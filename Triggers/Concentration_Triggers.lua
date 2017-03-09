local Concentration = {}

local triggers = {}

local function load()
  local tempTriggers = {}

    tempTriggers.BEBT =
      tempRegexTrigger("^(?:> )?(?:Concentration: )?(You're bright-eyed and bushy-tailed\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("BEBTconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.BOB =
      tempRegexTrigger("^(?:> )?(You're a bit off balance\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("BOBconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.SD =
      tempRegexTrigger("^(?:> )?(You're somewhat distracted\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("SDconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.OB =
      tempRegexTrigger("^(?:> )?(You're off balance\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("OBconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.DAOB =
      tempRegexTrigger("^(?:> )?(You're distracted and off balance\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("DAOBconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.SHOT =
      tempRegexTrigger("^(?:> )?(Your concentration is shot to hell\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("SHOTconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.TCTRN =
      tempRegexTrigger("^(?:> )?(You're too confused to remember your name\\.)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("TCTRNconcEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])
    tempTriggers.Unconscious =
      tempRegexTrigger("^(?:> )?(You fall unconscious!)"
                       ,[[
                          local conc = matches[2]
                          local arguments  = {conc = conc}

                          Events.raiseEvent("UnconsciousEvent", arguments)
                          Events.raiseEvent("concEvent", arguments)
                        ]])

  triggers = tempTriggers
end

local function unload()
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function reload()
  load()
  reload()
end

Concentration = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Concentration
