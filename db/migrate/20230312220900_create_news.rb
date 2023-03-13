class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.string :author
      t.text :description
      t.string :link
      t.timestamps
    end
  end
end
