-- Day and Night Cycle Script

-- Services
local Lighting = game:GetService("Lighting")

-- Configuration
local DAY_LENGTH = 60 -- Length of day in seconds
local NIGHT_LENGTH = 60 -- Length of night in seconds
local CYCLE_LENGTH = DAY_LENGTH + NIGHT_LENGTH

-- Variables
local currentTime = 0
local isDay = true

-- Function to update the lighting
local function updateLighting()
    if isDay then
        Lighting.ClockTime = 12 -- Noon
        Lighting.Ambient = Color3.fromRGB(120, 120, 120)
        Lighting.Brightness = 2
    else
        Lighting.ClockTime = 0 -- Midnight
        Lighting.Ambient = Color3.fromRGB(50, 50, 50)
        Lighting.Brightness = 1
    end
end

-- Function to handle the cycle
local function handleCycle()
    currentTime = currentTime + 1
    
    if isDay and currentTime >= DAY_LENGTH then
        isDay = false
        currentTime = 0
        updateLighting()
    elseif not isDay and currentTime >= NIGHT_LENGTH then
        isDay = true
        currentTime = 0
        updateLighting()
    end
end

-- Connect the cycle to the heartbeat
game:GetService("RunService").Heartbeat:Connect(handleCycle)

-- Initialize the lighting
updateLighting()