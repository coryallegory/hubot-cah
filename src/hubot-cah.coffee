# Description:
#   Cards Against Humanity game managed by Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cah help - List commands (https://github.com/coryallegory/hubot-cah)
#   hubot cah status - Current game status (https://github.com/coryallegory/hubot-cah)
#   hubot cah standings - List player scores for current game (https://github.com/coryallegory/hubot-cah)
#   hubot cah restart - Resets the game state (https://github.com/coryallegory/hubot-cah)
#   hubot cah register - Add self to the game (https://github.com/coryallegory/hubot-cah)
#   hubot cah unregister - Remove self from the game (https://github.com/coryallegory/hubot-cah)
#   hubot cah hand - List cards currently in your hand (https://github.com/coryallegory/hubot-cah)
#   hubot cah submit # # - Submit one or two cards for voting, depending how many are needed. # corresponds to the card id in your hand. The second # is optional. (https://github.com/coryallegory/hubot-cah)
#   hubot cah choose # - Choose the winning submission. # corresponds to the card choice id. (https://github.com/coryallegory/hubot-cah)
#
# Author:
#   Cory Metcalfe (corymetcalfe@gmail.com)


black_cards = [
  "(Draw 2, Pick 3) I went from ______ to _____, all thanks to _____.",
  "(Draw 2, Pick 3) _____ + _____ = _____",
  "(Pick 2) An international tribunal has found _____ guilty of _____.",
  "(Pick 2) An the Academy Award for _____ goes to _____.",
  "(Pick 2) Before _____, all we had was_____.",
  "(Pick 2) Dear Sir or Madam, We regret to inform you that the office of _____ has denied your request for _____.",
  "(Pick 2) For my next trick, I will pull _____ out of _____.",
  "(Pick 2) I never truly understood _____ until I encountered _____.",
  "(Pick 2) I spent my whole life working toward _____, only to have it ruined by _____.",
  "(Pick 2) If God didn't want us to enjoy _____, he wouldn't have given us _____.",
  "(Pick 2) In M. Night Shamalan's new movie, Bruce Willis discovers that _____ had really been _____ all along."
  "(Pick 2) In a pinch, _____ can be a suitable substitute for _____.",
  "(Pick 2) In a world ravaged by _____, our only solace is _____.",
  "(Pick 2) Lifetime presents _____, the story of _____.",
  "(Pick 2) Michael Bay's new three-hour action epic pits _____ against _____.",
  "(Pick 2) Rumor has it that Vladimir Putin's favorite dish is _____ stuffed with _____.",
  "(Pick 2) Step 1: _____. Step 2: _____. Step 3: Profit.",
  "(Pick 2) That's right I killed _____. How you ask? _____.",
  "(Pick 2) What's the next superhero/sidekick duo?",
  "(Pick 2) When I was tripping on acid _____ turned into _____.",
  "(Pick 2) You haven't truly lived until you've experienced _____ and _____ at the same time.",
  "(Pick 2) _____ is a slippery slope that leads to _____.",
  "(Pick 2) _____ would be woefully incomplete without _____.",
  "(Pick 2) After months of practice with _____, I think I'm finally ready for _____.",
  "(Pick 2) With enough time and pressure, _____ will turn into _____.",
  "(Pick 2) _____: Hours of fun. Easy to use. Perfect for _____!",
  "(Pick 2) When you get right down to it, _____ is just _____.",
  "A romantic candlelit dinner would be incomplete without _____.",
  "A successful job interview begins with a firm handshake and ends with _____.",
  "After blacking out during New Year's Eve, I was awoken by _____.",
  "After months of debate, the Occupy Wall Street General Assembly could only agree on “More _____!”",
  "After the earthquake, Sean Penn brought ______ to the people of Haiti.",
  "Alternative medicine is now embracing the curative powers of _____.",
  "And I would have gotten away with it, too, if it hadn't been for _____.",
  "And what did you bring for show and tell?",
  "Anthropologists have recently discovered a primitive tribe that worships _____.",
  "As part of his contract, Prince won't perform without _____ in his dressing room.",
  "As part of his daily regimen, Anderson Cooper sets aside 15 minutes for _____.",
  "BILLY MAYS HERE FOR _____.",
  "Before I run for president, I must destroy all evidence of my involvement with _____.",
  "But before I kill you, Mr. Bond, I must show you _____.",
  "Call the law offices of Goldstein & Goldstein, because no one should have to tolerate _____ in the workplace.",
  "Charades was ruined for me forever when my mom had to act out _____.",
  "Coming to Broadway this season, _____: The Musical.",
  "Dear Abby, I'm having some trouble with ______ and would like your advice.",
  "During Picasso's often-overlooked Brown Period, he produced hundreds of paintings of _____.",
  "During high school I never really fit in until I found _____ club.",
  "During his midlife crisis, my dad got really into _____.",
  "During sex, I like to think about _____.",
  "Every Christmas my uncle gets drunk and tells the story about _____.",
  "Everyone down on the ground! We don't want to hurt anyone. We're just here for _____.",
  "Finally! A service that delivers _____ right to your door.",
  "Having problems with _____? Try _____!",
  "He who controls _____ controls the world.",
  "Hey baby, come back to my place and I'll show you _____.",
  "How am I maintaining my relationship status.",
  "I do not know with what weapons World War III will be fought, but World War IV will be fought with ______.",
  "I drink to forget _____.",
  "I got 99 problems but _____ ain't one.",
  "I learned the hard way that you can't cheer up a grieving friend with _____.",
  "I'm not like the rest of you. I'm too rich and busy for _____.",
  "I'm sorry professor, but I couldn't complete my homework because of _____.",
  "In 1,000 years when paper money is but a distant memory, _____ will be our currency.",
  "In L.A. county Jail, word is you can trade 200 cigarettes for _____.",
  "In Michael Jackson's final moments, he thought about _____.",
  "In Rome, there are whisperings that the Vatican has a secret room devoted to _____.",
  "In an attempt to reach a wider audience, the Smithsonian Museum of Natural History has opened an interactive exhibit on _____.",
  "In his new self-produced album, Kanye West raps over the sounds of _____.",
  "In his newest and most difficult stunt, David Blaine must escape from _____.",
  "In its new tourism campaign, Detroit proclaims that it has finally eliminated _____.",
  "In the distant future, historians will agree that _____ marked the beginning of America's decline.",
  "In the new Disney Channel Original Movie, Hannah Montana struggles with _____ for the first time.",
  "In the seventh circle of Hell, sinners must endure _____ for all eternity.",
  "Instead of coal, Santa now gives the bad children _____ .",
  "It's a pity that kids these days are all getting involved with _____.",
  "Jesus is _____.",
  "Life for American Indians was forever changed when the White Man introduced them to _____.",
  "Listen, son. If you want to get involved with _____, I won't stop you. Just steer clear of _____.",
  "Little Miss Muffet, Sat on a tuffet, Eating her curds and _____.",
  "Loving you is easy 'cause you're _____.",
  "MTV's new reality show features eight washed-up celebrities living with _____.",
  "Major League Baseball has banned _____ for giving players an unfair advantage.",
  "Maybe she's born with it. Maybe it's _____.",
  "Members of New York's social elite are paying thousands of dollars just to experience _____.",
  "Money can't buy me love, but it can buy me _____.",
  "My country, 'tis of thee, sweet land of _____.",
  "My gym teacher got fired for adding _____ to the obstacle course.",
  "My life is ruled by a vicious cycle of _____ and _____.",
  "My mom freaked out when she looked at my browser history and found _____.com.",
  "My new favorite porn star is Joey “_____” McGee.",
  "Next from J.K. Rowling: Harry Potter and the Chamber of _____.",
  "Next on ESPN2: The World Series of _____.",
  "Next time on Dr. Phil: How to talk to your child about _____.",
  "On the third day of Christmas, my true love game to me: three French hens, two turtle doves, and _____.",
  "Only two things in life are certain: death and _____.",
  "Science will never explain the origin of _____.",
  "Studies show that lab rats navigate mazes 50% faster after being exposed to _____",
  "TSA guidelines now prohibit _____ on airplanes.",
  "The CIA now interrogates enemy agents by repeatedly subjecting them to _____.",
  "The Five Stages of Grief: denial, anger, bargaining, _____, acceptance.",
  "The blind date was going horribly until we discovered our shared interest in _____.",
  "The class field trip was completely ruined by _____.",
  "The healing process began when I joined a support group for victims of _____.",
  "The socialist governments of Scandanavia have declared that access to – is a basic human right.",
  "The votes are in, and the new high school mascot is _____.",
  "This holiday season, Tim Allen must overcome his fear of _____ to save Christmas.",
  "This is the way the world ends This is the way the world ends Not with a bang but with _____.",
  "This is your captain speaking. Fasten your seatbelts and prepare for _____.",
  "This month's Cosmo: 'Spice up your sex life by bringing ______ into the bedroom.'",
  "This season on Man vs. Wild, Bear Grylls must survive in the depths of the Amazon with only _____ and his wits.",
  "To prepare for his upcoming role, Daniel Day-Lewis immersed himself in the world of _____.",
  "Tonight on 20/20: What you don't know about _____ could kill you.",
  "Turns out that _____-Man was neither the hero we needed nor wanted.",
  "Wake up, America. Christmas is under attack by secular liberals and their _____.",
  "War! What is it good for?",
  "What am I giving up for Lent?",
  "What are my parents hiding from me?",
  "What brought the orgy to a grinding halt?",
  "What did I bring back from Mexico?",
  "What did Vin Diesel eat for dinner?",
  "What did the US airdrop to the children of Afghanistan?",
  "What do old people smell like?",
  "What does Dick Cheney prefer?",
  "What don't you want to find in your Chinese food?",
  "What ended my last relationship?",
  "What gets better with age?",
  "What gives me uncontrollable gas?",
  "What has been making life difficult at the nudist colony?",
  "What helps Obama unwind?",
  "What is Batman's guilty pleasure?",
  "What keeps me warm during the cold, cold winter?",
  "What left this stain on my couch?",
  "What never fails to liven up the party?",
  "White people like _____.",
  "What will I bring back in time to convince people that I am a powerful wizard?",
  "What will always get you laid?",
  "What would grandma find disturbing, yet oddly charming?",
  "What's Teach for America using to inspire inner city students to succeed?",
  "What's a girl's best friend?",
  "What's my anti-drug?",
  "What's my secret power?",
  "What's that smell?",
  "What's that sound?",
  "What's the crustiest?",
  "What's the gift that keeps on giving?",
  "What's the most emo?",
  "What's the new fad diet?",
  "What's the next Happy Meal toy?",
  "What's there a ton of in heaven?",
  "When I am President of the United States, I will create the Department of _____.",
  "When I am a billionaire, I shall erect a 50-foot statue to commemorate _____.",
  "When I pooped, what came out of my butt?",
  "When Pharaoh remained unmoved, Moses called down a Plague of _____.",
  "When all else fails, I can always masturbate to _____.",
  "When the United States raced the Soviet Union to the moon, the Mexican government funneled millions of pesos into research on _____.",
  "Why am I sticky?",
  "Why can't I sleep at night?",
  "Why do I hurt all over?",
  "_____. kid tested mother approved.",
  "_____. Awesome in theory, kind of a mess in practice.",
  "_____. Betcha can't have just one.",
  "_____. High five bro.",
  "_____. It's a trap!",
  "_____. That's how I want to die.",
  "_____: good to the last drop.",
  "_____? There's an app for that.",
]

