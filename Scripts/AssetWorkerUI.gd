extends Control

@export var asset_icon: TextureRect
@export var asset_amount_text: RichTextLabel
@export var work_asset: Asset
@export var click_button : TextureButton

var _worker_dictionary : Dictionary = {}

func _ready():
	click_button.pressed.connect(self._on_click)
	move_child(click_button, 2)

func init():
	asset_icon.texture = work_asset.sprite
	asset_amount_text.text = "x" + str(AssetManager.instance.get_asset_amount(work_asset))
	AssetManager.instance.on_asset_amount_changed.connect(self._update_text)

func _update_text():
	asset_amount_text.text = "x" + str(AssetManager.instance.get_asset_amount(work_asset))

func _on_click():
	var hired_ui = HiredUI.instance

	if hired_ui.get_selected_worker() == null:
		return
    
	if _worker_dictionary.has(hired_ui.get_selected_worker()):
		_worker_dictionary[hired_ui.get_selected_worker()] += 1
	else:
		_worker_dictionary[hired_ui.get_selected_worker()] = 1
	
	WorkerManager.instance.put_to_work(hired_ui.get_selected_worker())
	
	hired_ui.deselect_worker()
