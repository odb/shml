source ./shml.sh

function run_tests {
  # Confirm
  ##
  for __good in $(echo $__default_confirm_success_input); do
    echo "$__good" | confirm ""
    result=$?
    assert_equal "0" "$result" "$__good should confirm"
  done

  for __bad in $(echo "bad no N No"); do
    echo "$__bad" | confirm ""
    result=$?
    assert_equal "1" "$result" "$__bad should not confirm"
  done

  # test success callback
  output=$(echo "y" | confirm "" "__on_success__")
  assert_equal "success" $output "should print success"

  # test failure callback
  output=$(echo "n" | confirm "" "__on_success__" "__on_failure__")
  assert_equal "failure" $output "should print success"

  unset result
  unset output
}

# callbacks
__on_success__() {
  echo -n "success"
}

__on_failure__() {
  echo -n "failure"
}
