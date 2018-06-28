class Pokemon
  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}') ; " )
  end

  def self.find(id, db)
    new_pokemon = Pokemon.new
    db.execute("SELECT * FROM pokemon WHERE id = '#{id}'; ").each {
      |pokemon|
      new_pokemon.id = pokemon[0]
      new_pokemon.name = pokemon[1]
      new_pokemon.type = pokemon[2]
    }
    new_pokemon
  end

end
