#!/bin/sh

# Package
PACKAGE="glusterfs"
DNAME="GlusterFS"
INSTALL_DIR="/var/packages/${PACKAGE}/target"

# Others
NAME=glusterd
DAEMON="${INSTALL_DIR}/sbin/${NAME}"
PIDFILE="${INSTALL_DIR}/var/run/${NAME}.pid"


do_start()
{
    PIDf=`test -f $PIDFILE && cat $PIDFILE`
    PIDp=`pidof $NAME`
    if [ -n "$PIDf" -a -n "$PIDp" ]; then
        echo "$NAME is already running with PID $PIDp (pidfile: $PIDf)"
        exit 0
    elif [ -z "$PIDf" -a -z "$PIDp" ]; then
        echo "Starting $NAME..."
        "${DAEMON}" "--pid-file=${PIDFILE}" &
        exit $?
    else
        echo "Something is wrong. PID of $NAME is $PIDp, pidfile: $PIDf"
        exit 1
    fi
}


do_stop()
{
    PIDf=`test -f $PIDFILE && cat $PIDFILE`
    PIDp=`pidof $NAME`
    if [ -z "$PIDf" -a -z "$PIDp" ]; then
        echo "$NAME has already been stopped"
        exit 0
    else
        echo "Stopping $NAME..."
        if [ -n "$PIDf" ]; then
            kill "$PIDf"
        fi
        if [ -n "$PIDp" ]; then
            kill "$PIDp"
        fi
        exit 0
    fi
}


do_status()
{
    PIDf=`test -f $PIDFILE && cat $PIDFILE`
    PIDp=`pidof $NAME`
    if [ -z "$PIDf" -a -z "$PIDp" ]; then
        echo "$NAME is stopped"
        exit 0
    elif [ -z "$PIDp" -a -n "$PIDf" ]; then
        echo "$NAME is stopped, but pidfile is not removed (contains: $PIDf)"
        exit 1
    else
        echo "$NAME is running (PID=$PIDp, pidfile: $PIDf)"
        exit 0
    fi
}


case "$1" in
  start)
        do_start
        ;;
  stop)
        do_stop
        ;;
  status)
        do_status;
        ;;
  restart|force-reload)
        do_stop
        sleep 2
        do_start
        ;;
  *)
        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
        exit 3
        ;;
esac


