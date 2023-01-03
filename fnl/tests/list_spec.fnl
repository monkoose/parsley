(import-macros {: describe* : it*} "parsley.busted.macros")
(local psl-list (require "parsley.list"))

(describe* "concat"
  (it* "correctly concatenates mulitple lists"
    (assert.same [1 2 3 4 5 6]
                 (psl-list.concat [1 2] [3 4] [5 6]))
    (assert.same ["hello" "world"]
                 (psl-list.concat ["hello"] ["world"]))
    (assert.same ["hello"]
                 (psl-list.concat ["hello"]))
    (assert.same []
                 (psl-list.concat []))))

(describe* "reverse!"
  (it* "reverses a list in place"
    (var list [1 2 3 4 5 6])
    (psl-list.reverse! list)
    (assert.same [6 5 4 3 2 1] list)
    (psl-list.reverse! list)
    (assert.same [1 2 3 4 5 6] list))
  (it* "returns reversed list"
    (var list [1 2 3 4 5])
    (assert.same [5 4 3 2 1] (psl-list.reverse! list))))
