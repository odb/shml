source ./shml.sh

function run_tests {
  # Icons
  ##
  assert_equal "$(icon smile)" '☺' \
                "should draw smile"
}
