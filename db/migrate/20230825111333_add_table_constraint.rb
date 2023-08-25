# frozen_string_literal: true

class AddTableConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column :items,:name,:string,null:false
    change_column :items,:price,:integer,null:false
    change_column :items,:content,:text,null:false
    change_column :items,:sale_badge,:boolean,default:false
  end
end
