describe 'Wish List' do
  subject(:list)  { Wish_list.new }
  
  it "can store wishes" do
    expect(list.wishes).to eq []
  end
end