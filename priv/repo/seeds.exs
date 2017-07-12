# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirGql.Repo.insert!(%ElixirGql.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias ElixirGql.{User, Post, Repo}

Repo.insert!(%User{name: "Ryan Yogan", email: "ryanyogan@gmail.com"})
Repo.insert!(%User{name: "Weird Al", email: "al@aim.url"})

for _ <- 1..10 do
  Repo.insert!(%Post{
    title: Faker.Lorem.sentence,
    body: Faker.Lorem.paragraph,
    user_id: [1, 2] |> Enum.take_random(1) |> hd
  })
end
