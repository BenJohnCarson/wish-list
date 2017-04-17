require_relative 'wish'

class Wish_list
  
  attr_reader :wishes
  
  def initialize(wish = Wish)
    @wishes = []
    @wish = wish
  end
  
  def get_wish(name)
    raise "That wish doesn't exist" unless name_exists?(name)
    wishes.select { |wish| wish.name == name }.pop
  end
  
  def add_wish(name, price)
    fail "Wish with that name already exists" if name_exists?(name)
    check_price_type(price)
    wishes << wish.new(name, price)
  end
  
  def remove_wish(name)
    wishes.delete_if { |wish| wish.name == name }
  end
  
  def edit_wish(args)
    wish_name = args[:wish_name]
    property = args[:property]
    value = args[:value]
    check_price_type(value) if property == "price"
    get_wish(wish_name).edit_property(property, value)
  end
  
  def affordable_wishes(savings)
    wishes.select { |wish| wish.price <= savings }
  end
  
  private
  
  def name_exists?(name)
    wishes.collect { |wish| wish.name }.include?(name)
  end
  
  def check_price_type(value)
     raise "Price should be an integer" unless value.is_a? Integer
  end
  
  private
  
  attr_reader :wish
end