white_cards = [
  "72 virgins.",
  "8 oz. of sweet Mexican black-tar heroin.",
  "A 55-gallon drum of lube.",
  "A Bop It.",
  "A Burmese tiger pit.",
  "A Christmas stocking full of coleslaw.",
  "A Gypsy curse.",
  "A Hungry-Man Frozen Christmas Dinner for One.",
  "A PowerPoint presentation.",
  "A Super Soaker full of cat pee.",
  "A bag of magic beans.",
  "A balanced breakfast.",
  "A beached whale.",
  "A big black dick.",
  "A big hoopla about nothing.",
  "A bigger, blacker dick.",
  "A black male in his early 20s, last seen wearing a hoodie.",
  "A bleached asshole.",
  "A bloody pacifier.",
  "A boo-boo.",
  "A botched circumcision.",
  "A brain tumor.",
  "A can of whoop-ass.",
  "A cat video so cute that your eyes roll back and your spine slides out of your anus.",
  "A clandestine butt scratch.",
  "A cooler full of organs.",
  "A cop who is also a dog.",
  "A crappy little hand.",
  "A death ray.",
  "A defective condom.",
  "A disappointing birthday party.",
  "A dollop of sour cream.",
  "A drive-by shooting.",
  "A falcon with a cap on its head.",
  "A fetus.",
  "A foul mouth.",
  "A gassy antelope.",
  "A gentle caress of the inner thigh.",
  "A good sniff.",
  "A greased-up Matthew McConaughey.",
  "A homoerotic volleyball montage.",
  "A hot mess.",
  "A lamprey swimming up the toilet and latching onto your taint.",
  "A lifetime of sadness.",
  "A look-see.",
  "A low standard of living.",
  "A magic hippie love cloud.",
  "A man in yoga pants with a ponytail and feather earrings.",
  "A mating display.",
  "A micropenis.",
  "A middle-aged man on roller skates.",
  "A mime having a stroke.",
  "A monkey smoking a cigar.",
  "A mopey zoo lion.",
  "A murder most foul.",
  "A nuanced critique.",
  "A passionate Latino lover.",
  "A pile of squirming bodies.",
  "A pinata full of scorpions.",
  "A really cool hat.",
  "A rival dojo",
  "A robust mongoloid.",
  "A sad fat dragon with no friends.",
  "A sad handjob.",
  "A salty surprise.",
  "A sassy black woman.",
  "A sausage festival.",
  "A sea of troubles.",
  "A slightly shittier parallel universe.",
  "A snapping turtle biting the tip of your penis.",
  "A soulful rendition of “Ol' Man River.”",
  "A spontaneous conga line.",
  "A squadron of moles wearing aviator goggles.",
  "A stray pube.",
  "A surprising amount of hair.",
  "A sweaty, panting leather daddy.",
  "A sweet spaceship.",
  "A thermonuclear detonation.",
  "A tiny horse.",
  "A toxic family environment.",
  "A vagina that leads into another dimension.",
  "A visually arresting turtleneck.",
  "A web of lies.",
  "A windmill full of corpses.",
  "A woman scorned.",
  "A zesty breakfast burrito.",
  "AIDS.",
  "AXE body spray.",
  "Aaron Burr.",
  "Active listening.",
  "Actually getting shot, for real.",
  "Actually taking candy from a baby.",
  "Adderall.",
  "African children.",
  "Agriculture.",
  "Alcoholism.",
  "All my friends dying.",
  "All of this blood.",
  "All-you-can-eat shrimp for $4.99.",
  "Altar boys.",
  "American Gladiators.",
  "Amputees.",
  "An M. Night Shyamalan plot twist.",
  "An Oedipus complex.",
  "An all-midget production of Shakespeare's Richard III.",
  "An army of skeletons.",
  "An ass disaster.",
  "An asymmetric boob job.",
  "An erection that lasts more than four hours.",
  "An ether-soaked rag.",
  "An honest cop with nothing left to lose.",
  "An icepick lobotomy.",
  "An unhinged ferris wheel rolling toward the sea.",
  "An unstoppable wave of fire ants.",
  "Anal beads.",
  "Another goddamn vampire movie.",
  "Another shitty year.",
  "Another shot of morphine.",
  "Apologizing.",
  "Appreciative snapping.",
  "Arnold Schwarzenegger.",
  "Asians who aren't good at math.",
  "Assless chaps.",
  "Attitude.",
  "Auschwitz.",
  "Authentic Mexican cuisine.",
  "Autocannibalism.",
  "BATMAN!!!",
  "Balls.",
  "Barack Obama.",
  "Basic human decency.",
  "Beating your wives.",
  "Beefin' over turf.",
  "Bees?",
  "Being a busy adult with many important things to do.",
  "Being a dick to children.",
  "Being a dinosaur.",
  "Being a motherfucking sorcerer.",
  "Being awesome at sex.",
  "Being fabulous.",
  "Being marginalized.",
  "Being on fire.",
  "Being rich.",
  "Bill Clinton, naked on a bearskin rug with a saxophone.",
  "Bill Nye the Science Guy.",
  "Bingeing and purging.",
  "Bitches.",
  "Black people.",
  "Bling.",
  "Blood farts.",
  "Blowing some dudes in an alley.",
  "Booby-trapping the house to foil burglars.",
  "Boogers.",
  "Boris the Soviet Love Hammer.",
  "Bosnian chicken farmers.",
  "Breaking out into song and dance.",
  "Britney Spears at 55.",
  "Bullshit.",
  "Buying the right pants to be cool.",
  "Cards Against Humanity.",
  "Carnies.",
  "Catapults.",
  "Catastrophic Urethral Trauma.",
  "Centaurs.",
  "Chainsaws for hands.",
  "Charisma.",
  "Cheating in the Special Olympics.",
  "Child abuse.",
  "Child beauty pageants.",
  "Children on leashes.",
  "Chivalry.",
  "Christopher Walken.",
  "Chugging a lava lamp.",
  "Civilian casualties.",
  "Clams.",
  "Classist Undertones.",
  "Clearing a bloody path through Walmart with a scimitar.",
  "Coat hanger abortions.",
  "Cock.",
  "Cockfights.",
  "College.",
  "Concealing a boner.",
  "Consultants.",
  "Copping a feel.",
  "Coughing into a vagina.",
  "Count Chocula.",
  "Crippling debt.",
  "Crying into the pages of Sylvia Plath.",
  "Crystal meth.",
  "Cuddling.",
  "Customer service representatives.",
  "Cybernetic enhancements.",
  "Daddy issues.",
  "Daddy's belt.",
  "Dancing with a broom.",
  "Darth Vader.",
  "Date rape.",
  "Dead babies.",
  "Dead parents.",
  "Death by Steven Seagal.",
  "Deflowering the princess.",
  "Demonic possession.",
  "Dental dams.",
  "Dick Cheney.",
  "Dick fingers.",
  "Dining with cardboard cutouts of the cast of “Friends.”",
  "Disco fever.",
  "Doin' it in the butt.",
  "Doing the right thing.",
  "Domino's Oreo Dessert Pizza.",
  "Dorito breath.",
  "Double penetration.",
  "Drinking alone.",
  "Drinking ten 5-hour ENERGYs to get fifty continuous hours of energy.",
  "Dropping a chandelier on your enemies and riding the rope up.",
  "Dry heaving.",
  "Dwarf tossing.",
  "Dying alone and in pain.",
  "Dying of dysentery.",
  "Dying.",
  "Eating Tom Selleck's mustache to gain his powers.",
  "Eating all of the cookies before the AIDS bake-sale.",
  "Eating an albino.",
  "Eating an entire snowman.",
  "Eating the last known Bison.",
  "Edible underpants.",
  "Elderly Japanese men.",
  "Elf cum.",
  "Embryonic stem cells.",
  "Emotions.",
  "Enormous Scandinavian women.",
  "Erectile dysfunction.",
  "Estrogen.",
  "Ethnic cleansing.",
  "Eugenics.",
  "Euphoria by Calvin Klein.",
  "Exactly what you'd expect.",
  "Exchanging pleasantries.",
  "Existing.",
  "Expecting a burp and vomiting on the floor.",
  "Explosions.",
  "Fabricating statistics.",
  "Famine.",
  "Fancy Feast.",
  "Farting and walking away.",
  "Fear itself.",
  "Feeding Rosie O'Donnell.",
  "Fetal alcohol syndrome.",
  "Fiery poops.",
  "Figgy pudding.",
  "Filling every orifice with butterscotch pudding.",
  "Finding Waldo.",
  "Finding a skeleton.",
  "Finger painting.",
  "Fingering.",
  "Firing a rifle into the air while balls deep in a squealing hog.",
  "Fisting.",
  "Five-Dollar Footlongs.",
  "Flash flooding.",
  "Flesh-eating bacteria.",
  "Flightless birds.",
  "Flying robots that kill people.",
  "Flying sex snakes.",
  "Foreskin.",
  "Forgetting the Alamo.",
  "Former President George W. Bush.",
  "Free samples.",
  "Friction.",
  "Friendly fire.",
  "Friends who eat all the snacks.",
  "Friends with benefits.",
  "Frolicking.",
  "Fuck Mountain.",
  "Fucking up “Silent Night” in front of 300 parents.",
  "Full frontal nudity.",
  "Gandalf.",
  "Gay aliens",
  "Geese.",
  "Genetically engineered super-soldiers.",
  "Genghis Khan.",
  "Genital piercings.",
  "George Clooney's musk.",
  "German dungeon porn.",
  "Getting abducted by Peter Pan.",
  "Getting drunk on mouthwash.",
  "Getting hilariously gang-banged by the Blue Man Group.",
  "Getting in her pants, politely.",
  "Getting naked and watching Nickelodeon.",
  "Getting really high.",
  "Getting so angry that you pop a boner.",
  "Getting your dick stuck in a Chinese finger trap with another dick.",
  "Ghandi.",
  "Ghosts.",
  "Gift-wrapping a live hamster.",
  "Girls that always be textin'.",
  "Giving 110%.",
  "Gladitorial combat.",
  "Glenn Beck being harried by a swarm of buzzards.",
  "Glenn Beck catching his scrotum on a curtain hook.",
  "Glenn Beck convulsively vomiting as a brood of crab spiders hatches in his brain and erupts from his tear ducts.",
  "Global warming.",
  "Gloryholes.",
  "GoGurt.",
  "Goats eating cans.",
  "Goblins.",
  "God.",
  "Going around punching people.",
  "Golden showers.",
  "Good grammar.",
  "Grandma.",
  "Grandpa's ashes.",
  "Graphic violence, adult language and some sexual content.",
  "Grave robbing.",
  "Guys who don't call.",
  "Half-assed foreplay.",
  "Harry Potter erotica.",
  "Having sex on top of a pizza.",
  "Having shotguns for legs.",
  "Heartwarming orphans.",
  "Her Royal Highness, Queen Elizabeth II.",
  "Heteronormativity.",
  "Hillary Clinton's death stare.",
  "Hipsters.",
  "Historical revisionism.",
  "Historically black colleges.",
  "Home video of Oprah sobbing into a Lean Cuisine.",
  "Homeless people.",
  "Hope.",
  "Hormone injections.",
  "Horrifying laser hair removal accidents.",
  "Horse meat.",
  "Hot Cheese.",
  "Hot Pockets.",
  "Hot people.",
  "Hulk Hogan.",
  "Hurricane Katrina.",
  "Immaculate conception.",
  "Inappropriate yodeling.",
  "Incest.",
  "Indescribable loneliness.",
  "Insatiable bloodlust.",
  "Intelligent design.",
  "Intimacy problems.",
  "Italians.",
  "Jafar.",
  "Jean-Claude Van Damme.",
  "Jeff Goldblum.",
  "Jerking off into a pool of children's tears.",
  "Jew-fros.",
  "Jewish fraternities.",
  "Jibber-jabber.",
  "John Wilkes Booth.",
  "Judge Judy.",
  "Jumping out at people.",
  "Just the tip.",
  "Justin Bieber.",
  "Kamikaze pilots.",
  "Kanye West.",
  "Keanu Reaves.",
  "Keg stands.",
  "Kids with ass cancer.",
  "Kim-Jong-il.",
  "Krampus, the Austrian Christmas Monster.",
  "Lactation.",
  "Lady Gaga.",
  "Lance Armstrong's missing testicle.",
  "Land mines.",
  "Laying an egg.",
  "Leaving an awkward voicemail.",
  "Leprosy.",
  "Letting everyone down.",
  "Leveling up.",
  "Licking things to claim them as your own.",
  "Literally eating shit.",
  "Living in a trashcan.",
  "Lockjaw.",
  "Loki, the trickster god.",
  "Loose lips.",
  "Lumberjack fantasies.",
  "Lunchables.",
  "Mad hacky-sack skills.",
  "Making a friend.",
  "Making a pouty face.",
  "Making the penises kiss.",
  "Making the penises kiss.",
  "Mall Santa.",
  "Man meat.",
  "Masturbation.",
  "Me time.",
  "Me.",
  "MechaHitler.",
  "Media coverage.",
  "Medieval Times Dinner & Tournament.",
  "Men.",
  "Menstruation.",
  "Michael Jackson.",
  "Michelle Obama's arms.",
  "Mild autism.",
  "Mooing.",
  "Moral ambiguity.",
  "Morgan Freeman's voice.",
  "Mouth herpes.",
  "Mr. Clean, right behind you.",
  "Mufasa's death scene.",
  "Muhammad (Praise Be Unto Him).",
  "Multiple stab wounds.",
  "Mutually-assured destruction.",
  "My collection of high-tech sex toys.",
  "My first kill.",
  "My genitals.",
  "My hot cousin.",
  "My humps.",
  "My inner demons.",
  "My machete.",
  "My manservant, Claude.",
  "My relationship status.",
  "My sex life.",
  "My soul.",
  "My vagina.",
  "Natalie Portman.",
  "Natural male enhancement.",
  "Natural selection.",
  "Nazis.",
  "Necrophilia.",
  "Neil Patrick Harris.",
  "New Age music.",
  "Nickelback.",
  "Nicolas Cage.",
  "Nipple blades.",
  "Nocturnal emissions.",
  "Not contributing to society in any meaningful way.",
  "Not giving a shit about the Third World.",
  "Not having sex.",
  "Not reciprocating oral sex.",
  "Nothing.",
  "Nublile slave boys.",
  "Nunchuck moves.",
  "Obesity.",
  "Object permanence.",
  "Old-people smell.",
  "Ominous background music.",
  "One Ring to rule them all.",
  "One thousand Slim Jims.",
  "Oompa-Loompas.",
  "Opposable thumbs.",
  "Overcompensation.",
  "Overpowering your father.",
  "Oversized lollipops.",
  "Pabst Blue Ribbon.",
  "Pac-Man uncontrollably guzzling cum.",
  "Panda sex.",
  "Panty raids.",
  "Parting the Red Sea.",
  "Party poopers.",
  "Passable transvestites.",
  "Passing a kidney stone.",
  "Passive-aggressive Post-it notes.",
  "Pedophiles.",
  "Peeing a little bit.",
  "Penis envy.",
  "Picking up girls at the abortion clinic.",
  "Pictures of boobs.",
  "Pistol-whipping a hostage.",
  "Pixelated bukkake.",
  "Police brutality.",
  "Pooping back and forth. Forever.",
  "Poor life choices.",
  "Poor people.",
  "Poorly-timed Holocaust jokes.",
  "Porn stars.",
  "Powerful thighs.",
  "Prancing.",
  "Praying the gay away.",
  "Preteens.",
  "Pretending to be happy.",
  "Pretending to care.",
  "Pretty Pretty Princess Dress-Up Board Game.",
  "Pterodactyl eggs.",
  "Puberty.",
  "Public ridicule.",
  "Pulling out",
  "Pumping out a baby every nine months.",
  "Puppies!",
  "Putting an entire peanut butter and jelly sandwich into the VCR.",
  "Queefing.",
  "Quiche.",
  "Quivering jowls.",
  "Racially-biased SAT questions.",
  "Racism.",
  "Raping and pillaging.",
  "Re-gifting.",
  "Repression.",
  "Republicans.",
  "Revenge fucking.",
  "Reverse cowgirl.",
  "Riding off into the sunset.",
  "Ripping into a man's chest and pulling out his still-beating heart.",
  "Rising from the grave.",
  "Road head.",
  "Robert Downey, Jr.",
  "RoboCop.",
  "Roland the Farter, flatulist to the king.",
  "Ronald Reagan.",
  "Roofies.",
  "Running naked through a mall, pissing and shitting everywhere.",
  "Ryan Gosling riding in on a white horse.",
  "Same-sex ice dancing.",
  "Samuel L. Jackson.",
  "Santa Claus.",
  "Santa's heavy sack.",
  "Sarah Palin.",
  "Saxophone solos.",
  "Scalping.",
  "Science.",
  "Scientology",
  "Screaming like a maniac.",
  "Scrotal frostbite.",
  "Scrotum tickling.",
  "Scrubbing under the folds.",
  "Sean Connery.",
  "Sean Penn.",
  "Seduction.",
  "Self-flagellation.",
  "Self-loathing.",
  "Seppuku.",
  "Serfdom.",
  "Several intertwining love stories featuring Hugh Grant.",
  "Sexting.",
  "Sexual humiliation.",
  "Sexual tension.",
  "Sexy pillow fights.",
  "Sexy siamese twins.",
  "Shaft.",
  "Shapeshifters.",
  "Shaquille O'Neal's acting career.",
  "Sharing needles.",
  "Shutting the fuck up.",
  "Skeletor.",
  "Slapping a racist old lady.",
  "Slow motion.",
  "Smallpox blankets.",
  "Smegma.",
  "Sneezing, farting, and coming at the same time."
  "Sniffing glue.",
  "Socks.",
  "Soiling oneself.",
  "Some douche with an acoustic guitar.",
  "Some kind of bird-man.",
  "Some really fucked-up shit.",
  "Soup that is too hot.",
  "Space Jam on VHS.",
  "Space muffins.",
  "Special musical guest, Cher.",
  "Spectacular abs.",
  "Spending lots of money.",
  "Sperm whales.",
  "Spontaneous human combustion.",
  "Spring break!",
  "Statistically validated stereotypes.",
  "Stephen Hawking talking dirty.",
  "Stifling a giggle at the mention of Hutus and Tutsis.",
  "Stranger danger.",
  "Subduing a grizzly bear and making her your wife.",
  "Sudden Poop Explosion Disease.",
  "Suicidal thoughts.",
  "Sunshine and rainbows.",
  "Surprise sex!",
  "Survivor's guilt.",
  "Sweet, sweet vengeance.",
  "Swiftly achieving orgasm.",
  "Switching to Geico.",
  "Swooping.",
  "Take-backsies.",
  "Taking a man's eyes and balls out and putting his eyes where his balls go and then his balls in the eye holes.",
  "Taking down Santa with a surface-to-air missiles.",
  "Taking off your shirt.",
  "Tangled Slinkys.",
  "Tasteful sideboob.",
  "Teaching a robot to love.",
  "Team-building exercises.",
  "Teenage pregnancy.",
  "Tentacle porn.",
  "Testicular torsion.",
  "That ass.",
  "That thing that electrocutes your abs.",
  "The American Dream.",
  "The Big Bang.",
  "The Blood of Christ.",
  "The Care Bear Stare.",
  "The Chinese gymnastics team.",
  "The Dance of the Sugar Plum Fairy.",
  "The Donald Trump Seal of Approval.",
  "The Fanta girls.",
  "The Force.",
  "The Google.",
  "The Gulags.",
  "The Hamburglar.",
  "The Harlem Globetrotters.",
  "The Holy Bible.",
  "The Hustle.",
  "The Jews.",
  "The KKK.",
  "The Kool-Aid Man.",
  "The Land of Chocolate.",
  "The Little Engine That Could.",
  "The Make-A-Wish foundation.",
  "The Pope.",
  "The Qeusadilla Explosion Salad from Chili's.",
  "The Rapture.",
  "The Rev. Dr. Martin Luther King, Jr.",
  "The South.",
  "The Star Wars Holiday Special.",
  "The Tempur-Pedic Swedish Sleep System.",
  "The Three-Fifths Compromise.",
  "The Trail of Tears.",
  "The Ubermensch.",
  "The Virginia Tech Massacre.",
  "The World of Warcraft.",
  "The boners of the elderly.",
  "The chronic.",
  "The clitoris.",
  "The corporations.",
  "The day the birds attacked.",
  "The economy.",
  "The entire Internet.",
  "The folly of man.",
  "The forbidden fruit.",
  "The four arms of Vishnu.",
  "The gays.",
  "The glass ceiling.",
  "The grey nutrient broth that sustains Mitt Romney.",
  "The hardworking Mexican.",
  "The harsh light of day.",
  "The heart of a child.",
  "The hiccups.",
  "The homosexual agenda.",
  "The human body.",
  "The inevitable heat death of the universe.",
  "The invisible hand.",
  "The mere concept of Applebee's.",
  "The milk man.",
  "The miracle of childbirth.",
  "The mixing of the races.",
  "The moist, demanding chasm of his mouth.",
  "The new Radiohead album.",
  "The placenta.",
  "The primal, ball-slapping sex your parents are having right now.",
  "The profoundly handicapped.",
  "The shambling corpse of Larry King.",
  "The systematic destruction of an entire people and their way of life.",
  "The taint; the grundle; the fleshy fun-bridge.",
  "The terrorists.",
  "The thin veneer of sitautional causality that underlies porn.",
  "The tiny calloused hands of the Chinese  children that made this card.",
  "The token minority.",
  "The true meaning of Christmas.",
  "The underground railroad.",
  "The violation of our most basic human rights.",
  "The way white people is.",
  "Third base.",
  "Three months in the hole.",
  "Tiny nipples.",
  "Tom Cruise.",
  "Tongue.",
  "Toni Morrison's vagina.",
  "Too much hair gel.",
  "Tripping balls.",
  "Tweeting.",
  "Two midgets shitting into a bucket.",
  "Unfathomable stupidity.",
  "Unlimited soup, salad, and breadsticks.",
  "Upgrading homeless people to mobile hotspots.",
  "Uppercuts.",
  "Vehicular manslaughter.",
  "Velcro",
  "Viagra.",
  "Vietnam flashbacks.",
  "Vigilante justice.",
  "Vigorous jazz hands.",
  "Vikings.",
  "Vomiting mid-blowjob.",
  "Waiting 'til marriage.",
  "Waking up half-naked in a Denny's parking lot.",
  "Warm, velvety muppet sex"
  "Waterboarding.",
  "Weapons-grade plutonium.",
  "Wearing an octopus for a hat.",
  "Wearing underwear inside-out to avoid doing laundry.",
  "Whatever Kwanzaa is supposed to be about.",
  "When you fart and a little bit comes out.",
  "Whining like a little bitch.",
  "Whipping a disobedient slave.",
  "Whipping it out.",
  "White people.",
  "White privilege.",
  "Wifely duties.",
  "William Shatner.",
  "Winking at old people.",
  "Wiping her butt.",
  "Women in yogurt commercials.",
  "Women's suffrage.",
  "Words, words, words.",
  "World peace.",
  "YOU MUST CONSTRUCT ADDITIONAL PYLONS.",
  "Yeast.",
  "Zeus's sexual appetites.",
]

