# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

U1 = User.new(:first_name => "John", :last_name => "Metta", :username => "john", :email => "john@jmetta.org", :password => "et48ID", :password_confirmation => "et48ID")
U1.save

U2 = User.new(:first_name => "Delona", :last_name => "Campos-Davis",:username => "delona", :email => "info@smallplanettrading.com", :password => "mall202", :password_confirmation => "mall202")
U2.save

U3 = User.create(:first_name => "Karen", :last_name => "Murphy-Mendez", :username => "karen", :email => "murphymendez@gmail.com", :password => "mall202", :password_confirmation => "mall202")

B1 = Business.new(:name => "John Metta Consulting", :owner_id => U1.id, :street => "651 Floral Place", 
                :city => "Hood River", :state => "oregon", :subdomain => "mettadore",
                :zipcode => 97031, :phone => 5413873872, :website => "http://mettadore.com",
                :image => File.open("/Users/john/Dropbox/Pictures/John_Oahu.jpg"),
                :email => "john@mettadore.com")
B1.save
B2 = Business.new(:name => "Small Planet Trading", :owner_id => U2.id, :street => "202 Cascade Ave", 
                :street_2 => "Suite B", :city => "Hood River", :state => "oregon", :subdomain => "smallplanet",
                :zipcode => 97031, :phone => 5413872008, :website => "http://smallplanettrading.com",
                :image => File.open("/Users/john/Dropbox/Hydrasi/MixingZone/smallplanetlogo.jpg"),
                :email => "info@smallplanettrading.com")
B2.save

C1 = Consigner.new(:name => "John Doe", :biz_name => "Computer Stuff")
C1.save
C2 = Consigner.new(:name => "John Smith", :biz_name => "Clothing Stuff")
C2.save
C3 = Consigner.new(:name => "Jane Johnson", :biz_name => "Perfumy Stuff")
C3.save

B1.consigners << C1
[C1,C2,C3].each{ |c| B2.consigners << c}

