fs = require('fs')
parse = require('csv-parse')
keysList = []

fs.writeFile 'output.json'
fs.createReadStream('./input.csv').pipe(parse(delimiter: ':')).on('data', (csvrow)->
	if keysList.length == 0
		keysList = keysList.concat(csvrow[0].split(','))
		fs.writeFile 'output.json','[',(err,data)->
		return
	obj= {}
	for key of keysList
		obj[keysList[key]] = csvrow[0].split(',')[key]
	
	fs.appendFile 'output.json',JSON.stringify(obj, null, 2)  , 'utf8',(err,data)->
	return
).on 'end', ->
	fs.appendFile 'output.json',']' ,(err,data)->
	return


