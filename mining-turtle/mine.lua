--[[ Copyright (C) Grzegorz Ciolek 2021 --]]

--[[ CONFIGURATION DIVISION --]]

startingHeight = 0
endHeight = 0
mineLength = 0
mineWidth = 0

--[[ END OF CONFIGURATION --]]

function main()
	if startingHeight <= endHeight then
		print("Invalid configuration.")
		return 1
	end
	digQuarry()
	return 0 
end

function digQuarry()
	local isBlock = false
	for i = 0, (startingHeight - endHeight) - 2, 1 do
		isBlock = turtle.inspectDown()
		if isBlock then
			turtle.digDown()
		end
		turtle.down()
		digLayer()
		turtle.turnRight()
		turtle.turnRight()
	end
end

function digLayer()
	for i = 0, mineWidth - 2, 1 do
		if i % 2 == 0 then
			digLine(mineLength - 2)
			turtle.turnRight()
			digForwards()
			turtle.turnRight()
		else
			digLine(mineLength - 2)
			turtle.turnLeft()
			digForwards()
			turtle.turnLeft()
		end
	end
	digLine(mineLength - 2)
end

function digLine(length)
	local isBlock = false
	for i = 0, length, 1 do
		digForwards()
	end
end

function digForwards()
	isBlock = turtle.inspect()
	if isBlock then
		turtle.dig()
	end
	turtle.forward()
end

main()