class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #place code that's common to ALL models here.
end
