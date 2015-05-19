# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create!(name: "Jeffery Lebowski", email: "jeffery@golfer.com", password: "jeffery1234", password_confirmation: "jeffery1234")
Player.create!(name: "Walter Sobchak",   email: "walter@golfer.com",  password: "walter1234",  password_confirmation: "walter1234")

Club.create!(name: "1 Wood")
Club.create!(name: "3 Wood")
Club.create!(name: "5 Wood")
Club.create!(name: "3 Iron")
Club.create!(name: "4 Iron")
Club.create!(name: "5 Iron")
Club.create!(name: "6 Iron")
Club.create!(name: "7 Iron")
Club.create!(name: "8 Iron")
Club.create!(name: "9 Iron")
Club.create!(name: "Pitching Wedge")
Club.create!(name: "Sand Wedge")
Club.create!(name: "Putter")

timber_terrace = Course.create!(name: "Timber Terrace")
bogus_course = Course.create!(name: "Bogus Course")

Hole.create!(number: 1, par: 5, distance: 453, course_id: timber_terrace.id)
Hole.create!(number: 2, par: 4, distance: 347, course_id: timber_terrace.id)
Hole.create!(number: 3, par: 4, distance: 236, course_id: timber_terrace.id)
Hole.create!(number: 4, par: 3, distance: 162, course_id: timber_terrace.id)
Hole.create!(number: 5, par: 4, distance: 340, course_id: timber_terrace.id)
Hole.create!(number: 6, par: 3, distance: 147, course_id: timber_terrace.id)
Hole.create!(number: 7, par: 4, distance: 391, course_id: timber_terrace.id)
Hole.create!(number: 8, par: 3, distance: 158, course_id: timber_terrace.id)
Hole.create!(number: 9, par: 5, distance: 510, course_id: timber_terrace.id)

Hole.create!(number: 1, par: 5, distance: 453, course_id: bogus_course.id)
Hole.create!(number: 2, par: 4, distance: 347, course_id: bogus_course.id)
Hole.create!(number: 3, par: 4, distance: 236, course_id: bogus_course.id)
Hole.create!(number: 4, par: 3, distance: 162, course_id: bogus_course.id)
Hole.create!(number: 5, par: 4, distance: 340, course_id: bogus_course.id)
Hole.create!(number: 6, par: 3, distance: 147, course_id: bogus_course.id)
Hole.create!(number: 7, par: 4, distance: 391, course_id: bogus_course.id)
Hole.create!(number: 8, par: 3, distance: 158, course_id: bogus_course.id)
Hole.create!(number: 9, par: 5, distance: 510, course_id: bogus_course.id)
Hole.create!(number: 10, par: 5, distance: 453, course_id: bogus_course.id)
Hole.create!(number: 11, par: 4, distance: 347, course_id: bogus_course.id)
Hole.create!(number: 12, par: 4, distance: 236, course_id: bogus_course.id)
Hole.create!(number: 13, par: 3, distance: 162, course_id: bogus_course.id)
Hole.create!(number: 14, par: 4, distance: 340, course_id: bogus_course.id)
Hole.create!(number: 15, par: 3, distance: 147, course_id: bogus_course.id)
Hole.create!(number: 16, par: 4, distance: 391, course_id: bogus_course.id)
Hole.create!(number: 17, par: 3, distance: 158, course_id: bogus_course.id)
Hole.create!(number: 18, par: 5, distance: 510, course_id: bogus_course.id)

