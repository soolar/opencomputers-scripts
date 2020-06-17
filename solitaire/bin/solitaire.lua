-- A program to play Solitaire
local deck = require("solitaire.deck")
local pile = require("solitaire.pile")
-----------------------------------------------------------
local gamedeck = deck.new()
gamedeck:shuffle()
local drawpile = pile.new()
local goalpiles = {}
for i = 1, 4 do
  goalpiles[i] = pile.new()
end
local playpiles = {}
for i = 1, 7 do
  playpiles[i] = pile.new()
  for j = 1, i do
    local card = gamedeck:draw()
    if j == i then
      card:reveal()
    end
    playpiles[i]:pushcard(card)
  end
end

local function render()
  local out
  if #gamedeck.cards > 0 then
    out = "?? "
  else
    out = "   "
  end
  if #drawpile.cards > 0 then
    out = out .. tostring(drawpile.cards[#drawpile.cards])
  else
    out = out .. "  "
  end
  out = out .. "    "
  for _, p in ipairs(goalpiles) do
    if p:hascards() then
      out = out .. tostring(p.cards[#p.cards])
    else
      out = out .. "__"
    end
    out = out .. " "
  end
  print(out)
  print()
  local hadcards = true
  local row = 0
  while hadcards do
    out = ""
    row = row + 1
    hadcards = false
    for _, p in ipairs(playpiles) do
      local card = p.cards[row]
      if card then
        hadcards = true
        out = out .. tostring(card)
      else
        out = out .. "  "
      end
      out = out .. " "
    end
    print(out)
  end
end

render()
