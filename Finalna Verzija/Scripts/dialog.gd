extends Control

@onready var Text_Box = $DialogText/Label
@onready var Text_Name = $DialogName/Label

var Config : Array
var CurrentOption = 0
var IsTyping = false

const TypewritterTime = 1

func _ready() -> void:
	var Text_Box = $DialogText/Label
	var Text_Name = $DialogName/Label

func ProgressDialog() -> void:
	CurrentOption += 1
	if len(Config) < CurrentOption:
		self.queue_free()
		return
	var CurrentConfig = Config[CurrentOption - 1]

	Text_Name.text = CurrentConfig["Speaker"]

	Text_Box.text = ""
	var TimePerLetter = 0.1#TypewritterTime / len(CurrentConfig["Text"]) 
	IsTyping = true
	var OnOption = CurrentOption
	for i in CurrentConfig["Text"]:
		if not IsTyping or CurrentOption != OnOption:
			break
		
		Text_Box.text = Text_Box.text + i
		await get_tree().create_timer(TimePerLetter).timeout
		
	if CurrentOption != OnOption: 
		return
	Text_Box.text = CurrentConfig["Text"]
	IsTyping = false
func init(newConfig : Array) -> void:
	Config = newConfig
	CurrentOption = 0
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if IsTyping:
				IsTyping = false
			else:
				ProgressDialog()
