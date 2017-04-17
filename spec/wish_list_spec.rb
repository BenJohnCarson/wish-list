describe Wish_list do
  subject(:list)  { described_class.new }
  
  it "initializes with an empty array of wishes" do
    expect(list.wishes).to eq []
  end
  
  describe "#add_wish" do
    it "adds the wish to wishes array" do
      expect{ list.add_wish("Guitar", 400) }.to change { list.wishes.length }.by 1
    end
    
    it "takes a name and a price" do
      list.add_wish("Guitar", 400)
      wish = list.wishes.pop
      expect(wish.name).to eq "Guitar"
      expect(wish.price).to eq 400
    end
  end
end