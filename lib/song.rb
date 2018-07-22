require'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name=nil)
    @name = name
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new(name)
  end
  
  def self.create_by_name(name)
    song = self.new(name)
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    array = filename.split(' - ')
    song.name = array[1].gsub(".mp3", "")
    song.artist_name = array[0]
    song
  end
  
  def self.create_from_filename(mp3)
     @@all << self.new_from_filename(mp3)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
