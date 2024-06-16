class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :status, default: 0
      t.integer :sender

      t.timestamps
    end
  end
end
