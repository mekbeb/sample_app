#!/usr/bin/env ruby
def string_shuffle(s)
  s.split(' ').shuffle.join
end

if __FILE__ == $0  
  
   mg = "The quick brown fox jumps over the lazy dog"
   puts " --- Original message ----"
   puts mg
   puts "---- after split, shuffle and join ------"
   puts string_shuffle(mg)

# Result is as follows
#--- Original message ----
# The quick brown fox jumps over the lazy dog
#---- after split, shuffle and join ------
# dogoverbrownlazyThethejumpsquickfox

end
