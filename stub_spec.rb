require "spec_helper.rb"
require "rspec/expectations"

class ClassRoom 
    def initialize(students) 
       @students = students 
    end
    
    def list_student_names 
       @students.map(&:name).join(',') 
    end 
 end
 
 RSpec.describe ClassRoom do 
    it 'the list_student_names method should work correctly' do 
       student1 = double('student') 
       student2 = double('student') 
       
       allow(student1).to receive(:name) { 'John Smith'} 
       allow(student2).to receive(:name) { 'Jill Smith'} 
       
       cr = ClassRoom.new [student1,student2]
       expect(cr.list_student_names).to eq('John Smith,Jill Smith') 
    end 
 end 




 class ClassRoom 
    def initialize(students) 
       @students = students 
    end 
    
    def list_student_names 
       @students.map(&:name).join(',') 
    end 
     
 end 
 
 RSpec.describe ClassRoom do 
    it 'the list_student_names method should work correctly' do 
       student1 = double('student') 
       student2 = double('student')
       
       student1.stub(:name).and_return('John Smith')
       student2.stub(:name).and_return('Jill Smith') 
       
       cr = ClassRoom.new [student1,student2] 
       expect(cr.list_student_names).to eq('John Smith,Jill Smith') 
    end 
 end