require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

house1 = House.new({'name' => 'Slytherin'})
house2 = House.new({'name' => 'Gryffindor'})
house3 = House.new({'name' => 'Hufflepuff'})
house4 = House.new({'name' => 'Ravenclaw'})

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'house_id' => house1.id,
  'age' => 13
  })

student2 = Student.new({
  'first_name' => 'Margaret',
  'second_name' => 'KFC',
  'house_id' => house3.id,
  'age' => 69
  })

  student3 = Student.new({
    'first_name' => 'Yoni',
    'second_name' => 'Satat',
    'house_id' => house3.id,
    'age' => 287
    })

  student1.save()
  student2.save()
  student3.save()

  binding.pry
  nil
