class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def game_over?
    !@player1.is_alive? || !@player2.is_alive?
  end

  def announce_winner
    winner = @player1.is_alive? ? @player1 : @player2
    loser = @player1.is_alive? ? @player2 : @player1
    puts "#{winner.name} wins with #{winner.lives} lives left!"
    puts "#{loser.name} is out of lives. Game Over!"
  end

  def play_turn
    question = Question.new
    puts "#{@current_player.name}, #{question.ask_question}"
    answer = gets.chomp.to_i
    
    if answer == question.correct_answer
      puts "Correct!"
    else
      puts "Wrong! You lose a life."
      @current_player.lose_life
    end
    
    puts "#{@player1.name}: #{@player1.lives} lives | #{@player2.name}: #{@player2.lives} lives"
  end

  def start_game
    puts "Welcome to the 2-Player Math Game!"
    until game_over?
      play_turn
      switch_turns unless game_over?
    end
    announce_winner
  end
end
