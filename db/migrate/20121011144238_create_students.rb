require_relative '../config'
require_relative '../../lib/students_importer'

# this is where you should use an ActiveRecord migration to

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone
      t.datetime :created_at
      t.datetime :updated_at
    end
    p 'Start Student import'
    StudentsImporter.import
    p 'Finish Student import'
  end
end


