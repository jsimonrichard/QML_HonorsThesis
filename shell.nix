{ nixpkgs ? import <nixpkgs> {} }:
nixpkgs.mkShell {
  nativeBuildInputs = with nixpkgs; [
    poetry
    python310
  ];

  LD_LIBRARY_PATH = builtins.concatStringsSep ":" [
    "${nixpkgs.stdenv.cc.cc.lib}/lib"
    "${nixpkgs.zlib.outPath}/lib"
  ];
}