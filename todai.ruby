#!/usr/bin/env ruby

##
## http://twitter.com/hosi_mo
##

#DECODE BINARY
s = File.open("01.txt", "rb") {|f| print [f.read].pack("B*")}
print "\n"

###
### INITIALIZE
###

$a = [['I','p','w','g'], ['o','.','.','u'], ['a','c','t','o'],['u','s','w','!']]
$b = [[' ','u','i','l'], [' ','f','t',' '], ['s','c','y','s'],['t','u','u','e']]
$c = [['o',' ',' ','t'], ['S','-','t','o'], ['i','a','i',' '],['n','n','n','.']]
$d = [['h','w',':',' '], ['n','w','/','r'], ['o','.','o',' '],['o','j','k','i']]
$e = [['a','k','.','y'], ['_','/','a','o'], ['_','t','t','l'],['l','k','.',' ']]
$f = [['G','T','a','d'], ['h','/','s','e'], ['l','h',' ','r'],['C','S','p','F']]
$original = [$a.clone,$b.clone,$c.clone,$d.clone,$e.clone,$f.clone]


###
###FUNCTIONS
###

def rotate(y)
	for num in 1..12 do
		y.push y.shift
  	end
	return y
end

def stuv(i)
	if i==0
		$a = $a.transpose.reverse
	end
	if i==3
		$f = $f.transpose.map(&:reverse)
	end
	x = $b[i]
	x+= $c[i]
	x+= $d[i]
	x+= $e[i]
	x = rotate(x)
	$b[i]=[x[0],x[1],x[2],x[3]]
	$c[i]=[x[4],x[5],x[6],x[7]]
	$d[i]=[x[8],x[9],x[10],x[11]]
	$e[i]=[x[12],x[13],x[14],x[15]]
end

def efhi(i)
	if i==0
		$b = $b.transpose.map(&:reverse)
	end
	if i==3
		$d = $d.transpose.reverse
	end
	x = $c
	x+= $f.transpose.reverse
	x+= $e.reverse.map(&:reverse)
	x+= $a.transpose.map(&:reverse)
	y = x.clone
	y = rotate(y)
	y = y.transpose
	x = x.transpose
	x[i]=y[i]
	x = x.transpose.transpose.transpose
	$c = [x[0],x[1],x[2],x[3]]
	$f = [x[7],x[6],x[5],x[4]].transpose
	$e = [x[8],x[9],x[10],x[11]].reverse.map(&:reverse)
	$a = [x[12],x[13],x[14],x[15]].transpose.reverse
end

def knor(i)
	if i==0
		$c = $c.transpose.map(&:reverse)
	end
	if i==3
		$e = $e.transpose.reverse
	end
	x = $d
	x+= $f.reverse.map(&:reverse)
	x+= $b.reverse.map(&:reverse)
	x+= $a.reverse.map(&:reverse)
	y = x.clone
	y = rotate(y)
	y = y.transpose
	x = x.transpose
	x[i]=y[i]
	x = x.transpose.transpose.transpose
	$d = [x[0],x[1],x[2],x[3]]
	$f = [x[4],x[5],x[6],x[7]].reverse.map(&:reverse)
	$b = [x[8],x[9],x[10],x[11]].reverse.map(&:reverse)
	$a = [x[12],x[13],x[14],x[15]].reverse.map(&:reverse)
end

def tokyo
	stuv(1) #T
	efhi(2) #H
	efhi(0) #E
	stuv(2) #U
	knor(1) #N
	efhi(3) #I
	stuv(3) #V
	efhi(0) #E
	knor(3) #R
	stuv(0) #S
	efhi(3) #I
	stuv(1) #T
	stuv(3) #Y
	knor(2) #O
	efhi(1) #F
	stuv(1) #T
	knor(2) #O
	knor(0) #K
	stuv(3) #Y
	knor(2) #O
end

###
###ROTATE CUBE UNTIL CURCULATION POINT
###

surplus = 0
while true do
	tokyo
	surplus = surplus + 1
	if [$a,$b,$c,$d,$e,$f].flatten==$original.flatten
		p "surplus="+surplus.to_s
		print "\n"
		break
	end
end

###
###REPEATING "THE UNIVERSITY OF TOKYO" for 201^^3 MOD surplus
###201^^3 MOD 1008 = 153
###

for num in 1..153 do
	tokyo
end

###
###PRINT THE CUBE
###

p $a.flatten.join('')
for num in 0..3 do
	p $b[num].join('')+$c[num].join('')+$d[num].join('')+$e[num].join('')
end
p $f.flatten.join('')
print "\n"






