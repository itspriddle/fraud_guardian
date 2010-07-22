namespace :fraud_guardian do
  desc "Create config/fraud_guardian.yml"
  task :setup do
    puts "Creating config/fraud_guardian.yml"
    path = RAILS_ROOT + '/config/fraud_guardian.yml'
    File.open(path, 'w') do |f|
      lines = ["---", "login: user", "password: s3cret", "country: US", ""]
      f << lines.join("\n")
    end
  end
end