random_black_card: () ->
  card_index = Math.floor(Math.random()*black_cards.length)
  return card_index

random_white_card: () ->
    card_index = Math.floor(Math.random()*white_cards.length)
    return card_index


game = {}
# game states: 0=waiting, 1=submission, 2=choosing
reset_game = () ->
  game = {
    state: 0,
    names: [],
    scores_by_name: {},
    current_question: null,
    dealer_name: null,
    hands_by_name: {},
    submissions_by_name: {},
    choices: [],
    round_number: 0,
    round_start: null
}
reset_game()


update_hand_for_name = (name) ->
  hand = []
  submission = game.submissions_by_name[name]
  for phrase in game.hands_by_name[name]
    if phrase?
      if !submission? or submission.indexOf(phrase)<0
        hand.push phrase
  while hand.length < 5
    hand.push random_white_card()
  game.hands_by_name[name] = hand


lock_submissions = () ->
  if game.state == 1
    game.state = 2
    game.choices = []
    for name in game.names
      submission = game.submissions_by_name[name]
      if submission?
        game.choices.push submission
    game.choices.sort()


time_remaining = () ->
  if game.state == 1
    seconds_passed = ((new Date).getTime() - game.round_start) / 1000
    seconds_remaining = 120 - seconds_passed
    return seconds_remaining
  return 0


