source ./shml.sh

function run_tests {
  # Dialog
  ##
  output=$(echo "foo" | dialog "")
  assert_equal "foo" $output "should print input"

  output=$(echo -e "foo\nbar" | dialog "")
  assert_equal "foo" $output "should only print first line of input"

  unset output
}
