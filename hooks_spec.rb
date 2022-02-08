require "spec_helper.rb"
require "rspec/expectations" 

RSpec.describe do 
    before(:context) do 
        puts "Hello world"
    end
    it do 
        puts "Hello Koti"
    end 
    it do 
        puts "Hello Ram"
    end
    after(:all) do 
        puts "Hello jann"
    end
end