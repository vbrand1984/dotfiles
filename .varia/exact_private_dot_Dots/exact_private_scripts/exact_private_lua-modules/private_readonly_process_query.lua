local process_query = {}

-- This function returns true if a specified process is currently running

function process_query.is_running(the_process)
	local f = io.popen("pgrep --count '" .. the_process .. "' 2>/dev/null")
	local the_data = tonumber(f:read()) or 0
	f:close()
	return the_data > 0
end

return process_query
