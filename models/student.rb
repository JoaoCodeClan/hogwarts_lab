
require_relative('../db/sql_runner.rb')

class Student
 attr_reader(:id)
 attr_accessor(:first_name,:second_name, :house, :age)

  def initialize(options)

    @id =  options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO students(
      first_name,
      second_name,
      house_id,
      age
    )
    VALUES($1, $2, $3, $4) RETURNING id
    "
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql, values).first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run( sql, values )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find (id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run( sql, values )
    result = Student.new (student.first )
    return result
  end

  def house ()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    list_of_houses = SqlRunner.run(sql,values)
    return list_of_houses.map {|house| House.new(house)}
  end

end
