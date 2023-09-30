{ nixpkgs ? import <nixpkgs> {} }:
nixpkgs.mkShell {
  nativeBuildInputs = with nixpkgs; [
    poetry
    python310
    pkgconfig
  ];

  LD_LIBRARY_PATH = builtins.concatStringsSep ":" [
    "${nixpkgs.stdenv.cc.cc.lib}/lib"
    "${nixpkgs.zlib.outPath}/lib"
  ];

  # LLVM_CONFIG = "${nixpkgs.llvmPackages_10.llvm}/bin/llvm-config";
}