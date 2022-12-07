require_relative 'deck'
class Game
  attr_reader :player_cards, :dealer_cards

  def initialize(deck=Deck.new)
    @deck = deck
    @player_cards = []
    @dealer_cards = []
  end

  def player_pick
    card = @deck.pick
    @player_cards << card

    @player_cards.each.with_index do |c, i|
      print "#{c.symbol} #{c.rank} "
      puts if i == @player_cards.find_index(@player_cards.last)
    end
    p valuefy(@player_cards)
  end

  def dealer_pick
    card = @deck.pick
    @dealer_cards << @deck.pick
    
    @dealer_cards.each.with_index do |c, i|
      print "#{c.symbol} #{c.rank} "
      puts if i == @dealer_cards.find_index(@dealer_cards.last)
    end
    p valuefy(@dealer_cards)
  end

  def valuefy(arr)
    arr.inject(0) { |sum, card| sum + card.value }
  end

  def determine_winner
    player_score = valuefy(@player_cards)
    dealer_score = valuefy(@dealer_cards)
    winner = if player_score > dealer_score
      "Player"
    elsif player_score < dealer_score
      "Dealer"
    else
      "Draw"
    end
    winner
  end

  def edge_case_winner(array, who)
    winner = nil
    player_score = valuefy(array)
    if player_score > 21
      winner = who == 'Player' ? 'Dealer' : 'Player'
    elsif player_score == 21
      winner = who
    elsif @player_cards.size == 5
      winner = who
    end
    winner
  end

  def start
    stop = false
    until stop
      player_pick if @player_cards.empty?
      puts 'Another card?'
      choice = gets.chop
      if choice == 'y'
        player_pick
        winner = edge_case_winner(@player_cards, 'Player')
        stop = true if winner
      else
        while valuefy(@dealer_cards) < valuefy(@player_cards)
          dealer_pick
          winner = edge_case_winner(@dealer_cards, 'Dealer')
          stop = true if winner
          puts 'Another!'
        end
        winner = determine_winner if winner.nil?
        stop = true
      end
    end
    puts "GAME OVER!"
    puts "The Winner is #{winner}"
  end
end


g = Game.new
g.start
