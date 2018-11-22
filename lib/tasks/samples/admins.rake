namespace :samples do
  task admins: :environment do
    puts 'start create admins'

    Admin.find_or_create_by(email: 'a1@mg.com') do |admin|
      admin.password = '123123123'
      # admin.confirmed_at = Time.now
    end

    puts 'finished create admins'
  end
end
