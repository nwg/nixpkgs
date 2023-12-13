{ stdenv
, lib
, fetchFromGitLab
, pkg-config
, meson
, ninja
, libinput
, cmake
, mtdev
, libevdev
, libwacom
, gtk4
, wayland-protocols
, check
}: stdenv.mkDerivation rec {
  pname = "libinput-config";
  version = "2023-11-23";

  src = fetchFromGitLab {
    owner = "warningnonpotablewater";
    repo = "libinput-config";
    rev = "2bd67e6c829b96c29dc23df28b1ad4191a602122";
#    sha256 = "sha256-gTcgEZ7cs4jq8w5Genxtio9nVFy7y3n0nNXJ6SVtYHY=";
#    sha256 = "sha256-gTcgEZ7cs4jq8w5Genxtio9nVFy7y3n0nNXJ6SVtYHY=";
    sha256 = "sha256-JqKlQTJ46NEY+EgZFTubPYV45ey5lfX/giKN0fJblQM=";
#    sha256 = "sha256-JqKlQTJ46NEY+EgZFTubPYV45ey5lfX/giKN0fJblQQ=";
  };

  nativeBuildInputs = [ meson ninja libinput pkg-config cmake mtdev libevdev libwacom gtk4 wayland-protocols check ];

#  doCheck = true;
#  checkTarget = [ "checkall" ];

  buildPhase = ''
    meson build
    cd build
    ninja
    ninja install
  '';

  meta = with lib; {
    description = "libinput-config allows you to configure your inputs in case your Wayland compositor doesn't have a certain config or has none";
    homepage =
      "https://gitlab.com/warningnonpotablewater/libinput-config";
    platforms = platforms.linux;
#    maintainers = with maintainers; [ abbradar lovesegfault ];
    license = licenses.isc;
  };
}
