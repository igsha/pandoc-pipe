{ pkgs ? import <nixpkgs> {} }:

pkgs.python3Packages.buildPythonApplication rec {
  pname = "pandoc-pipe";
  version = "0.0.2";

  src = ./.;

  propagatedBuildInputs = with pkgs; [ panflute ];

  meta = with pkgs.stdenv.lib; {
    description = "A panflute filter to pipe CodeBlock into external program";
    homepage = https://github.com/igsha/pandoc-pipe;
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ igsha ];
  };
}
