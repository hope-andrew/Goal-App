class UpdatePrivateColumn < ActiveRecord::Migration
  def change
    rename_column :goals, :private, :privated
  end
end
