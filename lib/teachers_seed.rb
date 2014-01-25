require_relative '../app/models/teacher'

module TeachersSeed
  def self.seed
    Teacher.transaction do
      Teacher.create(name: 'Mike Busch', email: 'mike@dbc.com')
      Teacher.create(name: 'Elvis Presley', email: 'elvis@dbc.com')
      Teacher.create(name: 'John Lennon', email: 'john@dbc.com')
      Teacher.create(name: 'Ella Fitz', email: 'ella@dbc.com')
      Teacher.create(name: 'Louis Armstrong', email: 'armstrong@dbc.com')
    end
  end
end
