# DELETE ALL CONTENTS
Item.delete_all
User.delete_all
Rating.delete_all
UserSimilarity.delete_all

ua = FactoryGirl.create(:user)
ub = FactoryGirl.create(:user)
uc = FactoryGirl.create(:user)
ud = FactoryGirl.create(:user)
ue = FactoryGirl.create(:user)

ia = FactoryGirl.create(:item)
ib = FactoryGirl.create(:item)
ic = FactoryGirl.create(:item)
id = FactoryGirl.create(:item)
ie = FactoryGirl.create(:item)
ig = FactoryGirl.create(:item)
ih = FactoryGirl.create(:item)
ii = FactoryGirl.create(:item)
ij = FactoryGirl.create(:item)
ik = FactoryGirl.create(:item)

ub.ratings.create(type: "GeneralRating", item: ia, score: 5)
ub.ratings.create(type: "GeneralRating", item: ib, score: 4)
ub.ratings.create(type: "GeneralRating", item: ic, score: 3)
ub.ratings.create(type: "GeneralRating", item: id, score: 2)
ub.ratings.create(type: "GeneralRating", item: ie, score: 1)

uc.ratings.create(type: "GeneralRating", item: ig, score: 1)
uc.ratings.create(type: "GeneralRating", item: ih, score: 2)
uc.ratings.create(type: "GeneralRating", item: ii, score: 3)
uc.ratings.create(type: "GeneralRating", item: ij, score: 4)
uc.ratings.create(type: "GeneralRating", item: ik, score: 5)

ud.ratings.create(type: "GeneralRating", item: ia, score: 5)
ud.ratings.create(type: "GeneralRating", item: ib, score: 4)
ud.ratings.create(type: "GeneralRating", item: ic, score: 3)
ud.ratings.create(type: "GeneralRating", item: id, score: 2)
ud.ratings.create(type: "GeneralRating", item: ie, score: 1)

ue.ratings.create(type: "GeneralRating", item: ig, score: 1)
ue.ratings.create(type: "GeneralRating", item: ih, score: 2)
ue.ratings.create(type: "GeneralRating", item: ii, score: 3)
ue.ratings.create(type: "GeneralRating", item: ij, score: 4)
ue.ratings.create(type: "GeneralRating", item: ik, score: 5)
