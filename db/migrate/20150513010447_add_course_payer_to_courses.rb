class AddCoursePayerToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_player_id, :integer
  end
end
