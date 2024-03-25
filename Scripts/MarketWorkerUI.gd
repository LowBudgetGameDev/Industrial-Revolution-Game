extends Control

class_name MarketWorkerUI

@export var workerNameText : RichTextLabel
@export var worker : Worker

func init():
    workerNameText.text = worker.name
