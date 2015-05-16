# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jeffery = Player.create!(name: "Jeffery Lebowski", email: "jeffery@golfer.com", password: "jeffery1234", password_confirmation: "jeffery1234")
walter = Player.create!(name: "Walter Sobchak",   email: "walter@golfer.com",  password: "walter1234",  password_confirmation: "walter1234")

w1 = Club.create!(name: "1 Wood",)
w3 = Club.create!(name: "3 Wood",)
w5 = Club.create!(name: "5 Wood",)
i3 = Club.create!(name: "3 Iron",)
i4 = Club.create!(name: "4 Iron",)
i5 = Club.create!(name: "5 Iron",)
i6 = Club.create!(name: "6 Iron",)
i7 = Club.create!(name: "7 Iron",)
i8 = Club.create!(name: "8 Iron",)
i9 = Club.create!(name: "9 Iron",)
pw = Club.create!(name: "Pitching Wedge",)
sw = Club.create!(name: "Sand Wedge",)
p  = Club.create!(name: "Putter",)

timber_terrace = Course.create!(name: "Timber Terrace")

hole_1 = Hole.create!(number: 1, par: 5, distance: 453, course_id: timber_terrace.id)
hole_2 = Hole.create!(number: 2, par: 4, distance: 347, course_id: timber_terrace.id)
hole_3 = Hole.create!(number: 3, par: 4, distance: 236, course_id: timber_terrace.id)
hole_4 = Hole.create!(number: 4, par: 3, distance: 162, course_id: timber_terrace.id)
hole_5 = Hole.create!(number: 5, par: 4, distance: 340, course_id: timber_terrace.id)
hole_6 = Hole.create!(number: 6, par: 3, distance: 147, course_id: timber_terrace.id)
hole_7 = Hole.create!(number: 7, par: 4, distance: 391, course_id: timber_terrace.id)
hole_8 = Hole.create!(number: 8, par: 3, distance: 158, course_id: timber_terrace.id)
hole_9 = Hole.create!(number: 9, par: 5, distance: 510, course_id: timber_terrace.id)

bogus_course = Course.create!(name: "Bogus Course")

Hole.create!(number: 1, par: 5, distance: 453, course_id: bogus_course.id)
Hole.create!(number: 2, par: 4, distance: 347, course_id: bogus_course.id)
Hole.create!(number: 3, par: 4, distance: 236, course_id: bogus_course.id)
Hole.create!(number: 4, par: 3, distance: 162, course_id: bogus_course.id)
Hole.create!(number: 5, par: 4, distance: 340, course_id: bogus_course.id)
Hole.create!(number: 6, par: 3, distance: 147, course_id: bogus_course.id)
Hole.create!(number: 7, par: 4, distance: 391, course_id: bogus_course.id)
Hole.create!(number: 8, par: 3, distance: 158, course_id: bogus_course.id)
Hole.create!(number: 9, par: 5, distance: 510, course_id: bogus_course.id)

round = Round.create!(course_id: timber_terrace.id, player_id: jeffery.id, date: "4/26/2015", score: 52, finished: true, opponent_id: walter.id)

PlayedHole.create!(hole_id: hole_1.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_2.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_3.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_4.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_5.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_6.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_7.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_8.id, round_id: round.id, player_id: jeffery.id)
PlayedHole.create!(hole_id: hole_9.id, round_id: round.id, player_id: jeffery.id)
