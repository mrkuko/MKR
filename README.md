# MKR - mr__Kuko's Racing
## Requirements
* [es_extended](https://github.com/esx-framework/es_extended/tree/v1-final)

## How to install:
- Download https://github.com/mrkuko/MKR/releases
- extract to your directory and in type **start MKR** in your server.cfg

### Discription:
- Custom race events
- Config options:
  - Enable/Disable chat announcements
  - Name, position & color
  - Size & type of marker
  - Car model for race
  - Reward
  - Time to finish
  - Checkpoints

### Adding new route for race example pattern:
- paste this code under last route in your **config.lua** file

```lua
Route_x = {	
		Name = 'example', --name of the event
		Pos = {x = -132.008, y = 613.817, z = 204.460},--coords of enter mark
		Heading = 35.2909, --heading of spawned car
		Color = {r = 97, g = 6, b = 109},--color of markers, gps route, https://www.rapidtables.com/web/color/RGB_Color.html
		BColor = 58,--blipcolor, https://docs.fivem.net/docs/game-references/blips/
		Size  = {x = 2.0, y = 2.0, z = 2.0},--size of marker
        	Marker = 5,--type of entrance marker, https://docs.fivem.net/docs/game-references/markers/
		Car = 'freecrawler',--car model for race, https://gta.fandom.com/wiki/Vehicles_in_GTA_V
		Reward = 30000, --$ ,rewarded when finished sooner than ttf will runned away
		ttf = 480000,--time to fail, in miliseconds
		Points = {{x = float, y = float, z = float},{x = float, y = float, z = float}, --coords of checkpoints
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
		{x = float, y = float, z = float},{x = float, y = float, z = float},{x = float, y = float, z = float},
        },
	},
```
