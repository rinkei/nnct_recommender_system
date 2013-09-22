
# DELETE ALL CONTENTS
Item.delete_all
User.delete_all

10.times do |i|
  FactoryGirl.create(:item)
end

5.times do |i|
  FactoryGirl.create(:user)
end
