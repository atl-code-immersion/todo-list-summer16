class Task < ActiveRecord::Base

	def datified_dl
    datetime_deadline = "#{self.deadline[6..9]}-#{self.deadline[0..4].gsub('/','-')}"

    if self.deadline.include?("PM")
      datetime_deadline += " #{self.deadline[11].to_i + 12}#{self.deadline[12..14]}:00"
    else
      datetime_deadline += " 0#{self.deadline[11]}#{self.deadline[12..14]}:00"
    end


    x = Time.parse(datetime_deadline)
    return x
    # return datetime_deadline
  end
  
end
