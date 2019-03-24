# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.destroy_all
Player.destroy_all
Card.destroy_all




game1 = Game.create(game_status: "not started" , winner: "None")

p1 = Player.create(name: "Phil")
p2 = Player.create(name: "Comp1")
p3 = Player.create(name: "Comp2")
p4 = Player.create(name: "Comp3")

GamePlayer.create(game_id: game1.id, player_id: p1.id)
GamePlayer.create(game_id: game1.id, player_id: p2.id)
GamePlayer.create(game_id: game1.id, player_id: p3.id)
GamePlayer.create(game_id: game1.id, player_id: p4.id)

2.times do
  for x in (0..9)
    for i in ["red","yellow","green", "blue"]
      Card.create(number: x, color: i)
    end
  end
end


allcards = Card.all
allcards= allcards.shuffle
allcards= allcards.shuffle

  puts allcards.count
  for g in game1.players
    for i in (0..4)
      card = allcards.shift()
      PlayerCard.create(player_id: g.id,card_id: card.id)
    end
    puts "---"
  end
  puts "---"
  puts allcards.count
  puts "---"

  game1.update(active_card_id: allcards.shift().id)

  for k in allcards
    Deck.create(game_id: game1.id, card_id: k.id )
  end








#
# Card.all[5].update(player_id: p1.id)
# Card.all[15].update(player_id: p1.id)
# Card.all[20].update(player_id: p1.id)
# Card.all[25].update(player_id: p1.id)
