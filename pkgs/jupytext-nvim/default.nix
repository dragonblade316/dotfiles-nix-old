{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "jupytext-nvim";
  src = fetchFromGitHub {
    owner = "GCBallesteros";
    repo = "jupytext.nvim";
    rev = "6c9a872";
    sha256 = "sha256-8GSAjbABpVX+WSXVqVqrEY38rxlpFDmP3UNsVT/TKLg=";
  };
}
