# Mappings from keypress: https://github.com/dmauro/Keypress.git
# Copyright 2013 David Mauro
module.exports.nameByKeyCode = nameByKeyCode =

	0   : "\\"          # Firefox reports this keyCode when shift is held
	8   : "backspace"
	9   : "tab"
	12  : "num"
	13  : "enter"
	16  : "shift"
	17  : "ctrl"
	18  : "alt"
	19  : "pause"
	20  : "caps"
	27  : "esc"
	32  : "space"
	33  : "pageup"
	34  : "pagedown"
	35  : "end"
	36  : "home"
	37  : "left"
	38  : "up"
	39  : "right"
	40  : "down"
	44  : "print"
	45  : "insert"
	46  : "delete"
	48  : "0"
	49  : "1"
	50  : "2"
	51  : "3"
	52  : "4"
	53  : "5"
	54  : "6"
	55  : "7"
	56  : "8"
	57  : "9"
	65  : "a"
	66  : "b"
	67  : "c"
	68  : "d"
	69  : "e"
	70  : "f"
	71  : "g"
	72  : "h"
	73  : "i"
	74  : "j"
	75  : "k"
	76  : "l"
	77  : "m"
	78  : "n"
	79  : "o"
	80  : "p"
	81  : "q"
	82  : "r"
	83  : "s"
	84  : "t"
	85  : "u"
	86  : "v"
	87  : "w"
	88  : "x"
	89  : "y"
	90  : "z"
	# 91  : "cmd"
	# 92  : "cmd"
	# 93  : "cmd"
	96  : "num_0"
	97  : "num_1"
	98  : "num_2"
	99  : "num_3"
	100 : "num_4"
	101 : "num_5"
	102 : "num_6"
	103 : "num_7"
	104 : "num_8"
	105 : "num_9"
	106 : "num_multiply"
	107 : "num_add"
	108 : "num_enter"
	109 : "num_subtract"
	110 : "num_decimal"
	111 : "num_divide"
	124 : "print"
	144 : "num"
	145 : "scroll"
	186 : ";"
	59  : ";"
	187 : "="
	61  : "="
	188 : ","
	44  : ','
	189 : "-"
	45  : "-"
	190 : "."
	46  : "."
	191 : "/"
	192 : "`"
	96  : "`"
	219 : "["
	220 : "\\"
	221 : "]"
	222 : "\'"
	39 : "\'"
	# 223 : "`"
	91 : "cmd"
	# 225 : "alt"

module.exports.keyCodeByName = keyCodeByName =

	"\\" : 0
	"backspace" : 8
	"tab" : 9
	"num" : 12
	"enter" : 13
	"shift" : 16
	"ctrl" : 17
	"alt" : 18
	"pause" : 19
	"caps" : 20
	"esc" : 27
	"space" : 32
	"pageup" : 33
	"pagedown" : 34
	"end" : 35
	"home" : 36
	"left" : 37
	"up" : 38
	"right" : 39
	"down" : 40
	"print" : 44
	"insert" : 45
	"delete" : 46
	"0" : 48
	"1" : 49
	"2" : 50
	"3" : 51
	"4" : 52
	"5" : 53
	"6" : 54
	"7" : 55
	"8" : 56
	"9" : 57
	"a" : 65
	"b" : 66
	"c" : 67
	"d" : 68
	"e" : 69
	"f" : 70
	"g" : 71
	"h" : 72
	"i" : 73
	"j" : 74
	"k" : 75
	"l" : 76
	"m" : 77
	"n" : 78
	"o" : 79
	"p" : 80
	"q" : 81
	"r" : 82
	"s" : 83
	"t" : 84
	"u" : 85
	"v" : 86
	"w" : 87
	"x" : 88
	"y" : 89
	"z" : 90
	"num_0" : 96
	"num_1" : 97
	"num_2" : 98
	"num_3" : 99
	"num_4" : 100
	"num_5" : 101
	"num_6" : 102
	"num_7" : 103
	"num_8" : 104
	"num_9" : 105
	"num_multiply" : 106
	"num_add" : 107
	"num_enter" : 108
	"num_subtract" : 109
	"num_decimal" : 110
	"num_divide" : 111
	"print" : 124
	"num" : 144
	"scroll" : 145
	";" : [186, 59]
	"=" : [187, 61]
	"," : [188, 44]
	"-" : [189, 45]
	"." : [190, 46]
	"/" : [191]
	"`" : [192, 96]
	"[" : [219]
	"\\" : [220]
	"]" : [221]
	"\'" : [222, 39]
	"cmd": 91
	"super": [91, 17]