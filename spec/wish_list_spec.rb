describe Wish_list do
  subject(:list)  { described_class.new }
  
  it "initializes with an empty array of wishes" do
    expect(list.wishes).to eq []
  end
end