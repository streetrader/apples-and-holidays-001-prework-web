require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |addsupply| 
    addsupply.last.push(supply)
    end
  return holiday_hash
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring].each do |addsupply| 
    addsupply.last.push(supply)
    end
  return holiday_hash
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season.to_sym][holiday_name.to_sym] = []
  supply_array.each {|supply| holiday_hash[season.to_sym][holiday_name.to_sym] << supply }
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
allsupplies = []
  supplies = holiday_hash[:winter].each {|array| allsupplies << array[1] }
  return allsupplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  output = []
  supplies = holiday_hash.each do |key, season|
    puts "#{key.capitalize}:"
    season.each do |key, holiday|
      
      holiday_name = key.to_s.split("_")
      h2 = ""
      holiday_name.each { |word| h2 += word.capitalize + " " }
        
      output = "  #{h2.rstrip}: "
      holiday.each_with_index do |supply, index|
        output += supply
        output += ", " if index != holiday.length-1
        end
        puts output
      end
  end
  return true
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.  
end

def all_holidays_with_bbq(holiday_hash)
  output = []
    holiday_hash.each do |key, season|
      season.each do |key, holiday|
        holiday.each do |supply|
          output << key.to_sym if supply == "BBQ"
          end
        end
    end
    return output

end