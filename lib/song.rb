require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@names = []

  def initialize(name="", artist_name = "")
    @name = name
    @artist_name = artist_name
    @@all << self
    @@names << name
  end

  def self.all
    @@all
  end

  def self.names
    @@names.sort.uniq
  end

  def save
    self.class.all << self
  end

  def self.create(name="", artist_name="")
    self.new(name, artist_name)
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if !!found == true
      return found
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    alphabetized_list = []
    self.names.each do |name|
      @@all.each do |song|
        if name == song.name
          alphabetized_list << song
        end
      end
    end
    return alphabetized_list
  end
  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[1] = song_info[1].slice(0..-5)
    self.new(song_info[1], song_info[0])
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")
    song_info[1] = song_info[1].slice(0..-5)
    self.new(song_info[1], song_info[0])
  end

  def self.destroy_all
    @@all = @@all.clear
  end

end

# Song.create_by_name("Huffer")
# Song.create_by_name("Huffer")
# Song.create("Hey Joe")
# Song.create("Hey")
# Song.create("Grandma")
#
# binding.pry
