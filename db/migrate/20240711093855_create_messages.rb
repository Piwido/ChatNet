class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
