# def koti 
#     puts "Hello world"
# end

# koti

# def para(var1="koti", var2="joey")
#     puts "#{var1}"
#     puts "#{var2}"
# end
# para("koti","ram")


# def geeks(*var)
#     puts "#{var.length}"

#     for i in 0...var.length 
#         puts "#{var[i]}"
#     end
# end

# geeks "koti", "Ram", "jaan"


# def num 
#     a = 10 
#     b = 20 
#     sum = a+b 
#     return sum 
# end
# puts num 


# class Koti 
#     def geeks 
#         puts "Hello world"
#     end
# end 

# obj = Koti.new 
# obj.geeks 


# class Vehicle
 
#     def initialize(id, color, name)
     
#     @id = id
#     @veh_color = color
#     @veh_name = name
     
#     puts @id
#     puts @veh_color
#     puts @veh_name
#     puts "\n"
#     end
#     end
     
#     xveh = Vehicle. new("1", "Red", "ABC")
#     yveh = Vehicle. new("2", "Black", "XYZ")



# class Ram 
#     def initialize(id, name, model)
#         @id = id 
#         @name = name 
#         @model = model 
#         puts @id 
#         puts @name 
#         puts @model  
#     end
    
# end

# Ram.new("2","ferrari","Y")

# class Geeks 
#     def initialize 
#         @inst_1 = "Koti is smart"
#         @inst_2 = "Koti is a learner"
#     end
#     def display 
#         puts @inst_1 
#         puts @inst_2 
#     end
# end

# obj1 = Geeks.new()
# obj1.display()

# #get method 

# class CSWebsite 
#     def initialize(website)
#         @website = website 
#     end
#     #get method
#     def website 
#         @website 
#     end
# end

# gfg = CSWebsite.new "www.kindle.com"
# puts gfg.website 


# # set method 

# class CSWebsite 
#     def initialize(website)
#         @website = website 
#     end
#     def website 
#         @website 
#     end
#     #set method 
#     def website=(website)
#         @website = website 
#     end
# end

# gfg = CSWebsite.new "www.literatransact.com"
# puts gfg.website 

# gfg.website = "www.practise.literatransact.com"
# puts gfg.website 


# #attribute accessor methods 
# #attr_reader method 

# class CSWebsite 
#     def initialize(website)
#         @website = website 
#     end

#     attr_reader :website 
# end

# gfg = CSWebsite.new("www.kindle.com")
# puts gfg.website 


# #attr_writer 

# class CSWebsite 
#     def initialize(website)
#         @website = website 
#     end
#     attr_reader :website 
#     attr_writer :website 
# end
# gfg = CSWebsite.new("www.litera.com")
# puts gfg.website  

# gfg.website = "www.literatransact.com"
# puts gfg.website 

# #attr_accessor both getter and setter 

# class CSWebsite 
#     def initialize(website)
#         @website = website 
#     end

#     attr_accessor :website 
# end

# gfg = CSWebsite.new("www.kindle.com")
# puts gfg.website 

# gfg.website = "www.kindlestory.com"
# puts gfg.website 


# #mixed use of accessor 

# class CSWebsite 
#     def initialize(website, id)
#         @website = website 
#         @id = id 
#     end
#     attr_accessor :website 
#     attr_reader :id 
# end 

# gfg = CSWebsite.new("www.kindle.com", 12)
# puts gfg.website 
# puts gfg.id 


# class Exp 
    
#     def sum 
#        a = 10 
#        b = 20 
#        summ = a+b   
#        return summ
#     end
#     def hello 
#         puts "Hello world"
#     end
# end

# gfg = Exp.new 
# puts gfg.sum 
# puts gfg.hello



# class Koti 
#     def initialize
#         @name_1 = "koti"
#         @name_2 = "Ram"
#     end
#     def display 
#         puts @name_1
#         puts @name_2 
#     end
# end

# obj1 = Koti.new
# obj1.display 

# str = "koti"
# str.concat(" is a learner")
# puts str

# arr = [1,2,3,4]
# arr1 = [1,2,3,4]
# puts arr.concat(arr1) 

# arr = [1,2,3,4]
# puts arr.join("*")

# arr = ["ab","cd","ef"]
# puts (arr * "toy")

# puts "sample".index('p')
# puts "sample".index(?p) 

# string = "koteswararao"
# puts string.length 

# arr = ['a','b','c','d']
# puts arr.length 

# arr = ['1','2','3']
# puts arr.append('4')

# arr = [1,2,3,4]
# arr1 = [2,3,4,5]
# puts arr.append(arr1) 

# arr = [1,2,3,4]
# puts arr.push(5,6,7) 

# string = "koti is a learner"
# puts string.split() 

# arr = [1,2,3,4,5,6]
# puts arr.slice(2,5) 

require 'rubygems'
require 'httparty' 

 class FirstRequest 
     include HTTParty
     format :json
     base_uri 'api.publicapis.org/'

     def posts 
         self.class.get('/entries')
     end
 end

 first_request = FirstRequest.new 
 #puts first_request.posts
 first_request.posts.each do |post|
     puts post
 end



