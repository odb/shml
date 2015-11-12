source ./shml.sh

function run_tests {
  # Attribute
  ##
  assert_equal "$(attribute bold)foo$(attribute end)" \
          "$(echo -e '\033[1mfoo\033[0m')" \
          'should return bold text and end'

  assert_equal "$(attribute dim)foo$(attribute)" \
          "$(echo -e '\033[2mfoo\033[0m')" \
          'should return dim text and end'

  assert_equal "$(attribute underline)foo$(attribute)" \
          "$(echo -e '\033[4mfoo\033[0m')" \
          'should return underlined text and end'

  assert_equal "$(attribute blink)foo$(attribute)" \
          "$(echo -e '\033[5mfoo\033[0m')" \
          'should return blinking text and end'

  assert_equal "$(attribute invert)foo$(attribute)" \
          "$(echo -e '\033[7mfoo\033[0m')" \
          'should return inverted text and end'

  assert_equal "$(attribute hidden)foo$(attribute)" \
          "$(echo -e '\033[8mfoo\033[0m')" \
          'should return hidden text and end'

  assert_equal "$(attribute bold)foo$(attribute end)" \
          "$(echo -e '\033[1mfoo\033[0m')" \
          'should return modified text and end'

  assert_equal "$(attribute bold)foo$(attribute off)" \
          "$(echo -e '\033[1mfoo\033[0m')" \
          'should return modified text and end'

  assert_equal "$(attribute bold)foo$(attribute reset)" \
          "$(echo -e '\033[1mfoo\033[0m')" \
          'should return modified text and end'

  # Attribute - a alias
  ##
  assert_equal "$(a bold)foo$(a)" \
          "$(echo -e '\033[1mfoo\033[0m')" \
          'should return bold text and end'
}
