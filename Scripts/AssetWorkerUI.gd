extends Control

@export var asset_icon: TextureRect
@export var asset_amount_text: RichTextLabel
@export var work_asset: Asset
@export var click_button : TextureButton
@export var background : TextureRect
@export var signal_emmiter : PackedScene
@export var worker_group : HBoxContainer

var _worker_dictionary : Dictionary = {}

func _ready():
	click_button.pressed.connect(self._on_click)
	move_child(click_button, 3)

func init():
	asset_icon.texture = work_asset.sprite
	background.texture = work_asset.work_background
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
		_add_worker(hired_ui.get_selected_worker())
	
	WorkerManager.instance.put_to_work(hired_ui.get_selected_worker())

	var sig_emi = signal_emmiter.instantiate()
	add_child(sig_emi)
	sig_emi.resource = work_asset
	sig_emi.emit_signal_every(hired_ui.get_selected_worker().production_time_days)
	sig_emi.repeated_signal.connect(self._gain_asset)
	
	hired_ui.deselect_worker()

func _add_worker(worker: Worker):
	var wor

	match work_asset.type_of_worker:
		WorkerManager.Worker_Type.Miner:
			wor = worker.miner.instantiate()
		WorkerManager.Worker_Type.Farmer:
			wor = worker.farmer.instantiate()
	
	worker_group.add_child(wor)


func _gain_asset(asset: Asset):
	AssetManager.instance.increase_asset_amount(work_asset, 1)
