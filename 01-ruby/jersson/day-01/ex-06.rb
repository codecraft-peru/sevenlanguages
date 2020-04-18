# write a program that picks a random number. Let a player guess the number,
# telling the player whether the guess is too low or too high.

number_to_guess = rand(10)
welcome_message = "What's the number I'm thinking? It's between 0 and 9 :)"
keep_guessing = true

puts welcome_message

while keep_guessing
    guess = gets.to_i

    if guess == number_to_guess
        message = 'Great guess!'
        keep_guessing = false
    
    elsif guess > number_to_guess 
        message = 'Too high :( guess again!'
        keep_guessing = true
    
    else
        message = 'Too low :( guess again!'
        keep_guessing = true
    end

    puts message
end

# You can run this exercise using this command in the terminal
# ruby ex-06.rb