extends Label

func _process(delta):
	self.text = "\n " 
	for word in Global.get_database():
		if word != "word" and word != "Terms Found: ":				
			word = word.to_upper()
			self.text += "  -"+word + "\n"
