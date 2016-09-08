local RoleControlBase = luaclass("RoleControlBase")
local DisplayBase = require("Role/Display/DisplayBase")
local RoleData = require("Role/Data/RoleData")

function RoleControlBase:DeinfeProperty()
	self.display = nil
	self.data = nil
	self.actionControl = nil
	self.moveControl = nil
end

function RoleControlBase:New()
	self:DeinfeProperty()
    self:Init()
    self:InitDisplay()
    self:InitEvent()
	return self
end

function RoleControlBase:Init()
end

function RoleControlBase:InitDisplay()
    self.display = DisplayBase():New(self, self.insideEventMgr)
    self.display:Init()
end

function RoleControlBase:InitEvent()
end

return RoleControlBase