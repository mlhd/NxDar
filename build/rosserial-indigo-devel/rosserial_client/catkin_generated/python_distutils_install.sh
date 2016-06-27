#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/frank/Lidar/src/rosserial-indigo-devel/rosserial_client"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/frank/Lidar/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/frank/Lidar/install/lib/python2.7/dist-packages:/home/frank/Lidar/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/frank/Lidar/build" \
    "/usr/bin/python" \
    "/home/frank/Lidar/src/rosserial-indigo-devel/rosserial_client/setup.py" \
    build --build-base "/home/frank/Lidar/build/rosserial-indigo-devel/rosserial_client" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/frank/Lidar/install" --install-scripts="/home/frank/Lidar/install/bin"
