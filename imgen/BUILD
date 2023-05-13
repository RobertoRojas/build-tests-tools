load("@rules_python//python:defs.bzl", "py_binary")
load("@pip//:requirements.bzl", "requirement")

py_library(
    name = "imgen_lib",
    srcs = glob(['script/modules/*.py']),
    imports = ["script/modules"],
    deps = [requirement("Pillow")],
    visibility = ["//visibility:private"],
)

py_binary(
    name = "imgen_bin",
    srcs = ["script/main.py"],
    main = "main.py",
    deps = [
        ":imgen_lib"
    ],
    visibility = ["//visibility:public"],
)