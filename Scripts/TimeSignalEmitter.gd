extends Timer

signal repeated_signal

var _timer := 0.0
var _delay := 0.0

func emit_signal_every(seconds: float):
	_delay = seconds
	_timer += _delay

func _process(delta):
	if _timer < 0:
		repeated_signal.emit()
		_timer += _delay

	_timer -= delta
