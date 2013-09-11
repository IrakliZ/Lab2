# Irakli Zhuzhunashvili
# 9/11/2013
# Git Repo: https://github.com/IrakliZ/Lab2


# Part1: Hello World
class HelloWorldClass
  def initialize(name)
    @name = name.capitalize
  end
  def sayHi
    p "Hello #{@name}!"
  end
end
hello = HelloWorldClass.new("World!")
hello.sayHi

# Part2: Strings

def palindrome?(string)
  string = string.downcase
  string = string.gsub(/\W/,"")
  string2 = string.reverse
  if string == string2
    return true
  else
    return false
  end
end



def count_words(string)
  string = string.downcase
  string = string.gsub(/\W/," ")
  arr = string.split
  map = Hash.new()

  arr.each{|element|
    if map.has_key?(element)
      map[element] += 1;
    else
      map[element] = 1
    end
  }
  map
end

# Part3: Rock Paper Scissors

class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless (["R", "P", "S"].include?(game[0][1]) &&  ["R", "P", "S"].include?(game[1][1]))
  m1 = game[0][1]
  m2 = game[1][1]
  winner = 0

  if m1 == "R"
    if m2 == "P"
      winner = 1
    end
  elsif m1 == "P"
    if m2 == "S"
      winner = 1
    end
  elsif m1 == "S"
    if m2 == "R"
      winner = 1
    end
  end
  game[winner]
end

def rps_tournament_winner(tour)
  if tour[0][0].is_a?(String)
    rps_game_winner(tour)
  else
    rps_game_winner([rps_tournament_winner(tour[0]), rps_tournament_winner(tour[1])])
  end
end

# Part4 Anagrams

def combine_anagrams(words)
  arr = Array.new
  map  = Hash.new

  i = 0
  words.each{ |str|
    copy = str
    str = str.downcase
    str = str.chars.sort.join
    if map.has_key?(str)
      map[str].push(copy)
    else
      map[str] = [copy]
    end

  }
  map
end

def print_hash(h)
	h.each do |key, value|
  		value.each do |k,v|
    		print k + " "
  		end
  		print "\n"
	end
end

p palindrome?("A man, a plan, a canal -- Panama")  # => true
p palindrome?("Madam, I'm Adam!")                  # => true
p palindrome?("Abracadabra")                       # => false (nil is also ok)

p count_words("A man, a plan, a canal -- Panama")
p count_words "Doo bee doo bee doo"
p rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ])
tournament = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
p rps_tournament_winner(tournament)

anagrams = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']

print_hash(combine_anagrams(anagrams))
