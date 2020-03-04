class AddSecurityAnswerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :security_answer, :string
  end
end
