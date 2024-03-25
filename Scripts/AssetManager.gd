extends Node

class_name AssetManager

enum Asset_Enum {Wheat, Sugar, Cotton, Coal, Steel, Gold, Paper, Glass, Textile, Brick, Gunpowder, Firearm}

static var instance : AssetManager

var _asset_amount_dictionary : Dictionary = {}
var _asset_resource_dictionary : Dictionary = {}

func _init():
	instance = self

	for asset in Asset_Enum.keys():
		_asset_amount_dictionary[asset] = 0
	
	for asset in Asset_Enum.keys():
		var resource = load("res://Resources/Assets/" + str(asset) + ".tres")
		_asset_resource_dictionary[asset] = resource


func increase_asset_amount(asset: String, amount: int):
	_asset_amount_dictionary[asset] += amount

func decrease_asset_amount(asset: String, amount: int):
	_asset_amount_dictionary[asset] -= amount

func get_asset_amount(asset: String) -> int:
	return _asset_amount_dictionary[asset]

func get_asset_resource(asset: String) -> Asset:
	return _asset_resource_dictionary[asset]
