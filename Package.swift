// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "mlx-swift-lm",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "MLXLLM", targets: ["MLXLLM"]),
        .library(name: "MLXLMCommon", targets: ["MLXLMCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/samirsamor/mlx-swift.git", .upToNextMinor(from: "0.31.4")),
    ],
    targets: [
        .target(
            name: "MLXLMCommon",
            dependencies: [
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
                .product(name: "MLXOptimizers", package: "mlx-swift"),
            ],
            path: "Libraries/MLXLMCommon",
            exclude: ["README.md"]
        ),
        .target(
            name: "MLXLLM",
            dependencies: [
                "MLXLMCommon",
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
                .product(name: "MLXOptimizers", package: "mlx-swift"),
            ],
            path: "Libraries/MLXLLM",
            exclude: ["README.md"]
        ),
    ]
)
