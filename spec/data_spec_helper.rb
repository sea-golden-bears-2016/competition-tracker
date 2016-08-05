  def create_league_one
    League.create!( {name: "Super Pokemon"} )
  end

  def create_league_two
    League.create!( {name: "Monster Factory"} )
  end

  def run_round_one
    add_first_round_of_matches_league_one
    assign_wins_first_round_of_matches_league_one
    add_first_round_of_matches_league_two
    assign_wins_first_round_of_matches_league_two
  end

  def create_competitors_for_league_one
    eevee = LEAGUEONE.competitors.create!( {name: "Eevee"} )
    ponyata = LEAGUEONE.competitors.create!( {name: "Ponyata"} )
    fearow = LEAGUEONE.competitors.create!( {name: "Fearow"} )
    drowzee = LEAGUEONE.competitors.create!( {name: "Drowzee"} )
  end

  def create_competitors_for_league_two
    pidgey = LEAGUETWO.competitors.create!( {name: "Pidgey"} )
    gastly = LEAGUETWO.competitors.create!( {name: "Gastly"} )
    ekans = LEAGUETWO.competitors.create!( {name: "Ekans"} )
    krabby = LEAGUETWO.competitors.create!( {name: "Krabby"} )
  end

  def add_first_round_of_matches_league_one
    match1 = LEAGUEONE.matches.create!({round_number: 1})
    match1.competitors << [LEAGUEONE.competitors.find_by(name: 'Eevee'), LEAGUEONE.competitors.find_by(name: 'Ponyata')]
    match1.save
    match2 = LEAGUEONE.matches.create!({round_number: 1})
    match2.competitors << [LEAGUEONE.competitors.find_by(name: 'Fearow'), LEAGUEONE.competitors.find_by(name: 'Drowzee')]
    match2.save
  end

  def assign_wins_first_round_of_matches_league_one
    LEAGUEONE.matches[0].winner = LEAGUEONE.matches[0].competitors.find_by(name: 'Ponyata')
    LEAGUEONE.matches[0].loser = LEAGUEONE.matches[0].competitors.find_by(name: 'Eevee')
    LEAGUEONE.matches[0].save
    LEAGUEONE.matches[1].winner = LEAGUEONE.matches[1].competitors.find_by(name: 'Drowzee')
    LEAGUEONE.matches[1].loser = LEAGUEONE.matches[1].competitors.find_by(name: 'Fearow')
    LEAGUEONE.matches[1].save
  end

  def add_first_round_of_matches_league_two
    match1 = LEAGUETWO.matches.create!({round_number: 1})
    match1.competitors << [LEAGUETWO.competitors.find_by(name: 'Pidgey'), LEAGUETWO.competitors.find_by(name: 'Gastly')]
    match1.save
    match2 = LEAGUETWO.matches.create!({round_number: 1})
    match2.competitors << [LEAGUETWO.competitors.find_by(name: 'Ekans'), LEAGUETWO.competitors.find_by(name: 'Krabby')]
    match2.save
  end

  def assign_wins_first_round_of_matches_league_two
    LEAGUETWO.matches[0].winner = LEAGUETWO.matches[0].competitors.find_by(name: 'Gastly')
    LEAGUETWO.matches[0].loser = LEAGUETWO.matches[0].competitors.find_by(name: 'Pidgey')
    LEAGUETWO.matches[0].save
    LEAGUETWO.matches[1].winner = LEAGUETWO.matches[1].competitors.find_by(name: 'Ekans')
    LEAGUETWO.matches[1].loser = LEAGUETWO.matches[1].competitors.find_by(name: 'Krabby')
    LEAGUETWO.matches[1].save
  end

