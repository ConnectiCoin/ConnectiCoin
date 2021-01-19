#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CONNECTICOIND=${CONNECTICOIND:-$SRCDIR/connecticoind}
CONNECTICOINCLI=${CONNECTICOINCLI:-$SRCDIR/connecticoin-cli}
CONNECTICOINTX=${CONNECTICOINTX:-$SRCDIR/connecticoin-tx}
CONNECTICOINQT=${CONNECTICOINQT:-$SRCDIR/qt/connecticoin-qt}

[ ! -x $CONNECTICOIND ] && echo "$CONNECTICOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
CTCVER=($($CONNECTICOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoind if --version-string is not set,
# but has different outcomes for bitcoin-qt and bitcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$CONNECTICOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $CONNECTICOIND $CONNECTICOINCLI $CONNECTICOINTX $CONNECTICOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${CTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${CTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
