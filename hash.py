#!/usr/bin/python3
import sys, binascii, zlib

filename = sys.argv[1]
file = open(filename, 'rb')
buf = file.read()

cksum_binascii = binascii.crc32(buf)
print(hex(cksum_binascii))

cksum_zlib = zlib.crc32(buf)
print(hex(cksum_zlib))

file.close()
