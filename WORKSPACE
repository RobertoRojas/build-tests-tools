load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

http_file(
    name = "generator_tool",
    executable = True,
    sha256 = "f4cbbbc920549c4084cae4d9442f9f79f38420ddeff8784f6fadca7cf40e6649",
    urls = ["https://github.com/RobertoRojas/build-tests-tools-binary/releases/download/1.0.0/generator"],
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_python",
    sha256 = "a644da969b6824cc87f8fe7b18101a8a6c57da5db39caa6566ec6109f37d2141",
    strip_prefix = "rules_python-0.20.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.20.0/rules_python-0.20.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "python3_9",
    python_version = "3.9",
)

load("@python3_9//:defs.bzl", "interpreter")

load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "pip",
    python_interpreter_target = interpreter,
    requirements = "//imgen:script/requirements.txt",
)

load("@pip//:requirements.bzl", "install_deps")

install_deps()