class CreateNasdaqInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :nasdaq_instruments do |t|
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
