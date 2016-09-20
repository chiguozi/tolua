ControlManager = {}

local _map = {}

function ControlManager.Regist(name, control)
	if nil ~= _map[name] then
		logError("重复注册")
	end
	logError(name)
	_map[name] = control
end

function ControlManager.Get(name)
	return _map[name]
end

function ControlManager.Update()
	for k,v in pairs(_map) do
		print(k,v)
		v:Update()
	end
end

function ControlManager.Init()
	for k, v in pairs(_map) do
		v:Init()
	end
end