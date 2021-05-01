-- This file:
--   http://angg.twu.net/LATEX/2020-2-C2-ids-trigs.lua.html
--   http://angg.twu.net/LATEX/2020-2-C2-ids-trigs.lua
--           (find-angg "LATEX/2020-2-C2-ids-trigs.lua")
-- Author: Eduardo Ochs <eduardoochs@gmail.com>
--
-- (defun e () (interactive) (find-angg "LATEX/2020-2-C2-ids-trigs.tex"))
-- (defun l () (interactive) (find-angg "LATEX/2020-2-C2-ids-trigs.lua"))
-- See: (find-es "dednat" "drawing-polys")
--      (find-dn6 "luarects.lua" "LuaWithRects-tests")
--      (find-dn6 "luarects.lua" "AsciiRect")
--      (find-dn6 "picture.lua" "LPicture")
--      (find-dn6 "picture.lua" "LPicture" "addtex =")

-- «.pictreplace»	(to "pictreplace")
-- «.CCells»		(to "CCells")
-- «.CCells-A»		(to "CCells-A")
-- «.CCells-test»	(to "CCells-test")


-- «pictreplace»  (to ".pictreplace")
-- (find-LATEX "2020-2-C3-plano-tang.lua" "pictreplace")
pictreplace = function (bigstr)
    local f = function (s) return tostring(expr(s)) end
    local g = function (line) return (line:gsub("<([^<>]+)>", f)) end
    return (bigstr:gsub("[^\n]+", g))
  end



-- «CCells»  (to ".CCells")
getccells = function (lines)
    local cells_re = "^"..lines[1]:gsub("%_+", "(%1)"):gsub("[ _]", ".").."$"
    local empty_re = "^[-+ ]*$"
    local ccells = {}
    for i=2,#lines do
      local line = lines[i]
      if not line:match(empty_re) then
        local cells = {line:match(cells_re)}
        table.insert(ccells, cells)
      end
    end
    return ccells
  end

CCells = Class {
  type = "CCells",
  from = function (lines)
      local A = getccells(lines)
      A.lines = lines
      A.nlines = #A
      A.ncols  = #(A[1])
      return CCells(A)
    end,
  __tostring = function (cc) return cc:tostring() end,
  __index = {
    tostring = function (cc)
        local f = function (s) return "|"..s.."|" end
        return mapconcat(f, cc.lines, "\n")
      end,
    pos = function (cc, ncol, nline)
        return v((ncol-1)*(cc.xscale or 1), 1-nline)
      end,
    --
    -- (find-dn6 "zhas.lua" "MixedPicture")
    -- (find-dn6 "zhas.lua" "MixedPicture" " put =")
    addcellsto = function (cc, mp, totex)
        totex = totex or (function (s) return (s:gsub("!", "\\")) end)
        for y=1,cc.nlines do
          for x=1,cc.ncols do
            local text = cc[y][x]
            local pos = cc:pos(x, y)
            if text:match("[^ ]") then
              mp:put(pos, totex(text))
            end
          end
        end
      end,
    --
    -- (find-dn6 "picture.lua" "LPicture")
    -- (find-dn6 "picture.lua" "LPicture" "addtex =")
    addlatexto = function (cc, mp, ...)
        mp.lp:addt(...)
      end,
    addLineto = function (cc, mp, ...)
        local str = "\\Line"
        for _,point in ipairs({...}) do
	  str = str..tostring(cc:pos(point[1]+0.5, point[2]+0.5))
	  print(str)
        end
        cc:addlatexto(mp, str)
      end,
  },
}

AsciiRect.__index.toccells = function (ar)
    return CCells.from(ar.lines)
  end




-- «CCells-A»  (to ".CCells-A")
-- (c2m202fpp 6 "contas-sem-vai-um")
-- (c2m202fp    "contas-sem-vai-um")
-- (c2m202fpp 7 "div-polis")
-- (c2m202fp    "div-polis")
bigstr = [[
A = 1/ _ _ _ _ _   _ _ _ \
     |   2 7 7 3 |   1 2 |
     |           +------ |
     | - 2 4       2 3 1 |
     |   ---             |
     |     3 7           |
     |   - 3 6           |
     |     ---           |
     |       1 3         |
     |     - 1 2         |
     |       ---         |
     \         1         /
]]
luarecteval(bigstr)



-- «CCells-test»  (to ".CCells-test")
--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
loaddednat6()
dofile "2020-2-C2-ids-trigs.lua"

cc = A:toccells()
mp = MixedPicture.new({zdef="div numeric", scale="10pt", meta=""})
cc:addcellsto(mp)
cc:addLineto(mp, {0,0}, {2,1})
= cc
= mp
= mp:tolatex()

--]]

--[==[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
loaddednat6()
dofile "2020-2-C2-ids-trigs.lua"

= A
PP(A)
PPV(A.lines)

= otype(A)
PPV(A.lines)
cc = A:toccells()
= cc
PPV(cc)

mp = MixedPicture.new({zdef="div numeric", scale="10pt", meta=""})
for y=1,cc.nlines do
  for x=1,cc.ncols do
    local text = cc[y][x]
    local pos = cc:pos(x, y)
    if text:match("[^ ]") then
      print(pos, text)
      mp:put(pos, text)
      --   for v in mp.zha:points() do mp:put(v, v:lr()) end
    end
  end
end


= mp
= mp:tolatex()

= getccells(A.lines)

lines = A.lines
= lines[1]
= lines[1]:gsub("%_+", "(%1)")
= lines[1]:gsub("%_+", "(%1)"):gsub("[ _]", ".")
re = lines
re = "^"..lines[1]:gsub("%_+", "(%1)"):gsub("[ _]", ".")
= re
= lines[2]
= lines[2]:match(re)
PP({lines[2]:match(re)})

PPV(getccells(A.lines))

= otype(A)



--]==]
