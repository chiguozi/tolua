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

function ActionControl:InitEvent()
    self:RegistEvent(InsideType.CreateRoleFinish, self.OnDisplayLoaded)
end


function ActionControl:OnDisplayLoaded()
    local roleControl = self.roleControl
    self.animator = rolebase.display:GetComponent("Animator")

end


function ActionControl:CrossFade(clipName, speed, duration, force)
    speed = speed or 1
    duration = duration or 0.1
    force = force or false
    if self.animator == nil then return end
    if not force and clipName == self.curClipName then return end
    self.curClipName = clipName
    if self:HasClip(self.curClipName) then
        self:ChangeAnimatorSpeed(speed, true)
        self.animator:CrossFade(self.curClipName, duration, 0, 0)
    end 
end

function ActionControl:HasClip(clipName)
    return true
end

function ActionControl:ChangeAnimatorSpeed(speed, force)
    if not force and self.isLock then return end
    if speed <= 0 then speed = 0 end
    self.curSpeed = speed
    if nil ~= self.animator then
        self.animator.speed = self.curSpeed
    end
end

return ActionControl
