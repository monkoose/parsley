;;; any -> bool
(fn null? [x]
  (= x nil))

;;; any -> bool
(fn string? [x]
  (= (type x) "string"))

;;; any -> bool
(fn list? [x]
  (vim.tbl_islist x))

;;; any -> bool
(fn hash-table? [t]
  (and (= (type t) "table")
       (= (length t) 0)))

(fn function? [x]
  (= (type x) "function"))

(fn even? [n]
  (= (% n 2) 0))

(fn odd? [n]
  (not (even? n)))

;;; string|[any] -> bool
(fn empty? [xs]
  (or (not xs) (= (length xs) 0)))

;;; [any] -> any
(fn first [xs]
  (. xs 1))

;;; [any] -> any
(fn second [xs]
  (. xs 2))

;;; (fn [any] any) [any] -> [any]
(fn map [func xs]
  (icollect [_ x (ipairs xs)]
    (func x)))

;;; (fn [any] bool) [any] -> [any]
(fn filter [func xs]
  (icollect [_ x (ipairs xs)]
    (when (func x)
      x)))

;;; ...[string] ->
(fn echo [...]
  (vim.api.nvim_echo [...] false {}))

;;; integer integer -> (integer integer)
(fn mod [divident divisor]
  "Returns quotient and remainder which calculated from
  a dividing of the divident by the divisor."
  (values (math.floor (/ divident divisor))
          (% divident divisor)))

{: null?
 : string?
 : list?
 : hash-table?
 : function?
 : even?
 : odd?
 : empty?
 : first
 : second
 : map
 : filter
 : echo
 : mod}
