class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def tall_enough
    user.height > attraction.min_height
  end

  def enough_tickets
    user.tickets > attraction.tickets
  end

  def ride_update
    user.update(
      tickets: user.tickets - attraction.tickets,
      nausea: user.nausea + attraction.nausea_rating,
      happiness: user.happiness + attraction.happiness_rating
    )
  end

  def take_ride
    if tall_enough && enough_tickets
      ride_update
      "Thanks for riding the #{attraction.name}!"
    elsif !tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif !enough_tickets
      "Sorry. You do not have enough tickets the #{attraction.name}."
    end
  end
 



end
