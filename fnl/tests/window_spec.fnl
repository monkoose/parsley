(import-macros {: describe* : it*} "parsley.busted.macros")
(local psl-win (require "parsley.window"))

(describe* "window"
  (describe* "get-zindex"
    (it* "returns nil for a non-floating window"
      (assert.is_nil (psl-win.get-zindex (vim.api.nvim_get_current_win))))
    (it* "returns zindex value of a floating window"
      (local zindex 99)
      (vim.api.nvim_open_win 0 true
                             {:width 10 :height 10 :zindex zindex
                              :relative "editor" :row 1 :col 1})
      (assert.same zindex (psl-win.get-zindex 0))))

  (describe* "floating?"
    (it* "returns true for a floating window"
      (assert.is_true (psl-win.floating? 0)))
    (it* "returns false for a normal window"
      (vim.api.nvim_win_close 0 true)
      (assert.is_false (psl-win.floating? 0))))

  (describe* "visible?"
    (vim.cmd "split dummy")
    (local winid (vim.api.nvim_get_current_win))
    (vim.cmd "split dummy_2")

    (it* "returns true for a visible window in the current tabpage"
      (assert.is_true (psl-win.visible? winid)))

    (it* "returns false for an non-visible window in the current tabpage"
      (vim.api.nvim_win_close winid true)
      (assert.is_false (psl-win.visible? winid))))

  (describe* "get-height"
    (local winid (vim.api.nvim_get_current_win))
    (it* "returns height of a valid window"
      (assert.equal (vim.api.nvim_win_get_height winid)
                    (psl-win.get-height winid)))
    (it* "returns 0 for a non-valid window"
      (assert.equal 0 (psl-win.get-height 333))))

  (describe* "filetype"
    (vim.api.nvim_buf_set_option 0 "filetype" "javascript")
    (it* "returns correct filetype for a buffer in the window"
      (assert.equal "javascript" (psl-win.filetype 0))))

  (describe* "get-info"
    (it* "returns info table for a valid window"
      (local wininfo (. (vim.fn.getwininfo 0) 1))
      (assert.same wininfo (psl-win.get-info 0))
      (assert.has.error #(psl-win.get-info 333)))))
