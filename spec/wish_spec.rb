describe Wish do
  subject(:wish)  { described_class.new("Guitar", 400) }
  
  it "stores a name" do
    expect(wish.name).to eq "Guitar"
  end
  
  it "stores a price" do
    expect(wish.price).to eq 400
  end
  
  describe "#edit_property" do
    it "raises an error if the property doesn't exist" do
      expect{ wish.edit_property("weight", "100g") }.to raise_error "That property doesn't exist"
    end
    
    it "can change it's name" do
      expect{ wish.edit_property("name", "Bass") }.to change { wish.name }.to "Bass"
    end
    
    it "can change it's price" do
      expect{ wish.edit_property("price", 500) }.to change { wish.price }.to 500
    end
  end
end