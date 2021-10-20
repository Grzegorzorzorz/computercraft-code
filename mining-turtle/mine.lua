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
	local southpaw = false
	local isBlock = false
	for i = 0, (startingHeight - endHeight) - 2, 1 do
		isBlock = turtle.inspectDown()
		if isBlock then
			turtle.digDown()
		end
		turtle.down()
		digLayer(southpaw)
		if mineWidth % 2 == 1 then
			if southpaw == false then
				southpaw = true
			else
				southpaw = false
			end
		end
	end
end

function digLayer(southpaw)
	if southpaw == false then
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
	else
		for i = 0, mineWidth - 2, 1 do
			if i % 2 == 0 then
				digLine(mineLength - 2)
				turtle.turnLeft()
				digForwards()
				turtle.turnLeft()
			else
				digLine(mineLength - 2)
				turtle.turnRight()
				digForwards()
				turtle.turnRight()
			end
		end
	end
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