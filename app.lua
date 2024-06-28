local http = require("http.request")
local json = require("dkjson")

local function send_post_request(url, data)
    local headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded"
    }

    local body = ""
    for key, value in pairs(data) do
        if body ~= "" then
            body = body .. "&"
        end
        body = body .. key .. "=" .. value
    end

    local req = http.new_from_uri(url)
    req.headers:upsert(":method", "POST")
    req.headers:upsert("content-type", "application/x-www-form-urlencoded")
    req:set_body(body)

    local headers, stream = assert(req:go())
    local response_body = assert(stream:get_body_as_string())

    return response_body
end

local function chat()
    local url = "https://api.simsimi.vn/v1/simtalk"
    
    while true do
        io.write("you>: ")
        local user_input = io.read()
        if user_input == "exit" then
            break
        end

        local data = {
            text = user_input,
            lc = "id"
        }

        local response = send_post_request(url, data)
        local response_table = json.decode(response)
        
        if response_table and response_table.message then
            print("bot>: " .. response_table.message)
        else
            print("Error!!")
        end
    end
end

chat()
