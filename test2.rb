require 'scoruby'
random_forest = Scoruby.load_model 'rpt_rf.pmml'
# rpt_rf.pmml file included in zip (too large to upload to GitHub)

input_array = ARGV
# Arguments: crop_index , district_index, season_index, total_cost, area, outstanding_loan, interest_rate

# puts input_array.to_s

# gbm = Scoruby.load_model 'rpt_rf.pmml'
features =  {
        crop: input_array[0],
        state: 'Arunachal Pradesh',
        district: input_array[1],
        season: input_array[2],
        year: 2017,
        total_cost: input_array[3],
        temp: 20,
        rainfall: 123       
    }

puts random_forest.predict(features)[:label] + " ton(s) per hectare;"

profit = (random_forest.predict(features)[:label]).to_i * input_array[4].to_i 
profit *= 3050.277
profit -= (input_array[3].to_i * input_array[4].to_i)
profit -= (input_array[5].to_i * input_array[6].to_i)
# based on getProfit() from sharecode.py


puts "\nYour expected revenue = "+"#{profit.abs}" + " Rupees"

#{random_forest.predict(features)[:label]*input_array[4]*3050.277-input_array[3]*input_array[4]-input_array[5]*input_array[6]} 
# puts random_forest.decisions_count(features)

# puts gbm.score(features)