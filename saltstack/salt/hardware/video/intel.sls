# Currently trying without installing the xf86-video-intel package as it
# is often not recommended.
video_intel_packages:
  pkg.installed:
    - pkgs:
      - xf86-video-fbdev
      - xf86-video-vesa
      # 3D acceleration
      - mesa
