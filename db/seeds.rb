require "faker"

# Clear existing data
Article.destroy_all
Comment.destroy_all

# Create 10 sample articles
10.times do
  article = Article.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: 3).join("\n\n")
  )

  # Create 2-5 comments for each article
  rand(2..5).times do
    article.comments.create!(
      body: Faker::Lorem.sentence
    )
  end
end

puts "Seeded #{Article.count} articles and #{Comment.count} comments."
