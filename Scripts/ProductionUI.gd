extends Control

@export var button : Button
@export var delay_bar : ProgressBar

var _delay = 1.0
var _timer = -0.01

# Called when the node enters the scene tree for the first time.
func _ready():
	button.pressed.connect(self._produce)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _timer < 0.0:
		return
	
	_timer -= delta
	_update_delay_bar()

	if _timer < 0.0:
		MoneyManager.instance.gain_money(1)
		button.disabled = false

func _produce():
	if _timer > 0.0:
		return

	_timer += _delay

	button.disabled = true

func _update_delay_bar():
	if _timer < 0.0:
		delay_bar.value = 0
		return

	delay_bar.value = _timer / _delay
