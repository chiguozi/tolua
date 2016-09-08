local ComponentControlBase = luaclass("ComponentControlBase")

function ComponentControlBase:DefineProperty()
    self.roleControl = nil
    self.insideEventMgr = nil
end

function ComponentControlBase:New(role, eventMgr)
    self:DefineProperty()
    self.roleControl = role
    self.insideEventMgr = eventMgr
    return self
end

function ComponentControlBase:Init()
end

function ComponentControlBase:Regist(type, callback)
    self.insideEventMgr:RegistEvent(type, callback, self)
end

function ComponentControlBase:Unregist(type, callback)
    self.insideEventMgr:UnRegistEvent(type, callback, self)
end

function ComponentControlBase:Dispose()
    self.roleControl = nil
    self.insideEventMgr = nil
end


return ComponentControlBase