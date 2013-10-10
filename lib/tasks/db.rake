# encoding: utf-8
namespace :db do
  
  namespace :seed do
    
    task :similarity => :environment do
      load "#{Rails.root}/db/seeds/similarity.rb"
      exit
    end
  end
end