# -*- coding: utf-8 -*-
# DELETE ALL CONTENTS
Item.delete_all
User.delete_all
Rating.delete_all
UserSimilarity.delete_all

main_user = FactoryGirl.create(:user)
sub_user1 = FactoryGirl.create(:user)
sub_user2 = FactoryGirl.create(:user) 
sub_user3 = FactoryGirl.create(:user)

item1 = FactoryGirl.create(:item)
item2 = FactoryGirl.create(:item)
item3 = FactoryGirl.create(:item)
item4 = FactoryGirl.create(:item)
item5 = FactoryGirl.create(:item)
item6 = FactoryGirl.create(:item)
item7 = FactoryGirl.create(:item)
item8 = FactoryGirl.create(:item)

main_user.ratings.create(type: "GeneralRating", item: item1, score: 5)
main_user.ratings.create(type: "GeneralRating", item: item3, score: 5)
main_user.ratings.create(type: "GeneralRating", item: item5, score: 5)

# 似ていない
sub_user1.ratings.create(type: "GeneralRating", item: item2, score: 5)
sub_user1.ratings.create(type: "GeneralRating", item: item4, score: 5)
sub_user1.ratings.create(type: "GeneralRating", item: item6, score: 5)
sub_user1.ratings.create(type: "GeneralRating", item: item8, score: 5)

# 似ている
sub_user2.ratings.create(type: "GeneralRating", item: item1, score: 5)
sub_user2.ratings.create(type: "GeneralRating", item: item3, score: 5)
sub_user2.ratings.create(type: "GeneralRating", item: item5, score: 5)
sub_user2.ratings.create(type: "GeneralRating", item: item7, score: 5)

# とんとん
sub_user3.ratings.create(type: "GeneralRating", item: item1, score: 5)
sub_user3.ratings.create(type: "GeneralRating", item: item2, score: 5)
sub_user3.ratings.create(type: "GeneralRating", item: item5, score: 5)
sub_user3.ratings.create(type: "GeneralRating", item: item6, score: 5)

