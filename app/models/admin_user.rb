class AdminUser < ApplicationRecord
    #since we changed user to admin_users 
    #self.table_name = 'admin_users'

    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits
end

#inherits a lot of 'raw' Ruby code that is automatically provided.

