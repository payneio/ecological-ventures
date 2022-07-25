class CreateRelationships < ActiveRecord::Migration[7.0]
  def change

    rels = [
      # [ :people, :ventures ], # already exists
      [ :taxa, :ventures ],
      [ :ecoregions, :taxa ],
      [ :bioregions, :taxa ],
      [ :subrealms, :taxa ],
      [ :realms, :taxa ],
      [ :ecoregions, :ventures ],
      [ :bioregions, :ventures ],
      [ :subrealms, :ventures ],
      [ :realms, :ventures ],
      [ :ecoregions, :problems ],
      [ :bioregions, :problems ],
      [ :problems, :subrealms ],
      [ :problems, :realms ],
      [ :problems, :ventures ],
      [ :solutions, :ventures ],
      [ :problems, :solutions ],
    ]

    def id_type(table) 
      case table
      when :people then :bigint
      when :taxa then :bigint
      when :ventures then :bigint
      when :problems then :bigint
      when :solutions then :bigint
      when :ecoregions then :string
      when :bioregions then :string
      when :subrealms then :string
      when :realms then :string
      else raise "Unknown table #{table}"
      end
    end

    rels.each do |rel|
      table_name = (rel[0].to_s + "_" + rel[1].to_s).to_sym
      id0 = (rel[0].to_s.singularize+"_id").to_sym
      id1 = (rel[1].to_s.singularize+"_id").to_sym
      create_table table_name, id: false do |t|
        t.references rel[0].to_s.singularize.to_sym, foreign_key: true, type: id_type(rel[0]), index: true
        t.references rel[1].to_s.singularize.to_sym, foreign_key: true, type: id_type(rel[1]), index: true
      end
      add_index table_name, [id0, id1], unique: true
    end

  end
end
