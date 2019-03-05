class AddTeacherScheduleToUsers < ActiveRecord::Migration
  def change
        add_column :users, :teacher_schedule, :text
  end
end
