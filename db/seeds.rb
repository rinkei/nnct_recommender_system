
# DELETE ALL CONTENTS
Item.delete_all
User.delete_all

items, users = [], []

30.times do |i|
  items << FactoryGirl.create(:item)
end

10.times do |i|
  users << FactoryGirl.create(:user)
end

users.each do |u|
  items.each do |i|
    unless rand(3) == 2
      FactoryGirl.create(:rating, item: i, user: u, score: rand(5) + 1)
    end
  end
end
