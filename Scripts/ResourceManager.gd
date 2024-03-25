extends Node

class_name ResourceManager

enum Resources {Wheat, Sugar, Cotton, Coal, Steel, Gold, Paper, Glass, Textile, Brick, Gunpowder, Firearm}

var instance: ResourceManager

var _resource_amount_dictionary : Dictionary

func _init():
	instance = self

func _ready():
	for resource in Resources.keys():
		_resource_amount_dictionary[resource] = 0 

func increase_resource_amount(resource: Resources, amount: int):
	_resource_amount_dictionary[resource] += amount

func decrease_resource_amount(resource: Resources, amount: int):
	_resource_amount_dictionary[resource] -= amount

func get_resource_amount(resource: Resources) -> int:
	return _resource_amount_dictionary[resource]
