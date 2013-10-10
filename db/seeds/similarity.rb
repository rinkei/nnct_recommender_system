# DELETE ALL CONTENTS
Item.delete_all
User.delete_all
Rating.delete_all
UserSimilarity.delete_all

ua = FactoryGirl.create(:user)
ub = FactoryGirl.create(:user)
uc = FactoryGirl.create(:user)

ia = FactoryGirl.create(:item)
ib = FactoryGirl.create(:item)
ic = FactoryGirl.create(:item)

ua.ratings.create(type: "GeneralRating", item: ia, score: 5)
ua.ratings.create(type: "GeneralRating", item: ib, score: 4)
ua.ratings.create(type: "GeneralRating", item: ic, score: 1)

ub.ratings.create(type: "GeneralRating", item: ia, score: 4)
ub.ratings.create(type: "GeneralRating", item: ib, score: 5)
ub.ratings.create(type: "GeneralRating", item: ic, score: 2)

uc.ratings.create(type: "GeneralRating", item: ia, score: 1)
uc.ratings.create(type: "GeneralRating", item: ib, score: 1)
uc.ratings.create(type: "GeneralRating", item: ic, score: 5)
