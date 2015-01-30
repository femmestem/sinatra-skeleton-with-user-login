class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, presence: true

  # BCrypt module which contains `class Password`
  # and methods for hashing passwords
  include BCrypt

  # overwrite the password getter method that is provided by ActiveRecord

  # Accepts the password hash string stored in the :password_hash
  # field of the :users migration table and returns a Password object
  # from the Password class that is provided by BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  # overwrite the password setter method that is provided by ActiveRecord

  # Instead, creates a new Password object from the Password class
  # and sets the :password_hash field in the Users table to the encrypted
  # string returned by the the password object
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(user_info)
    email = user_info[:email]

    # this uses the Password#password setter method above
    # Parameter user_info[:password] is wrapped in a Password object
    # which is stored in the variable `password`
    password = user_info[:password]

    user = User.find_by(email: email) # latest ActiveRecord method

    # returns `user` if `user` exists and `user.password` de-encrypted string
    # matches the Password object to which it is being compared
    return user if user && user.password == password
    # `user.password == password` is not the standard Ruby `==` method
    # as you might expect; BCrypt overwrites `==` with its own method
    # ```
    # def ==(secret)
    #   super(BCrypt::Engine.hash_secret(secret, @salt))
    # end
    # ```

    nil
  end

  def get_name
    self.first_name
  end

end
