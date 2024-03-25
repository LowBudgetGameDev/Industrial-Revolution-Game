extends Control

class_name MarketAssetUI

@export var assetImage : TextureRect
@export var assetNameText : RichTextLabel
@export var asset : Asset

func init():
	assetImage.texture = asset.sprite
	assetNameText.text = asset.name

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

