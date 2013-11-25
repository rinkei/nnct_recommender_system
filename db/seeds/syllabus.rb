require 'csv'

Item.delete_all

lectures = CSV.table("#{Rails.root}/db/seeds/syllabus.csv")

lectures.each do |l|
  FactoryGirl.create(:item, name: l[0], aim: l[1], introduction: l[2])
end
