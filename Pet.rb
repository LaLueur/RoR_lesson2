class Pet
  NO_MENU = true

  def initialize
    @pet_name = 'Po'
    @awkwardness = 100
    @hp = 100
    @intellect = 1
    @hunger = 100
    @mood = 100
    @skill = 0
    @pet_master = 'Shifu'
    @methods = %w(sweat_dreams work kung_fu_training
                scrolls_reading furious_five_meet
                challenging_tai_lung sing)
    puts "Hello! What would you like to do? Panda's stats are next:"
  end

  def menu_view
    kill_panda && stop if dead_panda?
    train_panda if bad_panda?
    make_panda_cry if sad_panda?

    #ToDo: wrap with extra lines
    puts '========================'
    puts 'Actions available:
          0: Help
          1: Rename your panda
          2: Feed your panda
          3: Help Mr.Ping at the noodle shop
          4: Train your panda at the Jade Palace
          5: Read scrolls
          6: Clean Jade Palace
          7: Challenge Tai Lung if your panda is ready
          8: Meet furious five (your panda is their fan)
          9: Keep an eye on panda for a while
         10: Change your panda master
         11: The wixi finger hold (your panda makes you angry?)
         12: Panda sings a song
         13: Display one of your panda stats
         14: Display all of your panda stats
       exit: Exit'


    time

  end

  def show_all_attributes param = false
    printf("%-25s %s\n", "Your pet's name:", @pet_name)
    printf("%-25s %s\n", "Your pet's master:", @pet_master)
    printf("%-25s %d\n", "Your pet's skill level:", @skill)
    printf("%-25s %d\n", "Your pet's health:", @hp)
    printf("%-25s %d\n", "Your pet's intellect:", @intellect)
    printf("%-25s %d\n", "Your pet's mood:", @mood)
    printf("%-25s %d\n", "Your pet's hunger level:", @hunger)
    printf("%-25s %d\n", "Your pet's awkwardness: ", @mood)
    menu_view unless param
  end

