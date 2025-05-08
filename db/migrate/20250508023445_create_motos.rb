class CreateMotos < ActiveRecord::Migration[7.0]
  def change
    create_table :motos do |t|
      t.string :marca, null: false
      t.string :modelo, null: false
      t.integer :ano, null: false
      t.string :placa, null: false, index: { unique: true }
      t.string :cor
      t.integer :quilometragem, default: 0
      t.decimal :valor_diaria, precision: 10, scale: 2, null: false
      t.string :status, default: 'disponivel'
      t.string :foto
      t.date :ultima_manutencao
      t.date :proxima_manutencao

      t.timestamps
    end
  end
end