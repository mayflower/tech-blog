{ blogSrc ? { outPath = ./.; revCount = 1234; rev = "abcdef"; }
, system ? "x86_64-linux"
}:

let
  pkgs = import <nixpkgs> { inherit system; };
in

{
  build = pkgs.releaseTools.nixBuild {
    name = "mf-tech-blog";

    src = blogSrc;

    buildInputs = with pkgs; [ jekyll ];

    phases = [ "unpackPhase" "buildPhase" ];

    buildPhase = ''
      jekyll build -d $out
    '';
  };
}
