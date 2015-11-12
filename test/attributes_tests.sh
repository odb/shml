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

  # Attribute - a alias
  ##
  assert_equal "$(a bold)foo$(a)" \
          "$(echo -e '\033[1mfoo\033[0m')" \
          'should return bold text and end'
}
