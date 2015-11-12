source ./shml.sh

function run_tests {
  # Icons
  ##
  assert_equal "$(icon check)" "✓" \
                "draw check"

  assert_equal "$(icon xmark)" "✘" \
                "draw xmark"

  assert_equal "$(icon heart)" "❤" \
                "draw heart"

  assert_equal "$(icon sun)" "☀" \
                "draw sun"

  assert_equal "$(icon star)" "★" \
                "draw star"

  assert_equal "$(icon darkstar)" "☆" \
                "draw darkstar"

  assert_equal "$(icon umbrella)" "☂" \
                "draw umbrella"

  assert_equal "$(icon flag)" "⚑" \
                "draw flag"

  assert_equal "$(icon snow)" "❄" \
                "draw snow"

  assert_equal "$(icon music)" "♫" \
                "draw music"

  assert_equal "$(icon scissors)" "✂" \
                "draw scissors"

  assert_equal "$(icon tm)" "™" \
                "draw tm"

  assert_equal "$(icon copyright)" "©" \
                "draw copyright"

  assert_equal "$(icon apple)" "" \
                "draw apple"

  assert_equal "$(icon skull)" "☠" \
                "draw skull"

  assert_equal "$(icon face)" "☺" \
                "draw face"

  # Misc
  assert_equal "$(icon 'face')" "☺" \
                "works with single quotes"

  assert_equal "$(icon "face")" "☺" \
                "works with double quotes"

  assert_equal "$(icon "somethingThatWillNeverExist")" "" \
                "fails gracefully"
}
