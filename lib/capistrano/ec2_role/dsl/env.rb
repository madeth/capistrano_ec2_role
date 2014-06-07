module Capistrano
  module Ec2Role
    module DSL
      module Env

        def ec2_role(role_name, tag_name)
          AWS.memoize do
            instances = Capistrano::Ec2Role::Servers.new(
              fetch(:aws_access_key_id),
              fetch(:aws_secret_access_key),
              fetch(:aws_region)
            ).running.tagged(fetch(:ec2_deploy_tag_name, :role) => tag_name).to_instances_name

            role role_name.to_sym, instances
          end
        end

      end
    end
  end
end
