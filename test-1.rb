$global_variable = 10
class Class1 
    def print_global
        puts "Global variable in class1 is #$global_variable "
    end
end
class Class2
    def print_global 
        puts "Global variable in class2 is #$global_variable"
    end
end

class1obj = Class1.new 
class1obj.print_global 
class2obj = Class2.new 
class2obj.print_global   


class Customer 
    def initialize(id,name,addr)
        @cust_id = id 
        @cust_name = name 
        @cust_addr = addr 
    end
    def display_details()
        puts "Customer id is #@id"
        puts "Customer name is #@name"
        puts "Customer addr is #@addr"
    end
end

cust1 = Customer.new("1","John","abc apartments")
cust2 = Customer.new("2",'Joey',"def apartments")

cust1.display_details()
cust2.display_details()




class Customer 
    @@no_of_customers = 0
    def initialize(id,name,addr)
        @cust_id = id 
        @cust_name = name 
        @cust_addr = addr 
    end
    def display_details()
        puts "Customer id is #@id"
        puts "Customer name is #@name"
        puts "Customer addr is #@addr"
    end
    def total_no_of_customers()
        @@no_of_customers += 1
        puts "Total number of customers: #@@no_of_customers"
    end
end

cust1 = Customer.new("1","John","abc apartments")
cust2 = Customer.new("2",'Joey',"def apartments")

cust1.total_no_of_customers()
cust2.total_no_of_customers()



class Example 
    VAR1 = 100
    VAR2 = 200 
    def show 
        puts "Value of first constant #{VAR1}"
        puts "Value of first constant #{VAR2}"
    end
end

object = Example.new()
object.show