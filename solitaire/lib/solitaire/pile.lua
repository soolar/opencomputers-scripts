-- Part of a Solitaire program
local mod = {}
-----------------------------------------------------------
local pile = {}

function pile:pushcard(card)
  table.insert(self.cards, card)
end

function pile:popcard(card)
  local res = table.remove(self.cards)
  local newlast = self.cards[#self.cards]
  newlast:reveal()
  return res
end

function pile:hascards()
  return #self.cards > 0
end

local pilemeta = { __index = pile }
function mod.new(cards)
  local newpile = {
    cards = cards or {},
  }
  setmetatable(newpile, pilemeta)
  return newpile
end
-----------------------------------------------------------
return mod
