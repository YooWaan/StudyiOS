set terminal png
set output "g.png"

plot "chk.dat" using 1:2 with lines
