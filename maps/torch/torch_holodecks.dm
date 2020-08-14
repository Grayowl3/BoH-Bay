
/datum/map/torch

	holodeck_programs = list(
		"emptycourt"       = new/datum/holodeck_program(/area/holodeck/source_emptycourt, list('sound/music/manaos/fear.ogg')),
		"boxingcourt"      = new/datum/holodeck_program(/area/holodeck/source_boxingcourt, list('sound/music/manaos/fear.ogg')),
		"basketball"       = new/datum/holodeck_program(/area/holodeck/source_basketball, list('sound/music/manaos/fear.ogg')),
		"thunderdomecourt" = new/datum/holodeck_program(/area/holodeck/source_thunderdomecourt, list('sound/music/manaos/fear.ogg')),
		"beach"            = new/datum/holodeck_program(/area/holodeck/source_beach, list('sound/music/manaos/dust.ogg')),
		"desert"           = new/datum/holodeck_program(/area/holodeck/source_desert,
														list(
															'sound/effects/wind/wind_2_1.ogg',
											 				'sound/effects/wind/wind_2_2.ogg',
											 				'sound/effects/wind/wind_3_1.ogg',
											 				'sound/effects/wind/wind_4_1.ogg',
											 				'sound/effects/wind/wind_4_2.ogg',
											 				'sound/effects/wind/wind_5_1.ogg'
												 			)
		 												),
		"snowfield"        = new/datum/holodeck_program(/area/holodeck/source_snowfield,
														list(
															'sound/effects/wind/wind_2_1.ogg',
											 				'sound/effects/wind/wind_2_2.ogg',
											 				'sound/effects/wind/wind_3_1.ogg',
											 				'sound/effects/wind/wind_4_1.ogg',
											 				'sound/effects/wind/wind_4_2.ogg',
											 				'sound/effects/wind/wind_5_1.ogg'
												 			)
		 												),
		"space"            = new/datum/holodeck_program(/area/holodeck/source_space,
														list('sound/music/traitor.ogg')),
		"picnicarea"       = new/datum/holodeck_program(/area/holodeck/source_picnicarea, list('sound/music/manaos/seeingyourname.ogg')),
		"theatre"          = new/datum/holodeck_program(/area/holodeck/source_theatre),
		"meetinghall"      = new/datum/holodeck_program(/area/holodeck/source_meetinghall),
		"courtroom"        = new/datum/holodeck_program(/area/holodeck/source_courtroom, list('sound/music/traitor.ogg')),
		"voleyball"        = new/datum/holodeck_program(/area/holodeck/source_volleyball, list('sound/music/manaos/fear.ogg')),
		"cafe"             = new/datum/holodeck_program(/area/holodeck/source_cafe),
		"wildlifecarp"     = new/datum/holodeck_program(/area/holodeck/source_wildlife, list()),
		"temple"           = new/datum/holodeck_program(/area/holodeck/source_temple),
		"plaza"            = new/datum/holodeck_program(/area/holodeck/source_plaza),
		"lasertag"         = new/datum/holodeck_program(/area/holodeck/source_lasertag, list('sound/music/manaos/fear.ogg')),
		"turnoff"          = new/datum/holodeck_program(/area/holodeck/source_plating, list())
	)

	holodeck_supported_programs = list(

		"TorchMainPrograms" = list(
			"Basketball Court"  = "basketball",
			"Beach"             = "beach",
			"Boxing Ring"       = "boxingcourt",
			"Cafe"              = "cafe",
			"Courtroom"         = "courtroom",
			"Desert"            = "desert",
			"Empty Court"       = "emptycourt",
			"Meeting Hall"      = "meetinghall",
			"Picnic Area"       = "picnicarea",
			"Snow Field"        = "snowfield",
			"Space"             = "space",
			"Theatre"           = "theatre",
			"Thunderdome Court" = "thunderdomecourt",
			"Voleyball Court"   = "voleyball",
			"Bathhouse"         = "temple",
			"Plaza"             = "plaza",
			"Laser Tag"         = "lasertag"
		)

	)

	holodeck_restricted_programs = list(

		"TorchMainPrograms" = list(
			"Wildlife Simulation" = "wildlifecarp"
		)

	)