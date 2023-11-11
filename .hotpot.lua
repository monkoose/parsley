return {
    compiler = {
        macros = {
            env = "_COMPILER",
            compilerEnv = _G,
            allowedGlobals = false,
        },
    },
    build = {
        {verbose = true, atomic = true},
        {"fnl/parsley/**/*macros.fnl", false},
        {"fnl/parsley/**/*.fnl", true},
        {"fnl/tests/**/*.fnl", function(path)
          return path:gsub("fnl/tests", "tests")
        end},
        {"after/**/*.fnl", true},
    }
}
