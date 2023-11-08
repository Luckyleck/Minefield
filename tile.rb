# ./tile.rb 

class Tile
    def initialize
        @content = 'X'
        @is_mine = false
        @discovered = false
    end

    def content = @content;
    def is_mine? = @is_mine;
    def discovered? = @discovered;

    def make_mine
        @is_mine = true
    end

    def discover
        @discovered = true
        if is_mine?
            @content = 'M'
        else
            @content = 'C'
        end
    end 
end