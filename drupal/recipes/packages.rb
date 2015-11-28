## Recipe to install the required and commonly used packages for Drupal
node[:deploy].each do |app_name, deploy|
	execute 'Update packages before install' do
		command 'sudo yum update'
	end
	# Required
	package 'php'
	package 'php-pdo'
	package 'php-mcrypt'
	package 'php-curl'
	package 'php-json'
	package 'php-bcmath'
	package 'php-mbstring'
	# Common
	package 'ImageMagick'
	package 'php-pecl-imagick'
	
	# Restart apache2 after package installation
	service 'apache2' do
		action :restart
	end
end