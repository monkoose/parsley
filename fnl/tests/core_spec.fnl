(import-macros {: describe* : it*} "parsley.busted.macros")
(local psl (require "parsley"))

(describe* "even?"nt table in which to run the
  (it* "returns true for even numbers"
    (assert.is_true (psl.even? 2))
    (assert.is_true (psl.even? 10))
    (assert.is_true (psl.even? -2) "Negative numbers should pass")
    (assert.is_true (psl.even? 0) "Zero is even."))

  (it* "returns false for odd numbers"
    (assert.is_false (psl.even? 1))
    (assert.is_false (psl.even? 111))
    (assert.is_false (psl.even? -1) "Negative numbers should pass")))

(describe* "odd?"
  (it* "returns true for odd numbers"
    (assert.is_true (psl.odd? 3))
    (assert.is_true (psl.odd? 111))
    (assert.is_true (psl.odd? -1) "Negative numbers should pass"))

  (it* "returns false for even numbers"
    (assert.is_false (psl.odd? 112))
    (assert.is_false (psl.odd? -2) "Negative numbers should pass")
    (assert.is_false (psl.odd? 0) "Zero is even.")))

(describe* "string?"
  (it* "returns true for a string"
    (assert.is_true (psl.string? ""))
    (assert.is_true (psl.string? "hello")))
  (it* "returns false for not a string"
    (assert.is_false (psl.string? nil))
    (assert.is_false (psl.string? [1 2 3]))
    (assert.is_false (psl.string? 3))))

(describe* "null?"
  (it* "returns true for a nil"
    (assert.is_true (psl.null? nil)))
  (it* "returns false for not a nil"
    (assert.is_false (psl.null? "hello"))
    (assert.is_false (psl.null? false))
    (assert.is_false (psl.null? []))))

(describe* "list?"
  (it* "returns true for a list (sequential table)"
    (assert.is_true (psl.list? [1 2 3]))
    (assert.is_true (psl.list? []))
    (assert.is_true (psl.list? {}) "Empty hash table is a list"))
  (it* "returns false for not a list"
    (assert.is_false (psl.list? "hello"))
    (assert.is_false (psl.list? nil))
    (assert.is_false (psl.list? {:hello true}))))

(describe* "hash-table?"
  (it* "returns true for a hash table"
    (assert.is_true (psl.hash-table? {:hello true}))
    (assert.is_true (psl.hash-table? {}))
    (assert.is_true (psl.hash-table? []) "Empty list is a hash table"))
  (it* "returns false for not a hash table"
    (assert.is_false (psl.hash-table? "hello"))
    (assert.is_false (psl.hash-table? nil))
    (assert.is_false (psl.hash-table? [1 2 3]))))

(describe* "empty?"
  (it* "returns true for empty list or nil"
    (assert.is_true (psl.empty? nil))
    (assert.is_true (psl.empty? [])))
  (it* "returns false for not empty list"
    (assert.is_false (psl.empty? [1 2 3]))
    (assert.is_false (psl.empty? ["x"]))))

(describe* "first"
  (local list ["a" "b" "c"])
  (it* "returns first element from a list"
    (assert.equal "a" (psl.first list))
    (assert.not.equal "b" (psl.first list))
    (assert.not.equal "c" (psl.first list))))

(describe* "second"
  (local list ["a" "b" "c"])
  (it* "returns second element from a list"
    (assert.equal "b" (psl.second list))
    (assert.not.equal "a" (psl.second list))
    (assert.not.equal "c" (psl.second list))))

(describe* "map"
  (it* "returns correct list"
    (assert.same [2 4 6] (psl.map #(* 2 $) [1 2 3]))
    (assert.same ["a" "b" "c"]
                 (psl.map #(string.sub $ 1 1)
                          ["ab" "bc" "cd"]))))

(describe* "filter"
  (it* "returns correct list"
    (assert.same [1 3 5]
                 (psl.filter #(psl.odd? $) [1 2 3 4 5]))
    (assert.same ["hello"]
                 (psl.filter #(string.find $ "^hell")
                             ["helio" "hello" "good"]))))
