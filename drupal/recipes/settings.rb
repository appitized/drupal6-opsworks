## Recipe to set-up the Drupal 6 settings file (/settings.php)
node[:deploy].each do |app_name, deploy|
	template "#{deploy[:deploy_to]}/sites/default/settings.php" do
		source "settings.php.erb"
		mode 0664
		group deploy[:group]
		owner "www-data"
		
		## Get the environment_variables from the OpsWorks console 
		## and copy them into the variables to be passed to the template in ../templates/default/
		 variables({
			:DB_HOST => deploy[:environment_variables][:DB_HOST],
			:DB_NAME => deploy[:environment_variables][:DB_DATABASE],
			:DB_USER => deploy[:environment_variables][:DB_USERNAME],
			:DB_PASS => deploy[:environment_variables][:DB_PASSWORD],
			:REDIS_HOST => deploy[:environment_variables][:REDIS_HOST]
		})
	end
end