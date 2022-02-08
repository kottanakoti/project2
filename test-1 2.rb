n = 5 
fact = 1 
for i in (1..n)
   fact = fact*i 
end
puts fact  

even = 0
odd = 0 
for i in (1..20)
   if i%2 == 0 
      even += 1 
   else 
      odd += 1 
   end
end 
puts even 
puts odd   

st = "koteswararao"
l = st.length
for i in (0..l) 
   puts st[i]   
end

def factorial(n)
   raise "argument must be > 0" if n < 1 
   return 1 if n == 1 
   n * factorial(n-1)
end

puts factorial(1)
puts factorial(5)

hash = {1=> "one", 2=> "two", 3=> "three"}
puts hash[2]

hash1 = {:ko => 'koti', :rm => 'Ram', :jn => 'jaan'}
puts hash1[:ko] 


arr = [1,2,3,4,5]
arr.each {|a| puts a*2}
