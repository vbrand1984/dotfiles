-- chezmoi:template: left-delimiter=@'{% right-delimiter=%}'@
@'{% if false -%}'@
-- vim: ft=lua
-- This template adds the process_is_running function which checks if a certain process is currently running
-- Used in Openbox pipemenu scripts
@'{%- end -%}'@

--== TEMPLATE START: processIsRunning.lua ==--

-- returns true if the process is running
local function process_is_running(the_process)
    local f = io.popen("pgrep --count '" .. the_process .. "' 2>/dev/null")
    local the_data = tonumber(f:read()) or 0
    f:close()
    return the_data > 0
end

--== TEMPLATE END: processIsRunning.lua ==--

@'{%- /* This deletes an empty string after the template */ -%}'@
