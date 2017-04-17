describe 'Wish List' do
  subject(:list)  { Wish_list.new }
  
  let(:add_guitar)  { list.add_wish("Guitar", 400) }
  let(:add_watch)   { list.add_wish("Watch", 1000) }
  
  it "can store wishes" do
    expect(list.wishes).to eq []
  end
  
  context "a guitar has been added" do
    
    before do
      add_guitar
    end
    
    it "contains a guitar with a price" do
      wish = list.wishes.pop
      expect(wish.name).to eq "Guitar"
      expect(wish.price).to eq 400
    end
    
    it "can remove a wish" do
      add_watch
      list.remove_wish("Watch")
      expect(list.wishes.length).to eq 1
      wish = list.wishes.pop
      expect(wish.name).to eq "Guitar"
    end
  end
end