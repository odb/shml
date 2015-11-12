source ./shml.sh

function run_tests {
  # Elements
  ##
  assert_equal "$(br)" "$(echo -ne "\n\r")" "line break"

  assert_equal "$(tab)" "$(echo -e '\t')" "tab"

  assert_equal "$(indent)" "    " "indent 4 spaces"
  assert_equal "$(indent 2)" "  " "indent 2 spaces"
  assert_equal "$(i 2)" "  " "'i' alias work"

  assert_equal "$(hr)" "------------------------------------------------------------" \
                "draw default hr"

  assert_equal "$(hr 4)" "----" \
                "draw hr 4 wide"

  assert_equal "$(hr '.' 4)" "...." \
                "draw hr 4 wide with char"
}
