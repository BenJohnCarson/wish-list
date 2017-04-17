describe Wish do
  subject(:wish)  { described_class.new("Guitar", 400) }
  
  it "stores a name" do
    expect(wish.name).to eq "Guitar"
  end
  
  it "stores a price" do
    expect(wish.price).to eq 400
  end
end