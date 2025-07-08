let { tap, hold, td, combo,encoder, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
let me = tap.custom.media in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in

# "cu" for custom keys. This is just a name, so it can be whatever you want.
let cu = {
  # Again, these are just names. They don't have to be 4-letter or capitalized.
  COPY = tap.reg.mod.lctl & kc.C,
  PSTE = tap.reg.mod.lctl & kc.V,
  CUT =  tap.reg.mod.lctl & kc.X,
  CLOS = tap.reg.mod.lalt & kc.F4,
  # Screenshot
  SCSH = tap.reg.mod.lgui & tap.reg.mod.lsft & kc.S,
} in

# 1 tap = play/pause. 2 taps = next track. 3 taps = prev track.
let my_playback_tap_dance = td.make 200 [
  me.PLAY,
  me.NEXT,
  me.PREV,
  # Reminder: These can be hold-taps for more complex behavior.
  # These can even be tap dances... for nested tap dances... but uh... why though?
] in


# Keymap definition
{
  virtual_keys = [
    # combo.make 50 [0, 1], // この行をコメントアウトまたは削除し、以下に置き換える
    {
      type = 'combo, # VirtualKey のタイプを 'combo に指定
      data = {
        timeout_ms = 50,
        key_indices = [0, 1], # ここで物理キーのインデックスを指定
        slow_release = false, # デフォルト値（keymap.ncl の定義に基づく）
        require_prior_idle_ms = 0, # デフォルト値（keymap.ncl の定義に基づく）
      }
    },
    encoder.ccw 0,
    encoder.cw 0,
  ],
  layers =[ 
    [
      kc.A, kc.B, 
      TTTT,
      kc.C, kc.D,
    ]
  ]  
}
