extends Node

class_name AssetManager

enum Asset {Wheat, Sugar, Cotton, Coal, Steel, Gold, Paper, Glass, Textile, Brick, Gunpowder, Firearm}

var instance: AssetManager

var _asset_amount_dictionary : Dictionary
var _asset_resource_dictionary : Dictionary

func _init():
	instance = self

	for asset in Asset.keys():
		_asset_amount_dictionary[asset] = 0 
	
	for asset in Asset.keys():
		var resource = load("res://Resources/" + str(asset) + ".tres")
		_asset_resource_dictionary[asset] = resource


func increase_asset_amount(asset: Asset, amount: int):
	_asset_amount_dictionary[asset] += amount

func decrease_asset_amount(asset: Asset, amount: int):
	_asset_amount_dictionary[asset] -= amount

func get_asset_amount(asset: Asset) -> int:
	return _asset_amount_dictionary[asset]

func get_asset_resource(asset: Asset) -> Resource:
	return _asset_resource_dictionary[asset]
