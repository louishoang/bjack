def say(msg)
  puts "=> #{msg}"
end

def calculate_total(cards)
  # At this point cards is in the form of an array [['8', 'D'], ['K', 'H'] etc -> get the number
  arr = cards.map {|e| e[0]}

  # Got arr = ['8', 'K']
  # Start calculate total of 8 and K
  total = 0
  arr.each do |value| # start first do
    #If value = Ace
  if value == "A"     
    total += 11
  elsif value.to_i == 0 #Just J, Q, K
     total += 10
  else
      total += value.to_i
  end
  
  end #end of first do
  arr.select{|value| value == "A"}.count.times do
    total -= 10 if total > 21

  end

  

  total
end #end of method   

#Game start
 say "Welcome to Casino 101"
 say "What's your name"

 name = gets.chomp

 say "Hi, #{name}. Let's make some cash."

# value to be used

suite = ['H', 'S', 'C', 'D']

cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = cards.product(suite)

 # Start dealing
 one_more = "YES"
while one_more == "YES"
ready = deck.shuffle!

player_card = []
dealer_card = []

player_card << ready.pop
dealer_card << ready.pop
player_card << ready.pop
dealer_card << ready.pop

player_total = calculate_total(player_card)
dealer_total = calculate_total(dealer_card)

say "#{name} got #{player_card} which total is #{player_total}"
say "Dealer got #{dealer_card} which total is #{dealer_total}"
say ""

# Action

if player_total == 21 
  say "Wooho! You won."
  exit
end

while player_total < 21
  say "Do you need one more? "
  say "1) Yes 2) Stay"

  action = gets.chomp

if !['1', '2'].include?(action)
  say "Error! Please choose 1 or 2"
  next #ignore below code and return to while
end

if action == "2" 
  say "You choose to stay "
  break
end

# another card
player_card << ready.pop
player_total = calculate_total(player_card)
say "#{name} now has #{player_card}."
say " Total is now #{player_total}"

# Player total count
if player_total > 21
  say "Oops. You're busted. Good luck next time."
  exit
  
elsif player_total == 21
  say "Woohoo. BlackJack!!!! You won."
  exit
  
end
end #end of while

#Dealer 
if dealer_total == 21
  say "Sorry. Dealer got BlackJack. Good luck next time."
  exit
end

while dealer_total < 17
  # another card
  say "Dealer got new card."
  say ""
  dealer_card << ready.pop
  dealer_total = calculate_total(dealer_card)
  say " Dealer now has #{dealer_card}."
  say " Dealer's total is now #{dealer_total}"

if dealer_total == 21 
  say "Sorry. Dealer got BlackJack. Good luck next time."
  exit
  
 elsif dealer_total > 21
  say "Congrats. Dealer is busted."
  exit
  
end

end

# Compare
say ""
say " Let's turn cards up."

dealer_card.each do |card|
  
  say " => #{card}"
end
say ""

player_card.each do |card|
  
  say " => #{card}"
end
say ""

if player_total < dealer_total
  say "Sorry. You lose."
elsif player_total > dealer_total
  say "Congrats. You win."
else
  say "Tie"
end

say "One more round? "
say "YES or NO?"

agree = gets.chomp.upcase

if !['YES','NO'].include?(agree)
  say "What is it? Please choose either YES or NO."
end

if agree == "YES"
one_more
next
elsif agree == "NO"
  one_more = one_more.to_i

end
say "Thanks for coming. Bye!"
end
exit








