require_relative '../config'
require_relative '../../lib/teachers_seed'

class CreateTeachers < ActiveRecord::Migration
  def up
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_column :students, :teacher_id, :integer
    puts 'Start Teacher Seed'
    TeachersSeed.seed
    puts 'Finish Teacher Seed'
  end

  def down
    drop_table :teachers
    remove_column :students, :teacher_id
  end
end
