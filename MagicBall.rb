class MagicBall
  def initialize
    @answers_array =
        ['It is certain', 'It is decidedly so', 'Without a doubt', 'Yes — definitely',
         'You may rely on it', 'As I see it, yes', 'Most likely','Outlook good',
         'Signs point to yes', 'Very doubtful', 'Reply hazy, try again', 'Ask again later',
         'Better not tell you now', 'Cannot predict now', 'Concentrate and ask again', 'Yes',
         'Don’t count on it', 'My reply is no', 'My sources say no', 'Outlook not so good']
    initial_message = 'Please ask your question'
    puts initial_message
    while gets.chomp.empty?
      puts initial_message
    end
  end

  def shake
    puts 'Contacting Oracle...'
    sleep(3)
    r = rand(20)
    puts @answers_array[r]
  end
end

test_my_destiny = MagicBall.new
test_my_destiny.shake
