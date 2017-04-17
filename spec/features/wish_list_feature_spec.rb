describe 'Wish List' do
  subject(:list)  { Wish_list.new }
  
  it "can store wishes" do
    expect(list.wishes).to eq []
  end
  
  it "can add a wish" do
    list.add_wish("Guitar", 400)
    wish = list.wishes.pop
    expect(wish.name).to eq "Guitar"
    expect(wish.price).to eq 400
  end
end