extends Control

class_name MarketAssetUI

@export var assetImage : TextureRect
@export var assetNameText : RichTextLabel
@export var sellButton : Button
@export var asset : Asset

func _ready():
	sellButton.pressed.connect(self._sell_asset)


func init():
	assetImage.texture = asset.sprite
	assetNameText.text = asset.name

func _sell_asset():
	AssetManager.instance.sell_asset(asset)

