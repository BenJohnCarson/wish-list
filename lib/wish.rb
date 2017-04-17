class Wish
  
  attr_reader :name, :price
  
  def initialize(name, price)
    @name = name
    @price = price
  end
  
  def edit_property(property, value)
    raise "That property doesn't exist" unless property_exists?(property) 
    self.instance_variable_set("@#{property}", value)
  end
  
  private
  
  def property_exists?(property)
    self.instance_variables.include?(:"@#{property}")
  end
end