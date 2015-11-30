## Recipe to set-up the Drupal 6 db settings file (/dbconfig.php)
node[:deploy].each do |app_name, deploy|
	template "#{deploy[:deploy_to]}/sites/default/dbconfig.php" do
		source "dbconfig.php.erb"
		mode 0664
		group deploy[:group]
		owner "apache"
		
		## Get the environment_variables from the OpsWorks console 
		## and copy them into the variables to be passed to the template in ../templates/default/
		 variables({
			:DB_HOSTNAME => deploy[:environment_variables][:DB_HOSTNAME],
			:DB_DATABASE => deploy[:environment_variables][:DB_DATABASE],
			:DB_USERNAME => deploy[:environment_variables][:DB_USERNAME],
			:DB_PASSWORD => deploy[:environment_variables][:DB_PASSWORD]
		})
	end
end
