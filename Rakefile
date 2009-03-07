# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

task :default do 
	`rake spec`
end


namespace :skeleton do
	namespace :server do
		task :init do
			system "cap staging permissions"
			system "cap production permissions"
			system "cap staging db:create:all" # no need to do this one twice
			puts "Done."
			puts
			puts "Now run cap staging deploy:migrations or cap production deploy:migrations"
		end
	end

	
	task :version do
		f=File.read('skeleton.head')
		if(f)
			puts "This skeleton app was built from commit #{f}"
		else
			puts "No skeleton version available."
		end
	end	
	
	task :passwords do
		f=File.read("config/deploy/staging.rb")
		unless(f.include?('DEPLOY_PASSWORD'))
			puts "You've already raked your deploy passwords."
			puts "To change them again, you'll need to edit config/deploy/*.rb manually."
			exit
		end

		puts
		puts "This script will update staging.rb and production.rb with mysql and deploy passwords."
		puts "It will then add these files to git, and commit."
		puts

		print "Enter new deploy password:> "
		@deploy_passwd = STDIN.gets.chomp

		print "Enter new mysql password:> "
		@mysql_passwd = STDIN.gets.chomp

		if(@deploy_passwd.size == 0 || @mysql_passwd.size == 0) 
			puts "Need two passwords to continue, so exiting."
			exit
		end

		system "sed -i '' -e 's/DEPLOY_PASSWORD/#{@deploy_passwd}/g' config/deploy/production.rb"
		system "sed -i '' -e 's/DEPLOY_PASSWORD/#{@deploy_passwd}/g' config/deploy/staging.rb"
		system "sed -i '' -e 's/MYSQL_PASSWORD/#{@mysql_passwd}/g' config/deploy/production.rb"
		system "sed -i '' -e 's/MYSQL_PASSWORD/#{@mysql_passwd}/g' config/deploy/staging.rb"
		system "sed -i '' -e 's/MYSQL_PASSWORD/#{@mysql_passwd}/g' Capfile"

		`git add config/deploy/production.rb`
		`git add config/deploy/staging.rb`
		`git commit -m 'updated deploy data'`
		`git push`
	
		puts

		puts "Passwords changed, commited and pushed to git."	
		sleep(1)
		puts
		puts "NOW, add server deploy SSH key to your Unfuddle account and run:"
		puts
		puts "rake skeleton:server:init"
	end
end

