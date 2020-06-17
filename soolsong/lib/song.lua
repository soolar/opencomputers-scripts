local note = require("note")
-----------------------------------------------------------
local song = {}

function song.play(notes, deflen)
  deflen = deflen or 0.125
  for _, f in ipairs(notes) do
    -- f is the formatted form of the note
    print(f)
    local n, lenmult = string.match(f, "([ABCDEFG][#b]%d)x?(.*)")
    if lenmult ~= "" then
      lenmult = tonumber(lenmult)
    else
      lenmult = 1
    end
    note.play(note.midi(n), lenmult * deflen)
  end
end
-----------------------------------------------------------
return song
