function run_tests {
  # Emojis
  ##
  assert_equal "$(emoji smiley)" '😃' \
                "draw smiley"

  assert_equal "$(emoji halo)" '😇' \
                "draw halo"

  assert_equal "$(emoji lol)" '😂' \
                "draw lol"

  assert_equal "$(emoji tongue)" '😛' \
                "draw tongue"

  assert_equal "$(emoji blush)" '😊' \
                "draw blush"

  assert_equal "$(emoji sad)" '😟' \
                "draw sad"

  assert_equal "$(emoji cry)" '😢' \
                "draw cry"

  assert_equal "$(emoji rage)" '😡' \
                "draw rage"

  assert_equal "$(emoji wave)" '👋' \
                "draw wave"

  assert_equal "$(emoji ok)" '👌' \
                "draw ok"

  assert_equal "$(emoji +1)" '👍' \
                "draw +1"

  assert_equal "$(emoji thumbsdown)" '👎' \
                "draw thumbsdown"

  assert_equal "$(emoji happycat)" '😺' \
                "draw happycat"

  assert_equal "$(emoji cat)" '🐱' \
                "draw cat"

  assert_equal "$(emoji dog)" '🐶' \
                "draw dog"

  assert_equal "$(emoji bee)" '🐝' \
                "draw bee"

  assert_equal "$(emoji pig)" '🐷' \
                "draw pig"

  assert_equal "$(emoji monkey)" '🐵' \
                "draw monkey"

  assert_equal "$(emoji cow)" '🐮' \
                "draw cow"

  assert_equal "$(emoji panda)" '🐼' \
                "draw panda"

  assert_equal "$(emoji raw)" '🍣' \
                "draw raw"

  assert_equal "$(emoji house)" '🏠' \
                "draw house"

  assert_equal "$(emoji eyeglasses)" '👓' \
                "draw eyeglasses"

  assert_equal "$(emoji smoke)" '🚬' \
                "draw smoke"

  assert_equal "$(emoji fire)" '🔥' \
                "draw fire"

  assert_equal "$(emoji poop)" '💩' \
                "draw poop"

  assert_equal "$(emoji beer)" '🍺' \
                "draw beer"

  assert_equal "$(emoji cookie)" '🍪' \
                "draw cookie"

  assert_equal "$(emoji lock)" '🔒' \
                "draw lock"

  assert_equal "$(emoji unlock)" '🔓' \
                "draw unlock"

  assert_equal "$(emoji star)" '⭐' \
                "draw star"

  assert_equal "$(emoji joker)" '🃏' \
                "draw joker"

  assert_equal "$(emoji check)" '✅' \
                "draw check"

  assert_equal "$(emoji xmark)" '❌' \
                "draw xmark"

  assert_equal "$(emoji loo)" '🚽' \
                "draw loo"

  assert_equal "$(emoji bell)" '🔔' \
                "draw bell"

  assert_equal "$(emoji search)" '🔎' \
                "draw search"

  assert_equal "$(emoji dart)" '🎯' \
                "draw dart"

  assert_equal "$(emoji cream)" '💵' \
                "draw cream"

  assert_equal "$(emoji thinking)" '💭' \
                "draw thinking"

  assert_equal "$(emoji luck)" '🍀' \
                "draw luck"

  # Aliases
  assert_equal "$(e luck)" '🍀' \
                "'e' alias work"

  # Misc
  assert_equal "$(emoji 'luck')" '🍀' \
                "draw with single quotes"

  assert_equal "$(emoji "luck")" '🍀' \
                "draw with double quotes"

  assert_equal "$(emoji somethingIdontKnowAbout)" '' \
                "fail gracefully"
}
