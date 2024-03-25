extends Node2D

signal repeated_signal

var _timer := 0.0
var _delay := 0.0

func emit_signal_every(seconds: float):
	_delay = seconds

func _process(delta):
	if _timer > _delay:
		repeated_signal.emit()
		_timer = 0.0

	_timer += delta
