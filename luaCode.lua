local HttpService = game:GetService("HttpService")
local LogService = game:GetService("LogService")

local endpoint = "http://localhost:3000/logconsole" -- หรือ ngrok URL

LogService.MessageOut:Connect(function(message, messageType)
	local payload = {
		text = message,
		level = tostring(messageType) -- "Info", "Warning", or "Error"
	}

	local success, response = pcall(function()
		local data2 = request({
			Url = endpoint,
			Method = "POST",
			Headers = {
				['Content-Type'] = 'application/json'
			},
            Body = HttpService:JSONEncode(payload)
		})
	end)
end)

print('Testing')
