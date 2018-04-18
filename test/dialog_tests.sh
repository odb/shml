source ./shml.sh

__test_callback__() {
  #noop
  echo "$1"
}

function run_tests {
  # Dialog
  ##
  output=$(echo "foo" | dialog "question" "__test_callback__")
  assert_equal "question foo" "$output" "should print input"

  unset output
}
