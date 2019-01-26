RegisterServerEvent('niiko_handsup:getSurrenderStatus')
AddEventHandler('niiko_handsup:getSurrenderStatus', function(event,targetID)
	TriggerClientEvent("niiko_handsup:getSurrenderStatusPlayer",targetID,event,source)
end)

RegisterServerEvent('niiko_handsup:sendSurrenderStatus')
AddEventHandler('niiko_handsup:sendSurrenderStatus', function(event,targetID,handsup)
	TriggerClientEvent(event,targetID,handsup)
end)

RegisterServerEvent('niiko_handsup:reSendSurrenderStatus')
AddEventHandler('niiko_handsup:reSendSurrenderStatus', function(event,targetID,handsup)
	TriggerClientEvent(event,targetID,handsup)
end)