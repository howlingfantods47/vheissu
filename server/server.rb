require 'rubygems'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'mongoid'
require 'mp3info'

require_relative 'library'

Mongoid.load!('./mongoid.yml')


class MyServer < Sinatra::Base

  get '/' do
    'ertef'
  end

  get '/sync_library' do
    library_dir = '/home/neel/vheissu/public/files/'
    Library.createLibrary(library_dir)
    'done, go check the db'
  end

end #MyServer


MyServer.run!
