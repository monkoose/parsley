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
