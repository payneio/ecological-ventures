namespace :db do
    namespace :seed do
  
      Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
        task_name = File.basename(filename, '.rb').intern
  
        task task_name => :environment do
          load(filename)
        end
      end
  
      task :all => :environment do
        usersFilePath = File.join(Rails.root, 'db', 'seeds', 'seed_users.rb')
        load(usersFilePath)
        Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |filename|
          load(filename) unless filename == usersFilePath
        end
      end
  
    end
end
