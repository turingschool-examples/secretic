class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :provider
      t.string :uid
      t.string :image_url
      t.string :token

      t.timestamps null: false
    end
  end
end
