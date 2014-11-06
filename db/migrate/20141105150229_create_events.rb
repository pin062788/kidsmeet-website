class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :abstract
      t.text :content
      t.string :main_image_url
      t.date :apply_end_date
      t.datetime :expired_at
      t.string :duration
      t.string :address
      t.boolean :is_published

      t.timestamps
    end
  end
end
