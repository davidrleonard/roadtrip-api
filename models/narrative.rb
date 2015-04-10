class Narrative < ActiveRecord::Base
  belongs_to :article
  has_many :layers
end