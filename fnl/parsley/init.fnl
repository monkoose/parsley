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

{: null?
 : string?
 : list?
 : hash-table?
 : even?
 : odd?
 : empty?
 : first
 : second
 : map
 : filter
 : echo}
