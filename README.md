# Naufal Wiper Script

Wiper Script STANDALONE

# Features 
- Command untuk penghapusan seluruh kendaraan di server
- Command untuk penghapusan seluruh ped di server
- Command untuk penghapusan seluruh prop di server
- Penghapusan otomatis seluruh kendaraan di server
- Penghapusan otomatis seluruh ped di server
- Penghapusan otomatis seluruh prop di server

# Installation
- Add Resource Library (oxlib)

# Config settings

```lua
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
```

# Previews 
## Preview Penghapusan kendaraan

### Command
![Command](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/commandkendaaran.png)

### Countdown
![Countdown](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/notifkendaraan1.png)

### Berhasil
![Berhasil](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/notifkendaraan2.png)


## Preview Penghapusan peds

### Command
![Command](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/commandped.png)

### Countdown
![Countdown](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/notifped1.png)

### Berhasil
![Berhasil](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/notifped2.png)

## Preview Penghapusan prop

### Command
![Command](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/commandprop.png)

### Berhasil
![Countdown](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/notifprop1.png)

### Berhasil
![Berhasil](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/notifprop2.png)

# Previews Video

![previewresmonside](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/previewvideo.mp4)

# Previews Resmon Client Side

![previewresmonside](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/resmonsidenaufalwhiper.png)

# Dependencies

- [ox_lib](https://github.com/overextended/ox_lib)