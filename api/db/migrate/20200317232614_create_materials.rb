class CreateMaterials < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE material_type
        AS ENUM ('pdf',
                 'jpg',
                 'png'
        );
    SQL

    create_table :materials do |t|
      t.string :name, null: false
      t.string :path, null: false
      t.column :kind, :material_type, null: false
      t.references :course, foreign_key: true, null: false

      t.timestamps
    end
  end

  def down
    drop_table :materials

    execute <<-SQL
      DROP TYPE material_type;
    SQL
  end
end
