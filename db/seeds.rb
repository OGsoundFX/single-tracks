# n = 1
# 7.times do

#   Track.create(title: "Aggressive Beast #{n}", points: rand(1..5), price: 3.00, product_link: "https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_#{n}.mp3")
#   n += 1

# end

tracks = Track.all

tracks.each do |track|
  track.audio.attach(io: URI.open("https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_#{track.id}.mp3"), filename: track.title)
end
