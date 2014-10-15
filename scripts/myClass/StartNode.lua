--类 = class(类名,[父类]) 及CCNode 对象为StartNode的父类
local StartNode = class("StartNode", function()
	-- 创建并返回一个 CCNode 对象。
	return display.newNode()
end)

-- ctor() 是类的构造函数，在调用StartNode.new()创建StartNode对象实例时会自动执行
-- 如果继承类覆盖了ctor()，那么必须手动调用父类构造
-- 类名.super 可访问指定类的父类
function StartNode:ctor()
	-- 背景
	local bg = display.newSprite("MainMenu.png");
	bg:setAnchorPoint(ccp(0, 0))
	-- display.width、display.height 屏幕的设计分辨率
	bg:setScaleX(display.width/bg:getContentSize().width)
	bg:setScaleY(display.height/bg:getContentSize().height)
	bg:setPosition(ccp(0, 0))
	self:addChild(bg, 0)

	-- 开始按钮
	local start_btn = cc.ui.UIPushButton.new({normal = "button/PlayMenu.png"},{scale9 = true})
	start_btn:setScale(1.3)
	--display.cx、display.cy 屏幕中央的 x 坐标和 y 坐标
	start_btn:setPosition(ccp(display.cx - 150, display.cy + 90))
	self:addChild(start_btn, 0)

	start_btn:onButtonClicked(function(event)
		local GameScene = GameScene.new()
		CCDirector:sharedDirector():replaceScene(GameScene)
	end)

	-- 音乐开关按钮
	local music_btn = cc.ui.UICheckBoxButton.new({on = "button/soundController.png", off = "button/soundController2.png"})
	music_btn:setPosition(ccp(50, 50))
	music_btn:onButtonStateChanged(function(event)
		if event.state == "on" then
			print("on")
			elseif event.state == "off" then
			print("off")
		end
	end)
	music_btn:setButtonSelected(true)
	self:addChild(music_btn, 0)
end
return StartNode