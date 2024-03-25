extends Control

class_name MarketWorkerUI

@export var worker_name_text : RichTextLabel
@export var worker : Worker

func init():
	worker_name_text.text = worker.name
