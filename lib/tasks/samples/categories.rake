namespace :samples do
  task categories: :environment do
    Category.find_or_create_by(name: 'TryApp')
  end
end