class Api::MyExamplesController < ApplicationController

  def fortune_action
    fortunes = ["You will soon find a dollar.", "You will soon lose a dollar.", "A mysterious stranger will soon slap you."]
    @random_fortune = fortunes[rand(fortunes.count)]
    render "fortune_view.json.jbuilder"
  end

  def lotto_action 

    #-------- a non-repeating solution

    possible_numbers = (1..60).to_a #turning a numerical range into an array

    picked_numbers = possible_numbers.sample(6) #sample does 6 unique instances, it doesn't repeat

    @final_picked_numbers = "Your lotto numbers are: #{picked_numbers.join(", ")}."

    #---------------------



    #--------------- # another non-repeating solution

    # possible_numbers = (1..60).to_a.shuffle # this is turning the numerical range into an array and shuffling them

    # picked_numbers = []

    # 6.times do
    #   picked_numbers << possible_numbers.pop # this is picking the final 6 off the shuffled array
    # end

    #--------------------------

    # the original, repeating solution

    # lotto_array = []

    # 6.times do
    #   lotto_array << rand(1..60)
    # end

    # @final_lotto_array = lotto_array.join(", ")

    render "lotto_view.json.jbuilder"
  end

  def bottles

    x = 99
    y = 98

    100.times do
      if y == 1
        puts "#{x} bottles of beer on the wall, #{x} bottles of beer. Take one down and pass it around, #{y} bottle of beer on the wall."
      elsif y == 0 
        puts "#{x} bottle of beer on the wall, #{x} bottle of beer. Take one down and pass it around, no more bottles of beer on the wall."
      elsif x == 0
        puts "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."
      else 
        puts "#{x} bottles of beer on the wall, #{x} bottles of beer. Take one down and pass it around, #{y} bottles of beer on the wall."
      end
      x = x - 1
      y = y - 1
    end
    render "bottles_view.json.jbuilder"
  end

end
