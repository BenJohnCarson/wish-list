class Printer
  
  def print_wish(wish)
    "Wish name: #{wish.name}, Price: #{wish.price}"
  end
  
  def add_confirmation(wish)
    "Your wish: '#{print_wish(wish)}' was added successfully"
  end
  
  def remove_confirmation(wish)
    "Your wish: '#{print_wish(wish)}' was removed successfully"
  end
  
  def edit_confirmation(edited_wish)
    "Your wish was successfully changed to '#{print_wish(edited_wish)}'"
  end
  
  def print_affordable_wishes(wishes)
    "The wishes you can afford are: #{wishes.collect { |wish| "'#{print_wish(wish)}'" }.join(", ")}"
  end
end