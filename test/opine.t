#!/bin/sh

test_description='Test opine'

. ./sharness/sharness.sh

cd "$SHARNESS_TEST_DIRECTORY" || exit 1

test_expect_success 'Check mimetype' '
test "$(opine -t plain.txt)" = "text/plain"
'

test_expect_success 'Check symlink mimetype' '
test "$(opine -t symlink.txt)" = "text/plain"
'

test_expect_success 'Test opening file by mimetype' '
test "$(opine -c mimetype.conf plain.txt)" = "plain"
'

test_expect_success 'Test opening file by name' '
test "$(opine -c name.conf symlink.txt)" = "plain"
'

test_done

# vim: ft=sh
