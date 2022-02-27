data Expr = Val Int | Add Expr Expr | Mult Expr Expr

value :: Expr -> Int
value (Val n) = n
value (Add x y) = value x + value y
value (Mult x y) = value x * value y

type Cont = [Op]

data Op = EVAL Expr | ADD Int | MULT Int

eval :: Expr -> Cont -> Int
eval (Val n) c = exec c n
eval (Add x y) c = eval x (EVAL y : c)
eval (Mult x y) c = eval x (EVAL y : c)

exec :: Cont -> Int -> Int
exec [] n = n
exec (EVAL y : c) n = eval y (ADD n : c)
exec (ADD n : c) m = exec c (n + m)
exec (MULT n : c) m = exec c (n * m)

valuenew :: Expr -> Int
valuenew e = eval e []
