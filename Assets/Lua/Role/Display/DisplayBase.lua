local DisplayBase = luaclass("DisplayBase")
local ResourceManager = ResourceManager
local InsideType = RoleDefine.InsideType

function DisplayBase:DefineProperty()
    self.roleControl =  nil
    self.insideEventMgr = nil
    self.go = nil
    self.tr = nil
    self.pos = Vector3.zero
    self.forward = Vector3.forward
    self.eulerAngles = Vector3.zero
end

function DisplayBase:New(role, eventMgr)
    self:DefineProperty()
    self.roleControl = role
    self.insideEventMgr = eventMgr
    return self
end

function DisplayBase:Init()

end

function DisplayBase:Show()
    ResourceManager.Load(roleControl.data:Get("url"), self.OnLoaded, self)
end

function DisplayBase:OnLoaded(obj)
    if nil == obj then
        return
    end
    self.go = GameObject.Instantiate(obj)
    self.tr = self.go.transform
    self.insideEventMgr.Send(InsideType.CreateRoleFinish)
end

function DisplayBase:SetPos(value)
    local pos = value:Clone()
    self.pos = pos
    if nil ~= self.tr then
        self.tr.position = pos
    end
end

function DisplayBase:GetComponent(type)
    if nil ~= self.go then
        return self.go:GetComponent(type)
    end
    return nil
end

function DisplayBase:Regist(type, callback)
    self.insideEventMgr:RegistEvent(type, callback, self)
end

function DisplayBase:Unregist(type, callback)
    self.insideEventMgr:UnRegistEvent(type, callback, self)
end


return DisplayBase

