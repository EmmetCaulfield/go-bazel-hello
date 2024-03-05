#https://bazel.build/rules/lib/globals/workspace#workspace
workspace(name = "com_github_emmetcaulfield_go_hello")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "io_bazel_rules_go",
    commit = "58534a2cda8e546a4dec6ea9c6b64eb0bfe824dd",
    remote = "https://github.com/bazelbuild/rules_go.git",
)

git_repository(
    name = "bazel_gazelle",
    commit = "061cc37f7557411a7b1b8ea948a9404b8e6a13a4",
    remote = "https://github.com/bazelbuild/bazel-gazelle.git",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.21.1")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()
