;;; [any] ... -> [any]
(fn concat [list ...]
  "Returns a new list as a result of concatenating multiple lists."
  (var result [])
  (icollect [_ val (ipairs list) &into result]
    val)
  (when ...
    (each [_ l (ipairs [...])]
      (icollect [_ v (ipairs l) &into result]
        v)))
  result)

{: concat}
