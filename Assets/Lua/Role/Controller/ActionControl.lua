local ActionControl = luaclass("ActionControl", require("Role/Controller/ComponentControlBase"))
local AnimNameEnum = RoleDefine.AnimNameEnum

function ActionControl:New(role, eventMgr)
    self.class.super.New(self, role, eventMgr)
    return self
end

function ActionControl:DefineProperty()
    self.class.super.DeinfeProperty()
    self.animator = nil
    self.curClipName = nil
    self.clipMap = {}
    self.isLock = false
    self.curSpeed = 1
end


return ActionControl
