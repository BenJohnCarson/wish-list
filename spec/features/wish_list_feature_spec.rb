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
    
    it "can find a specific wish" do
      wish = list.wishes[0]
      expect(list.get_wish("Guitar")).to eq wish
    end
    
    it "contains a guitar with a price" do
      wish = list.get_wish("Guitar")
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
    
    it "can edit a wish" do
      edit_params = { wish_name: "Guitar",
                      property: "price",
                      value: 350
      }
      list.edit_wish(edit_params)
      wish = list.get_wish("Guitar")
      expect(wish.price).to eq 350
    end
    
    it "returns wishes you can afford" do
      add_watch
      wish = list.get_wish("Guitar")
      expect(list.affordable_wishes(500)).to eq [wish]
    end
  end
end