class AddCourseToHomeworks < ActiveRecord::Migration
  def change
    add_reference :homeworks, :course, index: true
    add_foreign_key :homeworks, :courses
  end
end
