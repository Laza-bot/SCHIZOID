extends Node3D

@onready var animPlayer = $"Metal Door_005_Metal Doors_0/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var cooldown = false
var isOpen = false

func interact() -> void:
	print("DID")
	if cooldown == true:
		return
	cooldown = true
	
	if isOpen:
		self.use_collision = true
		animPlayer.play("Close")
		isOpen = false
	else:
		self.use_collision = false
		animPlayer.play("Open")
		isOpen = true
		
	await get_tree().create_timer(2).timeout
		
	cooldown = false
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
