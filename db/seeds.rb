# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
john = User.create(id: 1, first_name: 'John', last_name: 'Smith')
other_1 = User.create(first_name: 'Other', last_name: '1')
other_2 = User.create(first_name: 'Other', last_name: '2')
other_3 = User.create(first_name: 'Other', last_name: '3')

Book.create(id: 1, title: "Some Book").reviews.create(
  [
    { content: "This book is great!", user_id: john.id },
    { content: "This book is good", user_id: other_1.id },
    { content: "This book is bad and I'm going to break the layout </ul>", user_id: other_2.id },
    { content: "This book is <strong>very</strong> entertaining", user_id: other_3.id }
  ]
)
