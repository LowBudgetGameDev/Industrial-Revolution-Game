extends Node

class_name TimeManager

static var instance

var _seconds_per_year := 300.0
var _seconds_per_day : float
var _timer := 290.0
var _days := 0
var _years := 0

func _init():
    instance = self

    _seconds_per_day = _seconds_per_year / 364.0

func _process(delta):
    _timer += delta

    _days = floori(_timer / _seconds_per_day) % 364
    _years = floori(_timer / _seconds_per_year)

    if _days % 364 == 0:
        _days = 0

func get_days() -> int:
    return _days

func get_years() -> int:
    return _years