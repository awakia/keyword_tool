class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :keyword
      t.integer :index
      t.string :uri
      t.string :host
      t.string :visible_uri
      t.string :title
      t.text :snippet

      t.timestamps
    end
  end
end
