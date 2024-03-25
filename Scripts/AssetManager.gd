extends Node

class_name AssetManager

enum Asset {Wheat, Sugar, Cotton, Coal, Steel, Gold, Paper, Glass, Textile, Brick, Gunpowder, Firearm}

var instance: AssetManager

var _resource_amount_dictionary : Dictionary

func _init():
	instance = self

func _ready():
	for resource in Asset.keys():
		_resource_amount_dictionary[resource] = 0 

func increase_resource_amount(resource: Asset, amount: int):
	_resource_amount_dictionary[resource] += amount

func decrease_resource_amount(resource: Asset, amount: int):
	_resource_amount_dictionary[resource] -= amount

func get_resource_amount(resource: Asset) -> int:
	return _resource_amount_dictionary[resource]
