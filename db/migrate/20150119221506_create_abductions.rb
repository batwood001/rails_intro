class CreateAbductions < ActiveRecord::Migration
  def change
    create_table :abductions do |t|
      t.references :earthling, index: true
      t.references :martian, index: true
      t.string :earthling_name

      t.timestamps null: false
    end
    add_foreign_key :abductions, :earthlings
    add_foreign_key :abductions, :martians
  end
end
