source ./shml.sh

function run_tests {
  # Elements
  ##
  assert_equal "$(br)" "$(echo -ne "\n\r")" "should line break"

  assert_equal "$(tab)" "$(echo -e '\t')" "should tab"

  assert_equal "$(indent)" "    " "should tab"
  assert_equal "$(indent 2)" "  " "should tab"
  assert_equal "$(i 2)" "  " "should tab"

  assert_equal "$(hr)" "------------------------------------------------------------" \
                "should draw default hr"

  assert_equal "$(hr 4)" "----" \
                "should draw hr 4 wide"

  assert_equal "$(hr '.' 4)" "...." \
                "should draw hr 4 wide with char"
}
