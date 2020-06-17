-- Part of a Solitaire program
local mod = {}
-----------------------------------------------------------
local card = {}

function card:reveal()
  self.visible = true
end

local function cardtostring(card)
  if not card.visible then
    return "??"
  end
  local res
  if card.val == 10 then
    res = "T"
  elseif card.val == 11 then
    res = "J"
  elseif card.val == 12 then
    res = "Q"
  elseif card.val == 13 then
    res = "K"
  elseif card.val == 1 then
    res = "A"
  else
    res = tostring(card.val)
  end
  res = res .. card.suit
  return res
end

local cardmeta = { __index = card, __tostring = cardtostring }
function mod.new(val, suit, visible)
  local newcard = {
    val = val,
    suit = suit,
    visible = visible,
  }
  setmetatable(newcard, cardmeta)
  return newcard
end
-----------------------------------------------------------
return mod
