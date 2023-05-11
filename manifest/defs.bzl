def _generate_manifest(ctx):
    output_name = ctx.attr.manifest_name if ctx.attr.manifest_name else ctx.label.name
    output = ctx.actions.declare_file(output_name)
    args = ctx.actions.args()
    args.add_all(["--type", ctx.attr.type, "--output", "{}/{}".format(ctx.bin_dir.path, output_name)])
    for f in ctx.attr.srcs:
        args.add_all(["--files", f.files.to_list()[0]])
    ctx.actions.run(
        executable = ctx.executable._generator,
        outputs = [output],
        arguments = [args],
    )
    return DefaultInfo(files = depset([output]))

generate_manifest = rule(
    implementation = _generate_manifest,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "manifest_name": attr.string(),
        "type": attr.string(
            default = "debug",
            values = ["debug", "release", "fake"],
        ),
        "_generator": attr.label(
            default = "@generator_tool//file",
            executable = True,
            cfg = "host",
        ),
    },
)