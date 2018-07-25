require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
    #binding.pry
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    # song.save
    song
  end

  def self.create_by_name(title)
    song = Song.new_by_name(title)
    song.save
    song #Calls previously defined method within class self.new_by_name
  end

  def self.find_by_name(title)
    self.all.find {|x| x.name == title}
  end

  def self.find_or_create_by_name(title)

    # there is no songs at all

    # theres a song without title but the object exists

    # there is no song




  end

end
