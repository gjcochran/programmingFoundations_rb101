# Question 1 
# c and a are pointing to the same object, b is different #==> correct 

# Question 2 
# all 3 have the same object.id because Fixnums' id dont change  #==> correct (integers are immutable)

# Question 3 
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# 
# "pumpkins" += "rutabaga" #==> "pumpkinsrutabaga" # incorrect
# ["pumpkins"] << "rutabaga" #==> ["pumpkins", "rutabaga"] # correct
# explanation, relates to Array<< mutating but String+ not..
# Why? It seems clear from the above that Ruby treats string and array arguments differently...but not so fast. Actually the arguments are treated in exactly the same way...but the results are different.

# In both cases, Ruby passes the arguments "by value", but unlike some other languages, the value that gets passed is a reference to some object. The string argument is passed to the method as a reference to an object of type String. Similarly, the array is passed to the method as a reference to an object of type Array.

# The important distinction is that while a reference is passed, the method initializes a new local variable for both the string and the array and assigns each reference to the new local variables. These are variables that only live within the scope of the method definition.

# So, if both arguments live inside the method as a new variable that stores a reference to the passed object...why don't the string and the array behave the same way in our output?

# The difference lies in what Ruby does when the program executes either a String#+= operation or an Array#<< operation.

# The String#+= operation is re-assignment and creates a new String object. The reference to this new object is assigned to a_string_param. The local variable a_string_param now points to "pumpkinsrutabaga", not "pumpkins". It has been re-assigned by the String#+= operation. This means that a_string_param and my_string no longer point to the same object.

# With the array, one array object can have any number of elements. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it.

# So, because the local variable an_array_param still points to the original object, the local variables my_array and an_array_param are still pointing at the same object, and we see the results of what happened to the array "outside" of the method.

# Question 4 
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins" 
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" #==> pumpkinsrutabaga
puts "My array looks like this now: #{my_array}" #==> ["pumpkins"]

# Question 5 

def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6 
def color_valid(color)
  color == "blue" || color == "green" #? true : false
end

puts color_valid('orange')

# i simplified with ternary, but that's unnecessary 

