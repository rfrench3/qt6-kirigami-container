FROM archlinux:latest

LABEL org.opencontainers.image.description="\
    Container image for kirigami app development. Based on Arch Linux. \
    An example devcontainer.json is provided in the project's repository."

RUN pacman -Syu --noconfirm \
    cmake \
    git \
    extra-cmake-modules \
    sudo \
    make \
    clang \
    qt6-base \
    qt6-languageserver \
    qt6-declarative \
    kirigami \
    kcoreaddons \
    kconfig \
    ki18n \
    kiconthemes \
    kirigami-addons \
    qqc2-desktop-style \
    qqc2-breeze-style \
    just 

# Create user with sudo access
RUN groupadd --gid 1000 user \
    && useradd --uid 1000 --gid 1000 -m -s /bin/bash user \
    && echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/user \
    && chmod 0440 /etc/sudoers.d/user

# Give user access to the input group
RUN groupadd -f input \
    && usermod -a -G input user

# Add welcome message to explain the slightly-off breeze theme
RUN echo 'echo "Welcome! The QML version of breeze, qqc2-breeze-style, is applied through QT_QUICK_CONTROLS_STYLE, and it can differ from the normal breeze theme."' >> /home/user/.bashrc

ENV QT_QUICK_CONTROLS_STYLE=org.kde.breeze
