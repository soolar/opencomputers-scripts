-- Part of a Solitaire program
local mod = {}
local card = require("solitaire.card")
-----------------------------------------------------------
local deck = {}

function deck:draw()
  return table.remove(self.cards, 1)
end

function deck:putback(stack)
  while stack:hascards() do
    table.insert(self.cards, stack:popcard())
  end
  self:shuffle()
end

function deck:shuffle()
  local count = #self.cards
  for i = 1, count do
    local j = i + math.random(0, count - i)
    self.cards[i], self.cards[j] = self.cards[j], self.cards[i]
  end
end

function decktostring(deck)
  local res = ""
  for i = 1, #deck.cards do
    if res ~= "" then
      res = res .. " "
    end
    local c = deck.cards[i]
    local wasvis = c.visible
    c:reveal()
    res = res .. tostring(c)
    c.visible = wasvis
  end
  return res
end

local deckmeta = { __index = deck, __tostring = decktostring }
local suits = { "H", "D", "S", "C" }
function mod.new()
  local newdeck = {
    cards = {},
  }
  for _, suit in ipairs(suits) do
    for val = 1, 13 do
      table.insert(newdeck.cards, card.new(val, suit, false))
    end
  end
  setmetatable(newdeck, deckmeta)
  return newdeck
end
-----------------------------------------------------------
return mod
