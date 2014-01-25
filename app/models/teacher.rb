require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  has_many :students
  validates :email, :uniqueness => true, :format => { :with => /\w+\@\w+.\w{2}/, :message => "Email format doesn't validate"}
  # validate :valid_phone?

  def valid_phone?
    if phone.gsub(/[\D]/, '').size < 10
      errors.add(:phone, "phone must have at least 10 digits!")
    end
  end
end

