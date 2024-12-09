Config = {}

Config.Command = 'wiper' -- Nama Command untuk menjalankan manual

Config.JalanOtomatis = true -- Berjalan Otomatis setiap jam mau digunakan atau tidak? (true/false)

Config.PenghapusanKendaraan = {
    enable = true, -- Command bisa digunakan atau tidak? (true/false)
    setiap = 2, -- setiap berapa jam sekali?
    countdownSetiap = 5 -- misal setiap 4 jam sekali, ada pemberitahuan countdown 5 menit sebelum Pembersihan dilakukan
}

Config.PenghapusanPed = {
    enable = true, -- Command bisa digunakan atau tidak? (true/false)
    setiap = 3, -- setiap berapa jam sekali?
    countdownSetiap = 5 -- misal setiap 4 jam sekali, ada pemberitahuan countdown 5 menit sebelum Pembersihan dilakukan
}

Config.PenghapusanProp = {
    enable = true, -- Command bisa digunakan atau tidak? (true/false)
    setiap = 4, -- setiap berapa jam sekali?
    countdownSetiap = 5 -- misal setiap 4 jam sekali, ada pemberitahuan countdown 5 menit sebelum Pembersihan dilakukan
}