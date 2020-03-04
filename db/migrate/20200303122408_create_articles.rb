class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :bgcolor
      t.string :text_color
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
