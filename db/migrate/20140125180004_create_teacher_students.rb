require_relative '../config'
require_relative '../../app/models/teacher'
require_relative '../../app/models/student'

class CreateTeacherStudents < ActiveRecord::Migration
  def up
    create_table :teacherstudents do |t|
      t.belongs_to :teacher
      t.belongs_to :student
      t.string :teacher_id
      t.string :student_id
    end

    # Student.all.each do |st|
    #   Teacherstudent.create(teacher_id: st.teacher_id, student_id: st.id)
    # end

    remove_column :students, :teacher_id
  end


  def down
    add_column :students, :teacher_id

    # Teacherstudent.all.each do |ts|
    #   student = Student.find(ts.student_id)
    #   student.teacher_id = ts.teacher_id
    #   student.save
    # end

    drop_table :teacherstudents
  end
end
