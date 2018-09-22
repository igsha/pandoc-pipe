{ stdenv, panflute, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pandoc-pipe";
  version = "0.0.2";

  src = ./.;

  propagatedNativeBuildInputs = [ panflute ];

  meta = with stdenv.lib; {
    description = "A panflute filter to pipe CodeBlock into external program";
    homepage = https://github.com/igsha/pandoc-pipe;
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ igsha ];
  };
}
