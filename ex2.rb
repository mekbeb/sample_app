#!/usr/bin/env ruby

class String
	def shuffle
	  @names = self.split(' ').shuffle
	  @all = ""
	  @names.each do |name|
	     @all = @all + "#{name} "
	  end
	  print @all + "\n"
	end
end

if __FILE__ == $0  
  
   mg = "The quick brown fox jumps over the lazy dog"

   puts "----- Original message ----"
   puts mg

   puts "----- shuffled ------"
   mg.shuffle 

# Result is as follows
#----- Original message ----
#The quick brown fox jumps over the lazy dog
#----- shuffled ------
#fox over jumps dog quick The brown lazy the 

end



