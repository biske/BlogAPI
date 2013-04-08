require 'active_record'

ActiveRecord::Base.configurations = YAML::load(IO.read('database.yml'))
ActiveRecord::Base.establish_connection("development")

class Schema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :state
    end
 
    add_index :users, :name
  end
end
 
Schema.new.change