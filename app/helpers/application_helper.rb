module ApplicationHelper

  def field_class(resource, field_name)
    if resource.errors.get(field_name)
      return "error".html_safe
    else
      return "".html_safe
    end
  end

  def mark_required(object, attribute)
    " (Mandatory)" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

  def number_of_days(date1, date2)
    ((((date2 - date1)/60)/60)/24).to_i
  end

  def calculate_price(booking)
    rooms = Room.all
    pricing = Hash.new
    pricing[:breakdown] = Hash.new

    price = 0
    extra = 0
    nights = number_of_days(booking.arrival, booking.departure)

    if booking[:roomRiadGuests]
      price = 420 * nights
      if booking[:roomRiadGuests] > 14
        room_extra = 30 * (booking[:roomRiadGuests] - 14) * nights
        extra += room_extra
        pricing[:breakdown]["riad"] = room_extra
      end
    else
      rooms.each { |room|
        if booking[:"room#{room.name}Guests"]
          guests = booking[:"room#{room.name}Guests"]
          price += room.priceMax * nights
          room_extra = 0
          if guests > 2
            room_extra = 30 * (guests - 2) * nights
            extra += room_extra
            pricing[:breakdown][room.name] = room_extra
          end
          pricing[:breakdown][room.name] = room_extra
        end
      }
    end
    pricing[:price] = price
    pricing[:deposit] = 30 * (price + extra) / 100
    pricing[:extra] = extra
    return pricing
  end

  def paypal_url(booking, amount, return_url, cancel_url, notify_url)
    values = {
        :business => 'info@riadyamina.com',
        :cmd => '_cart',
        :upload => 1,
        :return => return_url,
        :invoice => booking.id,
        :cancel_return => cancel_url,
        :notify_url => notify_url,
        :item_name => "riad_booking_#{booking.customer.firstName}_#{booking.customer.lastName}",
        :item_number => booking.id,
        :amount => amount,
        :quantity => 1
    }
=begin
    line_items.each_with_index do |item, index|
      values.merge!({
                        "amount_#{index+1}" => item.unit_price,
                        "item_name_#{index+1}" => item.product.name,
                        "item_number_#{index+1}" => item.id,
                        "quantity_#{index+1}" => item.quantity
                    })
    end
=end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end
