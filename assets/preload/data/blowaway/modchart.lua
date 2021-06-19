

function start(song) -- do nothing
    camZoom = 1
    trace(noteInvert)
end



function update(elapsed)
    if difficulty ~= 0 then
        if curStep >= 128 and curStep < 192 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                --setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        elseif curStep >= 192 and curStep < 256 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                setActorX(_G['defaultStrum'..i..'X'], i)
                --setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
            for i=4,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                --setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        elseif curStep >= 256 and curStep < 320 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                --setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
            for i=4,7 do
                setActorX(_G['defaultStrum'..i..'X'], i)
                --setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        elseif curStep >= 320 and curStep < 384 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                --setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
            end
            for i=4,7 do
                --setActorX(_G['defaultStrum'..i..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        elseif curStep >= 384 and curStep < 448 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                local arrowgoto = i + 4
                local startx = _G['defaultStrum'..i..'X']
                local newx = _G['defaultStrum'..arrowgoto..'X']
                local changeinx = newx - startx

                if (curStep == 384) then
                    tweenPosQuartOut(i,newx,getActorY(i),4.8,'')
                end
                --setActorX(_G['defaultStrum'..i..'X'] + changeinx * (math.sin(((curStep - 384) * 0.015625) * (math.pi * 0.5)))--[[((_G['defaultStrum'..arrowgoto..'X'] - _G['defaultStrum'..i..'X']) * (curStep - 384) / duration)]], i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
            for i=4,7 do
                local arrowgoto = i - 4
                local startx = _G['defaultStrum'..i..'X']
                local newx = _G['defaultStrum'..arrowgoto..'X']
                local changeinx = newx - startx
                if (curStep == 384) then
                    tweenPosQuartOut(i,newx,getActorY(i),4.8,'')
                end
                --setActorX(_G['defaultStrum'..i..'X'] + changeinx * (math.sin(((curStep - 384) * 0.015625) * (math.pi * 0.5)))--[[((_G['defaultStrum'..arrowgoto..'X'] - _G['defaultStrum'..i..'X']) * (curStep - 384) / duration)]], i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        elseif curStep >= 448 and curStep < 576 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                local newi = i + 4
                setActorX(_G['defaultStrum'..newi..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
            end
            for i=4,7 do
                local newi = i - 4
                setActorX(_G['defaultStrum'..newi..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
            end
        elseif curStep >= 576 and curStep < 640 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                local arrowgoto = i + 4
                local newx = _G['defaultStrum'..i..'X']
                local startx = _G['defaultStrum'..arrowgoto..'X']
                local changeinx = newx - startx

                if curStep == 576 then
                    tweenPosQuartOut(i,newx,getActorY(i),4.8,'')
                end
                --setActorX(_G['defaultStrum'..arrowgoto..'X'] + changeinx * (math.sin(((curStep - 576) * 0.015625) * (math.pi * 0.5)))--[[((_G['defaultStrum'..arrowgoto..'X'] - _G['defaultStrum'..i..'X']) * (curStep - 384) / duration)]], i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
            for i=4,7 do
                local arrowgoto = i - 4
                local newx = _G['defaultStrum'..i..'X']
                local startx = _G['defaultStrum'..arrowgoto..'X']
                local changeinx = newx - startx

                if curStep == 576 then
                    tweenPosQuartOut(i,newx,getActorY(i),4.8,'')
                end
                --setActorX(_G['defaultStrum'..arrowgoto..'X'] + changeinx * (math.sin(((curStep - 576) * 0.015625) * (math.pi * 0.5)))--[[((_G['defaultStrum'..arrowgoto..'X'] - _G['defaultStrum'..i..'X']) * (curStep - 384) / duration)]], i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end
        elseif curStep >= 640 and curStep < 704 and difficulty ~= 1 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                local curBeat = curStep % 16
                local yplus = 0
                local xplus = 0
                local curi = i % 4

                if curBeat == 0 or curBeat == 1 or curBeat == 2 or curBeat == 3 then
                    yplus = -64 + (curi * 43)
                    xplus = 0
                elseif curBeat == 4 or curBeat == 5 or curBeat == 6 or curBeat == 7 then
                    yplus = 64 + (curi * -43)
                    xplus = 0
                elseif curBeat == 8 or curBeat == 9 or curBeat == 10 then
                    yplus = 0
                    xplus = 0
                elseif curBeat == 11 or curBeat == 12 or curBeat == 13 then
                    yplus = 0
                    xplus = -64 + (curi *-43)
                elseif curBeat == 14 or curBeat == 15 then
                    yplus = 0
                    xplus = 64 + (curi * -43)
                end

                setActorX(_G['defaultStrum'..i..'X'] + xplus, i)
                setActorY(_G['defaultStrum'..i..'Y'] + yplus, i)
            end
            for i=4,7 do
                setActorX(_G['defaultStrum'..i..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
            end
        elseif curStep >= 704 and curStep < 752 and difficulty ~= 1 then
            if curStep == 704 then
                tweenPos('boyfriend',getActorX('boyfriend') + 200,getActorY('boyfriend'),4.8,'')
            end

            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,3 do
                setActorX(_G['defaultStrum'..i..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
            end
            for i=4,7 do
                local curBeat = curStep % 16
                local yplus = 0
                local xplus = 0
                local curi = i % 4
                local curBeatMod = curBeat % 4

                if curBeatMod == 0 or curBeatMod == 1 then
                    yplus = -64 + (curi * 43)
                    xplus = 0
                elseif curBeat == 2 or curBeat == 3 then
                    yplus = 64 + (curi * -43)
                    xplus = 0
                end

                setActorX(_G['defaultStrum'..i..'X'] + xplus, i)
                setActorY(_G['defaultStrum'..i..'Y'] + yplus, i)
            end
        elseif curStep >= 768 and curStep < 800 and difficulty ~= 1 then
            if noteInvert == 1 then
                for i=0,7 do
                    local arrowgoto = 0
                    if i == 0 then arrowgoto = 3 end
                    if i == 1 then arrowgoto = 2 end
                    if i == 2 then arrowgoto = 1 end
                    if i == 3 then arrowgoto = 0 end
                    if i == 4 then arrowgoto = 7 end
                    if i == 5 then arrowgoto = 6 end
                    if i == 6 then arrowgoto = 5 end
                    if i == 7 then arrowgoto = 4 end

                    local startx = _G['defaultStrum'..i..'X']
                    local newx = _G['defaultStrum'..arrowgoto..'X']
                    local changeinx = newx - startx

                    if (curStep == 768) then
                        tweenPosQuartOut(i,newx,getActorY(i),2.4,'')
                    end

                    --setActorX(_G['defaultStrum'..i..'X'] + changeinx * (math.sin(((curStep - 768) * (2*0.015625)) * (math.pi * 0.5))), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            else
                setActorX(_G['defaultStrum'..i..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
            end
        elseif curStep >= 800 and curStep < 896 and difficulty ~= 1 then
            if noteInvert == 1 then
                for i=0,7 do
                    --this definitely isn't the best way to do it but I'm lazy so
                    local arrowgoto = 0
                    if i == 0 then arrowgoto = 3 end
                    if i == 1 then arrowgoto = 2 end
                    if i == 2 then arrowgoto = 1 end
                    if i == 3 then arrowgoto = 0 end
                    if i == 4 then arrowgoto = 7 end
                    if i == 5 then arrowgoto = 6 end
                    if i == 6 then arrowgoto = 5 end
                    if i == 7 then arrowgoto = 4 end

                    setActorX(_G['defaultStrum'..arrowgoto..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            else
                for i=0,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            end
        elseif curStep >= 896 and curStep < 1024 and difficulty ~= 1 then
            if noteInvert == 1 then
                for i=0,7 do
                    local arrowgoto = 0
                    if i == 0 then arrowgoto = 3 end
                    if i == 1 then arrowgoto = 2 end
                    if i == 2 then arrowgoto = 1 end
                    if i == 3 then arrowgoto = 0 end
                    if i == 4 then arrowgoto = 7 end
                    if i == 5 then arrowgoto = 6 end
                    if i == 6 then arrowgoto = 5 end
                    if i == 7 then arrowgoto = 4 end

                    local currentBeat = (songPos / 1000)*(bpm/60)
                    setActorX(_G['defaultStrum'..arrowgoto..'X'] + 32 * math.sin((currentBeat + arrowgoto*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + arrowgoto*0.25) * math.pi), i)
                end
            else
                for i=0,7 do
                    local currentBeat = (songPos / 1000)*(bpm/60)
                    setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
                end
            end
        elseif curStep >= 1280 and curStep < 1536 and difficulty ~= 1 then
            if (curStep == 1280) then
                tweenPosQuartOut('dad',getActorX('dad'),getActorY('dad')-100,2.4,'')
                tweenPosQuartOut('boyfriend',getActorX('boyfriend'),getActorY('boyfriend')-100,2.4,'')
                --tweenPosSineInOutPingPong('dad',getActorX('dad'),getActorY('dad')+25,2.4,'')
                --tweenPosSineInOutPingPong('boyfriend',getActorX('boyfriend'),getActorY('boyfriend')+25,2.4,'')
            end

            local currentBeat = (songPos / 1000)*(bpm/60)

            if curStep >= 1280 and curStep < 1312 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1312 and curStep < 1344 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1344 and curStep < 1376 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1376 and curStep < 1408 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1408 and curStep < 1440 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1440 and curStep < 1472 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1472 and curStep < 1504 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            elseif curStep >= 1504 and curStep < 1536 then
                for i=0,3 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
                for i=4,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                    setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
                end
            else
                for i=0,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                end
            end

            --setActorY(getActorY('dad') - (math.sin(((curStep - 1280) * (0.015625*2)) * (math.pi * 0.5))), 'dad')
            --setActorY(getActorY('boyfriend') - (math.sin(((curStep - 1280) * (0.015625*2)) * (math.pi * 0.5))), 'boyfriend')
        elseif curStep >= 1536 and curStep < 1792 and difficulty ~= 1 then
            if (curStep == 1536) then
                tweenPos('dad',getActorX('dad'),getActorY('dad')-1000,20,'')
                tweenPos('boyfriend',getActorX('boyfriend') - 200,getActorY('boyfriend')-1000,20,'')
                for i=0,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                    setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                end
            end
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                setActorAngle(_G['defaultStrum'..i..'Angle'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
                setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
            end

            --setActorY(getActorY('dad') - (math.sin(((curStep - 1280) * (0.015625*2)) * (math.pi * 0.5))), 'dad')
            --setActorY(getActorY('boyfriend') - (math.sin(((curStep - 1280) * (0.015625*2)) * (math.pi * 0.5))), 'boyfriend')
        elseif curStep >= 1792 and curStep < 1856 and difficulty ~= 1 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,7 do
                setActorAngle(_G['defaultStrum'..i..'Angle'], i)
                local curBeat = curStep % 16
                local yplus = 0
                local xplus = 0
                local curi = i % 4

                if curBeat == 0 or curBeat == 1 or curBeat == 2 or curBeat == 3 then
                    yplus = -64 + (curi * 43)
                    xplus = 0
                elseif curBeat == 4 or curBeat == 5 or curBeat == 6 or curBeat == 7 then
                    yplus = 64 + (curi * -43)
                    xplus = 0
                elseif curBeat == 8 or curBeat == 9 or curBeat == 10 then
                    yplus = 0
                    xplus = 0
                elseif curBeat == 11 or curBeat == 12 or curBeat == 13 then
                    yplus = 0
                    xplus = -64 + (curi *-43)
                elseif curBeat == 14 or curBeat == 15 then
                    yplus = 0
                    xplus = 64 + (curi * -43)
                end

                setActorX(_G['defaultStrum'..i..'X'] + xplus, i)
                setActorY(_G['defaultStrum'..i..'Y'] + yplus, i)
            end
        elseif curStep >= 1856 and curStep < 1904 and difficulty ~= 1 then
            local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,7 do
                local curBeat = curStep % 16
                local yplus = 0
                local xplus = 0
                local curi = i % 4
                local curBeatMod = curBeat % 4

                if curBeatMod == 0 or curBeatMod == 1 then
                    yplus = -64 + (curi * 43)
                    xplus = 0
                elseif curBeat == 2 or curBeat == 3 then
                    yplus = 64 + (curi * -43)
                    xplus = 0
                end

                setActorX(_G['defaultStrum'..i..'X'] + xplus, i)
                setActorY(_G['defaultStrum'..i..'Y'] + yplus, i)
            end
        elseif curStep >= 1920 and curStep < 1952 and difficulty ~= 1 then
            if noteInvert == 1 then
                for i=0,7 do
                    local arrowgoto = 0
                    if i == 0 then arrowgoto = 3 end
                    if i == 1 then arrowgoto = 2 end
                    if i == 2 then arrowgoto = 1 end
                    if i == 3 then arrowgoto = 0 end
                    if i == 4 then arrowgoto = 7 end
                    if i == 5 then arrowgoto = 6 end
                    if i == 6 then arrowgoto = 5 end
                    if i == 7 then arrowgoto = 4 end

                    local startx = _G['defaultStrum'..i..'X']
                    local newx = _G['defaultStrum'..arrowgoto..'X']
                    local changeinx = newx - startx

                    if (curStep == 1920) then
                        tweenPosQuartOut(i,newx,getActorY(i),2.4,'')
                        tweenCameraZoomOut(2,2.4,'')
                    end

                    --setActorX(_G['defaultStrum'..i..'X'] + changeinx * (math.sin(((curStep - 768) * (2*0.015625)) * (math.pi * 0.5))), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            else
                for i=0,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            end
            if (curStep == 1920) then
                camZoom = 1.5
            end
        elseif curStep >= 1952 and curStep < 2336 and difficulty ~= 1 then

            if (curStep == 1952) then
                curDadx = getActorX('dad')
                curBFx = getActorX('boyfriend')
                curDady = getActorY('dad')
                curBFy = getActorY('boyfriend')

                tweenPosQuartOut('dad',curDadx + 175,curDady,1.2,'')
            end

            if (curStep == 1968) then
                tweenPosQuartOut('boyfriend',curBFx - 175,curBFy,1.2,'')
            end

            if (curStep == 1984) then
                tweenPosQuartOut('dad',curDadx - 100,curDady,1.2,'')
            end

            if (curStep == 2000) then
                tweenPosQuartOut('boyfriend',curBFx + 100,curBFy,1.2,'')
            end

            if (curStep == 2016) then
                tweenPosQuartOut('dad',curBFx - 100,curDady,1.2,'')
            end

            if (curStep == 2032) then
                camZoom = 0.5
                tweenPosQuartOut('boyfriend',curDadx + 100,curBFy,1.2,'')
            end

            if (curStep == 2048) then
                camZoom = 1
                tweenPosQuartOut('boyfriend',curBFx,curBFy,1.2,'')
                tweenPosQuartOut('dad',curDadx,curDady,1.2,'')
            end

            if (curStep == 2062) then
                camZoom = 0.3
                tweenPosQuartOut('boyfriend',curBFx,curBFy - 150,0.3,'')
                tweenPosQuartOut('dad',curDadx,curDady + 150,0.3,'')
            end

            if (curStep == 2066) then
                tweenPosQuartOut('boyfriend',curBFx,curBFy + 150,0.3,'')
                tweenPosQuartOut('dad',curDadx,curDady - 150,0.3,'')
            end

            if (curStep == 2070) then
                tweenPosQuartOut('boyfriend',curBFx,curBFy - 150,0.3,'')
                tweenPosQuartOut('dad',curDadx,curDady + 150,0.3,'')
            end

            if (curStep == 2074) then
                tweenPosQuartOut('boyfriend',curBFx,curBFy + 150,0.3,'')
                tweenPosQuartOut('dad',curDadx,curDady - 150,0.3,'')
            end

            if (curStep == 2078) then
                tweenPosQuartOut('boyfriend',curBFx,curBFy - 150,0.3,'')
                tweenPosQuartOut('dad',curDadx,curDady + 150,0.3,'')
            end

            if (curStep == 2082) then
                camZoom = 1.5
                tweenPosQuartOut('dad',curDadx,curDady,1.2,'')
            end

            if (curStep == 2096) then
                tweenPosQuartOut('boyfriend',curBFx,curBFy,1.2,'')
            end

            if (curStep == 2112) then
                camZoom = 1
                tweenPosQuartOut('dad',curDadx - 100,curDady,1.2,'')
                tweenAngleQuartOut('dad',360,1.2,'')
            end

            if (curStep == 2128) then
                tweenPosQuartOut('boyfriend',curBFx + 100,curBFy,1.2,'')
                tweenAngleQuartOut('boyfriend',-360,1.2,'')
            end

            if (curStep == 2144) then
                tweenPosQuartOut('dad',curBFx - 100,curDady,1.2,'')
                tweenAngleQuartOut('dad',0,1.2,'')
            end

            if (curStep == 2160) then
                camZoom = 0.5
                tweenPosQuartOut('boyfriend',curDadx + 100,curBFy,1.2,'')
                tweenAngleQuartOut('boyfriend',0,1.2,'')
            end

            if (curStep == 2176) then
                camZoom = 2
                tweenPosQuartOut('dad',curDadx + 175,curDady,1.2,'')
                tweenPosQuartOut('boyfriend',curBFx - 175,curBFy,1.2,'')
            end

            if (curStep == 2190) then
                camZoom = 1.66
            end

            if (curStep == 2194) then
                camZoom = 1.33
            end

            if (curStep == 2198) then
                camZoom = 1
            end

            if (curStep == 2202) then
                camZoom = 0.3
                tweenPosQuartOut('dad',curDadx,curDady,0.4,'')
                tweenPosQuartOut('boyfriend',curBFx,curBFy,0.4,'')
            end

            if (curStep == 2208) then
                camZoom = 1
                tweenPos('dad',getActorX('dad'),getActorY('dad')+1100,9.6,'')
                tweenPos('boyfriend',getActorX('boyfriend'),getActorY('boyfriend')+1100,9.6,'')
            end

            if noteInvert == 1 then
                for i=0,7 do
                    local arrowgoto = 0
                    if i == 0 then arrowgoto = 3 end
                    if i == 1 then arrowgoto = 2 end
                    if i == 2 then arrowgoto = 1 end
                    if i == 3 then arrowgoto = 0 end
                    if i == 4 then arrowgoto = 7 end
                    if i == 5 then arrowgoto = 6 end
                    if i == 6 then arrowgoto = 5 end
                    if i == 7 then arrowgoto = 4 end

                    setActorX(_G['defaultStrum'..arrowgoto..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            else
                for i=0,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            end
        elseif curStep >= 2336 and curStep < 2368 and difficulty ~= 1 then
            if noteInvert == 1 then
                for i=0,7 do
                    local arrowgoto = 0
                    if i == 0 then arrowgoto = 3 end
                    if i == 1 then arrowgoto = 2 end
                    if i == 2 then arrowgoto = 1 end
                    if i == 3 then arrowgoto = 0 end
                    if i == 4 then arrowgoto = 7 end
                    if i == 5 then arrowgoto = 6 end
                    if i == 6 then arrowgoto = 5 end
                    if i == 7 then arrowgoto = 4 end

                    local newx = _G['defaultStrum'..i..'X']
                    local startx = _G['defaultStrum'..arrowgoto..'X']
                    local changeinx = newx - startx

                    if (curStep == 2336) then
                        tweenPosQuartOut(i,newx,getActorY(i),2.4,'')
                    end

                    --setActorX(_G['defaultStrum'..i..'X'] + changeinx * (math.sin(((curStep - 768) * (2*0.015625)) * (math.pi * 0.5))), i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            else
                for i=0,7 do
                    setActorX(_G['defaultStrum'..i..'X'], i)
                    setActorY(_G['defaultStrum'..i..'Y'], i)
                end
            end
        else
            --local currentBeat = (songPos / 1000)*(bpm/60)
            for i=0,7 do
                setActorX(_G['defaultStrum'..i..'X'], i)
                setActorY(_G['defaultStrum'..i..'Y'], i)
                setActorAngle(_G['defaultStrum'..i..'Angle'], i)
            end
        end
    else
        --local currentBeat = (songPos / 1000)*(bpm/60)
        for i=0,7 do
            setActorX(_G['defaultStrum'..i..'X'], i)
            setActorY(_G['defaultStrum'..i..'Y'], i)
            setActorAngle(_G['defaultStrum'..i..'Angle'], i)
        end
    end

    --holy shit this modchart is huge
    --i could probably optimize it but nah
    --if you edited any of it i don't like you
    --thanks for checking it out i guess???
    --i'm not too good at goodbyes ._.
    --so just please leave my sight
end

function beatHit(beat) -- do nothing

end

function stepHit(step) -- do nothing

end

function playerTwoTurn()
    tweenCameraZoom(camZoom,(crochet * 4) / 1000)
end

function playerOneTurn()
    tweenCameraZoom(camZoom,(crochet * 4) / 1000)
end