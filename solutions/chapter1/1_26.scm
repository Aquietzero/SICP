; By using square, (expmod base (/ exp 2) m) only evaluates once. But if using
; explicit multiplication, the recursive process is doubled, which makes the
; `log` lose its power. So the O(logn) process has been transformed into a O(n)
; process.
