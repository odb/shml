source ./shml.sh

function run_tests {
  # Background
  ##
  assert_equal "$(bgcolor black 'foo')" \
          "$(echo -e '\033[40mfoo\033[49m')" \
          "black background color"

  assert_equal "$(bgcolor red 'foo')" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          "red background color"

  assert_equal "$(bgcolor green 'foo')" \
          "$(echo -e '\033[42mfoo\033[49m')" \
          "green background color"

  assert_equal "$(bgcolor yellow 'foo')" \
          "$(echo -e '\033[43mfoo\033[49m')" \
          "yellow background color"

  assert_equal "$(bgcolor blue 'foo')" \
          "$(echo -e '\033[44mfoo\033[49m')" \
          "blue background color"

  assert_equal "$(bgcolor magenta 'foo')" \
          "$(echo -e '\033[45mfoo\033[49m')" \
          "magenta background color"

  assert_equal "$(bgcolor cyan 'foo')" \
          "$(echo -e '\033[46mfoo\033[49m')" \
          "cyan background color"

  assert_equal "$(bgcolor gray 'foo')" \
          "$(echo -e '\033[47mfoo\033[49m')" \
          "gray background color"

  assert_equal "$(bgcolor gray 'foo')" \
          "$(echo -e '\033[47mfoo\033[49m')" \
          "gray background color"

  assert_equal "$(bgcolor darkgray 'foo')" \
          "$(echo -e '\033[100mfoo\033[49m')" \
          "darkgray background color"

  assert_equal "$(bgcolor lightred 'foo')" \
          "$(echo -e '\033[101mfoo\033[49m')" \
          "lightred background color"

  assert_equal "$(bgcolor lightgreen 'foo')" \
          "$(echo -e '\033[102mfoo\033[49m')" \
          "lightgreen background color"

  assert_equal "$(bgcolor lightyellow 'foo')" \
          "$(echo -e '\033[103mfoo\033[49m')" \
          "lightyellow background color"

  assert_equal "$(bgcolor lightblue 'foo')" \
          "$(echo -e '\033[104mfoo\033[49m')" \
          "lightblue background color"

  assert_equal "$(bgcolor lightmagenta 'foo')" \
          "$(echo -e '\033[105mfoo\033[49m')" \
          "lightmagenta background color"

  assert_equal "$(bgcolor lightcyan 'foo')" \
          "$(echo -e '\033[106mfoo\033[49m')" \
          "lightcyan background color"

  assert_equal "$(bgcolor white 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "white background color"

  # Terminators
  assert_equal "$(bgcolor white)foo$(bgcolor)" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          'color background and end color'

  assert_equal "$(bgcolor red)foo$(bgcolor end)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'color background and end color'

  assert_equal "$(bgcolor red)foo$(bgcolor off)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'color background and end color'

  assert_equal "$(bgcolor red)foo$(bgcolor reset)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'color background and end color'

  # Aliases
  assert_equal "$(bg white 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "'bg' alias works"

  assert_equal "$(bgc white 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "'bgc' alias works"

  assert_equal "$(background white 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "'background' alias works"

  # Mixed aliases
  assert_equal "$(bgcolor white)foo$(background)" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          'mixed aliases work'

  # Misc
  assert_equal "$(background 'white' 'foo bar')" \
          "$(echo -e '\033[107mfoo bar\033[49m')" \
          "single quotes and spaces work"

  assert_equal "$(background "white" "foo bar")" \
          "$(echo -e '\033[107mfoo bar\033[49m')" \
          "double quotes and spaces work"
}
