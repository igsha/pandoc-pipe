{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "pandoc-pipe";
  version = "0.0.1";

  src = ./.;

  buildCommand = ''
    mkdir -p $out/bin
    cp ${src}/${pname} $out/bin
  '';

  propagatedNativeBuildInputs = with pkgs; [ panflute ];

  meta = with pkgs.stdenv.lib; {
    description = "A panflute filter to pipe CodeBlock into external program";
    homepage = https://github.com/igsha/pandoc-pipe;
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ igsha ];
  };
}
