class CreateMinutesDocs < ActiveRecord::Migration
  def self.up
    create_table :minutes_docs do |t|
      t.string :title
      t.string :who
      t.datetime :date
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :minutes_docs
  end
end
