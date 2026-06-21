{
  dir_structure = [
    {
      name = "Assets";
      sub_dirs = [];
    }
    {
      name = "Components";
      sub_dirs = [];
    }
    {
      name = "Objects";
      sub_dirs = [];
    }
    {
      name = "Scenes";
      sub_dirs = [];
    }
    {
      name = "Globals";
      sub_dirs = [];
    }
    {
      name = "Tests";
      sub_dirs = [];
    }
    {
      name = "Builds";
      sub_dirs = [];
    }
    {
      name = "Lib";
      sub_dirs = [];
    }
  ];
  files = [
    {
      path = "flake.nix";
      content = builtins.readFile ./files/flake.nix;
      tracked = true;
    }
    {
      path = "Lib/Lib.cs";
      content = builtins.readFile ./files/lib.cs;
      tracked = false;
    }
    {
      path = "Tests/LibOptionTest.cs";
      content = builtins.readFile ./files/libOptionTest.cs;
      tracked = false;
    }
    {
      path = "Tests/LibResultTest.cs";
      content = builtins.readFile ./files/libResultTest.cs;
      tracked = false;
    }
    {
      path = "project.godot";
      content =
        /*
        toml
        */
        ''
          config_version=5

          [application]
            config/name="#{name}"
            config/features=PackedStringArray("4.6", "C#", "Forward Plus")

          [dotnet]
            project/assembly_name="#{name}"


          [file_customization]

          folder_colors={
          "res://Assets/": "purple",
          "res://Builds/": "gray",
          "res://Components/": "blue",
          "res://Globals/": "yellow",
          "res://Objects/": "teal",
          "res://Scenes/": "orange",
          "res://Tests/": "green",
          "res://Lib/": "red"
          }
        '';
      tracked = false;
    }
    {
      path = "#{name}.csproj";
      content =
        /*
        xml
        */
        ''
          <Project Sdk="Godot.NET.Sdk/4.6.2">
            <PropertyGroup>
              <TargetFramework>net8.0</TargetFramework>
              <TargetFramework Condition=" '$(GodotTargetPlatform)' == 'android' ">net9.0</TargetFramework>
              <EnableDynamicLoading>true</EnableDynamicLoading>
              <Nullable>enable</Nullable>
            </PropertyGroup>

            <ItemGroup>
              <Compile Remove="Tests\**\*.cs" />
            </ItemGroup>
          </Project>
        '';
      tracked = true;
    }
    {
      path = "Tests/Tests.csproj";
      content =
        /*
        xml
        */
        ''
          <Project Sdk="Microsoft.NET.Sdk">
            <PropertyGroup>
              <TargetFramework>net8.0</TargetFramework>
              <ImplicitUsings>enable</ImplicitUsings>
              <Nullable>enable</Nullable>
              <IsPackable>false</IsPackable>
              <IsTestProject>true</IsTestProject>

              <GodotProjectDir>$(MSBuildProjectDirectory)\..\..</GodotProjectDir>

              <EnableGodotSourceGenerators>false</EnableGodotSourceGenerators>
            </PropertyGroup>

            <ItemGroup>
              <PackageReference Include="coverlet.collector" Version="6.0.0" />
              <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.8.0" />
              <PackageReference Include="xunit" Version="2.5.3" />
              <PackageReference Include="xunit.runner.visualstudio" Version="2.5.3" />
              <PackageReference Include="GodotSharp" Version="4.6.2" />
            </ItemGroup>

            <ItemGroup>
              <Using Include="Xunit" />
            </ItemGroup>

            <ItemGroup>
              <ProjectReference Include="..\#{name}.csproj" />
            </ItemGroup>

            <ItemGroup>
              <Content Include="..\**\*.*" />
            </ItemGroup>
          </Project>
        '';
      tracked = true;
    }
    {
      path = ".rgignore";
      content = ''
        *

        !*.cs
        !*.gd
        !*.gdshader
        !*.glsl
      '';
      tracked = true;
    }
    {
      path = ".envrc";
      content = ''
        use flake
      '';
      tracked = true;
    }
    {
      path = ".gitignore";
      content = ''
        .godot/
        .nomedia/
        .import/
        export.cfg
        export_credentials.cfg
        *.translation
        .mono/
        data_*/
        mono_crash.*.json
        result
        .direnv
      '';
      tracked = true;
    }
    {
      path = ".justfile";
      content =
        /*
        just
        */
        ''
          default: build

          fmt:
            @gdformat .
            @dotnet format ./#{name}.csproj

          lint: fmt
            @gdlint .
            @dotnet build /warnaserror

          test: lint
            @dotnet test

          build: test
            @dotnet build

          push: build
            @git push
        '';
      tracked = true;
    }
    {
      path = "Assets/icon.svg";
      content = builtins.readFile ./files/godotIcon.svg;
    }
  ];
  build = [
    {
      program = "git";
      args = [
        "add"
        "-A"
      ];
    }
    {
      program = "nix";
      args = [
        "develop"
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "dotnet"
        "new"
        "sln"
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "dotnet"
        "sln"
        "add"
        "#{name}.csproj"
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "dotnet"
        "sln"
        "add"
        "./Tests/Tests.csproj"
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "dotnet"
        "new"
        "sln"
        "-o"
        "./Tests"
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "dotnet"
        "sln"
        "./Tests/Tests.sln"
        "add"
        "Tests.csproj"
      ];
    }
    {
      program = "direnv";
      args = [
        "allow"
      ];
    }
  ];
  run = [
    {
      program = "godot4.6-mono";
      args = [
        "--editor"
        "--path ."
      ];
    }
    {
      program = "direnv";
      args = [
        "exec"
        "."
        "neovide"
        "--wayland_app_id"
        "editor"
        "--"
        "--listen"
        "/tmp/godot.pipe"
      ];
    }
  ];
  included_paths = ["Components" "Objects" "Scenes" "Globals" "Tests" "Lib"];
  excluded_paths = ["Builds" ".godot" ".mono" "obj" "bin" "*.csproj" "*.sln"];
}
