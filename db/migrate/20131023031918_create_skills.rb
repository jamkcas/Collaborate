class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :primary_skill
      t.string :skills
      t.string :commitment_level
      t.string :category
      t.string :search_keywords
      t.string :interests
      t.references :user
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
