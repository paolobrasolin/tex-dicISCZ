local M = {}
local enc = {}

local licrs = {}
local codepoint2utf = unicode.utf8.char 
local function load_encfiles(f)
	local file= io.open(f,"r")
	local encodings = file:read("*all")
	file:close()
	for codepoint, licr in encodings:gmatch('DeclareUnicodeCharacter(%b{})(%b{})') do
		local codepoint = codepoint2utf(tonumber(codepoint:sub(2,-2),16))
		local licr= licr:sub(2,-2):gsub('@tabacckludge','')
		licrs[licr] = codepoint
	end
end

local function sanitize_licr(l)
	return l:gsub(" (.)",function(s) if s:match("[%a]") then return " "..s else return s end end):sub(2,-2)
end

local load_enc = function(enc)
	for _,e in pairs(enc) do
		local filename = e:lower() .. "enc.dfu"
		local dfufile = kpse.find_file(filename)
		if dfufile then
			load_encfiles(dfufile)
		end
	end
end



local cache = {}

local process = function(input)
	local output = input:gsub('\\IeC[%s]*(%b{})',function(iec)
		local code = cache[iec] or licrs[sanitize_licr(iec)] or '\\IeC '..iec
		-- print(iec, code)
		cache[iec] = code
		return code
	end)
	return output
end
M.process = process
M.load_enc = load_enc
return M
