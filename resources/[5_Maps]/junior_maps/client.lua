CreateThread(function()
  SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
  SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)


CreateThread(function()
  local lastZoom = nil 
  while true do
      local playerPed = PlayerPedId()
      local isInVehicle = IsPedInAnyVehicle(playerPed, true)
      
      local targetZoom = isInVehicle and 1100 or 1100

      if lastZoom ~= targetZoom then
          lastZoom = targetZoom
          SetRadarZoom(targetZoom)
      end

      Wait(isInVehicle and 1 or 500)
  end
end)
