(fn describe* [name ...]
  `(describe ,name (fn [] ,(unpack [...]))))

(fn it* [what ...]
  `(it ,what (fn [] ,(unpack [...]))))

{: describe*
 : it* }
