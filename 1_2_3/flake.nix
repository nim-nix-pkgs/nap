{
  description = ''Argument parser'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nap-1_2_3.flake = false;
  inputs.src-nap-1_2_3.owner = "madprops";
  inputs.src-nap-1_2_3.ref   = "1_2_3";
  inputs.src-nap-1_2_3.repo  = "nap";
  inputs.src-nap-1_2_3.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nap-1_2_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nap-1_2_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}