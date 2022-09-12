class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
