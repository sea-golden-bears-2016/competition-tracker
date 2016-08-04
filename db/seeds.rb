League.create(name: 'League A')
League.create(name: 'League B')

4.times do
  competitor = Competitor.new({
    :name => Faker::Name.name,
    :wins_count => 0,
    :loses_count => 0,
    :league_id => 1
  })
  competitor.save
end

4.times do
  competitor = Competitor.new({
    :name => Faker::Name.name,
    :wins_count => 0,
    :loses_count => 0,
    :league_id => 2
  })
  competitor.save
end

User.create(username: "admin", password: "secret")

