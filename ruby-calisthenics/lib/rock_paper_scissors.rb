class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    # YOUR CODE HERE
	hash = Hash["P" => 1, "S" => 2, "R" => 3]
	if hash[player1[1]].nil? || hash[player2[1]].nil?
		raise RockPaperScissors::NoSuchStrategyError, "Strategy must be one of R,P,S"
	end
	dif = hash[player1[1]] -  hash[player2[1]]
	if dif == -1 || dif == 2
		return player2
	else
	    return player1
	end		
  end

  def self.tournament_winner(tournament)
    # YOUR CODE HERE
	if tournament[0][0].class == String
    	return self.winner(tournament[0],tournament[1])
    end
    return self.winner(self.tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
  end
end
