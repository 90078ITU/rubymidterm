def method1
  x = 11
  method2 do |x|
    puts x
end end 
def method2
  x = 22
yield 33 end 
def method3
  x = 11
  method2 do |y|
    puts x
end end 


method3