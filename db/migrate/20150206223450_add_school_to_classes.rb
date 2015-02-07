class AddSchoolToClasses < ActiveRecord::Migration
  def change
    add_reference :classes, :school, index: true
    add_foreign_key :classes, :schools
  end
end
