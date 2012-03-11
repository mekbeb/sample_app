#!/usr/bin/env ruby

person1 = { :first => "Bill", :last => "Clinton" }
person2 = { :first => "Hilary", :last => "Clinton" }
person3 = { :first => "Chelsea", :last => "Clinton" }

if __FILE__ == $0  
  
   params = {}
   params[:father] = person1
   params[:mother] = person2
   params[:child] = person3

   puts params[:father][:first]
   puts params[:mother][:first]
   puts params[:child][:first]

   puts params[:father][:last]
   puts params[:mother][:last]
   puts params[:child][:last]

# Result is as follows
# Bill
# hilary
# Chelsea
# Clinton
# Clinton
# Clinton
end

