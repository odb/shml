# file: tests.sh

source ./shml.sh

# source all tests files
for f in ./test/*_tests.sh; do source $f; done

function run_tests {
####################################################
# Tests go here.
####################################################

  test_attributes
  test_color_background
  test_color_foreground
  test_elements
  test_emojis
  test_entities
  test_icons

  # Mixed
  ##
  assert_equal "$(bg white)$(c black foo)$(bg)" \
          "$(echo -e '\033[107m\033[30mfoo\033[39m\033[49m')" \
          'should return black text on white backround and end color'

####################################################
}

# vim: ft=sh:
