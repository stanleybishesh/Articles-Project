class Comment < ApplicationRecord
  include Visible
  
  belongs_to :article
  belongs_to :user, optional: true
end
