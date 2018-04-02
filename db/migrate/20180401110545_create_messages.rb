class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
	  t.integer :client_id
	  t.integer :receiver_ids, array: true, default: []
	  t.text :message
      t.timestamps
    end
  end
end
