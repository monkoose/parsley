(let [{: build} (require "hotpot.api.make")]
  (build "./"
    "fnl/(parsley/.+)" (fn [p {: join-path}]
                         (when (not (vim.endswith p "macros.fnl"))
                           (join-path "./lua" p)))
    "fnl/tests/(.+)" (fn [p  {: join-path}]
                       (join-path "./tests" p))))
