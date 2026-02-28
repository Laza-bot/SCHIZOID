extends CSGBox3D

@onready var Tranistiion = preload("res://Scenes/Transition.tscn")
@onready var EndScreen = preload("res://Scenes/EndScreen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func interact() -> void:
	var tras = Tranistiion.instantiate()
	add_child(tras)
	await get_tree().create_timer(1).timeout
	if self.name == "end":
		var ende = EndScreen.instantiate()
		add_child(ende)
		return
	get_tree().change_scene_to_file("res://Scenes/" + self.name + ".tscn")
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
