

class House
  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses(name)
          VALUES($1)
          RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values).first['id'].to_i
    return @id
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run(sql, values)
    house = houses.map { |house| House.new( house ) }
    return house
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = House.new(house.first)
    return result
  end

end
