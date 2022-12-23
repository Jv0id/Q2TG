{ pkgs, flakePkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; with flakePkgs; [
    yarn
    nodejs-18_x
    python3
    ffmpeg
    prisma-patched
    pkg-config
    (vips.override {
      libjxl = pkgs.libjxl.overrideAttrs (attrs: {
        doCheck = false;
      });
    })
  ];

  TGS_TO_GIF = "${flakePkgs.tgs-to-gif}/bin/tgs-to-gif";
  PRISMA_MIGRATION_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/migration-engine";
  PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
  PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
  PRISMA_INTROSPECTION_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/introspection-engine";
  PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
}