local Casting = {}

local sourceName = "casting"

local currentSpellPractice = ''
local currentSpellPower = 100
local currentSpellArguments = ''

local function practiceCast(conc)
  send("cast "..currentSpellPractice.." @ ".. currentSpellPower.. " "..currentSpellArguments)
end

local function practiceCastSetup(spellName, power, arguments)
  if spellName == "off" then
    Handlers.removeBEBTconcEventListener(sourceName)

  elseif spellName == "resume" then
    Handlers.addBEBTconcEventListener(sourceName, practiceCast)

  elseif spellName == "info" or spellName == "status" or spellName == "" then
    cecho("Currently casting "..currentSpellPractice.." @ "..currentSpellPower.." "..arguments)

  else
    if power < 50 then
      power = 50
    end

    if currentSpellPractice ~= '' then
      practiceCastMemory[currentSpellPractice] = {}
      practiceCastMemory[currentSpellPractice].power = power
      practiceCastMemory[currentSpellPractice].arguments = arguments
    end


    currentSpellPractice = spell
    currentSpellPower = power
    currentSpellArguments = arguments

    Handlers.addBEBTconcEventListener(sourceName, practiceCast)
  end
end

local function load()
  Handlers.addpracticeCastEventListener(sourceName, practiceCastSetup)
end

local function unload()
  Handlers.removepracticeCastEventListener(sourceName, practiceCastSetup)
end

local function reload()
  unload()
  load()
end

Casting = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Casting
