# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["Hair", 
"Fiber", 
"Glove", 
"Metal", 
"Grease",
"Blood", 
"Soot", 
"Carbon", 
"Cardboard",
"Rock", 
"Wood", 
"Plastic", 
"Rust", 
"Glass", 
"Cloth",
"N/A",
"Unidentifiable"].each do |foreign_object|
  ForeignObject.find_or_create_by_name(foreign_object)
end

["Employee Safety", 
"Foreign Object", 
"General Maintenance", 
"Hand Washing Facilities", 
"Metal Detection",
"Personnel Practices", 
"Pest and Vermin Control", 
"Product Quality", 
"Sanitation of Food Contact Surfaces", 
"Toilet Facilities"].each do |gmp|
  Gmp.find_or_create_by_name(gmp)
end

["Quality Assurance", 
"Production", 
"Sanitation", 
"Logistics", 
"Purchasing",
"Facilities", 
"R&D", 
"Human Resources", 
"Customer Service", 
"IT", 
"Labels", 
"Planning", 
"Sales", 
"Seattle Admin"].each do |department|
  Department.find_or_create_by_name(department)
end

if User.where(:email => 'dylan.conlin@gmail.com').exists?
  puts "already in db!"
else

admin = User.create!(:name => "Dylan Conlin",
   :email => "dylan.conlin@skfoodgroup.com",
   :department_id => 1,
   :password => "SuNFL0Wer",
   :supervisor => true,
   :user_id => 7,
   :password_confirmation => "SuNFL0Wer")                                       

   
admin.toggle!(:admin)

end

    User.create!(:name => "Karen Jorgensen",
   :email => "karen.jorgensen@skfoodgroup.com",
   :department_id => 1,
   :supervisor => false,
   :user_id => 1,
   :password => "password",
   :password_confirmation => "password")

    User.create!(:name => "Nicole Carl",
   :email => "nicole.carl@skfoodgroup.com",
   :department_id => 1,
   :password => "password",
   :user_id => 1,
   :supervisor => false,
   :password_confirmation => "password")
   
   User.create!(:name => "Marian Becerra",
   :email => "maria.becerra@skfoodgroup.com",
   :department_id => 1,
   :user_id => 1,
   :supervisor => false,
   :password => "password",
   :password_confirmation => "password")
   
   User.create!(:name => "Viviana Michealree",
   :email => "viviana.michealree@skfoodgroup.com",
   :department_id => 1,
   :user_id => 1,
   :supervisor => false,
   :password => "password",
   :password_confirmation => "password")

   User.create!(:name => "Ruben Renteria",
   :email => "ruben.renteria@skfoodgroup.com",
   :department_id => 1,
   :user_id => 1,
   :supervisor => false,
   :password => "password",
   :password_confirmation => "password")
   
   User.create!(:name => "Joanne Medeiros",
   :email => "joanne.medeiros@skfoodgroup.com",
   :department_id => 1,
   :user_id => 7,
   :supervisor => true,
   :password => "password",
   :password_confirmation => "password")   

   User.create!(:name => "Linda Dalhaus",
   :email => "linda.dalhaus@skfoodgroup.com",
   :department_id => 1,
   :user_id => 7,
   :supervisor => false,
   :password => "password",
   :password_confirmation => "password")   

   User.create!(:name => "Jodi Duval",
   :email => "jodi.duval@skfoodgroup.com",
   :department_id => 1,
   :user_id => 7,
   :supervisor => false,
   :password => "password",
   :password_confirmation => "password")

   User.create!(:name => "Joe Conlin",
   :email => "joe.conlin@skfoodgroup.com",
   :department_id => 1,
   :user_id => 1,
   :supervisor => false,
   :password => "password",
   :password_confirmation => "password")

    User.create!(:name => "Guest",
   :email => "guest@skfoodgroup.com",
   :department_id => 1,
   :password => "password",
   :user_id => 1,
   :supervisor => false,
   :password_confirmation => "password")

   User.create!(:name => "Doug Fresh",
   :email => "dylan.conlin@gmail.com",
   :department_id => 1,
   :password => "SuNFL0Wer",
   :supervisor => true,
   :user_id => 7,
   :password_confirmation => "SuNFL0Wer")                                       
