class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :title
      t.string :leagueID

      t.timestamps null: false
    end
  end
end
