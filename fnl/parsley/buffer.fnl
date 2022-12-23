(local psl (require "parsley"))

(local buffer {})

;;; BufNr -> FileType
(fn buffer.filetype [bufnr]
  "Returns filetype of the `bufnr`"
  (vim.api.nvim_buf_get_option bufnr :filetype))

;;; -> [BufNr]
(fn buffer.list-loaded []
  "Returns list of loaded buffer numbers, same as `:ls!`"
  (icollect [_ buf (ipairs (vim.api.nvim_list_bufs))]
    (when (vim.api.nvim_buf_is_loaded buf) buf)))

;;; BufNr -> bool
(fn buffer.empty? [bufnr]
  "Checks if buffer is empty."
  (let [last-linenr (vim.api.nvim_buf_line_count bufnr)]
    (and (= last-linenr 1)
         (= 0 (length
                (psl.first
                  (vim.api.nvim_buf_get_lines
                    bufnr 0 1 false)))))))

;;; BufName -> ?(true BufNr)
(fn buffer.exists? [bufname]
  "Checks if buffer exists."
  (if (= (vim.fn.bufexists bufname) 1)
      (values true (vim.fn.bufnr bufname))))

;;; BufName -> ?(true WinID)
(fn buffer.visible? [bufname]
  "Checks if buffer is visible in any window in the current tabpage."
  (match (vim.fn.bufwinid bufname)
    -1 nil
    winid (values true winid)))

;;; BufNr string ?any -> ?any
(fn buffer.get-var! [bufnr variable ?default]
  "Returns value of a buffer variable `b:`.
  Unlike `vim.api.nvim_buf_get_var()` if this option can't be found
  returns `?default` value."
  (match (pcall vim.api.nvim_buf_get_var bufnr variable)
    (true val) val
    _          (when ?default
                 (vim.api.nvim_buf_set_var
                   bufnr variable ?default)
                 (vim.api.nvim_buf_get_var bufnr variable))))

;;; BufNr LineNr -> integer
(fn buffer.line-length [bufnr linenr]
  "Returns length of the `linenr` of the buffer with `bufnr`.
  Also can be interpreted as the last column of the line."
  (length (psl.first (vim.api.nvim_buf_get_lines
                       bufnr (- linenr 1) linenr false))))

buffer
