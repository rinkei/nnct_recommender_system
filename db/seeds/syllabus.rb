require 'csv'

puts '# delete all Items'
Item.delete_all

puts '# load csv files'
CSV.table("#{Rails.root}/db/seeds/h25_syllabus_3i.csv").each do |l|
  FactoryGirl.create(:item, name: l[0], aim: l[1], introduction: l[2], grade: 3, department: 'Information')
end

CSV.table("#{Rails.root}/db/seeds/h25_syllabus_4i.csv").each do |l|
  FactoryGirl.create(:item, name: l[0], aim: l[1], introduction: l[2], grade: 4, department: 'Information')
end

CSV.table("#{Rails.root}/db/seeds/h25_syllabus_5i.csv").each do |l|
  FactoryGirl.create(:item, name: l[0], aim: l[1], introduction: l[2], grade: 5, department: 'Information')
end

