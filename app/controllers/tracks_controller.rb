class TracksController < ApplicationController
  require 'zipline'
  require "zipline/version"
  require 'zip_tricks'
  require "zipline/zip_generator"

  def index
    @tracks = Track.all
  end

  def zip
    require 'zip'
    require 'open-uri'
    zipfile = File.join(Rails.root,"/zipfiles/archive#{rand(1..500)}.zip")

    # (File.join(Rails.root,'app/assets/images/bar1.jpg'))

    Zip::File.open(zipfile, Zip::File::CREATE) do |zipfile|
      # input_filenames.each do |filename|
        # Two arguments:
        # - The name of the file as it will appear in the archive
        # - The original file, including the path to find it
      # zipfile.add("track", 'https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/track.mp3.zip')

      # zipfile.add("track", URI('https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/track.mp3.zip'))
      # zipfile.add("track", io: URI.open("https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_1.mp3"), filename: 'bar1')

      # zipfile.add("track", File.join(Rails.root,'app/assets/audio/Aggressive_Beast_1.mp3'))

      # THIS IS THE ONLY ONE WORKING
      zipfile.add("track.mp3", File.join(Rails.root,'app/assets/audio/Aggressive_Beast_1.mp3'))


    end
    url = zipfile
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"track.zip"
  end

  def download_multiple
    url1 = 'https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_1.mp3'
    url2 = 'https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_2.mp3'
    download(url1, 1) and return
    download(url2, 2) and return

    # url_array = ['https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_1.mp3', 'https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_2.mp3']

    # url_array.each do |url|
    #   download(url)
    # end
  end

  def download(url, n)
    require 'open-uri'
    # url = 'https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_1.mp3'
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"#{n}.mp3"
  end

  def download_single
    require 'open-uri'
    url = params[:url]
    title = params[:title]
    data = open(url).read
    send_data data, :disposition => 'attachment', :filename=>"#{title}.mp3"
  end

  def zipline
    # include Zipline
    # require 'zipline'
    # require 'open-uri'
    tracks = [['https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_1.mp3', "Aggressive_Beast_1.mp3"], ['https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_2.mp3', "Aggressive_Beast_2.mp3"], ['https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_3.mp3', "Aggressive_Beast_1.mp3"]]
    zipline(tracks, 'tracks.zip')
  end
end
