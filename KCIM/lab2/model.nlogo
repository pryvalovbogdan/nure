breed [ people person ]
breed [ trees tree ]
breed [ wind-paths wind-path ]

turtles-own [ health ]

patches-own [
  pollution
  is-power-plant?
]

to setup
  clear-all

  set-default-shape people "person"
  set-default-shape trees "tree"

  ask patches [
    set pollution 0
    set is-power-plant? false
  ]

  create-wind-paths 100 [
    setxy random-pxcor random-pycor
    set color blue - 2
    set size 0.5
  ]

  create-power-plants

  ask patches [ pollute ]

  create-people initial-population [
    set color black
    setxy random-pxcor random-pycor
    set health 5
  ]

  reset-ticks
end

to go

  if not any? people [ stop ]

  ask people [
    wander
    reproduce
    maybe-plant
    eat-pollution
    maybe-die
  ]

  diffuse pollution 0.8

  ask patches [ pollute ]

  ask wind-paths [
    move
  ]

  ask trees [
    cleanup
    maybe-die
  ]

  tick
end

to create-power-plants
  ask n-of power-plants patches [
    set is-power-plant? true
  ]
end

to pollute  ;; patch procedure
  if is-power-plant? [
    set pcolor red
    set pollution polluting-rate
  ]

 if pollution > 0 [
    set pollution pollution - (pollution * wind-speed / 100)
  ]

  set pcolor scale-color red (pollution - .1) 5 0
end

to move  ;; wind-path procedure
  rt random-float 30 - random-float 30
  fd wind-speed
  if pcolor = red [ set color blue - 2 ]
end

to cleanup  ;; tree procedure
  set pcolor green + 3
  set pollution max (list 0 (pollution - 1))
  ask neighbors [
    set pollution max (list 0 (pollution - .5))
  ]
  set health health - 0.1
end

to spread-pollution  ;; patch procedure
  ask neighbors4 [
    set pollution pollution + (([pollution] of myself) * wind-speed / 100) * cos(wind-direction)
  ]
end

to wander  ;; person procedure
  rt random-float 50
  lt random-float 50
  fd 1
  set health health - 0.1
end

to reproduce  ;; person procedure
  if health > 4 and random-float 1 < birth-rate + power-plant-influence [
    hatch-people 1 [
      set health 5
    ]
  ]
end

to maybe-plant  ;; person procedure
  if random-float 1 < planting-rate + power-plant-influence [
    hatch-trees 1 [
      set health 5
      set color green
    ]
  ]
end

to update-power-plant-influence
  ask patches with [is-power-plant? = true] [
    ask neighbors [
      set power-plant-influence power-plant-influence + 0.1
    ]
  ]
end

to update-clean-energy-effect
  ask patches with [clean-energy > 0] [
    ask neighbors [
      set birth-rate birth-rate + (clean-energy * 0.001)
    ]
  ]
end

to eat-pollution  ;; person procedure
  if pollution > 0.5 [
    let reaction-effect 0.05 ; коефіцієнт реакції на забруднення
    set health (health - ((pollution / 10) * reaction-effect)) ; зменшуємо вплив забруднення
  ]
end


to maybe-die  ;; die if you run out of health
  if health <= 0 [ die ]
end


; Copyright 2007 Uri Wilensky.
; See Info tab for full copyright and license.