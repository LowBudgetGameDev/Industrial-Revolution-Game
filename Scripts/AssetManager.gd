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


func increase_asset_amount(asset: Asset, amount: int):
	var ass = _asset_resource_dictionary.find_key(asset)
	_asset_amount_dictionary[ass] += amount

func decrease_asset_amount(asset: Asset, amount: int):
	var ass = _asset_resource_dictionary.find_key(asset)
	_asset_amount_dictionary[ass] -= amount

func get_asset_amount(asset: Asset) -> int:
	var ass = _asset_resource_dictionary.find_key(asset)
	return _asset_amount_dictionary[ass]

func get_asset_resource(asset: String) -> Asset:
	return _asset_resource_dictionary[asset]
