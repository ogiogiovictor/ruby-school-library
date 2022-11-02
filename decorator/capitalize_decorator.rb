require 'decorator'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Path: decorator\capitalize_decorator.rb
# Compare this snippet from methods\person.rb:
capitalize = CapitalizeDecorator.new('Coming from capitalize decorator')
p capitalize.correct_name
