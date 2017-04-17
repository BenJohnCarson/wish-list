describe "Interface Features" do
  
  subject(:interface) { Interface.new }
  
  it "adds a new wish with a confirmation" do
    expect(interface.add("Guitar", 400)).to eq "Your wish: 'Wish name: Guitar, Price: 400' was added successfully"
  end
  
  context "A guitar has been added" do
    
    before do
      interface.add("Guitar", 400)
    end
    
    it "can print out individual wishes" do
      expect(interface.find("Guitar")).to eq "Wish name: Guitar, Price: 400"
    end
    
    it "removes a wish with confirmation" do
      expect(interface.remove("Guitar")).to eq "Your wish: 'Wish name: Guitar, Price: 400' was removed successfully"
    end
    
    it "edits a wish with confirmation" do
      message = "Your wish was successfully changed to 'Wish name: Guitar, Price: 300'"
      expect(interface.edit("Guitar", "price", 300)).to eq message
    end
    
    it "displays your affordable wishes" do
      interface.add("Drums", 1000)
      interface.add("Night out", 100)
      message = "The wishes you can afford are: 'Wish name: Guitar, Price: 400', 'Wish name: Night out, Price: 100'"
      expect(interface.affordable_wishes(500)).to eq message
    end
  end
end