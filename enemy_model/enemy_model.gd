@tool
extends Node3D

enum EnemyType{ CANNON,ROCKET,GRANADE }
@export var enemy_type : EnemyType = EnemyType.CANNON :
	set(value):
		enemy_type = value
		
		$Armature/Skeleton3D/Bone_001/Cube_002.visible = false
		$Armature/Skeleton3D/Bone_001/Cylinder_001.visible = false
		$Armature/Skeleton3D/Bone_001/Sphere.visible = false
		
		match enemy_type:
			EnemyType.CANNON:
				$Armature/Skeleton3D/Bone_001/Sphere.visible = true
			EnemyType.ROCKET:
				$Armature/Skeleton3D/Bone_001/Cube_002.visible = true
			EnemyType.GRANADE:
				$Armature/Skeleton3D/Bone_001/Cylinder_001.visible = true

var rot_tween : Tween
enum Direction {LEFT,RIGHT}
@export var direction : Direction = Direction.RIGHT :
	set(value):
		direction = value
		rot_tween = create_tween()
		if direction == Direction.LEFT:
			rot_tween.tween_property($Armature,"rotation",Vector3(0.0,PI/2.0,0.0),0.2)
		elif direction == Direction.RIGHT:
			rot_tween.tween_property($Armature,"rotation",Vector3(0.0,-PI/2.0,0.0),0.2)
