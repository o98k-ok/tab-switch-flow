#!/usr/bin/osascript

set json_items to {}

tell application "iTerm"
    set session_names to {}
    repeat with w in windows
        repeat with t in tabs of w
            repeat with s in sessions of t
                copy name of s to end of session_names
            end repeat
        end repeat
    end repeat

    repeat with n in session_names
        set end of json_items to "{\"title\":\"" & n & "\", \"arg\":\"" & n & "\"},"
    end repeat
end tell


set json_output to text 1 thru -2 of (items of json_items as string)

set json_output to "{\"items\": [" & json_output & "]}"

return json_output
