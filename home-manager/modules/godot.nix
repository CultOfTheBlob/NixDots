{
  pkgs,
  config,
  lib,
  user,
  ...
}: let
  formatColor = color: "Color(${builtins.readFile (pkgs.runCommand "color" {} ''
    ${pkgs.pastel}/bin/pastel format rgb-float ${color} | sed -E 's/^rgb\\(|\\)$//' > $out
  '')})";
in {
  xdg.configFile = {
    godot-settings = {
      target = "godot/editor_settings-4.4.tres";

      text = ''
        [gd_resource type="EditorSettings" load_steps=3 format=3]

        [sub_resource type="InputEventKey" id="InputEventKey_gd5pb"]
        command_or_control_autoremap = true
        alt_pressed = true
        keycode = 75
        unicode = 75

        [sub_resource type="InputEventKey" id="InputEventKey_k5dlc"]
        keycode = 4194326

        [resource]
        interface/editor/main_font = "/home/${user}/.nix/home-manager/modules/assets/godot/DejaVuSansCondensed.ttf"
        interface/editor/main_font_bold = "/home/${user}/.nix/home-manager/modules/assets/godot/DejaVuSansCondensed-Bold.ttf"
        interface/editor/code_font = "/home/${user}/.nix/home-manager/modules/assets/godot/JetBrainsMonoNerdFontMono-Regular.ttf"
        interface/theme/preset = "Custom"
        interface/theme/base_color = ${formatColor config.colors.base00}
        interface/theme/accent_color = ${formatColor config.colors.base0D}
        interface/theme/contrast = 0.3
        interface/theme/corner_radius = 5
        interface/theme/custom_theme = "/home/${user}/.nix/home-manager/modules/assets/godot/minimal_theme.tres"
        filesystem/file_dialog/show_hidden_files = true
        text_editor/external/exec_path = "nvim"
        text_editor/external/exec_flags = "--server /tmp/godot.pipe --remote-send \"<esc>:n {file}<CR>:call cursor({line},{col})<CR>\""
        text_editor/external/use_external_editor = true
        editors/3d_gizmos/gizmo_settings/bone_axis_length = 0.1
        network/connection/network_mode = 1
        export/android/debug_keystore = "/home/${user}/.local/share/godot/keystores/debug.keystore"
        export/android/debug_keystore_pass = "android"
        export/android/java_sdk_path = ""
        export/android/android_sdk_path = "/home/${user}/Android/Sdk"
        export/macos/rcodesign = ""
        export/web/http_port = 8060
        export/web/tls_key = ""
        export/web/tls_certificate = ""
        export/windows/rcedit = ""
        export/windows/osslsigncode = ""
        export/windows/wine = ""
        _editor_settings_advanced_mode = true
        _project_settings_advanced_mode = true
        _export_template_download_directory = ""
        _default_feature_profile = ""
        _script_setup_templates_dictionary = {
        "CharacterBody2D": "0CharacterBody2DBasic Movement",
        "CharacterBody3D": "0CharacterBody3DBasic Movement",
        "Node": "0NodeDefault"
        }
        _use_favorites_root_selection = false
        dotnet/editor/external_editor = 0
        dotnet/editor/custom_exec_path = ""
        dotnet/editor/custom_exec_path_args = ""
        dotnet/build/verbosity_level = 2
        dotnet/build/problems_layout = 1
        _script_setup_use_script_templates = true
        network/language_server/show_native_symbols_in_editor = true
        shortcuts = [{
        "name": "editor/clear_output",
        "shortcuts": [SubResource("InputEventKey_gd5pb")]
        }, {
        "name": "spatial_editor/viewport_zoom_modifier_1",
        "shortcuts": [SubResource("InputEventKey_k5dlc")]
        }, {
        "name": "spatial_editor/viewport_zoom_modifier_2",
        "shortcuts": []
        }]
      '';
    };

    godot-layouts = {
      target = "godot/editor_layouts.cfg";

      text = lib.generators.toINI {} {
        Main = {
          dock_1 = "\"Scene,Import\"";
          dock_1_selected_tab_idx = 0;
          dock_3 = "\"Inspector,Node,History\"";
          dock_3_selected_tab_idx = 0;
          dock_floating = "{}";
          dock_filesystem_h_split_offset = 334;
          dock_filesystem_v_split_offset = 0;
          dock_filesystem_display_mode = 2;
          dock_filesystem_file_sort = 0;
          dock_filesystem_file_list_display_mode = 0;
          dock_filesystem_selected_paths = "PackedStringArray(\"res://Components/CharacterController/States/\")";
          dock_filesystem_uncollapsed_paths = "PackedStringArray(\"Favorites\", \"res://\", \"res://Components/\", \"res://Components/CharacterController/\")";
          dock_4 = "\"FileSystem\"";
          dock_node_current_tab = 0;
          dock_history_include_scene = true;
          dock_history_include_global = true;
          dock_bottom = "[\"FileSystem\"]";
          dock_closed = "[]";
          dock_split_1 = 0;
          dock_split_2 = 0;
          dock_hsplit_1 = 364;
          dock_hsplit_2 = 694;
          dock_hsplit_3 = -864;
          dock_hsplit_4 = 0;
        };
      };
    };
  };
}
