class Page < ApplicationRecord
    
    belongs_to :subject
    has_and_belongs_to_many :admin_users

    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) } #calls for invisible objects)
    scope :sorted, lambda { order("position ASC") }
    scope :newest_first, lambda {order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

    validates_presence_of :name
    validates_length_of :name, :maximum => 255
    validates_presence_of :permalink
    validates_length_of :permalink, :within => 3..255
    validates_uniqueness_of :permalink
        #for unique values by sunbject use ":scope => :subject_id"

end
