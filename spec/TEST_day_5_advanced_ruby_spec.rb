require "rspec"
require_relative "../day_5_advanced_ruby_rspec"

describe "Tree Datastructure" do
  it "Checks if the sum_of_tree() correctly returns the sum of the tree datastructure" do
    # Node.value ranges from 0 - 100
    
    root = Node.new(50)
    
    random_numbers = Array.new(50) { rand(0..100) }
    
    random_numbers.each do |num|
      root.insert(num)
    end
    
    expected_sum = 50 + random_numbers.sum
  
    expect(sum_of_tree(root)).to eq(expected_sum)
  end 
end