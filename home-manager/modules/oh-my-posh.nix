{config, ...}: {
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";

      palette = with config.colors; {
        main-bg = "#${base01}";
        terminal-red = "#${base08}";
        pistachio-green = "#${base0B}";
        terminal-green = "#${base0D}";
        terminal-blue = "#${base0F}";
        celeste-blue = "#${base07}";
        light-sky-blue = "#${base0C}";
        terminal-magenta = "#${base0E}";
      };

      blocks = [
        {
          alignment = "right";
          segments = [
            {
              background = "p:main-bg";
              foreground = "p:terminal-red";
              leading_diamond = "";
              style = "diamond";
              template = "{{ .UserName }}";
              trailing_diamond = " ";
              type = "session";
            }
            {
              background = "p:main-bg";
              foreground = "p:terminal-green";
              leading_diamond = "";
              properties = {style = "folder";};
              style = "diamond";
              template = " {{ .Path }}";
              trailing_diamond = "";
              type = "path";
            }
            {
              background = "p:main-bg";
              foreground = "p:terminal-blue";
              leading_diamond = " ";
              properties = {branch_icon = "";};
              style = "diamond";
              template = "{{ .HEAD }}";
              trailing_diamond = "";
              type = "git";
            }
            {
              background = "p:main-bg";
              foreground = "p:pistachio-green";
              leading_diamond = " ";
              properties = {fetch_version = false;};
              style = "diamond";
              template = "{{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}";
              trailing_diamond = "";
              type = "python";
            }
            {
              background = "p:main-bg";
              foreground = "p:light-sky-blue";
              leading_diamond = " ";
              properties = {fetch_version = false;};
              style = "diamond";
              template = "{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
              trailing_diamond = "";
              type = "go";
            }
            {
              background = "p:main-bg";
              foreground = "p:terminal-red";
              leading_diamond = " ";
              properties = {fetch_version = false;};
              style = "diamond";
              template = "{{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}";
              trailing_diamond = "";
              type = "java";
            }
          ];
          type = "prompt";
        }
        {
          alignment = "left";
          newline = true;
          segments = [
            {
              background = "p:main-bg";
              foreground = "p:terminal-magenta";
              leading_diamond = "";
              properties = {
                style = "austin";
                threshold = 150;
              };
              style = "diamond";
              template = "{{ .FormattedMs }}";
              trailing_diamond = " ";
              type = "executiontime";
            }
            {
              background = "p:main-bg";
              foreground = "p:celeste-blue";
              leading_diamond = "";
              style = "diamond";
              template = "❯";
              trailing_diamond = "";
              type = "text";
            }
          ];
          type = "prompt";
        }
      ];

      transient_prompt = {
        background = "transparent";
        foreground = "p:terminal-blue";
        template = "❯";
      };

      final_space = true;
      version = 3;
    };
  };
}
