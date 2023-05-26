DEFAULT = "1.0.0"
def _deps(repository_ctx):
    versions = {
        "0.0.0": {
            "sha256": "f4cbbbc920549c4084cae4d9442f9f79f38420ddeff8784f6fadca7cf40e6649",
            "urls": ["https://github.com/RobertoRojas/build-tests-tools-binary/releases/download/1.0.0/generator"],
        },
        "1.0.0": {
            "sha256": "f4cbbbc920549c4084cae4d9442f9f79f38420ddeff8784f6fadca7cf40e6649",
            "urls": ["https://github.com/RobertoRojas/build-tests-tools-binary/releases/download/1.0.0/generator"],
        },
    }
    sha256 = versions[repository_ctx.attr.version]['sha256']
    urls = versions[repository_ctx.attr.version]['urls']
    output = repository_ctx.path("file")
    repository_ctx.download(
        url = urls,
        output = output,
        sha256 = sha256,
        executable = True
    )
    content = "filegroup(name='tool',srcs=['file'],visibility = ['//visibility:public'],)"
    repository_ctx.file("BUILD.bazel", content=content)

_deps_rule = repository_rule(
    implementation = _deps,
    attrs = {
        "version": attr.string(values = ["1.0.0", "0.0.0"])
    }
)

def download_test_dependency(version=DEFAULT):
    _deps_rule(
        name = "gen_tool",
        version = version,
    )