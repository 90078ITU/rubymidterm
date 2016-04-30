#---------
# name: NumberGuess.rb
#
#----------------

class Screen

 def cls
   puts ("\n" * 30)
   puts "\a"
 end

 def pause
    STDIN.gets
 end

end

class Game
	@@gamesPlayed = 0
	@@guessPergame = 0
	@@averageGuesses = []


	def display_greeting
		Console_Screen.cls
		print "\t\t Welcome to the Ruby Number Guessing Game!" +
		"\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " + 
		"continue."

		Console_Screen.pause
	end

	def display_instruction
		Console_Screen.cls
		puts "Instruction:\n\n"

		puts "This game randomly generates a number from 1 to 1000 and "
		puts "challaenges you to identify it in as few guesses and possible "
	end

	def generate_number
		return randomNo = 1 + rand(1000)
	end

	def play_game
		number = generate_number

		loop do
			Console_Screen.cls
			print "\nEnter your guess and press the enter key: "

			reply = STDIN.gets
			reply.chop!
			reply = reply.to_i

			if reply < 1 or reply > 1000 then
				#cheatcode 9999
				if reply == 9999
					print "\nNumber of guesses this game: " + @@guessPergame.to_s
					print "\nTotal games played: " + @@gamesPlayed.to_s
					print "\nGuess history: " + @@averageGuesses.to_s
				end

				print "Invalid input, Please enter valid number between 1 and 1000"
				redo # redo the ciurrent iteration of the loop
			end

			if reply == number then
				Console_Screen.cls
				@@guessPergame = @@guessPergame + 1
				@@averageGuesses.push(@@guessPergame)

				print "You have guessed the number! Press Enter to continue."
				print "\nNumber of guesses this game: " + @@guessPergame.to_s
				print "\nTotal games played: " + @@gamesPlayed.to_s
				print "\nGuess history: " + @@averageGuesses.to_s
				Console_Screen.pause
				
				@@guessPergame = 0
				break
			elsif reply < number then
				@@guessPergame = @@guessPergame + 1
				Console_Screen.cls
				print "Your guess is too low! Press enter to continue."
				Console_Screen.pause
			elsif reply > number then
				@@guessPergame = @@guessPergame + 1
				Console_Screen.cls
				print "Your guess is too high! Press enter to continue."
				Console_Screen.pause
			end

			if @@guessPergame > 9
				@@averageGuesses.push(@@guessPergame)
				print "GAME OVER, You've reached 10 guesses."
				print "\nNumber of guesses this game: " + @@guessPergame.to_s
				print "\nTotal games played: " + @@gamesPlayed.to_s
				print "\nGuess history: " + @@averageGuesses.to_s
				@@guessPergame = 0
				break
			end

		end
			
	end

	def display_credits
		Console_Screen.cls
		puts "\t\t\Thanks you for playing the number game!!"
	end

	$noRight = 0

	Console_Screen = Screen.new

	SQ = Game.new

	SQ.display_greeting

	answer = ""

	loop do
		Console_Screen.cls

		print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

		answer = STDIN.gets

		answer.chop!

		break if answer == "y" || answer == "n"
	end

	if answer == "n"

		Console_Screen.cls

		puts "Perhaps anoher time.\n\n"

	else
		SQ.display_instruction
		@@gamesPlayed = @@gamesPlayed + 1

		loop do
			SQ.play_game
			@@gamesPlayed = @@gamesPlayed + 1

			Console_Screen.cls

			print "Would you like to play again? (y/n): "

			playAgain = STDIN.gets
			playAgain.chop!

			break if playAgain == "n"
		end

		SQ.display_credits

	end

end


