;;; [any] ... -> [any]
(fn concat [list ...]
  "Returns a new list as a result of concatenating multiple lists."
  (local result [])
  (icollect [_ val (ipairs list) &into result]
    val)
  (when ...
    (each [_ l (ipairs [...])]
      (icollect [_ v (ipairs l) &into result]
        v)))
  result)

;;; [any] -> [any]
(fn reverse! [list]
  "Reverses a list in place."
  (let [list-len (length list)]
    (for [i 1 (math.floor (/ list-len 2))]
      (let [j (+ (- list-len i) 1)
            temp-i (. list i)]
        (tset list i (. list j))
        (tset list j temp-i)))
    list))

{: concat
 : reverse!}
