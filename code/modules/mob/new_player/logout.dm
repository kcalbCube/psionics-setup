/mob/new_player/Logout()
	ready = 0

	// see login.dm
	if(my_client)
		// [SIERRA-ADD] - STATUSBAR
		if (get_preference_value(/datum/client_preference/show_statusbar) == GLOB.PREF_SHOW)
			winset(my_client, "mapwindow.statusbar", "is-visible=true")
		// [/SIERRA-ADD]
		GLOB.using_map.hide_titlescreen(my_client)
		my_client = null

	..()
	if(!spawning)//Here so that if they are spawning and log out, the other procs can play out and they will have a mob to come back to.
		key = null//We null their key before deleting the mob, so they are properly kicked out.
		qdel(src)
	return
