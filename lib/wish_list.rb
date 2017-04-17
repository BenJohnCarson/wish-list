require_relative 'wish'

class Wish_list
  
  attr_reader :wishes, :wish
  
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
    wishes << wish.new(name, price)
  end
  
  def remove_wish(name)
    wishes.delete_if { |wish| wish.name == name }
  end
  
  def edit_wish(args)
    wish_name = args.fetch(:wish_name)
    get_wish(wish_name).edit_property(args.fetch(:property), args.fetch(:value))
  end
  
  private
  
  def name_exists?(name)
    wishes.collect { |wish| wish.name }.include?(name)
  end
end