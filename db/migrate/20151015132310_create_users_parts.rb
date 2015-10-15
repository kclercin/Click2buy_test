class CreateUsersParts < ActiveRecord::Migration
  def change
    create_table :products_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
    end
  end
end
