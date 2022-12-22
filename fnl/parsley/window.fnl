(local buffer (require "parsley.buffer"))

(local window {})

;;; -> [integer integer]
(fn window.get-screen-size []
  "Returns height and width of the neovim client."
  (let [{: width : height} (. (vim.api.nvim_list_uis) 1)]
    [height width]))

;;; -> [Row Col]
(fn window.get-screen-pos []
  "Returns row and column of the cursor for neovim client."
  (let [winid (vim.api.nvim_get_current_win)
        [linenr column] (vim.api.nvim_win_get_cursor winid)
        {: row : col} (vim.fn.screenpos 0 linenr (+ column 1))]
    [row col]))

;;; WinID -> ?integer
(fn window.get-zindex [winid]
  "Returns zindex for floating window or nil."
  (. (vim.api.nvim_win_get_config winid) :zindex))

;;; WinID -> bool
(fn window.floating? [winid]
  "Checks if window with `winid` is floating window."
  (not= (window.get-zindex winid) nil))

;;; ?WinID -> bool
(fn window.visible? [winid]
  "Checks if window with `winid` is visible in current tabpage."
  (> (vim.fn.win_id2win winid) 0))

;;; ?WinID -> integer
(fn window.get-height [winid]
  "Returns height of the window with `winid`, if
  there is no such window returns 0."
  (match (pcall vim.api.nvim_win_get_height winid)
    (true height) height
    _ 0))

;;; WinID -> FileType
(fn window.filetype [winid]
  (buffer.filetype
    (vim.api.nvim_win_get_buf winid)))

;;; WinID -> {any}
(fn window.get-info [winid]
  "Returns hash-table with various information
  about window with `winid`"
  (. (vim.fn.getwininfo winid) 1))

window
