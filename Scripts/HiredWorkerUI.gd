extends Control

class_name HiredWorkerUI

@export var amount_text : RichTextLabel
@export var worker : String

func init():
    amount_text.text = "x" + str(WorkerManager.instance.get_amount_workers_hired(worker))
