# ./minefield.rb

require_relative "tile"

class Minefield
    # Initialize a gameboard
    def self.create_board
        Array.new(10) {Array.new(10) { Tile.new } } # They must be distinct
    end

    def self.create_mines(board)
        board.each do |row|
            random_num = (rand() * row.length).floor
            tile = row[random_num]
            tile.make_mine
        end
    end

    def initialize
        @lives = 3
        @board = Minefield.create_mines(Minefield.create_board)
        @game_over = false;
        @remaining_guesses = 10;
    end

    def lives = @lives;
    def remaining_guesses = @remaining_guesses;
    def game_over? = @game_over;

    def render_board
        puts '-----------------------'
        col_letters = ('A'..'Z').to_a.slice(0, @board.first.length).unshift(' ')
        print col_letters.join(' '); puts;
        @board.each_with_index do |row, index|
            build_row = []
            row.each do |tile|
                build_row << tile.content
            end
            print "#{index} "
            puts build_row.join(' ')
        end
        puts '-----------------------'
    end

    def ask_guess
        puts 'Enter a position, column then row'
        input = gets.chomp.downcase.split('')
        convert_guess(input)
    end

    def convert_guess(input)
        alpha = ('A'..'Z').to_a.slice(0, @board.first.length)
        row = input[1].to_i
        col = alpha.index(input[0].upcase)
        [row, col]
    end

    def check_mine(position)
        row,col = position[0], position[1]
        tile = @board[row][col]
        
        if tile.is_mine?
            puts 'You hit a mine!'
            @lives -= 1;
            tile.discover
        else
            puts 'Safe!'
            @remaining_guesses -= 1
            tile.discover
        end
    end

    def win?
        if @remaining_mines == 0
            @game_over = true;
            return true;
        end
    end

    def loss?
        if @lives == 0
            @game_over = true;
            return true;
        end
    end

end
