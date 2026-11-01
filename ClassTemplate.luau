local Class = {}
Class.__index = Class

-- CLIENT EXCLUSIVE: will store player and character
export type Class = {
	Player:Player;
	Character:Model;
	
	connections:{[string]:RBXScriptConnection};
	
	start:(self:Class)->();
	destroy:(self:Class)->();
}

function Class.new(player:Player, character:Model):Class
	local self = setmetatable({}, Class)::Class
	
	self.Player = player
	self.Character = character
	
	return self
end

function Class.start(self:Class)
	
end

function Class.doSomething(self:Class)
	
end

function _privFunction(self:Class)
	
end

-- EXCLUSIVE: FOR SCRIPTS THAT MAY NEED TO BE DESTROYED EVENTUALLY AND RELOAD
function Class.destroy(self:Class)
	for connectionName, connection in pairs(self.connections) do
		if not connection then continue end
		connection:Disconnect()
		self.connections[connectionName] = nil
	end
end

return Class
