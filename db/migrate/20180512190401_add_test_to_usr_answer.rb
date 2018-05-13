class AddTestToUsrAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_answers, :test, foreign_key: true
  end
end
