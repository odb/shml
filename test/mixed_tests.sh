source ./shml.sh

function run_tests {
  # Mixed
  ##
  assert_equal "$(bg white)$(c black foo)$(bg)" \
          "$(echo -e '\033[107m\033[30mfoo\033[39m\033[49m')" \
          'should return black text on white backround and end color'
}
