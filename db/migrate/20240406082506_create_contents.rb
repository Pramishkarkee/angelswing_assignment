class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.text :summary
      t.datetime :published_at
      t.string :status
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.string :slug
      t.string :category
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps
    end
    add_index :contents, :slug, unique: true
    add_foreign_key :contents, :users, column: :author_id
  end
end
