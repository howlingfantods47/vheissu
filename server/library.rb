class Library

  include Mongoid::Document
  has_many :songs

  field :root_directory, type: String

  def self.clearLibrary
    Mongoid.purge!
  end

  def self.createLibrary(root_dir)
    clearLibrary
    updateLibrary(root_dir)
  end

  def self.updateLibrary(root_dir)

    Dir[root_dir + '**/*'].each do |file|

      extension = File.extname(file)

      next if extension == ''

      if extension == '.mp3'
        Mp3Info.open(file) do |mp3|
          song = Song.new(
            :absolute_path => (file.strip if file),
            :title => (mp3.tag.title.strip if mp3.tag.title),
            :artist => (mp3.tag.artist.strip if mp3.tag.artist),
            :album => (mp3.tag.album.strip if mp3.tag.album),
            :tracknum => mp3.tag.tracknum,
            :genre => (mp3.tag.genre_s.strip if mp3.tag.genre_s),
            :album_art => 'cover.jpg'
          )
          song.save
        end
      end

    end

  end #self.createLibrary

end #Library

class Song

  include Mongoid::Document
  store_in collection: 'library'

  belongs_to :library

  field :absolute_path, type: String
  field :title, type: String
  field :artist, type: String
  field :album, type: String
  field :tracknum, type: Integer
  field :year, type: Integer
  field :genre, type: String
  field :album_art, type: String


end #Song

