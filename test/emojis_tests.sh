function test_emojis {
  # Emojis
  ##
  assert_equal "$(emoji brew)" '🍺' \
                "should draw beer"
}
