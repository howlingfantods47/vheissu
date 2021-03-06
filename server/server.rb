require 'rubygems'
require 'json'
require 'sinatra'
require 'sinatra/reloader'
require 'mongoid'
require 'mp3info'

require_relative 'library'

Mongoid.load!('./mongoid.yml')


class MyServer < Sinatra::Base


  post '/sync_library' do
    library_dir = params['dir']

    if library_dir.nil?
      Library.createLibrary('./public/mp3/')
    else
      Library.updateLibrary(library_dir)
    end

    reply = {'lib_size' => Song.count}
    reply.to_json
  end

  get '/song_titles' do
    reply = Song.all.pluck(:title)

    reply.to_json
  end

  get '/song_titles/album/:albumid' do
    reply = Song.where(album: params['albumid']).pluck(:title)

    reply.to_json
  end

  get '/song_titles/artist/:artistid' do
    reply = Song.where(artist: params['artistid']).pluck(:title)

    reply.to_json
  end

  get '/artists' do
    reply = Song.distinct(:artist)

    reply.to_json
  end

  get '/albums' do
    reply = Song.distinct(:album)

    reply.to_json
  end

  get '/albums/:artistid' do
    reply = Song.where(artist: params['artistid']).distinct(:album)

    reply.to_json
  end

  get '/track/:trackid' do
    reply = Song.where(title: params['trackid']).first

    reply.to_json(:except => [:_id, :library_id])
  end


end #MyServer


MyServer.run!
