def _gen_image(ctx):
    output_name = ctx.attr.output if ctx.attr.output else ctx.label.name
    output = ctx.actions.declare_file(output_name)
    args = ctx.actions.args()
    args.add_all(["--size", ctx.attr.size, "--output", output.path])
    ctx.actions.run(
        executable = ctx.executable._generator,
        outputs = [output],
        arguments = [args],
    )
    return DefaultInfo(files = depset([output]))

imgen = rule(
    implementation = _gen_image,
    attrs = {
        "output": attr.string(),
        "size": attr.int(default=500),
        "_generator": attr.label(
            default = "//imgen:imgen_bin",
            executable = True,
            cfg = "host",
        ),
    },
)