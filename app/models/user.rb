class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save
  validates :password, presence: true

  # BCrypt module which contains `class Password`
  # and methods for hashing passwords
  include BCrypt

  # overwrite the password getter method that is provided by ActiveRecord
  # when :users migration table contains a password field

  # Accepts the password hash string stored in the :password_hash
  # field of the :users migration table and returns a Password object
  # from the Password class that is provided by BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  # overwrite the password setter method that is provided by ActiveRecord
  # when :users migration table contains a password field

  # Instead, creates a new Password object from the Password class
  # that is provided by BCrypt and sets the :password_hash field
  # in the :users migration table to the encryption string returned by the
  # the password object
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(user_info)
    email = user_info[:email]

    # this uses the #password=(new_password) setter method above
    # so the user_info[:password] params is wrapped in a Password object
    # and that object is stored in the variable `password`
    password = user_info[:password]

    # user = User.find_by_email(email) # deprecated ActiveRecord method
    user = User.find_by(email: email) # latest ActiveRecord method


    # return user if `user` exists and `user.password` de-encrypted string
    # matches the password object it is being compared to
    return user if user && user.password == password
    # the reason user.password == password works is because it is
    # not the standard Ruby method `==` as you might expect
    # in other words, BCrypt has its own `==` method

    # ```
    # def ==(secret)
    #   super(BCrypt::Engine.hash_secret(secret, @salt))
    # end
    # ```

    nil # returns nil if user is not kicked out of this method by the return statement above
  end

  def get_name
    self.first_name
  end

end
