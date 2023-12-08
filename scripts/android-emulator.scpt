set alreadyRunning to true
try 
    do shell script "ps -ecwwo pid,comm | grep \"qemu-system-aarch64\""
on error err
    set alreadyRunning to false
    do shell script "~/Library/Android/sdk/emulator/emulator @Pixel_6a_API_34 > /dev/null 2>&1 &"
end try
if alreadyRunning is true then
    tell application "System Events"
        tell application process "qemu-system-aarch64"
            set frontmost to true
        end tell
    end tell
end if
