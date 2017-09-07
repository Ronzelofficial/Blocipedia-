class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :wikis
  has_many :collaborators, dependent: :destroy

  enum role: [:standard, :premium, :admin]
  after_initialize :set_role, :if => :new_record?

  def set_role
    self.role ||= :standard
  end
end
