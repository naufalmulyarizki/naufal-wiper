
if Config.JalanOtomatis then
    if Config.PenghapusanKendaraan.enable then -- validasi diaktifkan untuk penghapusan kendaran
        lib.cron.new('* */'..Config.PenghapusanKendaraan.setiap..' * * *', function() -- Berjalan Waktu Setiap jamnya
            perulangan(Config.PenghapusanKendaraan.countdownSetiap)
        end)
    end

    if Config.PenghapusanPed.enable then -- validasi diaktifkan untuk penghapusan ped
        lib.cron.new('* */'..Config.PenghapusanPed.setiap..' * * *', function() -- Berjalan Waktu Setiap jamnya
            perulangan(Config.PenghapusanPed.countdownSetiap)
        end)
    end

    if Config.PenghapusanProp.enable then -- validasi diaktifkan untuk penghapusan prop
        lib.cron.new('* */'..Config.PenghapusanProp.setiap..' * * *', function() -- Berjalan Waktu Setiap jamnya
            perulangan(Config.PenghapusanProp.countdownSetiap)
        end)
    end
end

tidakdinaiki = function(veh) -- Validasi yang terhapus hanya kendaraan yang tidak dinaiki
    for i=-1, 12 do
        if GetPedInVehicleSeat(veh, i) > 0 then -- Validasi yang naik kendaraan
            return false -- Validasi hasil return tak terhapus
        end
    end
    return true
end

ak = function(tipe)
    if tipe == 'kendaraan' and Config.PenghapusanKendaraan.enable then -- validasi hanya bisa tipe kendaraan dan diaktifkan untuk penghapusan kendaraan
        local kendaraan = 0
        local av = GetAllVehicles() -- Mengambil total kendaraan yang tidak terdaftar di server
        for i=1, #av do
            if tidakdinaiki(av[i]) then -- Validasi yang terhapus hanya kendaraan yang tidak dinaiki
                DeleteEntity(av[i]) -- Menghapus semua ped yang tidak terdaftar di server
                kendaraan = i -- Menunjukan jumlah kendaraan
            end
        end
        -- Notifikasi pembersihan selesai
        TriggerClientEvent('ox_lib:notify', -1, {title = 'Kendaraan yang dibersihkan berjumlah '..kendaraan..' kendaraan', position = 'top-right', })
        TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan kendaraan selesai!', position = 'top-right',})
    elseif tipe == 'ped' and Config.PenghapusanPed.enable then -- validasi hanya bisa tipe ped dan diaktifkan untuk penghapusan ped
        local peds = 0
        local cw = GetAllPeds() -- Mengambil total ped yang tidak terdaftar di server
        for i=1, #cw do
            DeleteEntity(cw[i]) -- Menghapus semua ped yang tidak terdaftar di server
            peds = i -- Menunjukan jumlah ped
        end
        -- Notifikasi pembersihan selesai
        TriggerClientEvent('ox_lib:notify', -1, {title = 'Peds yang dibersihkan berjumlah '..peds..' peds', position = 'top-right', })
        TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan peds selesai!', position = 'top-right',})
    elseif tipe == 'prop' and Config.PenghapusanProp.enable then -- validasi hanya bisa tipe prop dan diaktifkan untuk penghapusan prop
        local barang = 0
        local bw = GetAllObjects() -- Mengambil total prop yang tidak terdaftar di server
        for i=1, #bw do
            DeleteEntity(bw[i]) -- Menghapus semua prop yang tidak terdaftar di server
            barang = i -- Menunjukan jumlah prop
        end
        -- Notifikasi pembersihan selesai
        TriggerClientEvent('ox_lib:notify', -1, {title = 'Prop yang dibersihkan berjumlah '..barang..' peds', position = 'top-right', })
        TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan prop selesai!', position = 'top-right',})
    end
end

perulangan = function(tipe, brp)
    local sisa = brp
    for i=1, brp do
        if sisa > 1 then
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam '..sisa..' menit lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(60000)
            sisa = sisa - 1
        elseif sisa == 1 then
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam '..sisa..' menit lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(30000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 30 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(15000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 15 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(10000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 5 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(1000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 4 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(1000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 3 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(1000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 2 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(1000)
            TriggerClientEvent('ox_lib:notify', -1, {title = 'Pembersihan '..tipe..' dalam 1 detik lagi!', position = 'top-right',}) -- notif pembersihan
            Wait(1000)
            ak(tipe)
        end
    end
end

-- Pembuatan Command
lib.addCommand(Config.Command, { -- Nama Command
    help = 'Wiper (ped/kendaraan/prop)', -- Help (Atau Bantuan Command)
    restricted = 'group.admin', -- Cuman bisa digunakan admin
    params = { -- Parameter Sesuai Docs
        {
            name = 'tipe', 
            type = 'string',
            help = 'Masukkan tipe penghapusan (ped/kendaraan/prop)',
            optional = true,
        },
        {
            name = 'brp',
            type = 'number',
            help = 'berapa menit? 0 kalau mau sekarang!',
            optional = true,
        },
    }
}, function(source, args)
    if not args.tipe then return TriggerClientEvent('ox_lib:notify', source, {title = 'Masukkan tipe pembersihan', position = 'top-right',}) end -- Membuat validasi ketika engga ada tipe muncul notif
    if not args.brp then -- Validasi ketika ada tipe engga ada perjalanan manual menit maka langsung melakukan pembersih sesuai dengan tipenya
        ak(args.tipe) -- Melakukan pembersihan
    else
        if args.brp == 0 then -- dan jiga argumen berapa menit manual nya 0 maka langsung pembersihan
            ak(args.tipe) -- Melakukan pembersihan
        else -- ketika ada argumen berapanya maka langsung berjalan sesuai perulangan 
            perulangan(args.tipe, args.brp) 
        end
    end
end)