extends Node

var playerGuess
var compNum
var rng = RandomNumberGenerator.new()
var guessesTaken

func _ready():
	guessesTaken = 0
	rng.randomize()
	compNum = rng.randi_range(1, 100)
	print(compNum)
	$Panel/Label.text = "Guess a number between 1 and 100."

func _on_LineEdit_text_entered(new_text):
	playerGuess = new_text
	print(playerGuess)
	guessesTaken = guessesTaken + 1
	$Panel/LineEdit.clear()
	_compareGuesses()

func _compareGuesses():
	playerGuess = int(playerGuess)
	if playerGuess < compNum:
		$Panel/Label.text = "You number is too low."

	if playerGuess > compNum:
		$Panel/Label.text = "You number is too high."
	
	if playerGuess == compNum:
		guessesTaken = str(guessesTaken)
		$Panel/Label.text = "You win! You guessed my number in " + guessesTaken + \
		" tries."
		$Panel/Button.visible = true
	
	elif guessesTaken == 5:
		compNum = str(compNum)
		$Panel/Label.text = "You lose! The number was " + compNum + "."
		$Panel/Button.visible = true

func _on_Button_pressed():
	guessesTaken = 0
	rng.randomize()
	compNum = rng.randi_range(1, 100)
	print(compNum)
	$Panel/Label.text = "Guess a number between 1 and 100."
	$Panel/Button.visible = false
