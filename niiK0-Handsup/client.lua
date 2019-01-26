handsup = false

function getSurrenderStatus()
	return handsup
end

RegisterNetEvent('niiko_handsup:getSurrenderStatusPlayer')
AddEventHandler('niiko_handsup:getSurrenderStatusPlayer',function(event,source)
		if handsup then
			TriggerServerEvent("niiko_handsup:reSendSurrenderStatus",event,source,true)
		else
			TriggerServerEvent("niiko_handsup:reSendSurrenderStatus",event,source,false)
		end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local lPed = GetPlayerPed(-1)
		RequestAnimDict("random@mugging3")
		if not IsPedInAnyVehicle(lPed, false) and not IsPedSwimming(lPed) and not IsPedShooting(lPed) and not IsPedClimbing(lPed) and not IsPedCuffed(lPed) and not IsPedDiving(lPed) and not IsPedFalling(lPed) and not IsPedJumping(lPed) and not IsPedJumpingOutOfVehicle(lPed) and IsPedOnFoot(lPed) and not IsPedRunning(lPed) and not IsPedUsingAnyScenario(lPed) and not IsPedInParachuteFreeFall(lPed) then
			if IsControlPressed(1, 323) then
				if DoesEntityExist(lPed) then
					SetCurrentPedWeapon(lPed, 0xA2719263, true)
						DisableControlAction(27,75,true) -- disable exit vehicle
						DisableControlAction(0, 167, true) -- MENU GANG
						DisableControlAction(0, 289, true) -- INV
						DisableControlAction(0, 288, true) -- TELEMOVEL
						DisableControlAction(0, 170, true) -- ANIMS
						DisableControlAction(0, 168, true) -- FATURAS
						DisableControlAction(0, 29, true) -- B
						DisableControlAction(0, 105, true) -- X
						DisableControlAction(0, 73, true) -- X
						DisableControlAction(0, 58, true) -- G
						DisableControlAction(0, 47, true) -- G
						DisableControlAction(0,22,true) -- SPACE JUMP
						DisableControlAction(0,21,true) -- disable sprint
						DisableControlAction(0, 322, true) -- ESC
						DisableControlAction(0,24,true) -- disable attack
						DisableControlAction(0,25,true) -- disable aim
						DisableControlAction(0,47,true) -- disable weapon
						DisableControlAction(0,58,true) -- disable weapon
						DisableControlAction(0,263,true) -- disable melee
						DisableControlAction(0,264,true) -- disable melee
						DisableControlAction(0,257,true) -- disable melee
						DisableControlAction(0,140,true) -- disable melee
						DisableControlAction(0,141,true) -- disable melee
						DisableControlAction(0,142,true) -- disable melee
						DisableControlAction(0,143,true) -- disable melee
						DisableControlAction(0,75,true) -- disable exit vehicle
						DisableControlAction(0,20,true)
						DisableControlAction(0,7,true) -- L
						DisableControlAction(0,182,true) -- L
						DisableControlAction(0,37,true) -- TAB
						DisableControlAction(0,105,true) -- X
						DisableControlAction(0,244,true) -- M
						DisableControlAction(0,16,true) -- M
						DisableControlAction(0,17,true) -- M
						Citizen.CreateThread(function()
						RequestAnimDict("random@mugging3")
						while not HasAnimDictLoaded("random@mugging3") do
							Citizen.Wait(100)
						end

						if not handsup then
							handsup = true
							TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
							
						end   
					end)
				end
			end
		end
		if IsControlReleased(1, 323) then
			if DoesEntityExist(lPed) then
				Citizen.CreateThread(function()
					RequestAnimDict("random@mugging3")
					while not HasAnimDictLoaded("random@mugging3") do
						Citizen.Wait(100)
					end

					if handsup then
						handsup = false
						ClearPedSecondaryTask(lPed)
					end
				end)
			end
		end
	end
end)