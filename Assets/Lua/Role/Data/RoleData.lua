local RoleData = luaclass("RoleData")

function RoleData:New()
	self:DefineProperty()
	return self
end

function RoleData:DefineProperty()
	self.id = 0
	self.url = ""
	self.name = ""
    self.initPos = Vector3.zero
    self.initRot = Vector3.zero
    self.initScale = Vector3.zero
end

function RoleData:Get(property)
	return self[property]
end

return RoleData
