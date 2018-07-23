require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(name=nil, artist_name=nil)
    @name = name
    @artist_name = artist_name
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end
  
  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    @@all << song
    song
  end
  
  def self.find_by_name(song_title)
    @@all.find {|song| song.name == song_title}
  end
  
  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
  end
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed_name = filename.split(" - ")
    song_name = parsed_name[1].chomp(".mp3")
    artist_name = parsed_name[0]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    parsed_name = filename.split(" - ")
    song_name = parsed_name[1].chomp(".mp3")
    artist_name = parsed_name[0]
    
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
