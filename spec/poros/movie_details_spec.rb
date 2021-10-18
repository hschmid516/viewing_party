require 'rails_helper'

describe MovieDetail do
  it 'has attributes' do
    movie = MovieDetail.new(details_data, cast_data, reviews_data)

    expect(movie.id).to eq(17473)
    expect(movie.title).to eq('The Room')
    expect(movie.vote_average).to eq(4.1)
    expect(movie.runtime).to eq(99)
    expect(movie.genres).to eq(["Drama", "Romance"])
    expect(movie.summary).to eq("Johnny is a successful banker with great respect for and dedication to the people in his life, especially his future wife Lisa. The happy-go-lucky guy sees his world being torn apart when his friends begin to betray him one-by-one.")
    expect(movie.cast).to eq([["Tommy Wiseau", "Johnny"],
                             ["Juliette Danielle", "Lisa"],
                             ["Greg Sestero", "Mark"],
                             ["Philip Haldiman", "Denny"],
                             ["Carolyn Minnott", "Claudette"],
                             ["Robyn Paris", "Michelle"],
                             ["Dan Janjigian", "Chris R"],
                             ["Kyle Vogt", "Peter"],
                             ["Greg Ellery", "Steven"],
                             ["Mike Holmes", "Mike"]])
    expect(movie.total_reviews).to eq(3)
    expect(movie.reviews.first).to eq(["Gimly", "Everybody knows _The Room_ is bad. That's like, the whole thing. But anybody who says its badness is self-aware is a liar. It's regular bad. It's regular fucking awful. Genuinely, the movies my peers in film class were making when I was **fifteen** are better than _The Room_. Before you say it, yes I did watch The Room in a group, and no I didn't enjoy it.\r\n\r\n_Final rating:½ - So bad it’s offensive. I may never fully recover._"])
  end
end
