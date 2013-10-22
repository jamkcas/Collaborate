class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tagline
      t.string :category
      t.text :description
      t.text :needs
      t.string :commitment_level
      t.boolean :status, default: true
      t.text :search_keywords
      t.references :user
      t.timestamps
    end
  end
end