new_round = (dealer_name) ->
  game.dealer_name = dealer_name
  game.current_question = random_black_card()
  game.round_number = game.round_number + 1
  game.round_start = (new Date).getTime()
  for name in game.names
    update_hand_for_name(name)
  game.state = 1

  return 'Round ' + game.round_number + ': ' + game.current_question



module.exports = (robot) ->
  

  robot.respond /cah help/, (msg) ->
    message = 'https://github.com/coryallegory/hubot-cah'
    message = message + 'cah help - List commands'
    message = message + 'cah status - Current game status'
    message = message + 'cah standings - List player scores for current game'
    message = message + 'cah restart - Resets the game state'
    message = message + 'cah register - Add self to the game'
    message = message + 'cah unregister - Remove self from the game'
    message = message + 'cah hand - List cards currently in your hand'
    message = message + 'cah submit # # - Submit one or two cards for voting, depending how many are needed. # corresponds to the card id in your hand. The second # is optional.'
    message = message + 'cah choose # - Choose the winning submission. # corresponds to the card choice id.'
    msg.send message
  

  robot.respond /cah status/, (msg) ->
    if game.state == 0
      msg.send 'Waiting for players to register.'
    if game.state == 1
      seconds_remaining = time_remaining()
      if seconds_remaining <= 0
        lock_submissions()
      else
        message = 'Round ' + game.round_number + ': ' + game.current_question
        message = '\n' + seconds_remaining + ' seconds remaining to submit answers for ' + game.player_names[game.current_dealer_name]
        msg.send message
    if game.state == 2
      message = 'Round ' + game.round_number + ': ' + game.current_question + '\n'
      message = message + game.names[game.dealer_name] + ', choose a submission:'
      for i in [0...game.choices.length] by 1
        choice = game.choices[i]
        message = message + '\n' + (i+1) + '. ' + choice
      msg.send message
    msg.send 'Something is wrong with the game, invalid state :/'


  robot.respond /cah standings/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    sort_by_score_asc = (a,b) ->
      return game.scores_by_name[a] - game.scores_by_name[b]
    game.names.sort(sort_by_score_asc)
    message = 'CAH Standings\n-------------'
    for i in [0...game.names.length] by 1
      name = game.names[i]
      message = message + '\n' + (i+1) + '. ' + name + '(' + game.scores_by_name[name] + ')'
    msg.send message


  robot.respond /cah restart/, (msg) ->
    reset_game()
    msg.send 'CAH has been reset.'


  robot.respond /cah register/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    
    if player_name in game.names
      message = '' + player_name + ' is already a player'
      score = game.scores_by_name[player_name]
      if score?
        message = message + ' with ' + score + ' points'
      message = message + '.'
      msg.send message
    else
      game.names.push player_name
      game.scores_by_name[player_name] = 0
      update_hand_for_name[player_name]

      message = '' + player_name + ' has been added.'

      if game.names.length == 1
        message = message + '\n' + new_round(player_name)

      msg.send message


  robots.respond /cah unregister/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    index = game.names.indexOf(player_name)
    if index? and index >= 0
      game.names.splice(index, 1)
      delete game.scores_by_name[player_name]
      delete game.submissions_by_name[player_name]
      delete game.hands_by_name[player_name]
      msg.send '' + player_name + ' has been removed.'
    else
      msg.send '' + player_name + ' is not registered.'


  robots.respond /cah hand/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    hand = game.hands_by_name[player_name]
    if !hand?
      msg.send 'You are not a registered player.'
    else
      submission = game.submissions_by_name[player_name]
      message = ''
      if submission?
        message = 'Currently submitted: ' + submission + '\n'
      for i in [0...hand.length] by 1
        card = Cards.answers[hand[i]]
        if i>0
          message = message + '\n'
        message = message + i + ' - ' + card
      msg.send message


  robots.respond /cah submit ([1-5]) ([1-5])?/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    if game.state != 1
      msg.send 'Now is not the time for submitting cards.'
    else
      if player_name === game.dealer_name
        msg.send 'You're the dealer, you do not get to submit this round.'
      else
        first = msg.match[1]
        second = msg.match[2]
        if !first?
          msg.send 'You need to choose a card from your hand.'
        else if second? and second === first
          msg.send 'You cannot use the same card twice.'
        else
          submission = first
          if second?
            submission = submission + ' / ' + second
          game.submissions_by_name[player_name] = submission

          if game.submissions.length === game.names
            lock_submissions()

          msg.send 'Submitted: ' + submission


  robots.respond /cah choose ([0-9])+/, (msg) ->
    if game.state != 2
      msg.send 'Now is not the time for choosing cards.'
    else
      player_name = msg.message.user.name.toLowerCase()
      if player_name !== game.dealer_name
        msg.send 'Only the dealer, ' + game.dealer_name + ', may choose.'
      else
        choice = msg.match[1]
        if choice < 1 or choice >= game.choices.length
          msg.send 'You've made an invalid choice.'
        else
          winner_name = null
          for name in game.names
            submission = game.submissions_by_name[name]
            if (submission? and submission === choice)
              winner_name = name
              break
          if winner_name?
            score = game.scores_by_name[winner_name]
            score = score + 1
            game.scores_by_name[winner_name] = score
            message = winner_name + ' wins!\n'
            message = message + new_round(winner_name)
            msg.send message

