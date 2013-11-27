require 'csv'

Item.delete_all

grades = {}
grades['3i'] = CSV.table("#{Rails.root}/db/seeds/h25_syllabus_3i.csv")
grades['4i'] = CSV.table("#{Rails.root}/db/seeds/h25_syllabus_4i.csv")
grades['5i'] = CSV.table("#{Rails.root}/db/seeds/h25_syllabus_5i.csv")

grades.each_pair do |k, v|
  v.each do |l|
    FactoryGirl.create(:item, name: l[0], aim: l[1], introduction: l[2], grade: k)
  end
end
