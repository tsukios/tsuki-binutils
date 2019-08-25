#as: --pic --no-underscore --em=criself
#ld: --shared -m crislinux --hash-style=sysv
#source: tls-gd-1.s
#source: tls128.s
#source: tls-x.s
#objdump: -s -t -R -p -T

# DSO with a single R_CRIS_16_GOT_GD.  Check that we have proper
# NPTL/TLS markings and GOT.

.*:     file format elf32-cris

Program Header:
    LOAD off    0x0+ vaddr 0x0+ paddr 0x0+ align 2\*\*13
         filesz 0x0+144 memsz 0x0+144 flags r-x
    LOAD off    0x0+144 vaddr 0x0+2144 paddr 0x0+2144 align 2\*\*13
         filesz 0x0+108 memsz 0x0+108 flags rw-
 DYNAMIC off    0x0+1c8 vaddr 0x0+21c8 paddr 0x0+21c8 align 2\*\*2
         filesz 0x0+70 memsz 0x0+70 flags rw-
     TLS off    0x0+144 vaddr 0x0+2144 paddr 0x0+2144 align 2\*\*2
         filesz 0x0+84 memsz 0x0+84 flags r--

Dynamic Section:
  HASH                 0x0+b4
  STRTAB               0x0+124
  SYMTAB               0x0+d4
  STRSZ                0x0+d
  SYMENT               0x0+10
  RELA                 0x0+134
  RELASZ               0x0+c
  RELAENT              0x0+c
private flags = 0:

SYMBOL TABLE:
#...
0+80 g       \.tdata	0+4 x
#...
DYNAMIC SYMBOL TABLE:
#...
0+80 g    D  \.tdata	0+4 x
#...

DYNAMIC RELOCATION RECORDS
OFFSET   TYPE              VALUE 
0+2244 R_CRIS_DTP        x

Contents of section \.hash:
#...
Contents of section \.text:
 0140 5fae0c00                             .*
#...
Contents of section \.got:
 2238 c8210+ 0+ 0+ 0+  .*
 2248 0+                             .*
