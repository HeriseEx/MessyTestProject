--=================================================== 罗技鼠标宏 ==============================================


--[[
	进入脚本按键获取初始化状态
]]

EnablePrimaryMouseButtonEvents(true)
--========================================= 通用枚举 ===========================================
local eventEnum = {
	eSpriteState = false,	-- 脚本激活事件
	eContinuouslyClick = false  -- 鼠标连点事件
}

--========================================= 通用工具模块 ========================================
-- 需要检测的键盘按键
local needUpdateKeyBoardList = {
	["capslock"] = true
}

-- 需要检测的鼠标按键
local needUpdateMouseList = {
	["1"] = true
}

-- 连续调用最小间隔(ms) 未设置上限
local minTriggerDelay = nil
local minTriggerLimit = 500
function setMinTriggerDelay(delay)
	minTriggerDelay = math.max(minTriggerLimit, delay)
end

function resetMinTriggerDelay()
	minTriggerDelay = minTriggerLimit
end

-- 更新键盘按键状态
function UpdateKeyBoardState(key)
	local function updateKeyState(key)
		if key == "capslock" then
			eventEnum.eSpriteState = IsKeyLockOn(key)
		elseif key == "" then
			-- todo
		end
	end

	if key then
		updateKeyState(key)
		return
	end

	for index, item in pairs(needUpdateKeyBoardList) do
		if item ~= nil then
			updateKeyState(index)
		end	
	end
end

-- 更新鼠标按键状态
function UpdateMouseState(key)
	local function updateKeyState()
		-- todo
	end

	if key then
		updateKeyState(key)
		return
	end

	for index, item in pairs(needUpdateKeyBoardList) do
		if item ~= nil then
			updateKeyState(index)
		end	
	end
end

-- 更新所有需要监测的按键状态
function UpdateScriptState()
	UpdateKeyBoardState()
	UpdateMouseState()
end

--========================================= 预调用函数实现 ======================================
-- 预初始化
function preInit()
	-- 初始化连击事件时间间隔
	resetMinTriggerDelay()
	-- 脚本开启时监测开启状态
	UpdateScriptState()
end

preInit()

--========================================= 函数功能实现 ========================================
function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %s\n", event, arg);
	--if event == ""  and arg == "" then
	UpdateScriptState()
	--end

	if not eventEnum.eSpriteState then
		return
	end

	-- 定义点击事件
	if event == "MOUSE_BUTTON_PRESSED" and arg == 3 then
		
	-- 	eventEnum.eContinuouslyClick = true
	-- elseif event == "MOUSE_BUTTON_RELEASED" and arg == 3 then	
	-- 	eventEnum.eContinuouslyClick = false
	end


	-- if eventEnum.eContinuouslyClick then
	-- 	continuouslyClickMouse(event, arg, minTriggerLimit)
	-- end
end

-- 鼠标连续点击
function continuouslyClickMouse(event, key, delay)
	if not eventEnum.eSpriteState then
		return
	end

	if not eventEnum.eContinuouslyClick then
		return
	end

	PressAndReleaseMouseButton(key)

	OutputLogMessage("clickkey"..key)

	-- Sleep(delay)
	-- OnEvent(event, key)
end

