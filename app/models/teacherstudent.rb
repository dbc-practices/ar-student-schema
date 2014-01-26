require_relative '../../db/config'

class Teacherstudent < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
end

