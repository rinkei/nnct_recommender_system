# encoding: utf-8
namespace :experiment do
  namespace :db do
    namespace :seed do
      task :syllabus => :environment do
        load "#{Rails.root}/db/seeds/syllabus.rb"
        exit
      end
    end
  end
end
