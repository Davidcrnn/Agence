class CreateMentionLegales < ActiveRecord::Migration[5.1]
  def change
    create_table :mention_legales do |t|

      t.timestamps
    end
  end
end
