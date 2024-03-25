extends Timer

signal repeated_signal

@export var resource: Resource

var _timer := 0.0
var _delay := 0.0

func emit_signal_every(days: float):
	_delay = TimeManager.instance.days_to_seconds(days)
	_timer += _delay

func _process(delta):
	if _timer < 0:
		repeated_signal.emit(resource)
		_timer += _delay

	_timer -= delta
