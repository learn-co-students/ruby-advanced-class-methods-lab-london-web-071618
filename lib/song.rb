require 'pry'

class Song
    attr_accessor :name, :artist_name, :song_name
    attr_reader :song

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
      return song
    end

    def self.new_by_name(name)
      song = self.new
      song.name = name
      return song
    end

    def self.create_by_name(name)
      song = self.create
      song.name = name
      return song
    end

    def self.find_by_name(name)
    found_name =  @@all.find {|song| song.name == name }
    return found_name
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create_by_name(name)
    end

    def self.alphabetical
      sorted_array = self.all.sort_by {|song| song.name}
      sorted_array
    end

    def self.new_from_filename(filename)
        sections = filename.split(" - ")
        artist_section = sections[0]
        song_section = sections[1].gsub(".mp3","")

        song = self.create
        song.name = song_section
        song.artist_name = artist_section
        song
    end

    def self.create_from_filename(filename)
      sections = filename.split(" - ")
      artist_section = sections[0]
      song_section = sections[1].gsub(".mp3","")

      song = self.create
      song.name = song_section
      song.artist_name = artist_section
      song
    end



    def self.destroy_all
      self.all.clear
    end


end
