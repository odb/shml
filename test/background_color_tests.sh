source ./shml.sh

function run_tests {
  # Background
  ##
  assert_equal "$(bgcolor black 'foo')" \
          "$(echo -e '\033[40mfoo\033[49m')" \
          "returns black background color"

  assert_equal "$(bgcolor red 'foo')" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          "returns red background color"

  assert_equal "$(bgcolor green 'foo')" \
          "$(echo -e '\033[42mfoo\033[49m')" \
          "returns green background color"

  assert_equal "$(bgcolor yellow 'foo')" \
          "$(echo -e '\033[43mfoo\033[49m')" \
          "returns yellow background color"

  assert_equal "$(bgcolor blue 'foo')" \
          "$(echo -e '\033[44mfoo\033[49m')" \
          "returns blue background color"

  assert_equal "$(bgcolor magenta 'foo')" \
          "$(echo -e '\033[45mfoo\033[49m')" \
          "returns magenta background color"

  assert_equal "$(bgcolor cyan 'foo')" \
          "$(echo -e '\033[46mfoo\033[49m')" \
          "returns cyan background color"

  assert_equal "$(bgcolor gray 'foo')" \
          "$(echo -e '\033[47mfoo\033[49m')" \
          "returns gray background color"

  assert_equal "$(bgcolor gray 'foo')" \
          "$(echo -e '\033[47mfoo\033[49m')" \
          "returns gray background color"

  assert_equal "$(bgcolor darkgray 'foo')" \
          "$(echo -e '\033[100mfoo\033[49m')" \
          "returns darkgray background color"

  assert_equal "$(bgcolor lightred 'foo')" \
          "$(echo -e '\033[101mfoo\033[49m')" \
          "returns lightred background color"

  assert_equal "$(bgcolor lightgreen 'foo')" \
          "$(echo -e '\033[102mfoo\033[49m')" \
          "returns lightgreen background color"

  assert_equal "$(bgcolor lightyellow 'foo')" \
          "$(echo -e '\033[103mfoo\033[49m')" \
          "returns lightyellow background color"

  assert_equal "$(bgcolor lightblue 'foo')" \
          "$(echo -e '\033[104mfoo\033[49m')" \
          "returns lightblue background color"

  assert_equal "$(bgcolor lightmagenta 'foo')" \
          "$(echo -e '\033[105mfoo\033[49m')" \
          "returns lightmagenta background color"

  assert_equal "$(bgcolor lightcyan 'foo')" \
          "$(echo -e '\033[106mfoo\033[49m')" \
          "returns lightcyan background color"

  assert_equal "$(bgcolor white 'foo')" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          "returns white background color"

  # Terminators
  assert_equal "$(bgcolor white)foo$(bgcolor)" \
          "$(echo -e '\033[107mfoo\033[49m')" \
          'returns color background and end color'

  assert_equal "$(bgcolor red)foo$(bgcolor end)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'returns color background and end color'

  assert_equal "$(bgcolor red)foo$(bgcolor off)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'returns color background and end color'

  assert_equal "$(bgcolor red)foo$(bgcolor reset)" \
          "$(echo -e '\033[41mfoo\033[49m')" \
          'returns color background and end color'

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
