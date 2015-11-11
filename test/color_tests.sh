source ./shml.sh

function run_tests {
  # Background
  ##
  assert_equal "$(background white 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "should return white background, text and end color"

  assert_equal "$(background darkgray 'foo')" \
          "$(echo -e '\033[100mfoo\033[49m')" \
          "should return black background, text and end color"

  assert_equal "$(background black 'foo')" \
          "$(echo -e '\033[40mfoo\033[49m')" \
          "should return black background, text and end color"

  assert_equal "$(background white)foo$(background)" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          'should return white background, text and end color'

  assert_equal "$(background red)foo$(background end)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'should return red background, text and end color'

  # Background - bg alias
  ##
  assert_equal "$(bg 'white' 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "should return white background, text and end color"
}

function test_color_foreground {
  # Foreground - color
  ##
  assert_equal "$(color black 'foo')" \
          "$(echo -e '\033[30mfoo\033[39m')" \
          "should return black foreground, text and end color"

  assert_equal "$(color darkgray 'foo')" \
          "$(echo -e '\033[91mfoo\033[39m')" \
          "should return black foreground, text and end color"

  assert_equal "$(color white 'foo')" \
          "$(echo -e '\033[97mfoo\033[39m')" \
          "should return white foreground, text and end color"

  assert_equal "$(color e4e4e4 'foo')" \
          "$(echo -e '\033[90mfoo\033[39m')" \
          "should return e4e4e4 foreground, text and end color"

  assert_equal "$(color white)foo$(color)" \
          "$(echo -e '\033[97mfoo\033[39m')" \
          'should return white foreground, text and end color'

  assert_equal "$(color red)foo$(color 'end')" \
          "$(echo -e '\033[31mfoo\033[39m')" \
          'should return red foreground, text and end color'

  # Foreground - c alias
  ##
  assert_equal "$(c white 'foo')" \
          "$(echo -e '\033[97mfoo\033[39m')" \
          "should return white foreground, text and end color"
}

