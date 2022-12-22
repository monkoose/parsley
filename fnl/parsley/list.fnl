;;; [any] ... -> [any]
(fn concat [list ...]
  (var result [])
  (icollect [_ val (ipairs list) &into result]
    val)
  (when ...
    (each [_ l (ipairs [...])]
      (icollect [_ v (ipairs l) &into result]
        v)))
  result)

{: concat}
