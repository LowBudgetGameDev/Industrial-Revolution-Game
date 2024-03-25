extends Control

class_name HiredWorkerUI

@export var amount_text : RichTextLabel
@export var worker : String

func init():
    amount_text.text = "x" + str(WorkerManager.instance.get_amount_workers_hired(worker))

    var human_scene = load(WorkerManager.instance.get_worker_resource(worker).sprite.resource_path)

    var human = human_scene.instantiate()

    add_child(human)
    human.set_position(Vector2(5, 14))
    human.set_scale(Vector2(0.35, 0.35))
    
