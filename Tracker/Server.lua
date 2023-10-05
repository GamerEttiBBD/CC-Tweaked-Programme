function WaitForConnection()
    while true do
        id, msg = rednet.receive()
        if msg == "seaking connection" then
            rednet.send(id, "offering connection")
            id2, msg2 = rednet.receive()
            if id == id2 then
                if msg2 == "closing connection" then
                    print("connected successfully")
                else
                    print("connection refused")
                end
            end 
        end
    end
end

function main()
    rednet.open("back")
    WaitForConnection()
end

main()