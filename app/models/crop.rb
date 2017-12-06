class Crop < ApplicationRecord
    
    NAMES = ['Maize','Moong','Urad','Groundnut','Bajra','Cotton','Jowar','Ragi','Sesamum','Onion','Sugarcane','Sunflower','Potato','Gram','Wheat','Safflower','Arhar','RM','Nigerseed','Barley','Jute']
    SEASONS = ['Kharif', 'Rhabi', 'Summer']
    #RELATIONSHIPS
    belongs_to :farm

end
