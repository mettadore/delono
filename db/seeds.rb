# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

U1 = User.new(:first_name => "John", :last_name => "Metta", :username => "john", :email => "john@jmetta.org", :password => "et48ID", :password_confirmation => "et48ID")
U1.save!

U2 = User.new(:first_name => "Delona", :last_name => "Campos-Davis",:username => "delona", :email => "info@smallplanettrading.com", :password => "mall202", :password_confirmation => "mall202")
U2.save!

U3 = User.create(:first_name => "Karen", :last_name => "Murphy-Mendez", :username => "karen", :email => "murphymendez@gmail.com", :password => "mall202", :password_confirmation => "mall202")
U3.save!
B1 = Business.new(:name => "John Metta Consulting", :owner_id => U1.id, :street => "651 Floral Place", 
                :city => "Hood River", :state => "oregon", :subdomain => "mettadore",
                :zipcode => 97031, :phone => 5413873872, :website => "http://mettadore.com",
                :image => File.open("/Users/john/Dropbox/Pictures/John_Oahu.jpg"),
                :email => "john@mettadore.com")
B1.save!


B2 = Business.new(:name => "Small Planet Trading", :owner_id => U2.id, :street => "202 Cascade Ave", 
                :street_2 => "Suite B", :city => "Hood River", :state => "oregon", :subdomain => "smallplanet",
                :zipcode => 97031, :phone => 5413872008, :website => "http://smallplanettrading.com",
                :image => File.open("/Users/john/Dropbox/Hydrasi/MixingZone/smallplanetlogo.jpg"),
                :email => "info@smallplanettrading.com")
B2.save!

C1 = Consigner.new(:name => "John Doe", :biz_name => "Computer Stuff")
C1.save!
C2 = Consigner.new(:name => "John Smith", :biz_name => "Clothing Stuff")
C2.save!
C3 = Consigner.new(:name => "Jane Johnson", :biz_name => "Perfumy Stuff")
C3.save!

B1.consigners << C1
[C1,C2,C3].each{ |c| B2.consigners << c}
B1.save!
B2.save!

TransactionType.create(:noun => "receipt", :verb => "receive", :past => "received")
TransactionType.create(:noun => "sale", :verb => "sell", :past => "sold")
TransactionType.create(:noun => "restock", :verb => "restock", :past => "restocked")
TransactionType.create(:noun => "return", :verb => "return", :past => "returned")
TransactionType.create(:noun => "loss", :verb => "loose", :past => "lost")

P1 = Product.new(:code => "GSYXL", :name => "Gawdy Shirt, Puke Yellow, Extra Large", :consigner_id => C2.id, :business_id => B2.id, :wholesale => 15, :retail => 20)
P1.save!
P2 = Product.new(:code => "GSGL", :name => "Gawdy Shirt, Baby Poop Green, Large", :consigner_id => C2.id, :business_id => B2.id, :wholesale => 15, :retail => 20)
P2.save!
P3 = Product.new(:code => "GSPS", :name => "Gawdy Shirt, Hot Pink, Small", :consigner_id => C2.id, :business_id => B2.id, :wholesale => 15, :retail => 20)
P3.save!
P4 = Product.new(:code => "GSBOXL", :name => "Gawdy Shirt, Burnt Orange & Avacado Green, Extra Large", :consigner_id => C2.id, :business_id => B2.id, :wholesale => 15, :retail => 20)
P4.save!

P5 = Product.new(:code => "45S", :name => "Cloyingly Sweet",  :consigner_id => C3.id, :business_id => B2.id, :retail => 34.50, :wholesale => 20)
P5.save!
P6 = Product.new(:code => "45D", :name => "Like a Dry Lakebed",  :consigner_id => C3.id, :business_id => B2.id, :retail => 24.50, :wholesale => 15)
P6.save!
P7 = Product.new(:code => "45F", :name => "Feet don't smell too bad",  :consigner_id => C3.id, :business_id => B2.id, :retail => 20, :wholesale => 18)
P7.save!
P8 = Product.new(:code => "45A", :name => "Workout Armpit",  :consigner_id => C3.id, :business_id => B2.id, :retail => 50, :wholesale => 35)
P8.save!

P9 = Product.new(:code => "32F Sat", :name => "Satellite Modem", :consigner_id => C1.id, :business_id => B1.id, :retail => 15, :wholesale => 10)
P9.save!

[P1, P2, P3, P4, P5, P6, P7, P8].each do |p|
  (0..rand(15)).each do |n|
    Transaction.create(:business_id => B2.id, :product_id => p.id, :transaction_type_id => TransactionType.type_id("received"))
  end
end
Transaction.create(:business_id => B1.id, :product_id => P9.id, :transaction_type_id => TransactionType.type_id("received"))

[P1, P2, P3, P4, P5, P6, P7, P8].each do |p|
  (0..rand(p.count)).each do |n|
    if rand(2)
      Transaction.create(:business_id => B2.id, :product_id => p.id, :transaction_type_id => 2 + rand(3))
    end
  end
end

