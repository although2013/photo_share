class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commentable, :polymorphic => true, index: true
      t.belongs_to :user, index: true

      t.string :body

      t.timestamps null: false
    end
  end
end
