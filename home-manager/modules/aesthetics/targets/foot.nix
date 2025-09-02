{ config, lib, ... }: let
  cfg = config.aesthetics.targets.foot;
  aes = config.aesthetics;
in {
  options.aesthetics.targets.foot.enable = lib.mkOption {
    type = lib.types.bool;
    default = (aes.enableAllTargets && aes.hasGui);
    description = "Whether to enable the aesthetics foot target.";
  };
  config = lib.mkIf (cfg.enable && config.programs.foot.enable) {
    programs.foot.settings = {
      main.font = "${aes.font.name}:size=${aes.font.size.small}";
      tweak.font-monospace-warn = false;
      colors = with aes.scheme; {
        background = base00;
        foreground = base05;

        # normal
        regular0 = base00;
        regular1 = base08;
        regular2 = base0B;
        regular3 = base0A;
        regular4 = base0D;
        regular5 = base0E;
        regular6 = base0C;
        regular7 = base05;

        # bright
        bright0 = base03;
        bright1 = base09;
        bright2 = base01;
        bright3 = base02;
        bright4 = base04;
        bright5 = base06;
        bright6 = base0F;
        bright7 = base07;

        # extended
        "16" = base09;
        "17" = base0F;
        "18" = base01;
        "19" = base02;
        "20" = base04;
        "21" = base06;

        # misc
        selection-background = base05;
        selection-foreground = base00;
        urls = base04;
        jump-labels = "${base00} ${base0A}";
        scrollback-indicator = "${base00} ${base04}";
      };
    };
  };
}
