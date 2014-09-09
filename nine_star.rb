require 'date'

module NineStar
  STAR_KI_YEARS = {
    "9 Fire"  => [1901, 1910, 1919, 1928, 1937, 1946, 1955, 1964, 1973, 1982, 1991, 2000, 2009],
    "8 Earth" => [1902, 1911, 1920, 1929, 1938, 1947, 1956, 1965, 1974, 1983, 1992, 2001, 2010],
    "7 Metal" => [1903, 1912, 1921, 1930, 1939, 1948, 1957, 1966, 1975, 1984, 1993, 2002, 2011],
    "6 Metal" => [1904, 1913, 1922, 1931, 1940, 1949, 1958, 1967, 1976, 1985, 1994, 2003, 2012],
    "5 Earth" => [1905, 1914, 1923, 1932, 1941, 1950, 1959, 1968, 1977, 1986, 1995, 2004, 2013],
    "4 Wood"  => [1906, 1915, 1924, 1933, 1942, 1951, 1960, 1969, 1978, 1987, 1996, 2005, 2014],
    "3 Wood"  => [1907, 1916, 1925, 1934, 1943, 1952, 1961, 1970, 1979, 1988, 1997, 2006, 2015],
    "2 Earth" => [1908, 1917, 1926, 1936, 1944, 1953, 1962, 1971, 1980, 1989, 1998, 2007, 2016],
    "1 Water" => [1909, 1918, 1927, 1937, 1945, 1954, 1963, 1972, 1981, 1990, 1999, 2008, 2017]
  }

  STAR_KI_DATE_RANGES = [
    {:start => "Feb 4", :end => "Mar 5"},
    {:start => "Mar 6", :end => "Apr 5"},
    {:start => "Apr 6", :end => "May 5"},
    {:start => "May 6", :end => "Jun 5"},
    {:start => "Jun 6", :end => "Jul 7"},
    {:start => "Jul 8", :end => "Aug 7"},
    {:start => "Aug 8", :end => "Sep 7"},
    {:start => "Sep 8", :end => "Oct 8"},
    {:start => "Oct 9", :end => "Nov 7"},
    {:start => "Nov 8", :end => "Dec 7"},
    {:start => "Dec 8", :end => "Jan 5"},
    {:start => "Jan 6", :end => "Feb 3"}
  ]

  def get_ki_element_for_year(year)
    # iterate over the list of elements and years
    STAR_KI_YEARS.each_pair do |key, value|
      # if this element's years includes the given year
      if value.include?(year)
        # return the element
        return key
      end
    end

    # if the given year was not in ANY element, return nil
    return nil
  end

  def get_date_range_index_from_date(date)
    date_ranges = STAR_KI_DATE_RANGES.map do |star_ki_date_range|
      start  = Date.parse(star_ki_date_range[:start]).yday
      last   = Date.parse(star_ki_date_range[:end]).yday
      Range.new(start, last)
    end

    day_of_year = date.yday

    date_ranges.each_with_index do |range, index|
      if range.include?(day_of_year)
        return index
      end
    end

    return nil
  end

  STAR_KI_NUMBERS = [
    {"9 Fire" => "9.5.9", "8 Earth" => "8.2.2", "7 Metal" => "7.8.4", "6 Metal" => "6.5.6", "5 Earth" => "5.2.8", "4 Wood" => "4.8.1", "3 Wood" => "3.5.3", "2 Earth" => "2.2.5", "1 Water" => "1.8.7"},
    {"9 Fire" => "9.4.1", "8 Earth" => "8.1.3", "7 Metal" => "7.7.5", "6 Metal" => "6.4.7", "5 Earth" => "5.1.9", "4 Wood" => "4.7.2", "3 Wood" => "3.4.4", "2 Earth" => "2.1.6", "1 Water" => "1.7.8"},
    {"9 Fire" => "9.3.2", "8 Earth" => "8.9.4", "7 Metal" => "7.6.6", "6 Metal" => "6.3.8", "5 Earth" => "5.9.1", "4 Wood" => "4.6.3", "3 Wood" => "3.3.5", "2 Earth" => "2.9.7", "1 Water" => "1.6.9"},
    {"9 Fire" => "9.2.3", "8 Earth" => "8.8.5", "7 Metal" => "7.5.7", "6 Metal" => "6.2.9", "5 Earth" => "5.8.2", "4 Wood" => "4.5.4", "3 Wood" => "3.2.6", "2 Earth" => "2.8.8", "1 Water" => "1.5.1"},
    {"9 Fire" => "9.1.4", "8 Earth" => "8.7.6", "7 Metal" => "7.4.8", "6 Metal" => "6.1.1", "5 Earth" => "5.7.3", "4 Wood" => "4.4.5", "3 Wood" => "3.1.7", "2 Earth" => "2.7.9", "1 Water" => "1.4.2"},
    {"9 Fire" => "9.9.5", "8 Earth" => "8.6.7", "7 Metal" => "7.3.9", "6 Metal" => "6.9.2", "5 Earth" => "5.6.4", "4 Wood" => "4.3.6", "3 Wood" => "3.9.8", "2 Earth" => "2.6.1", "1 Water" => "1.3.3"},
    {"9 Fire" => "9.8.6", "8 Earth" => "8.5.8", "7 Metal" => "7.2.1", "6 Metal" => "6.8.3", "5 Earth" => "5.5.5", "4 Wood" => "4.2.7", "3 Wood" => "3.8.9", "2 Earth" => "2.5.2", "1 Water" => "1.2.4"},
    {"9 Fire" => "9.7.7", "8 Earth" => "8.4.9", "7 Metal" => "7.1.2", "6 Metal" => "6.7.4", "5 Earth" => "5.4.6", "4 Wood" => "4.1.8", "3 Wood" => "3.7.1", "2 Earth" => "2.4.3", "1 Water" => "1.1.5"},
    {"9 Fire" => "9.6.8", "8 Earth" => "8.3.1", "7 Metal" => "7.9.3", "6 Metal" => "6.6.5", "5 Earth" => "5.3.7", "4 Wood" => "4.9.9", "3 Wood" => "3.6.2", "2 Earth" => "2.3.4", "1 Water" => "1.9.6"},
    {"9 Fire" => "9.5.9", "8 Earth" => "8.2.2", "7 Metal" => "7.8.4", "6 Metal" => "6.5.6", "5 Earth" => "5.2.8", "4 Wood" => "4.8.1", "3 Wood" => "3.5.3", "2 Earth" => "2.2.5", "1 Water" => "1.8.7"},
    {"9 Fire" => "9.4.1", "8 Earth" => "8.1.3", "7 Metal" => "7.7.5", "6 Metal" => "6.4.7", "5 Earth" => "5.1.9", "4 Wood" => "4.7.2", "3 Wood" => "3.4.4", "2 Earth" => "2.1.6", "1 Water" => "1.7.8"},
    {"9 Fire" => "9.3.2", "8 Earth" => "8.9.4", "7 Metal" => "7.6.6", "6 Metal" => "6.3.8", "5 Earth" => "5.9.1", "4 Wood" => "4.6.3", "3 Wood" => "3.3.5", "2 Earth" => "2.9.7", "1 Water" => "1.6.9"}
  ]

  def get_star_ki_number(index,element)
    STAR_KI_NUMBERS[index][element]
  end

  STAR_KI_DESCRIPTIONS = {
    "9 Fire"  => {
      :element       => "9 Fire",
      :name          => "Lover",
      :color         => "Purple",
      :description   => "The Nine Fire person has all the qualities that the sun can bestow: inspiration, enlightenment, and clarity.  " + \
                        "These types have an enormous capacity to see the obvious and steer a path through troubled waters.  " + \
                        "In politics, particularly in times of change and revolution, they can inspire a nation.  " + \
                        "Their natural active energy attracts them to situations that are in a similar state of flux, or conversely, their natural strong charge attrats them to situations of stagnation that require major change.  " + \
                        "Of all the nine types this is the one most at home in the field of communication, especially when it concerns emotions and personal experiences.  " + \
                        "These traits, along with your warm, passionate nature, can make you successful in theater and film.  " + \
                        "The enlightened, liberal views of Nine Fires are well represented by the powet William Blake, but Nine Fires can be equally proud, vain, sophisticated, and critical." + \
                        "The senstive nature that underlies your strong, successful surface image can erupt stormily, but of the nine you are the equickest to forgive and forget.  " + \
                        "Like the One Water, as the 'middle daughter' you do not like to have your space invaded, and as a result have few close friends but plenty of contacts.  " + \
                        "Your capacity to see clearly and undersatnd the big picture does not help you deal with the practical problems of day-to-day living such as repairing the washing machine or changing the oil in your car!  " + \
                        "Appearances are important to you. In clothes, cars, and the contents of your home you pay considerable attention to detail and dislike individuals who seem sloppy or undtidy or who display poor manners.  " + \
                        "The world would be a poorer place without the colorful, sophisticated, inspiring Nine Fire.  You lift the spirit and inspire us with your performance, and you are certainly not going to be forgotten overnight.",
      :famous_people => "Christopher Columbus, Fancisco Pizarro, Jane Austen, Johann Sebastain Bach, Warren Beatty, Walt Disney, Franz Kafka, Stanley Kubrick, Liza Minelli, Sylvester Stallone, JRR Tolkien, WB Yeats, Alexander Graham Bell, Bill Gates, Jean-Jacques Rousseau"
    },
    "8 Earth" => {
      :element       => "8 Earth",
      :name          => "Transformer",
      :color         => "White",
      :description   => "As the 'youngest son', the Eight Earth has the combined experience of the older brothers and sisters.  You have a good natural sense of investment and freqently accumulate wealth when young, through either your own hard labor or an inheritance.  If your investment or business fails before middle age, you are quite likely to succeed again.  Your success in achieving material wealth tends to be achieved more through your single-mindedness than through any subltety, charm, or creative talent.
                         The most yang of the Earth elements, you tend to move slowly and persistently and to gain from your experiences.  The mountain imagery shows you to be a strong, stable character with enormous reserves of energy- although you need to retreat into your 'cave' from time to time, which gives the impression of being reserved and cool in most situations.  Of all the nine signs you are perhaps the hardest to get close to: you generally conceal your feelings and only display them when provoked. When you are challenged, you can dart out of your 'cave' and deliver a powerful argument.
                         You have a strong sense of what is right and just, and many Eight Earths have been involved in human rights.  The mountain, combining quailities of strength and contemplation, can bring about change and revolution in people's lives. But you can be resistant to change not initiated by you.  Your main asset is your composed, solid nature that can ride out most difficulties in life.  Your experience and hidden strength can be of enormous help to family, friends, and colleagues.",
      :famous_people => "Queen Elizabeth I, Ronald Reagan, Paul Cezanne, Paul Gauguin, Elton John, Grace Kelly, Beatrix Potter, Stephen Spielberg, Martin Luther King"
    },
    "7 Metal" => {
      :element       => "7 Metal",
      :name          => "Artist",
      :color         => "Red",
      :description   => "The time of year associated with the Seven Metal is late autumn, when farmers traditionally celebrated the harvest with relaxation and enjoyment.  Seven Metal types are great pleasure-seekers who, more than any other of the nine types, enjoy spending money on fashion, entertainment, and eating out. At the table you make a great host, with a capacity to listen and be receptive to others.  You often dress and appear younger than your natural age.
                         Like Six Metal you have natural leaderhsip qualities, but these are displayed in the advice you give others or the direction you suggest in the workplace.  You are charismatic, can be dramatic, and graceful in nature.  You have a great sense of fun and optimism and are endowed with a good sense of humor.  With your free and independent nature you are not keen to be drawn into long-term committments at work or in relationships.  Being the 'youngest daughter' in the Nine Star family, you have the accumulated experience of the rest of the family to help you.
                         Your articulacy and sense of timing make you an exceptionally good speaker, and many Seven Metal politicians were famous orators.  Seevn Metal individuals often exhibit a swing in the character between their outgoing, fun-loving sociable side and a much deeper, reflective, spiritual nature.",
      :famous_people => "William Pitt, David Livingstone, Robert Burns, Sean Connery, Francis Ford Coppola, DH Lawrence, Andrew Lloyd Webber, Claude Monet, Michelle Pfeiffer, Peter Tchaikovsky, Richard Wranger, Sir Isaac Newton, Louis Pasteur, Mike Tyson"
    },
    "6 Metal" => {
      :element       => "6 Metal",
      :name          => "Father",
      :color         => "White",
      :description   => "The most obvious trait is that of natural leadership and authority.  This can be in the field of poltics and militarism or fashion and the arts.  Many Six Metals have broken new ground and paved the way for future generations.  With the full force of heaven present in your sign, you can be extremely moral, direct, and noble.  The consistent nature can make you rational, careful, sometimes even rigid.  You are active an sociable, bu more reserved than the Seven Metal.  You tend to be a perfectionist and are quietly self-critical. The worst mistake anyone can make with a Six Metal friend is to criticize them.
                         Most Six Metal types place a lot of emphasis on family values.  You are natural leaders in the family and the community, and will often give up your outside interests to return to the home if that is what the situation warrants.  If you do not have a family of your own you may well be at the hub of activiy in the workplace.  You are a born leader in most situations.
                         In relationships you are the most loyal of all the nine types and are at your most comfortable in a relationship where you can take the lead.  Despite the fact that you are goverend by the full force of yang, the opposite side to this nature can come through, showing up as a strongly intuitive individual with a rational, wise approach to family and relationship problems.",
      :famous_people => "Mikhail Gorbachev, Richard Nixon, Yitzhak Rabin, Captain Scott, Amerigo Vespucci, Sir Arthur Conan Doyle, Salvador Dali, James Dean, John Lennon, Auguste Renoir, Sharon Stone, William Wordsworth, Johannes Kepler, J. Robert Oppenheimer, Jesse Owens"
    },
    "5 Earth" => {
      :element       => "5 Earth",
      :name          => "Center",
      :color         => "Yellow",
      :description   => "As a Five Earth you will always find yoruself at the center of what is going on.  At work you will frequently be at the hub of discussions or arguments and will probably feel left out if this is not the case.  In family life you will let your opinions and needs be known to those around you.  You have a great capacity to control situations and are likely to take the lead.
                         People often look to you for leadership and guidance.  While at times this can be fulfilling and exhilarating, friends can lean on you and take advantage. If you are off your guard or not feeling well you could find this a drain.  At these times you need to protec yourself from being exploited in this way.
                         The Five Earth is symbolic of the beginning and end of a cycle.  In relation to your principal nature this could be defined as a life of ups and downs, which in some situations could be quite extreme, involving success or failure. However, you should not take this negatively as Five Earth poeple have great resilience and bounce back in times of difficulty.  It is not unusual for Five Earths to make similar mistakes throughout their lives, but their resilient natures help them deal with challenges far more quickly than any of the other eight characters.
                         Your ideas and style may appear unorthodox, and you need to guard against being over-ambitious or too impractical.  You tend to take criticism or advice as a threat, which can make you either defensive or even more determined.  You are bold and determined, sometimes aggressively so, and can bring about enormous change through reinvention or the destruction of old systems or patterns.  Being outside the 'family, symbolic of the so-called 'seventh child' gives you a tendency to learn in life from outside the family- from your own difficulties and experiences.  As a result it is not unusual for you to develop and stabalize later in life.
                         Perhaps the best image for the Five Earth is a toddler.  If you watch young children explore and experience the world it can be fascinating and frustrating at the same time.  They wanter around the home like a mini sumo wrestler, wide-eyed, determined, inquisitive, with a tremendous strength in their belly as they totter from one activity to the next.  Yet there is no weakness in their gait- they are resilient and centered. They cannot be held back as they explore, make mistakes, and bounce back from some new discovery that turned out to be painful or frightening.  They look as if they own the world.
                         In relationships, since you are at the center, people will naturally gravitate towards you...and you enjoy having that attention focused on you.  As a result you may find yoruself in unconventional types relationships.",
      :famous_people => "Jacques Chirac, Oliver Cromwell, Mahatma Gandhi, Chiang Kai-shek, Sir Walter Raleigh, Richard Attenborough, Ludwig van Beethoven, Lord Byron, Anton Checkhov, Greta Garbo, Henri Matisse, John Calvin, Jean-Paul Sartre, Joe Dimaggio"
    },
    "4 Wood"  => {
      :element       => "4 Wood",
      :name          => "Guide",
      :color         => "Green",
      :description   => "The Four Wood has a nature that is governed by air.  This can be expressed through anything from stillness to a full-fledged hurricane, and as a result the Four Wood is one of the most emotional of the nine signs.  WHile at times appearing gentle and easy-going, these individuals can change their moods quickly and can be come stubborn and impulsive.
                         Although they share the tree-like nature of Three Woods, they are a lot more practical, thoughtful, and reliable.  They have great common sense and sensitivity to others. THis can work both for and against.  Sensitivity, when combined with good listening skills, can make for an excellent counsellor, but on the other hand it can make these people easily influenced by more powerful individuals. This trusting quality, innate to Four Woods, can make them gullible.
                         THeir sensitivity makes them deeply appreciative of poetry, painting, music, and other arts.  Their best form of communication is conversation, and they can be very charismatic orators, leaders, or political figures.  The natural element of wind can cause them to change their minds frequently, also their direction in life. On the other hand, the gentle quality of wind can allow their influence to pervade their work, their direction, and their relationships.
                         The trusting nature of Fours can cause difficulties in relationships as they regard everyone as trustworthy.  It is a good idea to seek the advice of a friend or confidant before embarking on a long-term committment in a relationship.  The facial expression of Fours, in particular the eyes, appears very often; this is a sign of trust.",
      :famous_people => "Charles I, Stalin, Joan Collins, Jimi Hendrix, Raphael, Martin Scorsese, William Shakespeare, Orson Welles, John Logie Baird, Galileo, Martin Luther, Rudolph Steiner"
    },
    "3 Wood"  => {
      :element       => "3 Wood",
      :name          => "Warrior",
      :color         => "Bright Green",
      :description   => "These individuals are born with the full force of spring with their nature.  Like the season, they are endowed with plenty of vitality and energy and are capable of strong, powerful action.  THey are very positive and optimistic, going about their tasks vigorously and expecting others to keep up.  In pursuit of growth or new pastures they may lead the way and leave the detail to others.
                         They symbolism of thunder has an explosive and awesome quality. As in nature, thunder indicates that some change is about to occur.  Pleo who dislike change and interruption in their lives dislike the vigorous and optimistic nature of the Three Wood. THey are open and honest, and can be unerringly frank to the poin where they alienate friends and colleagues.  They like to get their point of view across first, and only then will they listen to the thoughts and opinions of others.  These strongly opinionated people can have grandiose ideas, but if they can complement this by working with others who can 'ground' their ision they can abe one of the most creative of the nine types.
                         As the Eldest Son of the 9 Star family, Three Woods are likely to be precocious.  Many born under this sign have early success in their lives and move on as soon as they become bored.  THe full energy of spring that the sign represents also gives Three Woods a strong, virile nature, and many figures in the entertainment world who have this sign are regarded as pin-ups or heart-throbs.
                         Many born under this sign are humorous and outspoken, and frequently get themselves into trouble through their direct and honest sense of humor.  Fortunately, their articulacy can just as easily get them out of such situations! Spontaneity, humor, and charm are amongst the strongest assets of a Three Wood.",
      :famous_people => "Cecil Rhodes, Brigitte Bardot, Samuel Taylor Coleridge, Claude Debussy, Mick Jagger, Henry Moore, Robert De Niro, Laurence Olivier, Keith Richards, Robin Williams, Ernest Rutherford, James Watt, Friedrich Nietzsche"
    },
    "2 Earth" => {
      :element       => "2 Earth",
      :name          => "Mother",
      :color         => "Black",
      :description   => "For steadiness and reliability the Two Earth is unbeatable.The maternal quality best serves these individuals when they are in a position of service to others.  They are not natural born leadesr, but work away in the background and quietly get the job done.
                         The quality of earth represented here could be described as sand or compost, which gives us the image of its nurturing, helpful nature.  THe early and maternal nature that the Two possesses is expressed not only within the individual's family but within the larger family of humanity.  THere are many examples in history and in the present of leaders whose main aim was or is to serve others.
                         Two Earth Individuals are not aggressive by nature and have a strong, patient quality.  They are generally sociable and public-spirited and make excellent teachers or organizers.  Busying themselves helping others gives them great satisfaction. They need to be within a group, whether family, workplace, or elsewhere: without the support of an organization they can lose direction and spirit.  These types tend to be over-fastidious and fussy in their working methods, which can cause them to get bogged down in detail and irritates others.  On the plus side, they derive great strength from using their natural talent for diplomacy.
                         The Two Earth often feels at home on the land or in the woods.  Gardening or walking in the country are good forms of recreation.",
      :famous_people => "Tony Blair, Ho Chi Minh, Roald Amundsen, Hernando Cortes, Michael Douglas, Thomas Gainsborough, Marilyn Monroe, Pablo Picasso, Diana Ross, Oscar Wilde, Samule Morse"
    },
    "1 Water" => {
      :element       => "1 Water",
      :name          => "Innovator",
      :color         => "White",
      :description   => "To appreciate fully the qualities of the One White Water, we must look at the qualities of water in nature: on the one hand the lively, fresh mountain stream epitomized by waterfalls and activity, and on the other the deep, slow, calm qualities of ponds, lakes, and oceans. Many One Water characters fall into one or other of these categories.  THe spirited, youthful nature of a fresh mountain stream brings out a spirit of adventure.  One of water's qualities is it's natural exploratory tendency, always looking for the next opportunity to move on in search of the sea.  This argument is borne our by the number of famous explorers born under this sign.  Water also needs some kind of container, from a glass to the banks of a river.  Without this containment it's free-spirited nature can result in individuals being chaotic and undisciplined.  The opposite quality also holds true: from time to time, the One Water gype can seem to disciplined and too rigid.
                         The sensivtive, philosophical, and intuitive side of water's nature is exhibited in the many artists, writers, and composers born under this sign. This brooding, relfective quality is similar to the energy of deep water.
                         One Water is representative of the 'Middle Son', bringing out the diplomatic quality in some. You could be a good arbitor or lawyer as well as being a good listener within the family and community. Although you may seem quiet on the surface you hear all sides of the argument and will often come up with a win/win situation. They generally find listening easy and written communication comes naturally to them.
                         Water individuals value their own space and prefer to be independent.  As a result they can become isoated and may spend much of their middle and old age alone.
                         The element water, which in oriental medicine governs the functions of the kidney/adrenal system is always associated with sexual energy. Libido and sexual attraction are qualities that generally feature strongly with the One Water.  They exhibit great passion but are not flirtatious by nature, and once they make a commitment it is generally very deep.",
      :famous_people => "Catherine the Great, Anwar Sadat, Fidel Castro, Captain Cook, Sir Francis Drake, Eric Clapton, Errol FLynn, James Joyce, Diane Keaton, Igor Stravinsky, Andy Warhol, Rory Underwood"
    }
  }
end

class Date
  include NineStar

  def star_ki_number
    element = get_ki_element_for_year(self.year)
    index = get_date_range_index_from_date(self)
    get_star_ki_number(index, element)
  end

  def star_ki_element
    element = get_ki_element_for_year(self.year)
    STAR_KI_DESCRIPTIONS[element]
  end
end
