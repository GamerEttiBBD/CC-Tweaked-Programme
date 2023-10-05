function GetFromSatalite()
    x,y,z = gps.locate()
    return x, y, z
end

function EstablishConnection()
    rednet.open("back")
    rednet.broadcast("seaking connection")
    id, msg = rednet.receive()
    if msg == "offering connection" then
        rednet.send(id, "completing connection")
        connected = true
    end
    if connected then
        print("Connected to Server")
    else
        print("Connection Failed")
    end  
end

function PushToServer(x,y,z)
    
end

function GetFromServer()

end

function main()
    while true do
        EstablishConnection()
    end
end

main()