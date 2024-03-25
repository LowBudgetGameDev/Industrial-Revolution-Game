extends Control

@export var money_text : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	MoneyManager.instance.on_money_amount_changed.connect(self.update_money_text)
	update_money_text()


func update_money_text():
	money_text.text = "[center]$" + str(MoneyManager.instance.get_money_amount()) + "[/center]"
