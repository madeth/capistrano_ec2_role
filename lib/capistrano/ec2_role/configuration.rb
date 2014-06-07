Capistrano::Configuration.instance(:must_exist).load do

  def ec2_role(role_name, tag_name, options={})
    AWS.memoize do
      instances = Capistrano::Ec2Role::Servers.new(
        fetch(:aws_access_key_id),
        fetch(:aws_secret_access_key),
        fetch(:aws_region)
      ).running.tagged({fetch(:ec2_deploy_tag_name, :role) => tag_name}).to_instances_name

      instances.each {|instance|
        server instance, role_name, options
      }
    end
  end

end
