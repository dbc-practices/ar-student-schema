require_relative '../config'

class ModifyColumns < ActiveRecord::Migration
  def up
    add_column :students, :name, :string
    add_column :students, :address, :string

    Student.all.each do |student|
      student.name = student[:first_name] + " " + student[:last_name]
      student.save
    end

    remove_column :students, :first_name
    remove_column :students, :last_name
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string

    Student.all.each do |student|
      split = student[:name].split(" ")
      student.first_name = split[0]
      student.last_name = split[1]
      student.save
    end

    remove_column :students, :name, :string
    remove_column :students, :address, :string
  end
end


