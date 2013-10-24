class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tagline
      t.string :category
      t.text :description
      t.string :role_needed
      t.text :role_details
      t.string :commitment_level
      t.boolean :status, default: true
      t.string :search_keywords
      t.references :user
      t.timestamps
    end
  end
end
