# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if ENV['roles']
  roles = Role.create([
                        { title: 'Author' },
                        { title: 'Subscriber' }
                      ])
end

if ENV['category']
  category = Category.create([
                               { name: 'busywork' },
                               { name: 'charity' },
                               { name: 'cooking' },
                               { name: 'diy' },
                               { name: 'education' },
                               { name: 'music' },
                               { name: 'recreational' },
                               { name: 'relaxation' },
                               { name: 'social' }
                             ])
end

if ENV['advertisement']
  advertisement = Advertisement.create([
                                    { name: 'electronics' },
                                    { name: 'jewelry' },
                                    { name: "men's clothing" },
                                    { name: "women's clothing" }
                                  ])
end
