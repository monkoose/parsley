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
(fn hash-table? [x]
  (and (= (type x) "table")
       (not (vim.tbl_islist x))))

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

(fn map [func xs]
  (icollect [_ x (ipairs xs)]
    (func x)))

(fn filter [func xs]
  (icollect [_ x (ipairs xs)]
    (when (func x)
      x)))

;;; string ->
(fn echo [str]
(vim.api.nvim_echo
  [["nvlime: " "String"]
   [str "WarningMsg"]]
  false {}))

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