private

  def sweat_dreams param = false
    puts 'Sleeping well... Dreaming about kung fu...'
    @hp += 10
    @mood += 10
    @hunger +=10
    menu_view unless param
  end

  def work param = false
    puts "Working at the father's noodle shop is so boring..."
    @hunger += 5
    @mood -= 20
    menu_view unless param
  end

  def kung_fu_training param = false
    puts 'I love kung fuuuuuuuuu!'
    @hp -= 10
    @skill += 20
    @mood += 20
    @hunger += 10
    @awkwardness -= 20
    menu_view unless param
  end

  def scrolls_reading param = false
    puts "Read...Read...Read...No! I'm not sleeping!"
    @intellect += 20
    @skill += 10
    menu_view unless param
  end

  def furious_five_meet param = false
    puts 'The Furious Five!!! You are bigger than your action figures. Except, you, Mantis. You are the same.'
    @mood += 20
    @awkwardness += 10
    @intellect -= 5
    menu_view unless param
  end

  def challenging_tai_lung param = false
    puts 'Buddy, I am the Dragon Warrior.'
    @skill += 30
    @intellect += 10
    @hp -= 15
    @hunger += 15
    @awkwardness -=20
    menu_view unless param
  end

  def sing param = false
    puts '       Hear the legends of the Kung Fu Panda!
       Raised in a noodle shop, never seeking glory or fame,
       He climbed a mountain top and earned the Dragon Warrior name.
       Ooh Ah Ya!
       Kung Fu Panda!
       Master Shifu saw the warrior blossom,
       And master the skills of bodacious and awesome!
       Kung Fu Panda!
       He lives and he trains and he fights with the Furious Five,
       Protect the valley something, something, something, something alive!
       Ooh Ah Ya!
       Kung Fu Panda!'
    @mood += 20
    menu_view unless param

  end

  def display_attribute(attr, param = false)
    case attr
    when 'health'
      puts @hp
    when 'awkwardness'
      puts @awkwardness
    when 'intellect'
      puts @intellect
    when 'hunger'
      puts @hunger
    when 'mood'
      puts @mood
    when 'skill'
      puts @skill
    when 'name'
      puts @pet_name
    else
      puts 'Please choose one of your panda attributes:
            name, health, awkwardness, intellect, hunger, skill or mood'
    end
    menu_view unless param
  end

  def rename param = false
    puts "Enter your pet's new name: "
    new_name = gets.chomp
    unless new_name.empty?
      @pet_name = new_name
      puts "Your new pet's name is #{@pet_name}"
      menu_view unless param
    else
      rename
    end
  end

  def eat param = false
    puts 'What can be better than a bowl of dumplings!'
    @hunger -= 10
    @hp += 10
    @mood += 10
    @awkwardness += 5
    menu_view unless param
  end

  def change_master param = false
    if @pet_master == 'Shifu'
      puts 'Go home Master Shifu. It is Master Oogway time!'
      @pet_master = 'Oogway'
    else
      puts 'Go home Master Oogway. It is Master Shifu time!'
      @pet_master = 'Shifu'
    end
    @skill += 15
    @mood -= 5
    @awkwardness -= 5
    menu_view unless param
  end

  def the_wuxi_finger_hold param = false
    puts 'No!No!No!'
    @mood -= 5
    menu_view unless param
  end

  def clean_jade_palace param = false
    puts 'So boring...'
    @mood -= 20
    @hunger += 10
    menu_view unless param
  end

  def keep_an_eye_on_panda
    puts 'We are watching on him...'
    send @methods.sample, NO_MENU
    sleep(3)
    puts "Let's look how does panda's attributes change"
    show_all_attributes
  end

  def kill_panda
    puts 'Are you enemy for Dragon Warrior? Ok. I am dying...'
    new_game
  end

  def train_panda
    puts 'You are not the Dragon Warrior. You will never be the Dragon Warrior!'
    puts 'Your master displeased with you. Clean all the Jade palace as a punishment.
          Then train and read, stupid panda! '
    clean_jade_palace NO_MENU
    kung_fu_training NO_MENU
    scrolls_reading
  end

  def new_game
    puts 'Press 1 if you want to start new game and 2 for exit'
    gets.chomp.to_i == 1 ? initialize : exit
  end

  def help_information param = false
    puts "Welcome to Kung Fu Panda little world! Here you can create your own Dragon Warrior!
          And it is not necessary will be Po. But it will be awesome! Trust us. We believe in you!
          So. Your pet will have some stats as:
          - name        (default value is Po)
          - awkwardness (default value is 100, be sure do not exceed 150 because your panda will be
                         punished by its master)
          - health      (default = 100, if your panda health decrease to 0 or less your pet will die)
          - intellect   (default = 1, be sure do not reduce to -5 because your panda will be
                         punished by its master)
          - hunger      (default = 100, be sure do not exceed 150 because your panda will die)
          - mood        (default = 100,
          - skill       (default = 0, be sure do not reduce to -5 because your panda will be
                         punished by its master)
          - pet_master  (default = 'Shifu' but you can change it to Master Oogway)

          Also you have several methods for your panda, such as:
          - rename your panda
          - feed your panda (panda hunger will decrease and health, mood and awkwardness will increase)
          - help Mr.Ping at the noodle shop (it will increase your panda hunger and seriously decrease its mood)
          - train your panda (it will increase mood, skills, hunger and decrease health and awkwardness)
          - read scrolls (your panda becomes smarter and increase its skills)
          - clean Jade Palace (it is a punishment, so panda mood will decrease and hunger will increase)
          - challenge Tai Lung (increase: skills, intellect, hunger; decrease: health, awkwardness)
          - meet furious five (your panda is their fan, so it will increase panda mood and awkwardness, decrease
            its intellect)
          - keep an eye on panda for a while (call some method and show you how panda stats change after that)
          - change your panda master (increase: skills, decrease: mood and awkwardness)
          - the wixi finger hold (your panda makes you angry? lets ruin its mood!)
          - Panda sings a song (and the mood is getting better)
          - display one of your panda stats (you just have to input whats the stat it should be)
          - display all of your panda stats

          Be carefully! If you don't input any choice for 20-30 seconds panda health stats will decrease and finally
          it can die.
          Also if intellect and skills become less than -5 or awkwardness becomes bigger than 150 your panda will be
          punished by its Master: clean all the Jade Palace, additional training and read scrolls.
          Be nice with your pet. If its mood become smaller than 20 your little panda will cry. Do you really want it?

          Good luck! And have a nice time playing with panda!"

    menu_view unless param
  end

  def next_action action
    menu_view && stop if action.empty? || action.nil?

    puts action
      case action
        when '0'
          help_information
        when '1'
          rename
        when '2'
          eat
        when '3'
          work
        when '4'
          kung_fu_training
        when '5'
          scrolls_reading
        when '6'
          clean_jade_palace
        when '7'
          challenging_tai_lung
        when '8'
          furious_five_meet
        when '9'
          keep_an_eye_on_panda
        when '10'
          change_master
        when '11'
          the_wuxi_finger_hold
        when '12'
          sing
        when '13'
          puts 'What stat do you want to display?'
          display_attribute(gets.chomp)
        when '14'
          show_all_attributes
        when 'exit'
          exit
      end
  end

  def something_wrong?
    dead_panda? or bad_panda?
  end

  def dead_panda?
    @hp <= 0 || @hunger >= 150
  end

  def bad_panda?
    @awkwardness > 150 || @intellect < -5 || @skill < -5
  end

  def sad_panda?
    @mood < 20
  end

  def make_panda_cry
    puts 'Panda is very sad. It is crying like a little girl...'
  end

  def time2
    action = ""
    until !action.empty?
      action = gets.strip
      sleep(rand(5..10))
      puts 'Time pass...'
    end

    next_action action
  end

  #http://stackoverflow.com/questions/14250517/making-a-timer-in-ruby
  def time
    action = Thread.new do
      Thread.current[:value] = gets.strip
    end

    timer = Thread.new { sleep(rand(20..30)); action.kill}

    action.join
    if action[:value]
      timer.kill
      next_action action[:value]
    else
      afk
    end
  end

  def afk param = false
    puts 'Your panda is in dangerous! You have to pay attention to it or it will sad and finally die'
    @hp -= 30
    @mood -= 30
    @hunger += 30
    menu_view unless param
  end

end


po = Pet.new
po.show_all_attributes
po.menu_view