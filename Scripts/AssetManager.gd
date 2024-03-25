extends Node

class_name AssetManager

enum Asset_Enum {Sugar, Brick, Steel, Paper, Gunpowder, Cotton, Coal, Wheat, Glass, Gold, Textile, Firearm}

static var instance : AssetManager

signal on_asset_amount_changed

var _asset_amount_dictionary : Dictionary = {}
var _asset_resource_dictionary : Dictionary = {}

func _init():
	instance = self

	for asset in Asset_Enum.keys():
		_asset_amount_dictionary[asset] = 0
	
	for asset in Asset_Enum.keys():
		var resource = load("res://Resources/Assets/" + str(asset) + ".tres")
		_asset_resource_dictionary[asset] = resource

func sell_asset(asset: Asset):
	var ass = _asset_resource_dictionary.find_key(asset)
	MoneyManager.instance.gain_money(asset.sell_price * _asset_amount_dictionary[ass])

	_asset_amount_dictionary[ass] = 0
	on_asset_amount_changed.emit()

func increase_asset_amount(asset: Asset, amount: int):
	var ass = _asset_resource_dictionary.find_key(asset)
	_asset_amount_dictionary[ass] += amount
	on_asset_amount_changed.emit()

func decrease_asset_amount(asset: Asset, amount: int):
	var ass = _asset_resource_dictionary.find_key(asset)
	_asset_amount_dictionary[ass] -= amount
	on_asset_amount_changed.emit()

func get_asset_amount(asset: Asset) -> int:
	var ass = _asset_resource_dictionary.find_key(asset)
	return _asset_amount_dictionary[ass]

func get_asset_resource(asset: String) -> Asset:
	return _asset_resource_dictionary[asset]
