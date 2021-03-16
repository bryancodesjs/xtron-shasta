import sys
import hashlib
import base58

def hex_to_address(hexaddr):
    checksum = hashlib.sha256(hashlib.sha256(bytes.fromhex(hexaddr)).digest()).digest()[0:4].hex()
    addrchecksum = hexaddr + checksum
    base58addr = base58.b58encode(bytes.fromhex(addrchecksum)).decode('utf-8')
    return base58addr

def main():
    print(hex_to_address(sys.argv[1]))

if __name__ == '__main__':
    main()
