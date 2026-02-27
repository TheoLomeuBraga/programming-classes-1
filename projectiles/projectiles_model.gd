@tool
extends Node3D
class_name ProjectileModel

enum ProjectileModelType {BULLET,MISSILE,BOMB}
func update_model(type: ProjectileModelType) -> void:
	$Cube.visible = false
	$Cylinder.visible = false
	$Cube_001.visible = false
	match type:
		ProjectileModelType.BULLET:
			$Cube.visible = true
		ProjectileModelType.MISSILE:
			$Cylinder.visible = true
		ProjectileModelType.BOMB:
			$Cube_001.visible = true

@export var projectile_model_type : ProjectileModelType :
	set(value):
		projectile_model_type = value
		update_model(projectile_model_type)
