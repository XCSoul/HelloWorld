-- 触摸响应层

local TouchLayer = class("TouchLayer",function ()
	print("touch")
	return display.newNode()
end)
function TouchLayer:ctor(params)
	self._func = params.func
	print("touch")
	self:init()
end



function TouchLayer:init()
	local corlorLayer = display.newColorLayer(ccc4(23, 222, 21, 0))
	self:addChild(corlorLayer, 0)
    print("touch")
	-- 触摸事件
	corlorLayer:setTouchSwallowEnabled(true)
	corlorLayer:setTouchEnabled(true)
	corlorLayer:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
	corlorLayer:addNodeEventListener(cc.NODE_TOUCH_EVENT, function ( event )
		if event.name == "began" then
			print("beganMask")
			return true
		elseif event.name == "moved" then
			print("movedMask")
		elseif event.name == "ended" then
			print("endedMask")
			-- 点击回调函数
			if self._func then
				(self._func)()
			end
			return true
		end
		return false
	end)
end

return TouchLayer


