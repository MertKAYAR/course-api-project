class CreateCertificates < ActiveRecord::Migration[8.0]
  def change
    create_table :certificates do |t|
      t.date :issue_date
      t.string :unique_code
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
