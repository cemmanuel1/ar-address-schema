require_relative '../../db/config'

class Contact < ActiveRecord::Base
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/ }
  validates :phone, :format => { :with => /^[0-9]{3}.?-?[0-9]{3}.?-?[0-9]{4}$/}
  validates :company, :presence => true

  def name
    first_name + " " + last_name
  end

  def area_code 
    phone_number.match(/^\(?[0-9][0-9][0-9]\)?/)
  end 

end
