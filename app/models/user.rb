class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :department_id, :user_id, :supervisor, :title, :hire_date, :receives_production_check_alert
  has_secure_password
  has_many :issues
  has_many :nonconformances
  has_many :instances
  has_many :waste_captures
  has_many :production_checks
  has_many :comments
  has_many :audits
  has_many :infractions, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  belongs_to :department                                   
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  has_many :packagings, dependent: :destroy
  has_many :tunneltemps, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true 
  validates :user_id, presence: true
  validates :department_id, presence: true
  default_scope order: 'name ASC'
  def feed
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
