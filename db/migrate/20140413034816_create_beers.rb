class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :beer_id

      t.timestamps
    end
  end
end
