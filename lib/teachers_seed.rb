require_relative '../app/models/teacher'
require_relative '../app/models/student'
module TeachersSeed
  def self.seed
    Teacher.transaction do
      Teacher.create(name: 'Mike Busch', email: 'mike@dbc.com')
      Teacher.create(name: 'Elvis Presley', email: 'elvis@dbc.com')
      Teacher.create(name: 'John Lennon', email: 'john@dbc.com')
      Teacher.create(name: 'Ella Fitz', email: 'ella@dbc.com')
      Teacher.create(name: 'Louis Armstrong', email: 'armstrong@dbc.com')
    end

    puts "seeding random teacher id to student"
    Student.transaction do
      teacher_ids = Teacher.all.map {|teach| teach.id}
      Student.all.each do |st|
        st.teacher_id = teacher_ids.sample
        st.save
      end # End of student.all.each loop
    end # End of Student transaction
    puts "end random teacher id to student"
  end # End of self.seed
end # End of module
