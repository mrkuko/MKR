Config = {}
Config.Locale = "en" --language
Config.SendMessagess = true --enable/disable chat messagess from MKR
Config.OpenControl = 38 --key to enter the marker https://docs.fivem.net/docs/game-references/controls/

Config.Checkpoints = {

	Route_1 = {	
		Name = 'Challenge!', --name of the event
		Pos = {x = -455.761, y = 1596.413, z = 359.058},--coords of enter mark
		Heading = 35.2909, --heading of spawned car
		Color = {r = 97, g = 6, b = 109},--color of markers, gps route
		BColor = 58,--blipcolor
		Btype = 430,--blip's sprite
		Size  = {x = 2.0, y = 2.0, z = 2.0},--size of marker
        Marker = 5,--type of entrance marker
		Car = 'freecrawler',--car model for race
		Character = 'CHAR_HUNTER', --character who will send you the message
		Entry = 1200,
		Reward = 30000, --$
		ttf = 480000,--time to fail, in miliseconds
		Points = {{x = -478.332, y = 1703.859, z = 318.916},{x = -517.429, y = 2008.133, z = 203.933}, --coords of checkpoints
		{x = -715.725, y = 2265.737, z = 76.995},{x = -700.312, y = 2479.929, z = 60.982},
		{x = -1224.988, y = 2631.160, z = 5.715},{x = -1545.967, y = 2706.743, z = 3.295853},{x = -1793.849, y = 2690.624, z = 3.351615},
		{x = -2011.357, y = 2709.88, z = 2.239907},{x = -2421.38, y = 2835.641, z = 2.542586},{x = -2615.765, y = 2896.13, z = 3.937656},
		{x = -3012.304, y = 3339.107, z = 9.315673},{x = -2612.521, y = 3578.005, z = 2.040363},{x = -2392.759, y = 3995.083, z = 24.00619},
		{x = -2256.556, y = 4324.121, z = 43.78838},{x = -2053.619, y = 4524.444, z = 28.54206},{x = -1830.542, y = 4489.859, z = 20.08925},
		{x = -1642.085, y = 4429.107, z = 2.210462},{x = -1458.271, y = 4302.752, z = 1.746609},{x = -1125.189, y = 4379.458, z = 11.97224},
		{x = -888.9857, y = 4426.015, z = 19.90054},{x = -1159.692, y = 4445.959, z = 17.55126},{x = -1383.871, y = 4474.057, z = 24.06472},
		{x = -1560.934, y = 4496.954, z = 20.29828},{x = -1519.27, y = 4645.993, z = 27.97107},{x = -1543.835, y = 4737.645, z = 51.19287},
		{x = -1427.229, y = 4798.821, z = 102.0222},{x = -1201.195, y = 4855.095, z = 186.3121},{x = -1059.823, y = 4781.146, z = 234.2725},
		{x = -932.0377, y = 4750.844, z = 284.0083},{x = -839.5086, y = 4886.142, z = 282.2415},{x = -660.0806, y = 4725.961, z = 238.6226},
		{x = -499.6732, y = 4734.818, z = 240.134},{x = -426.2835, y = 4737.144, z = 252.2123},{x = -289.2881, y = 4673.943, z = 241.4418},
		{x = -432.1404, y = 4933.886, z = 169.8821},{x = -642.4768, y = 5114.819, z = 126.8648},{x = -753.7324, y = 5259.138, z = 92.1375},
		{x = -942.3, y = 5254.155, z = 81.59638},{x = -664.3641, y = 5322.281, z = 64.38352},{x = -790.5513, y = 5430.201, z = 34.52625},},
	},
	Route_2 = {	
		Name = 'City Run', --name of the event
		Pos = {x = -132.008, y = 613.817, z = 205.260},--coords of enter mark
		Heading = 114.2758, --heading of spawned car
		Color = {r = 255, g = 153, b = 51},--color of markers, gps route
		BColor = 47,--blipcolor https://docs.fivem.net/docs/game-references/blips/
		Btype = 430,--blip's sprite
		Size  = {x = 2.0, y = 2.0, z = 2.0},--size of marker
        Marker = 5,--type of entrance marker
		Car = 'comet2',--car model for race
		Character = 'CHAR_MP_RAY_LAVOY', --photo of character which will send you the message https://wiki.gtanet.work/index.php?title=Notification_Pictures
		Entry = 800, --price to enter the race
		Reward = 15000, --$
		ttf = 180000,--time to fail, in miliseconds
		Points = {{x = -250.2492, y = 605.4804, z = 184.877},{x = -369.2902, y = 670.2508, z = 166.2205}, --coords of checkpoints
		{x = -547.119, y = 670.009, z = 143.048},{x = -699.318, y = 718.974, z = 157.962},{x = -593.062, y = 738.485, z = 181.764},
		{x = -719.461, y = 804.162, z = 210.396},{x = -782.695, y = 826.117, z = 206.769},{x = -984.096, y = 802.302, z = 172.600},		
		{x = -1145.893, y = 768.265, z = 157.569},{x = -1236.450, y = 659.581, z = 141.592},{x = -1356.729, y = 610.958, z = 133.162},
		{x = -1384.812, y = 556.664, z = 124.970},{x = -1454.185, y = 524.632, z = 117.319},{x = -1576.251, y = 457.763, z = 107.486},
		{x = -1840.431, y = 486.402, z = 131.337},{x = -1981.923, y = 511.103, z = 106.505},{x = -1952.167, y = 271.612, z = 85.127},
		{x = -1834.128, y = 70.029, z = 74.388},{x = -2105.505, y = 291.266, z = 126.018},{x = -2209.743, y = 567.619, z = 162.552},
		{x = -2304.790, y = 457.871, z = 173.467},},
	},
	Route_3 = {	
		Name = 'Los Santos dike', --name of the event
		Pos = {x = 2682.130, y = 1680.322, z = 24.552},--coords of enter mark
		Heading = 114.2758, --heading of spawned car
		Color = {r = 23, g = 39, b = 46},--color of markers, gps route
		BColor = 78,--blipcolor https://docs.fivem.net/docs/game-references/blips/
		Btype = 430,--blip's sprite
		Size  = {x = 2.0, y = 2.0, z = 2.0},--size of marker
        Marker = 5,--type of entrance marker
		Car = 'retinue',--car model for race
		Character = 'CHAR_HUNTER', --photo of character which will send you the message https://wiki.gtanet.work/index.php?title=Notification_Pictures
		Entry = 500, --price to enter the race
		Reward = 5000, --$
		ttf = 180000,--time to fail, in miliseconds
		Points = {{x = 2677.375, y = 1644.27, z = 23.635},{x = 2539.940, y = 1587.425, z = 29.340}, --coords of checkpoints
		{x = 2405.018, y = 1221.531, z = 57.106},{x = 2269.277, y = 1041.760, z = 72.343},{x = 2374.139, y = 927.238, z = 106.078},
		{x = 2446.089, y = 629.422, z = 137.875},{x = 2372.456, y = 278.359, z = 185.163},{x = 2273.311, y = 168.644, z = 211.476},
		{x = 2198.621, y = 113.147, z = 227.860},{x = 1994.874, y = -78.735, z = 210.891},{x = 1785.022, y = -79.356, z = 189.070},
		{x = 1665.190, y = -77.154, z = 171.765},{x = 1575.688, y = -73.447, z = 159.349},{x = 1345.970, y = -112.793, z = 119.891},
		{x = 1281.956, y = -202.608, z = 100.218},{x = 1308.311, y = -274.970, z = 90.890},{x = 1220.469, y = -285.677, z = 68.276},},
	},
}