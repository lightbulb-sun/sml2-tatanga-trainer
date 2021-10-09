## Details

The purpose of this trainer patch is to better gauge what happens
during the Tatanga fight.
It can be restarted at any point by pressing
`[Start]`+`[Select]`+`[A]`+`[B]`.

### Prerequisites

Memory location `$ad1c` has two simultaneous functions:
* it acts as a countdown for when the next crescent should be launched,
* it determines the number of Tatanga's stun frames after being hit
  with a fireball.

So if the goal is a quick fight, it's advantageous to start launching
fireballs as late as possible, so there are as few stun frames as possible.

*BUT:* As soon as a new crescent gets launched,
that countdown gets reset to 255, which means shooting a fireball too late
results in a stun time of more than four seconds.

This countdown value will be referred to as `C/D` from now on.

### Example

This is what a session with the trainer looks like:

![tatanga_trainer_2x](https://user-images.githubusercontent.com/83726489/136659039-6f58627e-8ac6-4c44-9045-224074b8110a.png)

The information in the screenshot displays the following:

#### Top Row

* `→79` means the first right-press happened at the `C/D` value of 79,
* `B7` means the first B-press happened at the `C/D` value of 7,
* `[Fireball]x7` means 7 successful fireballs were launched,
* `4.2Hz` means there were 4.2 B-presses per second.

#### Second Row

* `3 0 253` means that three fireballs caused damage to Tatanga at the
  `C/D` values of 3, 0 and 253, showcasing the long stun timer
  described above,
* the grayed out fireballs indicate that a third fireball was requested,
  which the game won't allow,
* the skull means Mario took damage during the fight.

The first two rows are visible during the fight.
After either Mario or Tatanga die, or the player presses `[Start]`,
the full screen analysis table appears.

#### Table

The various columns and symbols mean the following:

* `N` is the number of the successfully launched fireball,
* `DEL` is the delta in frames between (un)successfully launched fireballs,
* `BEG` is the beginning frame of an (un)successfully launched fireball,
* `END` is the ending frame of a successfully launched fireball's
  lifecycle or the frame of a different event described below,
* `C/D` is Tatanga's countdown value that's also used in the first two rows.

The middle column shows what actually happened:

* `H` means Tatanga was hit,
* `x` means the fireball despawned without hitting anything,
* `S` means a stomp,
* `B` means a futile B-press after losing fire power,
* the skull means Mario took damage for the first time,
* the grayed out fireball means that the player requested to launch
  a third fireball while there still were two fireballs on screen,
  which the game won't let you.

Frame 0 is the one where the game hands you back control in the fight.

#### Debug version

To speed up practice, a debug version is included, which gets rid of
the music and reduces the wait time at the beginning of the fight.
