extends Control

class_name HiredWorkerUI

@export var amount_text : RichTextLabel
@export var worker : Worker
@export var background : Panel
@export var click_button : TextureButton

func _ready():
	WorkerManager.instance.on_hired_worker.connect(self.update_text)

	click_button.pressed.connect(self._on_clicked)
	move_child(click_button, 999)

func init():
	update_text()

	var human_scene = load(worker.sprite.resource_path)

	var human = human_scene.instantiate()

	add_child(human)
	human.set_position(Vector2(5, 14))
	human.set_scale(Vector2(0.35, 0.35))

func update_text():
	amount_text.text = "x" + str(WorkerManager.instance.get_amount_workers_hired(worker))

func _on_clicked():
	if WorkerManager.instance.get_amount_workers_hired(worker) == 0:
		return

	background.self_modulate = Color(0.5, 0.5, 0)
