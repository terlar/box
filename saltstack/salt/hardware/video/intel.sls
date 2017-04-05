video_intel_packages:
  pkg.installed:
    - pkgs:
      - xf86-video-fbdev
      - xf86-video-vesa
      # 2D-accelearation
      - xf86-video-intel-git
      # 3D-acceleration
      - mesa
