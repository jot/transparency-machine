class CreateAgendaDocs < ActiveRecord::Migration
  def self.up
    create_table :agenda_docs do |t|
      t.string :title
      t.string :who
      t.datetime :date
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :agenda_docs
  end
end
