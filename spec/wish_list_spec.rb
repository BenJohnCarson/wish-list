describe Wish_list do
  subject(:list)    { described_class.new }
  
  let(:add_guitar)  { list.add_wish("Guitar", 400) }
  let(:add_watch)   { list.add_wish("Watch", 1000) }
  
  it "initializes with an empty array of wishes" do
    expect(list.wishes).to eq []
  end
  
  context "A guitar has been added" do
    
    before do
      add_guitar
    end
  
    describe "#get_wish" do
      it "returns a wish by name" do
        wish = list.wishes[0]
        expect(list.get_wish("Guitar")).to eq wish
      end
      
      it "errors if that wish doesn't exist" do
        expect{ list.get_wish("Fish") }.to raise_error "That wish doesn't exist"
      end
    end
    
    describe "#add_wish" do
      it "adds the wish to wishes array" do
        expect{ add_watch }.to change { list.wishes.length }.by 1
      end
      
      it "only allows integers for price" do
        expect{ list.add_wish("Speakers", "100") }.to raise_error "Price should be an integer"
      end
  
      it "takes a name and a price" do
        wish = list.get_wish("Guitar")
        expect(wish.name).to eq "Guitar"
        expect(wish.price).to eq 400
      end
      
      it "errors if there's a wish with the same name already present" do
        expect{ list.add_wish("Guitar", 400) }.to raise_error "Wish with that name already exists"
      end
    end
    
    describe "#remove_wish" do
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
    
    describe "#edit_wish" do
      it "can change the name of a wish" do
        edit_params = { wish_name: "Guitar",
                        property: "name",
                        value: "Bass"
        }
        list.edit_wish(edit_params)
        expect{ list.get_wish("Bass") }.to_not raise_error
      end
      
      it "can change the price of a wish" do
        edit_params = { wish_name: "Guitar",
                        property: "price",
                        value: 300
        }
        list.edit_wish(edit_params)
        expect(list.get_wish("Guitar").price).to eq 300
      end
      
      it "only allows integers when changing price" do
        edit_params = { wish_name: "Guitar",
                        property: "price",
                        value: "300"
        }
        expect{ list.edit_wish(edit_params) }.to raise_error "Price should be an integer"
      end
    end 
    
    describe "#affordable_wishes" do
      it "returns an array of wishes which have a price less than the savings value passed in" do
        add_watch
        list.add_wish("Speakers", 200)
        wish1 = list.get_wish("Guitar")
        wish2 = list.get_wish("Speakers")
        wish3 = list.get_wish("Watch")
        affordable_wishes = list.affordable_wishes(500)
        expect(affordable_wishes).to include wish1, wish2
        expect(affordable_wishes).not_to include wish3
      end
    end
  end
end