class TracksController < ApplicationController
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

      zipfile.add("track.mp3", File.join(Rails.root,'app/assets/audio/Aggressive_Beast_1.mp3'))

      # url = 'https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_1.mp3'
      # data = open(url).read
      # zipfile.add("track.mp3", data)

      # end
      # zipfile.get_output_stream("myFile") { |f| f.write "myFile contains just this" }
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
end
