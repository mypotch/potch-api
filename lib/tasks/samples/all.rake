namespace :samples do
  task all: :environment do
    # for init create
    Rake::Task['samples:admins'].invoke
  end
end
