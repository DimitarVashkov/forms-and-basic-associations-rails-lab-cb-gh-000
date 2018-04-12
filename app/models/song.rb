class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_by_name(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    artist = Artist.find_by_name(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(notes)
    notes.each do |x|
      if x.strip != ''
        self.notes.build(content: x )
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
