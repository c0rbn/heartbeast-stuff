extends Node

onready var scoreLabel = $ScoreLabel

var score = 0 setget set_score

func set_score(value):
	score = value
	scoreLabel.text = "Score = " + str(score)

#func _on_Enemy_score_up():
#	self.score += 10

