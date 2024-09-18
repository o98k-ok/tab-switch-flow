#!/usr/bin/osascript

set the_query to "{query}" 
tell application "iTerm"
    activate
    repeat with w in windows
        repeat with t in tabs of w
            repeat with s in sessions of t
              set the_name to the name of s
              if the_name = the_query then
                log the_name
                select w
                select t
                select s
                return
              end if
            end repeat
        end repeat
    end repeat
end tell