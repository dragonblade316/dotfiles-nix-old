{
  stdenv,
  lib,
  fetchFromGitHub,
  pnpm-lock-export,
  buildNpmPackage,
}:
buildNpmPackage rec {
  pname = "Grammarly Language server";
  version = "0.24.0";

  src = fetchFromGitHub {
    owner = "znck";
    repo = "grammarly";
    rev = "v${version}";
    sha256 = "sha256-XEGjAQJSRb8Ae5lr2gSDmkPr+8XV4SPeJPiEuZ16kWg=";
  };

  npmDepsHash = "sha256-1VTXzlafuI+dU4k1JyZPVI5/5h0gt/eggPPXKYxKsbs=";

  postPatch = ''
    pnpm-lock-export
  '';

  buildInputs = [
    pnpm-lock-export
  ];

  meta = with lib; {
    description = "A language server to interact with grammerly";
    license = licenses.mit;
  };
}
