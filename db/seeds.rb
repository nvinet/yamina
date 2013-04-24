# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Adding Room data
Room.create :name => 'Mimzy',
            :description => 'This exquisite spacious double suite with its plain-whitewashed walls and artisan-crafted furniture is offset by a traditional kelim in soft red and orange hues.  The ensuite bathroom is decorated in brown tadelakt and contains an original roll-top bath with shower.  The room is situated on the first floor and overlooks the courtyard below.',
            :priceMin => 85,
            :priceMax => 95,
            :roomType => 'Deluxe Suite',
            :guestMin => 2,
            :guestMax => 4,
            :link => 'http://www.airbnb.co.uk/rooms/914253'

Room.create :name => 'Safia',
            :description => 'Encased in swathes of fine muslin, the large ornate four-poster bed brings a feel of luxury and romance to this room.  With its beautiful zellige recessed windows and ensuite shower this room is a relaxing haven to escape to.  The room is accessed on the ground floor off the courtyard with its welcoming pool.',
            :priceMin => 70,
            :priceMax => 85,
            :roomType => 'Large Double Suite',
            :guestMin => 2,
            :guestMax => 3,
            :link => 'http://www.airbnb.co.uk/rooms/934225'

Room.create :name => 'Zitouni',
            :description => 'A wonderfully light airy suite of good proportions decorated simply with white painted walls.  The suite is beautifully furnished with traditional hand crafted furniture and an ornate painted circular headboard complete with air-conditioning.  It has a king-size bed and ensuite bathroom and is located on the first floor with a great view overlooking the relaxing courtyard below from its own Juliette balcony.',
            :priceMin => 85,
            :priceMax => 95,
            :roomType => 'Deluxe Suite',
            :guestMin => 2,
            :guestMax => 4,
            :link => 'http://www.airbnb.co.uk/rooms/936043'

Room.create :name => 'Leila',
            :description => 'This beautiful double suite offers a contemporary as well as a traditional feel.  The beige and black tadelakt walls, adds a wonderful feeling of elegance and luxury throughout.  The ensuite shower room with beautiful black and white zellige tiles adds a further element of the dramatic to the room that lends itself well to the overall comfort of the Riad.',
            :priceMin => 65,
            :priceMax => 75,
            :roomType => 'Double Suite',
            :guestMin => 2,
            :guestMax => 2,
            :link => 'http://www.airbnb.co.uk/rooms/934207'

Room.create :name => 'Meyer',
            :description => 'This stunning suite is accessed via its own private terrace and is to be found at the very top of the Riad. This is a superior suite and is wonderful for honeymooners or those looking for a little more privacy.  The suite is beautifully framed on one side with stained Iraqi glass bathing the room in a soft orange glow.  An ornate hand-painted screen beautifully offsets the suites queen size bed, and its sumptuous furniture and comes complete with an ensuite shower room in the traditional tadelekt plaster and zellige tiles as seen throughout the riad.',
            :priceMin => 100,
            :priceMax => 130,
            :roomType => 'Superior Suite',
            :guestMin => 2,
            :guestMax => 4,
            :link => 'http://www.airbnb.co.uk/rooms/936050'

Room.create :name => 'Sara',
            :description => 'This spacious double suite is located on the ground floor and is great for those wanting easy access.  The suite has a beautifully relaxed feel with its zellige tiled walls and its warm beige and cream tones.  The suite has been tastefully furnished and comes complete with a retro-psychadelic styled ensuite shower-room.',
            :priceMin => 70,
            :priceMax => 85,
            :roomType => 'Large Double Suite',
            :guestMin => 2,
            :guestMax => 3,
            :link => 'http://www.airbnb.co.uk/rooms/936032'

Room.create :name => 'Fatna',
            :description => 'A cozy double room with a king-size bed, decorated in true Moroccan style with beautiful crafted furniture, and a splash of vibrant colour. Complete with a traditional beige tadelakt plaster ensuite shower-room.',
            :priceMin => 50,
            :priceMax => 65,
            :roomType => 'Double Room',
            :guestMin => 2,
            :guestMax => 2,
            :link => 'http://www.airbnb.co.uk/rooms/934191'
