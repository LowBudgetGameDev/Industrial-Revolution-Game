extends Control

@export var time_text: RichTextLabel

func _process(delta):
	update_text()

func update_text():
	time_text.text = "[center]" + str(TimeManager.instance.get_years()) + " years, " + str(TimeManager.instance.get_days()) + " days[/center]"
