#
# Linker script for Concentration Room (lite version)
# Copyright 2010 Damian Yerrick
#
# Copying and distribution of this file, with or without
# modification, are permitted in any medium without royalty
# provided the copyright notice and this notice are preserved.
# This file is offered as-is, without any warranty.
#
MEMORY {
  ZP:     start = $10, size = $f0, type = rw;
  # use first $10 zeropage locations as locals
  RAM:    start = $0300, size = $0500, type = rw;
  ROM7:    start = $C000, size = $4000, type = ro, file = %O, fill=yes, fillval=$FF;
}

SEGMENTS {
  ZEROPAGE: load = ZP, type = zp;
  BSS:      load = RAM, type = bss, define = yes, align = $100;
  DMC:      load = ROM7, type = ro, align = 64, optional = yes;
  CODE:     load = ROM7, type = ro, align = $100;
  RODATA:   load = ROM7, type = ro, align = $100;
  VECTORS:  load = ROM7, type = ro, start = $FFFA;
}

FILES {
  %O: format = bin;
}

