local bopInterval = 2
function onCreatePost()

    
    
    makeLuaSprite('marca', 'credits/asbel', 0, 580)
    scaleObject('marca', 0.9 , 0.9)
    setObjectCamera('marca', 'camOther')
    addLuaSprite('marca', true)
    
    screenCenter('marca', 'x')
    setProperty("marca.x", getProperty("marca.width") * 8.1);
    
	
	setProperty('marca.alpha', 0.9)
	 
	
	setProperty('marca.flipX',true)
	
	
	    if downscroll then
  
    setProperty('marca.y', 5)
    
        setProperty("healthbarSP.x", getProperty("healthBar.x")+getMid('healthBar.width')-getMid('healthbarSP.width')+downscrollX)
        setProperty("healthbarSP.y", getProperty("healthBar.y")+getMid('healthBar.height')-getMid('healthbarSP.height')+downscrollY)
    else
        setProperty("healthbarSP.x", getProperty("healthBar.x")+getMid('healthBar.width')-getMid('healthbarSP.width')+upscrollX)
        setProperty("healthbarSP.y", getProperty("healthBar.y")+getMid('healthBar.height')-getMid('healthbarSP.height')+upscrollY)
    end
end

function onBeatHit()
	if curBeat % bopInterval == 0 then
	
	scaleObject('marca', 0.95, 0.95)
	doTweenX('iconauohsdohjas3', 'marca.scale', 0.9, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas4', 'marca.scale', 0.9, crochet/1000, 'circOut')
end
end

