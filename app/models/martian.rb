class Martian < ActiveRecord::Base
  has_many :abductions

  def abduct earthling
    if Abduction.where(earthling_name: earthling.name).count < 2
      Abduction.create(earthling_name: earthling.name, earthling_id: earthling.id, martian_id: self.id)
      return true
    else
      return false
    end
  end

end
