# Bot Simsimi Lua

## require

- `lua`
- `luarocks`
- `http`
- `dkjson`

## install tools

```bash
sudo pacman -S lua luarocks
```

## install dependensi

```bash
luarocks install http --local
```

```bash
luarocks install dkjson --local
```

## set config lua

```bash
luarocks config local_by_default true
```

## jalankan

jika nda bisa langsung jalan, set path luarocks

```bash
eval "$(luarocks path --bin)"
```

jalankan

```bash
lua app.lua
```
