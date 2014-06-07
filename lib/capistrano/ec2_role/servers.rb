require 'aws-sdk'

module Capistrano
  module Ec2Role
    class Servers

      class << self
        attr_accessor :cache_instances
      end

      attr_accessor :ec2_instances

      def initialize(access_key_id, secret_access_key, region)
       self.class.cache_instances ||= AWS::EC2.new(
         :access_key_id => access_key_id,
         :secret_access_key => secret_access_key,
         :region => region
       ).instances.to_a

       self.ec2_instances = self.class.cache_instances.clone
       self
      end

      def cache_instances
        self.class.cache_instances
      end

      def tagged(tag)
        tap { 
          ec2_instances.delete_if {|instance| untagged?(instance, tag) }
        }
      end

      def running
        tap {
          ec2_instances.delete_if {|instance| instance.status != :running }
        }
      end

      def to_instances_name
        ec2_instances.map {|instance| instance.public_dns_name || instance.private_dns_name }
      end

      private
      
      def untagged?(instance, tag)
        return true if tag.empty?

        required = tag.map {|k, v|
          instance.tags[k.to_s].gsub(/[\s　]/, '').split(',').include?(v) rescue false
        } 
        
        required.uniq.any? {|r| r == false}
      end

    end
  end
end
