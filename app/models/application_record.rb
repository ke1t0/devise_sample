class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def search(search)
  #   if search
  #     User.where(['name LIKE ?', "%#{search}%"])
  #   else
  #     all
  #   end
  # end

  # def Tsearch(search)
  #   if search
  #     Tweet.where(['body LIKE ?', "%#{search}%"])
  #   else
  #     all
  #   end
  # end
end
