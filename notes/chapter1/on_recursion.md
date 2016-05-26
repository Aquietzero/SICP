# Some fixed patterns for recursion.

**TODO** After a little test, procedure can not be passed by name. I will just keep this thought in mind
and keep reading.

For normal `for` loops in functional programming, it can be expressed generally in the following way.

    (define (for n iteration)
        (define (for-iter n counter)
            (if (not (= n counter)) (iteration counter)))
        (for-iter n 0))

But if an iteration process can be explicitly expressed, then we can consider the problem in the following way.
Let's say the iteration is f(x) = g(f(h(x))), where `h` is a function of x and `g` is a function of f(x). For an
example from `1_15.scm`:

    sin(x) = 3 * sin(x/3) - 4 * (sin(x/3))^3,

Here

    h(x) = x/3
    g(f) = 3f - 4f^3

Then a general process `p` can be abstracted from `g(f)`

    (define (p f) (g f))

Then the iteraton becomes

    (define (f x) (if (cond x)) x (p (f (h x))))

