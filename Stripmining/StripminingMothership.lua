function GetX()
    x,y,z = gps.locate()
    return x
end
 
function GetY()
    x,y,z = gps.locate()
    return y
end
 
function GetZ()
    x,y,z = gps.locate()
    return z
end
 
function MoveForward(times)
    for i = times,1,-1 do
        turtle.forward()
    end
end
 
function MoveBack(times)
	for i = times,1,-1 do
        turtle.back()
    end
end
 
function MoveUp(times)
    for i = times,1,-1 do
        turtle.forward()
    end
end
 
function MoveDown(times)
    for i = times,1,-1 do
        turtle.forward()
    end
end
 
function TurnLeft(times)
    for i = times,1,-1 do
        turtle.turnLeft()
    end
end
 
function TurnRight(times)
    for i = times,1,-1 do
        turtle.turnRight()
    end
end
 
function FindEmpty()
    slotamount = 16
    foundslot = false
    slotid = 0   
    while (foundslot == false) do
        for i = slotamount,1,-1 do
            if turtle.getItemDetail(i,false) == nil then
                foundslot = true
                print("Empty slot found")
                slotid = i
            end
        end
    end
    return slotid
end
 
--function SortInventory()  
--end
 
function CheckForChests()
    print("called CheckForChests")
	slotamount = 16
    foundchest = false
    chestslotid = 0
    while(foundchest == false) do
        print("in whileloop")
        for i = slotamount,1,-1 do
            print("in for")
            count, name = turtle.getItemDetail(i, false)
            if (name == nil or name == '') then
                print("name nil")
            else
                print("asked for Chest detail")
                if(name == "minecraft:chest") then
                    print("item there")
                    if(count == 2) then
                        foundchest = true
                        print("Chests found")
                        chestslotid = i
                    end
                end
            end
        end
        return false
    end
    return true, chestslotid
end
 
function CheckForCoal()
    print("called CheckForCoal")
	slotamount = 16
    foundcoal = false
    coalslotid = 0
    while(foundcoal == false) do
        for i = slotamount,1,-1 do
            if turtle.getItemDetail(i,false) == not nil then
                count, name = turtle.getItemDetail(i,false)
                print("asked for Coal detail")
                if(name == "minecraft:coal_block") then
                    if(count == 64) then
                        foundcoal = true
                        print("Coalblock found")
                        coalslotid = i
                    end
                end
            end
        end
        return false
    end
    return true, coalslotid
end
 
function CheckForFloppy()
    print("called CheckForFloppy")
	slotamount = 16
    foundfloppy = false
    floppyslotid = 0
    while(foundfloppy == false) do
        for i = slotamount,1,-1 do
            if turtle.getItemDetail(i,false) == not nil then
                count, name = turtle.getItemDetail(i,false)
                print("asked for Floppy detail")
                if(name == "computercraft:disk") then
                    if(count == 1) then
                        foundfloppy = true
                        print("Floppydisk found")
                        floppyslotid = i
                    end
                end
            end
        end
        return false
    end
    return true, floppyslotid
end
 
function CheckForDrive()
    print("called CheckForDrive")
	slotamount = 16
    founddrive = false
    driveslotid = 0
    while(founddrive == false) do
        for i = slotamount,1,-1 do
            if turtle.getItemDetail(i,false) == not nil then
                count, name = turtle.getItemDetail(i,false)
                print("asked for Drive detail")
                if(name == "computercraft:disk_drive") then
                    if(count == 1) then
                        founddrive = true
                        print("Diskdrive found")
                        driveslotid = i
                    end
                end
            end
        end
        return false
    end
    return true, driveslotid
end
 
function CheckForTurtle()
    print("called CheckForTurtle")
	slotamount = 16
    foundturtle = false
    turtleslotid = 0
    while(foundturtle == false) do
        for i = slotamount,1,-1 do
            if turtle.getItemDetail(i,false) == not nil then
                count, name = turtle.getItemDetail(i,false)
                print("asked for Turtle detail")
                if(name == "computercraft:turtle_normal" or name == "computercraft:turtle_advanced") then
                    foundturtle = true
                    print("Turtle found")
                    turtleslotid = i
                end
            end
        end
        return false
    end
    return true, turtleslotid
end
 
function CheckInventory()
    print("called CheckInventory")
    chestworked, chest = CheckForChests()
    coalworked, coal = CheckForCoal()
    diskworked, disk = CheckForFloppy()
    driveworked, drive = CheckForDrive()
    turtleworked, turtle = CheckForTurtle()
    if(chestworked and coalworked and diskworked and driveworked and turtleworked) then
        return true, chest, coal, disk, drive, turtle
    else
        return false
    end
end
 
function GoToGround()
    NotOnGround = true
    while (NotOnGround) do
        if turtle.detectDown() == false then
            turtle.down()
        else
            NotOnGround = false
        end
    end
end
 
function DetectPhysicsblock()
    blockinfront = true
    while(blockinfront) do
        if(turtle.detect() == true) then
            turtle.dig()
        else
            blockinfront = false
        end
    end
end
 
function CheckFloor()
    if(turtle.detectDown == false) then
        SelectBlock()
        turtle.placeDown()
    end
    turtle.turnLeft()
    turtle.forward()
    if(turtle.detectDown == false) then
        SelectBlock()
        turtle.placeDown()
    end
    TurnRight(2)
    MoveForward(2)
    if(turtle.detectDown == false) then
        SelectBlock()
        turtle.placeDown()
    end
end
 
function MakeStairs()
    if (GetY > -53) then
        for i = 4, 0, -1 do
            turtle.up()
        end
        turtle.dig()
        DetectPhysicsblock()
        turtle.forward()
        turtle.turnLeft()
        turtle.dig()
        DetectPhysicsblock()
        TurnRight(2)
        turtle.dig()
        DetectPhysicsblock()
        turtle.turnLeft()
        for i = 3, 0, -1 do
            turtle.digDown()
            turtle.down()
            turtle.turnLeft()
            turtle.dig()
            DetectPhysicsblock()
            TurnRight(2)
            turtle.dig()
            DetectPhysicsblock()
            turtle.turnLeft()
        end
    CheckFloor()
    end
end
 
function DigTunnel()
end
 
function main()
    chestslot = 0
    coalslot = 0
    diskslot = 0
    driveslot = 0
    turtleslot = 0
    rednet.open("left")
    print("Turtle needs:")
    print("     2x Chest")
    print("     64x Coalblocks")
    print("     1x Floppydisk")
    print("     1x Diskdrive")
    print("     64x Miningturtles")
    print("                         ")
    print(" Items above are amount sensitive!")
    print("Type key after adding everything...")
    read()
    print("Checking Inventory...")
    bool, chest, coal, disk, drive, turtle = CheckInventory()
    if(bool == false) then
        print("Some items are missing!")
        print("Check list and try again!")
    else
        chestslot = chest
        coalslot = coal
        diskslot = disk
        driveslot = drive
        turtleslot = turtle
        print("Item-Requirements met")
        GoToGround()
        print("I am on ground!")
        MakeStairs()
        print("I finished the stairs!")
    end
end

main()