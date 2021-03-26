n = 1
7.times do

  Track.create(title: "Aggressive Beast #{n}", points: rand(1..5), price: 3.00, product_link: "https://www.ogsoundfx.com/NeWsfXsHoPbAmSfx/testing/Aggressive_Beast_#{n}.mp3")
  n += 1

end
