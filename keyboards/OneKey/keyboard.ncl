let { DirectPinKey,PhysicalEncoder, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  usb_dev = {
    vendor_id = 12023,  # 0x2ef7
    product_id = 512, # 0xBABE
    product_ver = 256,  # 0x0200
  },
  encoders =
  let E = PhysicalEncoder in
  [
  E 15 14 2,
  ],
  keys =
    let D = DirectPinKey in
    [
      D 16, D 17,
    ]
}