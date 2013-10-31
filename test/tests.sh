# file: tests.sh

source ./clistrap.sh

function before {
  true
}

function after {
  true
}

function run_tests {
####################################################
# Tests go here.
####################################################

  # Foreground - cs-color
  ##
  assert_equal "`cs-color 'black' 'foo'`" \
          "`echo -e '\033[30mfoo\033[39m'`" \
          "should return black foreground, text and end color"

  assert_equal "`cs-color 'darkgray' 'foo'`" \
          "`echo -e '\033[91mfoo\033[39m'`" \
          "should return black foreground, text and end color"

  assert_equal "`cs-color 'white' 'foo'`" \
          "`echo -e '\033[97mfoo\033[39m'`" \
          "should return white foreground, text and end color"

  assert_equal "`cs-color 'e4e4e4' 'foo'`" \
          "`echo -e '\033[90mfoo\033[39m'`" \
          "should return e4e4e4 foreground, text and end color"

  assert_equal "`cs-color`foo`cs-color 'end'`" \
          "`echo -e '\033[97mfoo\033[39m'`" \
          'should return white foreground, text and end color'

  assert_equal "`cs-color 'red'`foo`cs-color 'end'`" \
          "`echo -e '\033[31mfoo\033[39m'`" \
          'should return red foreground, text and end color'

  # Foreground - cs.color alias
  ##
  assert_equal "`cs.color 'white' 'foo'`" \
          "`echo -e '\033[97mfoo\033[39m'`" \
          "should return white foreground, text and end color"

  # Background
  ##

  assert_equal "`cs-bg-color 'white' 'foo'`" \
          "`echo -e '\033[107mfoo\033[49m'`" \
          "should return white background, text and end color"

  assert_equal "`cs-bg-color 'darkgray' 'foo'`" \
          "`echo -e '\033[100mfoo\033[49m'`" \
          "should return black background, text and end color"

  assert_equal "`cs-bg-color 'black' 'foo'`" \
          "`echo -e '\033[40mfoo\033[49m'`" \
          "should return black background, text and end color"

  assert_equal "`cs-bg-color`foo`cs-bg-color 'end'`" \
          "`echo -e '\033[40mfoo\033[49m'`" \
          'should return white background, text and end color'

  assert_equal "`cs-bg-color 'red'`foo`cs-bg-color 'end'`" \
          "`echo -e '\033[41mfoo\033[49m'`" \
          'should return red background, text and end color'

  # Mixed
  ##
  assert_equal "$(cs-bg-color white "$(cs-color black "foo")")" \
          "`echo -e '\033[107m\033[30mfoo\033[39m\033[49m'`" \
          'should return black text on white backround and end color'

  # Mixed
  ##

####################################################
}
