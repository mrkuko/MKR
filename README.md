# MKR - mr__Kuko's Racing
## Requirements
* [es_extended](https://github.com/esx-framework/es_extended/tree/v1-final)

## How to install:
- Download https://github.com/
- extract to your directory and in type **start MKR** in your server.cfg

###Discription:
- Custom race events

###Adding new route for race example pattern:

```lua
Route_x = {	
		Name = 'example', --name of the event
		Pos = {x = -132.008, y = 613.817, z = 204.460},--coords of enter mark
		Heading = 35.2909, --heading of spawned car
		Color = {r = 97, g = 6, b = 109},--color of markers, gps route
		BColor = 58,--blipcolor
		Size  = {x = 2.0, y = 2.0, z = 2.0},--size of marker
        Marker = 5,--type of entrance marker
		Car = 'freecrawler',--car model for race
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
###End
