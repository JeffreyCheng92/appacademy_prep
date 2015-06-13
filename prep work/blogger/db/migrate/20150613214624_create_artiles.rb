class CreateArtiles < ActiveRecord::Migration
  def change
    create_table :artiles do |t|

      t.timestamps
    end
  end
end
