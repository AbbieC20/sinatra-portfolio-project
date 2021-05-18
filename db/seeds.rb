# user with no record
# user with 1 record
# user with 2 records

user_1 = User.create(:username => "abbie_cornelius", :email => "abbie@flatiron.com", :password => "testing")
user_2 = User.create(:username => "AC123", :email => "abbiec@flatiron.co.uk", :password => "checking")
user_3 = User.create(:username => "Acorn.94", :email => "ac_123@flatiron", :password => "reviewing")

record_1 = Record.create(:name => "Cut the Mustard", :location => "Tooting, London", :category => "Cafe", :notes => "Great pastries, independently run")
record_1.update(:user_id => user_1.id)

record_2 = Record.create(:name => "The Pond", :location => "Brighton, UK", :category => "Pub", :notes => "Amazing food, good selection of craft beer")
record_2.update(:user_id => user_2.id)

record_3 = Record.create(:name => "Spitalfields", :location => "Central London", :category => "Market", :notes => "Good mix of chain shops and independent - lots of food places around")
record_3.update(:user_id => user_2.id)

