extends Control

@export var asset_icon: TextureRect
@export var asset_amount_text: RichTextLabel
@export var work_asset: Asset

func init():
    asset_icon.texture = work_asset.sprite
    asset_amount_text.text = "x" + str(AssetManager.instance.get_asset_amount(work_asset))
