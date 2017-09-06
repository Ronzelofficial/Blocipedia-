class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  default_scope { order('created_at DESC') }
  scope :not_private, -> { where("private IS NULL or private = ?", false) }
  scope :visible_to, -> (user) { user && user.premium? ? all : not_private }
end
