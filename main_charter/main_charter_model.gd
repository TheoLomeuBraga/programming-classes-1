
@tool
extends Node3D
class_name MainCharterModel

@onready var animation_tree : AnimationTree = $AnimationTree

var color_pallet_shader = load("res://main_charter/color_pallet.gdshader")
func update_color_pallet(target : Node = self) -> void:
	if target is MeshInstance3D:
		var mi : MeshInstance3D = target
		if mi.get_surface_override_material_count() > 0 and mi.get_surface_override_material(0) is ShaderMaterial:
			var sm : ShaderMaterial = mi.get_surface_override_material(0)
			if sm.shader == color_pallet_shader:
				sm.set_shader_parameter("color_2",light_armor)
				sm.set_shader_parameter("color_4",hands)
				sm.set_shader_parameter("color_5",armor)
				sm.set_shader_parameter("color_6",skin)
	
	for c in target.get_children():
		update_color_pallet(c)


@export var light_armor : Color : # light armor
	set(value):
		light_armor = value
		update_color_pallet()

@export var hands : Color : # hands
	set(value):
		hands = value
		update_color_pallet()

@export var armor : Color : # armor
	set(value):
		armor = value
		update_color_pallet()

@export var skin : Color : # skin
	set(value):
		skin = value
		update_color_pallet()


enum AnimationMode {FLOOR,AIR}
@export var animation_mode : AnimationMode = AnimationMode.FLOOR

@export_range(.0,1.0) var walk_speed : float

@export var shoot : bool

func _ready() -> void:
	update_color_pallet()

func _process(delta: float) -> void:
	pass
