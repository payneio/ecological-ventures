namespace :export do
  desc "Export users" 
  task :export_to_seeds => :environment do
    Solution.all.each do |venture| 
      excluded_keys = ['created_at', 'updated_at', 'id'] 
      serialized = venture
        .serializable_hash
        .delete_if{|key,value| excluded_keys.include?(key)} 
      puts "Solution.create(#{serialized})"
    end 
  end
end
