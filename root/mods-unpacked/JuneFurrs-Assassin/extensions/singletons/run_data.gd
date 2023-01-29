extends "res://singletons/run_data.gd"

const ASSASSIN_LOG = "JuneFurrs-Assassin"


# Extensions
# =============================================================================

func init_effects()->Dictionary:
	return _assassin_add_custom_effects(.init_effects())



# Custom
# =============================================================================

# Adds Assassin's custom effects to the vanilla set
func _assassin_add_custom_effects(vanilla_effects:Dictionary)->Dictionary:
	ModLoaderUtils.log_info("Adding custom effects", ASSASSIN_LOG)

	var custom_effects = {
		# All projectiles become homing
		# Used by: psinas_little_locust
		"all_homing_projectiles": 0, # int (0 = false, 1 = true)
	}

	return Utils.merge_dictionaries(vanilla_effects, custom_effects)
