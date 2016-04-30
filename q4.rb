class Troll
	attr_accessor :ugliness, :smelliness, :strength

	def initialize(grunts = '')
		if grunts != ''
			@grunts = grunts
		else
    		@grunts = "UNGAH"
    	end
    end

    def speak
    	print (@grunts + "\n") * 42
    end

    def reverse
    	print @grunts.reverse! + "\n"
    end

    def self.propagate()
		return Troll.new("eegah")
	end

	def fight
		#this method needs to be added for respond_to?
	end

end

newclass = Troll.new
#newclass.speak
#newclass.reverse
newclass.ugliness = "simplestring"
puts newclass.ugliness


tester = Troll.propagate
tester.speak
#tester.reverse

puts tester.respond_to?('fight')
