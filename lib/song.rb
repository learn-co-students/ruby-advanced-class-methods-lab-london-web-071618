
require 'pry'

class Song
  attr_writer
  attr_accessor :name, :artist_name
   @@all = []

  def self.create
    song = Song.new
    # puts song
    @@all << song
    song
  end

#instantiate new Song class with name = "Blank space", so when call song.name will return "Blank Space"
  def self.new_by_name(new_name)
    song = Song.create
    song.name = new_name
    song
  end

  def self.create_by_name(name)
    if Song.find_by_name(name) == nil
      song = Song.create
      song.name = name
      song
    end
  end

  def self.find_by_name(song_name)
    search = @@all.find {|element| element.name == song_name}
    search == nil ? nil : search
  end

  def self.find_or_create_by_name(song_name)
    Song.create_by_name(song_name)
    Song.find_by_name(song_name)
  end

  def self.alphabetical
    array_to_sort = []
    @@all.collect {|element| array_to_sort << element.name}
    sorted = (array_to_sort.sort).collect {|name| Song.find_by_name(name)}
  end

  def self.new_from_filename(filename)
    split_array = filename.split /\-|s+|\./
    split_array = split_array.map{|element| element.strip}

    artists_name = split_array[0]
    song_name = split_array[1]

    song = Song.create_by_name(song_name)
    song.artist_name = artists_name
    song
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
# song = Song.new_by_name("Blank Space")
#song.name
# binding.pry
