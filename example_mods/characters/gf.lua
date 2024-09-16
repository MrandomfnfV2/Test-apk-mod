fontuse = 'fpsFuente'

function onCreatePost()
     makeLuaText("fps", " ", -1, 5, 5)
    setTextSize("fps", 15)
    setObjectCamera("fps", 'other'); 
    setTextColor('fps', 'ffffff')
    addLuaText("fps",true)
    setProperty('fps.alpha',1);
    setTextFont('fps', fontuse .. ".ttf");
    setTextBorder('fps', 1, '000000')
    
    makeLuaText("MemoryCounter", "MEM: 0 MB", -1, 5, 5+ getTextSize('fps')*1)
    setTextSize("MemoryCounter", 16)
    setObjectCamera("MemoryCounter", 'other'); 
    setTextColor('MemoryCounter', 'ffffff')
    addLuaText("MemoryCounter",true)
    setProperty('MemoryCounter.alpha',1);
    setTextFont('MemoryCounter', fontuse .. ".ttf");
    
    setTextBorder('MemoryCounter', 1, '000000')
    

    
 

  addHaxeLibrary('Main');
  runHaxeCode([[
    Main.fpsVar.visible = false;
  ]]);
end

function onStepHit()
end

function round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end


local months = {'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'}
local timeTab = {}

function onCreate()
	get = getRandomInt(1,1)
	
end
mP = 0
memPeak = 0
function onUpdate()
--setObjectOrder('fps',9999);
--setObjectOrder('time',9999);
--setObjectOrder('months',9999);
--setObjectOrder('MemoryCounter',9999);
    
    local curFps = ""..getPropertyFromClass("Main", "fpsVar.currentFPS")
    local m = round(getPropertyFromClass("openfl.system.System", "totalMemory") / 1000000, 1);
    if mP < m then
    mP = m
    end
    local peakLv = 0
  

    timeTab = os.date('*t')
    yepp = ""
    if timeTab.hour < 12 then yepp = 'A.M' else yepp = 'P.M' end
    --part1 = 'Ngày: '..timeTab.day .. '/' .. months[timeTab.month] .. '/' .. timeTab.year
    part2 = 'Thời gian: '..timeTab.hour .. ':'.. minCheck() .. ' '.. yepp 

    setTextString('time', part2)
    setTextString('months', part1)

   if m> 1024 then
   memory = round(m / 1024,2)
   measure = "GB"
   else
   memory = m
   measure = "MB"
   end
   
   if mP> 1024 then
   memPeak = round(mP / 1024,2)
   measurePeak = "GB"
   else
   memPeak = mP
   measurePeak = "MB"
   end
   
   if getPropertyFromClass("Main", "fpsVar.currentFPS") <=30 then
   setTextColor('MemoryCounter', 'ff0000')
   setTextColor('fps', 'ff0000')
   else
   setTextColor('MemoryCounter', 'ffffff')
   setTextColor('fps', 'ffffff')
   end
 
    setTextString("MemoryCounter", "Port by LiterallyAsbelin")
    setTextString("fps","FPS: "..curFps .. " • RAM: " .. memory .." "..measure.. " / "..memPeak.." "..measurePeak)
    

if get == 1 then

			setTextString("botplayTxt", "Botplay [ON] - Psych Engine "..version.."\nPort by LiterallyAsbelin")
            setTextFont('botplayTxt', 'fpsFuente.ttf')
setTextSize('botplayTxt', 21)
	end

end

function round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
  return x / n
end

function minCheck()
    if string.len(timeTab.min) < 2 then
        if tonumber(timeTab.min) < 10 then 
            return '0'..timeTab.min
        else
            return timeTab.min
        end
    else
        return timeTab.min
    end
end

function mathlerp(from,to,i)
  return from+(to-from)*i
end

function onEndSong() 
addHaxeLibrary('Main');
  runHaxeCode([[
    Main.fpsVar.visible = true;
  ]]);
end

function onExitSong() 
addHaxeLibrary('Main');
  runHaxeCode([[
    Main.fpsVar.visible = true;
  ]]);
end

