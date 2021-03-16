import sys
import hashlib
import base58

def address_to_hex(base58addr):
    addrchecksum = base58.b58decode(base58addr).hex()
    address = addrchecksum[0:42]
    checksum = hashlib.sha256(hashlib.sha256(bytes.fromhex(address)).digest()).digest()[0:4].hex()
    if checksum != addrchecksum[42:]:
        raise ValueError("Invalid checksum")
    return address

def main():
    print(address_to_hex(sys.argv[1]))

if __name__ == '__main__':
    main()
