require_relative 'nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Path: decorator\decorator.rb
# Compare this snippet from methods\person.rb:
decorate = Decorator.new('John')
p decorate.correct_name
