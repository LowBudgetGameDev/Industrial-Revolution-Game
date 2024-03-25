extends Control

class_name MarketWorkerUI

@export var worker_name_text : RichTextLabel
@export var buy_button : Button
@export var worker : Worker

func _ready():
	buy_button.pressed.connect(self.buy_worker)

func init():
	worker_name_text.text = worker.name

	var human_scene = load(worker.sprite.resource_path)

	var human = human_scene.instantiate()

	add_child(human)

	human.set_scale(Vector2(0.25, 0.25))
	human.set_position(Vector2(12, 12))

func buy_worker():
	WorkerManager.instance.buy_worker(worker)
