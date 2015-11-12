source ./shml.sh

function run_tests {
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

