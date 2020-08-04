
/obj/item/organ/internal/eyes
	name = "globos oculares"
	icon_state = "eyes"
	gender = PLURAL
	organ_tag = BP_EYES
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 10
	var/phoron_guard = 0
	var/list/eye_colour = list(0,0,0)
	var/innate_flash_protection = FLASH_PROTECTION_NONE
	max_damage = 45
	var/eye_icon = 'icons/mob/human_races/species/default_eyes.dmi'
	var/apply_eye_colour = TRUE
	var/tmp/last_cached_eye_colour
	var/tmp/last_eye_cache_key
	var/flash_mod
	var/darksight_range
	var/darksight_tint

/obj/item/organ/internal/eyes/proc/get_eye_cache_key()
	last_cached_eye_colour = rgb(eye_colour[1],eye_colour[2], eye_colour[3])
	last_eye_cache_key = "[type]-[eye_icon]-[last_cached_eye_colour]"
	return last_eye_cache_key

/obj/item/organ/internal/eyes/proc/get_onhead_icon()
	var/cache_key = get_eye_cache_key()
	if(!human_icon_cache[cache_key])
		var/icon/eyes_icon = icon(icon = eye_icon, icon_state = "")
		if(apply_eye_colour)
			eyes_icon.Blend(last_cached_eye_colour, ICON_ADD)
		human_icon_cache[cache_key] = eyes_icon
	return human_icon_cache[cache_key]

/obj/item/organ/internal/eyes/proc/get_special_overlay()
	var/icon/I = get_onhead_icon()
	if(I)
		var/cache_key = "[last_eye_cache_key]-glow"
		if(!human_icon_cache[cache_key])
			var/image/eye_glow = image(I)
			eye_glow.layer = EYE_GLOW_LAYER
			eye_glow.plane = EFFECTS_ABOVE_LIGHTING_PLANE
			human_icon_cache[cache_key] = eye_glow
		return human_icon_cache[cache_key]

/obj/item/organ/internal/eyes/proc/change_eye_color()
	set name = "Cambiar color de ojos."
	set desc = "Cambias el color de tus ojos roboticos."
	set category = "IC"
	set src in usr
	if (!owner || owner.incapacitated())
		return
	var/new_eyes = input("Por favor selecciona el color de ojos.", "Color de ojos", rgb(owner.r_eyes, owner.g_eyes, owner.b_eyes)) as color|null
	if(new_eyes)
		var/r_eyes = hex2num(copytext(new_eyes, 2, 4))
		var/g_eyes = hex2num(copytext(new_eyes, 4, 6))
		var/b_eyes = hex2num(copytext(new_eyes, 6, 8))
		if(do_after(owner, 10) && owner.change_eye_color(r_eyes, g_eyes, b_eyes))
			update_colour()
			// Finally, update the eye icon on the mob.
			owner.regenerate_icons()
			owner.visible_message(SPAN_NOTICE("\The [owner] cambia su color de ojos."),SPAN_NOTICE("Has cambiado tu color de ojos"),)

/obj/item/organ/internal/eyes/replaced(var/mob/living/carbon/human/target)

	// Apply our eye colour to the target.
	if(istype(target) && eye_colour)
		target.r_eyes = eye_colour[1]
		target.g_eyes = eye_colour[2]
		target.b_eyes = eye_colour[3]
		target.update_eyes()
	..()

/obj/item/organ/internal/eyes/proc/update_colour()
	if(!owner)
		return
	eye_colour = list(
		owner.r_eyes ? owner.r_eyes : 0,
		owner.g_eyes ? owner.g_eyes : 0,
		owner.b_eyes ? owner.b_eyes : 0
		)

/obj/item/organ/internal/eyes/take_internal_damage(amount, var/silent=0)
	var/oldbroken = is_broken()
	. = ..()
	if(is_broken() && !oldbroken && owner && !owner.stat)
		to_chat(owner, "<span class='danger'>Te quedas ciego!</span>")

/obj/item/organ/internal/eyes/Process() //Eye damage replaces the old eye_stat var.
	..()
	if(!owner)
		return
	if(is_bruised())
		owner.eye_blurry = 20
	if(is_broken())
		owner.eye_blind = 20

/obj/item/organ/internal/eyes/New()
	..()
	flash_mod = species.flash_mod
	darksight_range = species.darksight_range
	darksight_tint = species.darksight_tint

/obj/item/organ/internal/eyes/proc/get_total_protection(var/flash_protection = FLASH_PROTECTION_NONE)
	return (flash_protection + innate_flash_protection)

/obj/item/organ/internal/eyes/proc/additional_flash_effects(var/intensity)
	return -1

/obj/item/organ/internal/eyes/robot
	name = "sensor optico"
	relative_size = 10

/obj/item/organ/internal/eyes/robot/New()
	..()
	robotize()

/obj/item/organ/internal/eyes/robotize()
	..()
	name = "sensor optico"
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "camera"
	dead_icon = "camera_broken"
	verbs |= /obj/item/organ/internal/eyes/proc/change_eye_color
	update_colour()
	flash_mod = 1
	darksight_range = 2
	darksight_tint = DARKTINT_NONE

/obj/item/organ/internal/eyes/get_mechanical_assisted_descriptor()
	return "retinal overlayed [name]"
