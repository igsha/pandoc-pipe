{ stdenv, lib, panflute, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pandoc-pipe";
  version = "0.0.3";

  src = ./.;

  propagatedBuildInputs = [ panflute ];

  meta = with lib; {
    description = "A panflute filter to pipe Div class to external program";
    homepage = https://github.com/igsha/pandoc-pipe;
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ igsha ];
  };
}
