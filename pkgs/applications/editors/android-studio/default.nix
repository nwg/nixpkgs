{ callPackage, makeFontsConf, gnome2, buildFHSUserEnv, tiling_wm ? false }:

let
  mkStudio = opts: callPackage (import ./common.nix opts) {
    fontsConf = makeFontsConf {
      fontDirectories = [];
    };
    inherit (gnome2) GConf gnome_vfs;
    inherit buildFHSUserEnv;
    inherit tiling_wm;
  };
  stableVersion = {
    version = "2021.3.1.16"; # "Android Studio Dolphin (2021.3.1)"
    sha256Hash = "GnJbWFeG9DuUQzbK9wM2BEbj9LXm4jQFf/Eh5Q75HZo=";
  };
  betaVersion = {
    version = "2021.3.1.14"; # "Android Studio Dolphin (2021.3.1) Beta 5"
    sha256Hash = "k1Qt54u45rwHsQNz9TVqnFB65kBKtfFZ3OknpfutKPI=";
  };
  latestVersion = { # canary & dev
    version = "2022.2.1.2"; # "Android Studio Flamingo (2022.2.1) Canary 2"
    sha256Hash = "hlHlgyl9If2LH4aExpElx0rqmWeoFX+qx4w6RRb5e8U=";
  };
in {
  # Attributes are named by their corresponding release channels

  stable = mkStudio (stableVersion // {
    channel = "stable";
    pname = "android-studio";
  });

  beta = mkStudio (betaVersion // {
    channel = "beta";
    pname = "android-studio-beta";
  });

  dev = mkStudio (latestVersion // {
    channel = "dev";
    pname = "android-studio-dev";
  });

  canary = mkStudio (latestVersion // {
    channel = "canary";
    pname = "android-studio-canary";
  });
}
