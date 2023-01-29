extends Node

const MOD_DIR = "JuneFurrs-Assassin/"
const ASSASSIN_LOG = "JuneFurrs-Assassin"

var dir = ""
var ext_dir = ""
var trans_dir = ""

func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init", ASSASSIN_LOG)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"

	# Add extensions
	modLoader.install_script_extension(ext_dir + "singletons/run_data.gd")       # custom effect `all_homing_projectiles` - register
	modLoader.install_script_extension(ext_dir + "singletons/weapon_service.gd") # custom effect `all_homing_projectiles` - apply during run

	# Add translations
	modLoader.add_translation_from_resource(trans_dir + "assassinmod_text.en.translation")


func _ready():
	_load_assassin_content()


func _load_assassin_content():
	ModLoaderUtils.log_info("Loading custom content", ASSASSIN_LOG)

	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	# Characters
	ContentLoader.load_data(dir + "content_data/assassin_characters.tres", ASSASSIN_LOG)

	# Items
	ContentLoader.load_data(dir + "content_data/assassin_items.tres", ASSASSIN_LOG)

	# Weapons - Melee
	ContentLoader.load_data(dir + "content_data/weapons_melee/chainsaw.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_melee/claws.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_melee/diamond_crusher.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_melee/robo_fist.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_melee/scythe.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_melee/small_scythe.tres", ASSASSIN_LOG)

	# Weapons - Ranged
	ContentLoader.load_data(dir + "content_data/weapons_ranged/blowgun.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_ranged/scorching_sand_bottle.tres", ASSASSIN_LOG)
	ContentLoader.load_data(dir + "content_data/weapons_ranged/six_bullet_revolver.tres", ASSASSIN_LOG)

	# Sets (aka Weapon Classes)
	ContentLoader.load_data(dir + "content_data/assassin_sets.tres", ASSASSIN_LOG)

	# Challenges
	ContentLoader.load_data(dir + "content_data/assassin_challenges.tres", ASSASSIN_LOG)

	# Testing
	# ContentLoader.load_data(dir + "content_data/assassin_tests.tres", ASSASSIN_LOG)
