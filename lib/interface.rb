require_relative 'wish_list'
require_relative 'printer'

class Interface
  
  def initialize(wish_list = Wish_list.new, printer = Printer.new)
    @wish_list = wish_list
    @printer = printer
  end
  
  def find(name)
    wish = wish_list.get_wish(name)
    printer.print_wish(wish)
  end
  
  def add(name, price)
    wish_list.add_wish(name, price)
    wish = get_wish(name)
    printer.add_confirmation(wish)
  end
  
  def remove(name)
    wish = get_wish(name)
    wish_list.remove_wish(name)
    printer.remove_confirmation(wish)
  end
  
  def edit(name, property, value)
    args = set_edit_args(name, property, value)
    wish_list.edit_wish(args)
    edited_wish = find_edited_wish(name, property, value)
    printer.edit_confirmation(edited_wish)
  end
  
  def affordable_wishes(savings)
    wishes = wish_list.affordable_wishes(savings)
    printer.print_affordable_wishes(wishes)
  end
  
  private
  
  def get_wish(name)
    wish_list.get_wish(name)
  end
  
  def find_edited_wish(name, property, value)
    property == "name" ? get_wish(value) : get_wish(name)
  end
  
  def set_edit_args(name, property, value)
    {
      wish_name: name,
      property: property,
      value: value
    }
  end
  
  attr_reader :wish_list, :printer
end