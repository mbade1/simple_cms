class Page < ApplicationRecord
    
    belongs_to :subject
    has_and_belongs_to_many :admin_users

    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) } #calls for invisible objects)
    scope :sorted, lambda { order("position ASC") }
    scope :newest_first, lambda {order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
