(import-macros {: describe* : it*} "parsley.busted.macros")
(local psl-buf (require "parsley.buffer"))
(local psl (require "parsley"))

(describe* "buffer"
  (before_each
    (fn []
      (psl.map #(vim.api.nvim_buf_delete $ {:force true})
               (vim.api.nvim_list_bufs))))

  (describe* "filetype"
    (it* "returns correct buffer filetype"
      (vim.api.nvim_buf_set_option 0 "filetype" "fennel")
      (assert.equal "fennel" (psl-buf.filetype 0))
      (vim.api.nvim_buf_set_option 0 "filetype" "lisp")
      (assert.equal "lisp" (psl-buf.filetype 0))))

  (describe* "list-loaded"
    (it* "returns correct list of loaded buffers"
      (local pre-length (length (psl-buf.list-loaded)))
      (local bufnr (vim.api.nvim_create_buf true false))
      (assert.equal (+ pre-length 1) (length (psl-buf.list-loaded))
                    "after adding a buffer")

      (vim.api.nvim_buf_delete bufnr {:unload true})
      (assert.equal pre-length (length (psl-buf.list-loaded))
                    "after unloading a buffer")))

  (describe* "empty?"
    (local bufnr (vim.fn.bufnr))

    (it* "returns true for empty buffer"
      (assert.is_true (psl-buf.empty? bufnr)))

    (it* "returns false for non-empty buffer"
      (vim.api.nvim_buf_set_lines bufnr 0 -1 false ["hello" "world"])
      (assert.is_false (psl-buf.empty? bufnr))

      (vim.api.nvim_buf_set_lines bufnr 0 -1 false ["   "])
      (assert.is_false (psl-buf.empty? bufnr) "blank characters is still a content")

      (vim.api.nvim_buf_set_lines bufnr 0 -1 false ["" ""])
      (assert.is_false (psl-buf.empty? bufnr) "blank lines is still a content")))

  (describe* "exists?"
    (local name "dummy")

    (it* "returns (values true bufnr) for existing buffer"
      (vim.cmd "edit dummy")
      (assert.same [(values true (vim.fn.bufnr name))]
                   [(psl-buf.exists? name)]))

    (it* "returns false for non-existing buffer"
      (assert.falsy (psl-buf.exists? name))))

  (describe* "visible?"
    (local name "dummy")

    (it* "returns true for existing and visible buffer in any window"
      (vim.cmd "split dummy")
      (assert.same [(values true (vim.api.nvim_get_current_win))]
                   [(psl-buf.visible? name)]))

    (it* "returns false for non-visible buffer"
      (vim.cmd "split dummy")
      (vim.cmd "edit dummy_2")
      (assert.falsy (psl-buf.visible? name))))

  (describe* "line-length"
    (local line "hello, world!")
    (local line-len (length line))
    (it* "returns line length in bytes"
      (vim.api.nvim_buf_set_lines 0 0 -1 false [line])
      (assert.equal line-len (psl-buf.line-length 0 1))
      (vim.api.nvim_buf_set_lines 0 0 -1 false [])
      (assert.equal 0 (psl-buf.line-length 0 1)))))
