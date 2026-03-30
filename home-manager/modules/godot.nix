{
  pkgs,
  config,
  user,
  lib,
  ...
}: let
  formatColor = color:
    builtins.readFile (pkgs.runCommand "color" {
        nativeBuildInputs = [pkgs.pastel pkgs.gnused pkgs.coreutils];
      } ''
        pastel format rgb-float "${color}" \
          | sed -E 's/^rgb\((.*)\)$/Color(\1, 1)/' \
          | tr -d '\n' \
          > "$out"
      '');
in {
  xdg.configFile = {
    godot-settings = {
      target = "godot/editor_settings-4.6.tres";

      text = ''
        [gd_resource type="EditorSettings" format=3]

        [sub_resource type="InputEventKey" id="InputEventKey_x4my5"]
        command_or_control_autoremap = true
        alt_pressed = true
        keycode = 75
        unicode = 75

        [sub_resource type="InputEventKey" id="InputEventKey_nmlct"]
        keycode = 4194326

        [resource]
        interface/editor/code_font_contextual_ligatures = 0
        interface/editor/main_font = "/home/${user}/.nix/home-manager/modules/assets/godot/DejaVuSansCondensed.ttf"
        interface/editor/main_font_bold = "/home/${user}/.nix/home-manager/modules/assets/godot/DejaVuSansCondensed-Bold.ttf"
        interface/editor/code_font = "/home/${user}/.nix/home-manager/modules/assets/godot/JetBrainsMonoNerdFontMono-Regular.ttf"
        interface/theme/color_preset = "Custom"
        interface/theme/base_color = ${formatColor config.colors.base00}
        interface/theme/accent_color = ${formatColor config.colors.base0D}
        interface/theme/contrast = 0.3
        text_editor/theme/highlighting/symbol_color = Color(0.67, 0.79, 1, 1)
        text_editor/theme/highlighting/keyword_color = Color(1, 0.44, 0.52, 1)
        text_editor/theme/highlighting/control_flow_keyword_color = Color(1, 0.55, 0.8, 1)
        text_editor/theme/highlighting/base_type_color = Color(0.26, 1, 0.76, 1)
        text_editor/theme/highlighting/engine_type_color = Color(0.56, 1, 0.86, 1)
        text_editor/theme/highlighting/user_type_color = Color(0.78, 1, 0.93, 1)
        text_editor/theme/highlighting/comment_color = Color(1, 1, 1, 0.5)
        text_editor/theme/highlighting/doc_comment_color = Color(0.6, 0.7, 0.8, 0.8)
        text_editor/theme/highlighting/string_color = Color(1, 0.93, 0.63, 1)
        text_editor/theme/highlighting/background_color = Color(0.11545098, 0.1305098, 0.16062745, 1)
        text_editor/theme/highlighting/completion_background_color = Color(0.16415687, 0.18556863, 0.22839217, 1)
        text_editor/theme/highlighting/completion_selected_color = Color(1, 1, 1, 0.07)
        text_editor/theme/highlighting/completion_existing_color = Color(1, 1, 1, 0.14)
        text_editor/theme/highlighting/completion_font_color = Color(1, 1, 1, 0.75)
        text_editor/theme/highlighting/text_color = Color(1, 1, 1, 0.75)
        text_editor/theme/highlighting/line_number_color = Color(1, 1, 1, 0.5)
        text_editor/theme/highlighting/safe_line_number_color = Color(1, 1.2, 1, 0.75)
        text_editor/theme/highlighting/caret_color = Color(1, 1, 1, 1)
        text_editor/theme/highlighting/selection_color = Color(0.5058824, 0.6313726, 0.75686276, 0.4)
        text_editor/theme/highlighting/brace_mismatch_color = Color(1, 0.47, 0.42, 1)
        text_editor/theme/highlighting/current_line_color = Color(1, 1, 1, 0.07)
        text_editor/theme/highlighting/line_length_guideline_color = Color(0.18039216, 0.20392157, 0.2509804, 1)
        text_editor/theme/highlighting/word_highlighted_color = Color(1, 1, 1, 0.07)
        text_editor/theme/highlighting/number_color = Color(0.63, 1, 0.88, 1)
        text_editor/theme/highlighting/function_color = Color(0.34, 0.7, 1, 1)
        text_editor/theme/highlighting/member_variable_color = Color(0.736, 0.88, 1, 1)
        text_editor/theme/highlighting/mark_color = Color(1, 0.47, 0.42, 0.3)
        text_editor/theme/highlighting/warning_color = Color(0.83, 0.78, 0.62, 0.15)
        text_editor/theme/highlighting/breakpoint_color = Color(1, 0.47, 0.42, 1)
        text_editor/theme/highlighting/code_folding_color = Color(1, 1, 1, 0.27)
        text_editor/theme/highlighting/search_result_color = Color(1, 1, 1, 0.07)
        editors/3d_gizmos/gizmo_settings/bone_axis_length = 0.1
        editors/animation/default_animation_step = 0.033333335
        run/platforms/linuxbsd/prefer_wayland = true
        _export_preset_advanced_mode = false
        export/android/debug_keystore = "/home/${user}/.local/share/godot/keystores/debug.keystore"
        export/android/debug_keystore_pass = "android"
        export/android/java_sdk_path = ""
        export/android/android_sdk_path = "/home/${user}/Android/Sdk"
        export/android/scrcpy/screen_size = "1920x1080/120"
        export/macos/rcodesign = ""
        export/macos/actool = ""
        export/web/http_port = 8060
        export/web/tls_key = ""
        export/web/tls_certificate = ""
        export/windows/osslsigncode = ""
        _editor_settings_advanced_mode = false
        _project_settings_advanced_mode = false
        _export_template_download_directory = ""
        _default_feature_profile = ""
        _script_setup_templates_dictionary = {}
        _script_setup_use_script_templates = true
        _use_favorites_root_selection = false
        dotnet/editor/external_editor = 0
        dotnet/editor/custom_exec_path = ""
        dotnet/editor/custom_exec_path_args = ""
        dotnet/build/verbosity_level = 2
        dotnet/build/problems_layout = 1
        shortcuts = [{
        "name": "editor/clear_output",
        "shortcuts": [SubResource("InputEventKey_x4my5")]
        }, {
        "name": "spatial_editor/viewport_zoom_modifier_1",
        "shortcuts": [SubResource("InputEventKey_nmlct")]
        }, {
        "name": "spatial_editor/viewport_zoom_modifier_2",
        "shortcuts": []
        }]
      '';
    };
  };
}
