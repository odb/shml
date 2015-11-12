source ./shml.sh

function run_tests {
  # Mixed
  ##
  assert_equal "$(bg white)$(c black foo)$(bg)" \
          "$(echo -e '\033[107m\033[30mfoo\033[39m\033[49m')" \
          'works with nested stuffs'

  assert_equal "$(bg "white")$(c 'black' "foo")$(bg "end")" \
          "$(echo -e '\033[107m\033[30mfoo\033[39m\033[49m')" \
          'works with mixed quoting'

  local example_string="foo bar\nbah\tbin"
  assert_equal "$(bg white)$(c black "$example_string")$(bg)" \
          "$(echo -e "\033[107m\033[30mfoo bar\nbah\tbin\033[39m\033[49m")" \
          "works with variables"

  unset example_string
}
