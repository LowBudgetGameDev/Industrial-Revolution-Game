extends Node

class_name MoneyManager

static var instance : MoneyManager

signal on_money_amount_changed

var _money : float

func _init():
	instance = self

# Called when the node enters the scene tree for the first time.
func _ready():
	_money = 0
	pass # Replace with function body.

func can_spend_money(price: float) -> bool:
	return _money >= price

func gain_money(amount : float):
	_money += amount
	on_money_amount_changed.emit()

func lose_money(amount: float):
	_money -= amount
	on_money_amount_changed.emit()

func get_money_amount() -> float:
	return round(_money*100)/100
