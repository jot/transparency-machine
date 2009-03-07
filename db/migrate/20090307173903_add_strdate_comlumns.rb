class AddStrdateComlumns < ActiveRecord::Migration
  def self.up
    add_column :agenda_docs, :strdate, :string
    add_column :minutes_docs, :strdate, :string
  end

  def self.down
    remove_column :agenda_docs, :strdate
    remove_column :minutes_docs, :strdate
  end
end
