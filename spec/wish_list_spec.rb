describe Wish_list do
  subject(:list)    { described_class.new }
  
  let(:add_guitar)  { list.add_wish("Guitar", 400) }
  let(:add_watch)   { list.add_wish("Watch", 1000) }
  
  it "initializes with an empty array of wishes" do
    expect(list.wishes).to eq []
  end
  
  describe "#add_wish" do
    it "adds the wish to wishes array" do
      expect{ add_guitar }.to change { list.wishes.length }.by 1
    end
    
    it "takes a name and a price" do
      add_guitar
      wish = list.wishes.pop
      expect(wish.name).to eq "Guitar"
      expect(wish.price).to eq 400
    end
  end
  
  describe "#remove_wish" do
    
    before do
      add_guitar
    end
    
    it "removes a wish from wishes array" do
      expect{ list.remove_wish("Guitar") }.to change { list.wishes.length }.by (-1)
    end
    
    it "removes the correct wish" do
      add_watch
      list.remove_wish("Watch")
      wish = list.wishes.pop
      expect(wish.name).to eq "Guitar"
    end
  end
end