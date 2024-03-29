require 'active_record'

ActiveRecord::Base.configurations = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.establish_connection("development")

class Schema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :state
      
      t.timestamps
    end
    
    create_table :posts do |t|
      t.string      :title
      t.text        :content
      t.references  :user
      
      t.timestamps
    end
    
    create_table :comments do |t|
      t.text  :content
      t.references :post
      t.references :user
      
      t.timestamps
    end
  end
end
 
Schema.new.change