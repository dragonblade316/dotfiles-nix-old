{
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  name = "jupytext-nvim";
  src = fetchFromGitHub {
    owner = "GCBallesteros";
    repo = "NotebookNavigator.nvim";
    rev = "42b686f";
    sha256 = "sha256-8GSAjbABpVX+WSXVqVqrEY38rxlpFDmP3UNsVT/TKLg=";
  };
}
