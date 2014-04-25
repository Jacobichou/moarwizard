module ApplicationHelper
   #Return base title on individual-page basis
   def full_title(page_title)
      base_title = "EMIS"
      if page_title.empty?
         base_title
      else
         "#{base_title} | #{page_title}"
      end
   end


   def recipient(recipient_id)
      @recipient = User.where("id = ?", recipient_id).take
   end
end
