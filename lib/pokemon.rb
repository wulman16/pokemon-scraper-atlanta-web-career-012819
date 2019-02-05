class Pokemon

	attr_reader :id, :name, :type, :db

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', 
			'#{type}')")
	end

	def self.find(id, db)
		poke_name = db.execute("SELECT name FROM pokemon WHERE pokemon.id = '#{id}'").flatten[0]
		poke_type = db.execute("SELECT type FROM pokemon WHERE pokemon.id = '#{id}'").flatten[0]
		self.new(id: id, name: poke_name, type: poke_type, db: db)
	end

end
