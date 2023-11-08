# ./play_minefield.rb

require_relative "minefield"

minefield = Minefield.new
system('clear' || 'cls')

until minefield.game_over?
    puts "Guesses left: #{minefield.remaining_guesses}"
    puts "Remaining lives: #{minefield.lives}"
    minefield.render_board
    guess = minefield.ask_guess
    minefield.check_mine(guess)
    
    if minefield.win?
        puts 'You survived, thanks for playing!'
    elsif minefield.loss?
        puts 'You lost, thanks for playing'
    end

    sleep(2)
    system('clear' || 'cls')
end