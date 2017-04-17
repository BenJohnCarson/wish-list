require_relative 'wish'

class Wish_list
  
  attr_reader :wishes, :wish
  
  def initialize(wish = Wish)
    @wishes = []
    @wish = wish
  end
  
  def add_wish(name, price)
    wishes << wish.new(name, price)
  end
  
  def remove_wish(name)
    wishes.delete_if { |wish| wish.name == name }
  end
end