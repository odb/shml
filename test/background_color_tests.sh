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
