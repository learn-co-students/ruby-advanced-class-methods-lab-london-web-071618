require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    #I want to create a method that calls an array of all stored songs of Class
    @@all
  end

  def save
    #I want to save an instance of Song to the Class array
    self.class.all << self
  end

  def self.create
    #I want to create a Song instance from a method
    song = Song.new
    song.save
    song
    #binding.pry
  end

  def self.new_by_name(title)
    # I want to create an instance with a name/title
    song = Song.new
    song.name = title
    # song.save
    song
  end

  def self.create_by_name(title)
    song = Song.new_by_name(title)
    song.save #Calls previously defined method within class self.new_by_name
    song
  end

  def self.find_by_name(title)
    song = self.all.find {|x| x.name == title}
    song
  end

  def self.find_or_create_by_name(title)
    #I want to find a song by its name or create one if it doesnt exist.
    #Potential Conditions:
    #1. There are no songs at all
    #2. There is song without title but the object exists

    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    #Returns an array of Song instances, alphabeticalally arranged by name.
    #Create an array of Song names
    # Feed array of Song names into find by name method, mapping found objects into new array.
    to_arrange = Song.all.map {|song| song.name }
    to_arrange.sort!
    to_arrange.map! {|names| Song.find_by_name(names)}
  end

  def self.new_from_filename(filename)
    #Takes filename, returns song instance
    #File name is a string of name of song and artist
    #Turn file name into an array and concat to fit nameing conditions

    # binding.pry
    to_edit = filename.split(/.-.|\./)
    song = self.new_by_name(to_edit[1])
    song.artist_name = to_edit[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
