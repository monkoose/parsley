;; fennel-ls: macro-file

(fn return [...]
  (let [return-values#
        (accumulate [str "" _ s (ipairs [...])]
          (do
            (assert-compile (or (= (type s) "boolean")
                                (sym? s)))
            (.. str " " (tostring s) ",")))]
    `(lua ,(.. "return" (return-values#:gsub ",$" "")))))

(lambda iter-func? [funcname]
  (let [iter-names [:all :any :each :enumerate :filter :find
                    :flatten :fold :join :last :map :next :nextback
                    :nth :nthback :peek :peekback :rev :rfind :skip
                    :skipback :slice :take :totable]]
    (var result false)
    (each [_ f (ipairs iter-names) &until result]
      (when (= funcname f)
        (set result true)))
    result))

(fn iter [it ...]
  "Macro for `:h vim.iter`
  Usage example:
     `(iter [1 2 3]
           (map #(* 3 $))
           (rev)
           (skip 2)
           (totable))`"
  (local result [])
  (each [_ v# (ipairs [...])]
    (assert-compile (list? v#) (.. "Expected list, but got " (type v#)) v#)
    (let [func (tostring (table.remove v# 1))]
      (assert-compile (iter-func? func) (.. "Not an Iter function `" func "`") func)
      (table.insert result `(: ,func ,(unpack v#)))))
  `(-> (vim.iter ,it)
       ,(unpack result)))

{: return
 : iter}
