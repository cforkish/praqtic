class User < ActiveRecord::Base

  has_many :lessons, :foreign_key => :creator_id
  has_many :lesson_interactions #, :class_name => "LessonInteraction"
  has_many :questions, :foreign_key => :creator_id
  has_and_belongs_to_many :tracked_questions, class_name: "Question", foreign_key: "user_id",
                              association_foreign_key: "question_id", join_table: "user_tracked_questions"
  has_many :question_interactions

  before_save do
    email.downcase!
    username.downcase!
  end
  before_create :create_remember_token

  default_scope { order(created_at: :asc) }

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_USERNAME_REGEX = /\A[\w]+\z/i
  validates :username, presence: true,
                       length: { maximum: 20 },
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 10 }

  def to_param # overridden
    username
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
