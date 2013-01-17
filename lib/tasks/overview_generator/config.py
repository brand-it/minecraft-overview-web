# This is a sample config file, meant to give you an idea of how to format your
# config file and what's possible.

# Define the path to your world here. 'My World' in this case will show up as
# the world name on the map interface. If you change it, be sure to also change
# the referenced world names in the render definitions below.
worlds['North'] = "~/maps/world"

worlds['East'] = "~/maps/world"

worlds['South'] = "~/maps/world"

worlds['West'] = "~/maps/world"

# Define where to put the output here.
outputdir = "~/current/public"

# This is an item usually specified in a renders dictionary below, but if you
# set it here like this, it becomes the default for all renders that don't
# define it.
# Try "smooth_lighting" for even better looking maps!
rendermode = "smooth_lighting"

lit_subway_cave_smooth = [Base(), EdgeLines(), Depth(), Cave(only_lit=True), SmoothLighting()]
nether = [Base(), EdgeLines(), Nether()]

normal_title = "Default"
night_title  = "Night"
cave_title   = "Caves"



renders["render1"] = {
        'world': 'North',
        'title': normal_title,
		'northdirection': 'upper-left'
}
# This example is the same as above, but rotated
renders["render2"] = {
        'world': 'North',
		'rendermode': lit_subway_cave_smooth,
        'title': cave_title,
		'northdirection': 'upper-left'
}

# Here's how to do a nighttime render. Also try "smooth_night" instead of "night"
renders["render3"] = {
        'world': 'North',
        'title': night_title,
        # Notice how this overrides the rendermode default specified above
        'rendermode': 'night',
		'northdirection': 'upper-left'
}



renders["render4"] = {
        'world': 'East',
        'title': normal_title,
		'northdirection': 'upper-right'
}
# This example is the same as above, but rotated
renders["render5"] = {
        'world': 'East',
		'rendermode': lit_subway_cave_smooth,
        'title': cave_title,
		'northdirection': 'upper-right'
}

# Here's how to do a nighttime render. Also try "smooth_night" instead of "night"
renders["render6"] = {
        'world': 'East',
        'title': night_title,
        # Notice how this overrides the rendermode default specified above
        'rendermode': 'night',
		'northdirection': 'upper-right'
}


renders["render7"] = {
        'world': 'South',
        'title': normal_title,
		'northdirection': 'lower-left'
}
# This example is the same as above, but rotated
renders["render8"] = {
        'world': 'South',
		'rendermode': lit_subway_cave_smooth,
        'title': cave_title,
		'northdirection': 'lower-left'
}

# Here's how to do a nighttime render. Also try "smooth_night" instead of "night"
renders["render9"] = {
        'world': 'South',
        'title': night_title,
        # Notice how this overrides the rendermode default specified above
        'rendermode': 'night',
		'northdirection': 'lower-left'
}


renders["render10"] = {
        'world': 'West',
        'title': normal_title,
		'northdirection': 'lower-right'
}
# This example is the same as above, but rotated
renders["render11"] = {
        'world': 'West',
		'rendermode': lit_subway_cave_smooth,
        'title': cave_title,
		'northdirection': 'lower-right'
}

# Here's how to do a nighttime render. Also try "smooth_night" instead of "night"
renders["render12"] = {
        'world': 'West',
        'title': night_title,
        # Notice how this overrides the rendermode default specified above
        'rendermode': 'night',
		'northdirection': 'lower-right'
}




# renders["render4"] = {
# 	'world': 'Prime World',
# 	'title': "Nether",
# 	'rendermode': nether
# }
