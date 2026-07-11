vertebrates = {
  :mammals => ["homosapiens", "bears", "elephants", "monkeys"],
  :birds => ["finches", "ostriches", "eagles", "ravens"],
  :reptiles => ["snakes", "turtle", "tortoise", "crocodiles"],
  :amphibians => ["frogs", "toads", "salamanders", "axolotl"],
  :fishes => ["salmon", "sharks", "pufferfish", "seahorse"]
}

print "Please enter a vertebrate class: "
choice = gets.chomp()

begin
  case choice
  
  when "mammal"
    output = vertebrates[:mammals].join(", ")
    
  when "bird"
    output = vertebrates[:birds].join(", ")
    
  when "reptile"
    output = vertebrates[:reptiles].join(", ")
    
  when "amphibian"
    output = vertebrates[:amphibians].join(", ")
    
  when "fish"
    output = vertebrates[:fishes].join(", ")
    
  else
    puts "Your choice is not valid!"
    
  end
ensure
  puts "Here is our list of fishes: #{output}"

end
