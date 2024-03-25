extends Control

class_name MarketAssetUI

@export var assetImage : TextureRect
@export var assetNameText : RichTextLabel
@export var sellButton : Button
@export var asset : Asset

func _ready():
	sellButton.pressed.connect(self._sell_asset)

func _process(delta):
	if AssetManager.instance.get_asset_amount(asset) == 0:
		sellButton.disabled = true
	else:
		sellButton.disabled = false


func init():
	assetImage.texture = asset.sprite
	assetNameText.text = asset.name

func _sell_asset():
	AssetManager.instance.sell_asset(asset)

