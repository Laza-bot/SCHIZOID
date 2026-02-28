extends CSGMesh3D


@onready var DialogClass = preload("res://Scenes/Dialog.tscn")
@onready var AnimPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.


var dialogLookUp = {
	"Venesa1": [
		{"Text": "Hi!" , "Speaker": "Venesa"},
		{"Text": "Hi Venesa..." , "Speaker": "You"},
		{"Text": "How are you doing?","Speaker": "Venesa"},
		{"Text": "good...","Speaker": "You"},
		{"Text": "Ah alright","Speaker": "Venesa"}
	],
	"Vilosn1": [
		{"Text": "Yo!", "Speaker" : "Vilosn"},
		{"Text": "...", "Speaker" : "You"},
		{"Text": "... (awkard lisance)","Speaker" : "Vilosn"}
	],
	"Hilton1": [
		{"Text": "Hello there!", "Speaker" : "Hilton"},
		{"Text": "what's up", "Speaker" : "You"},
		{"Text": "Yea nothing much.","Speaker" : "Hilton"},
		{"Text": "Did you ... hear that?", "Speaker" : "You"},
		{"Text": "No...?  ", "Speaker" : "Hilton"},
		{"Text": "Ah alright", "Speaker" : "You"}
	],
	
	"Venesa2": [
		{"Text": "Yo Venesa..." , "Speaker": "You"},
		{"Text": "Hello?","Speaker": "Venesa"},
		{"Text": "Have you noticed something weird?","Speaker": "You"},
		{"Text": "Nope, why?","Speaker": "Venesa"},
		{"Text": "It's noting","Speaker": "Venesa"}
	],
	"Vilosn2": [
		{"Text": "Could you stop making that sound?", "Speaker" : "Vilosn"},
		{"Text": "What sound?", "Speaker" : "You"},
		{"Text": "...","Speaker" : "Vilosn"}
	],
	"Hilton2": [
		{"Text": "Hey!", "Speaker" : "Hilton"},
		{"Text": "Get away from me.", "Speaker" : "You"},
		{"Text": "what what's happening","Speaker" : "Hilton"},
		{"Text": "Stay back.", "Speaker" : "You"},
		{"Text": "What are you talking about", "Speaker" : "Hilton"},
		{"Text": "I said stay back", "Speaker" : "You"}
	],
}

var triggered = false

func interact():
	if triggered == true:
		return
	print("Do")
	triggered = true
	
	var dialog = DialogClass.instantiate()
	add_child(dialog)
	dialog.init(dialogLookUp[self.get_parent_node_3d().name])
	
	dialog.ProgressDialog()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
