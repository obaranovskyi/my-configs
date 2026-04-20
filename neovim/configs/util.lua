local M = {}

-- Get the visual selection in the current buffer
function M.get_visual_selection()
	local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
	local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
	local lines = vim.fn.getline(csrow, cerow)
	if #lines == 0 then
		return ""
	end
	lines[1] = string.sub(lines[1], cscol)
	lines[#lines] = string.sub(lines[#lines], 1, cecol)
	return table.concat(lines, "\n"):gsub("%)$", "")
end

-- Get the current file name
function M.get_current_file()
	return vim.fn.expand("%:t")
end

-- Get the directory of the current file
function M.get_current_file_directory()
	return vim.fn.expand("%:p:h")
end

--- This function extracts the filename from a given path.
-- @param path The path to extract the filename from.
-- @return The filename as a string.
-- @usage
-- local filename = get_filename_from_path("./a/b/c/index.md")
function M.get_filename_from_path(path)
	return path:match("([^/]+)$")
end

--- This function converts a filename to Pascal case.
-- It first extracts the filename without the extension, then replaces hyphens with spaces,
-- and finally capitalizes the first letter of each word.
-- @param path The path to extract the filename from and convert to Pascal case.
-- @return The filename in Pascal case as a string.
-- @usage
-- local filename = get_pascal_case_filename("./a/b/c/hello-world.md")
function M.get_pascal_case_filename(path)
	local filename = path:match("([^/]+)%.md$")
	filename = filename:gsub("-", " ")
	filename = filename:gsub("(%a)([%w_']*)", function(first, rest)
		return first:upper() .. rest:lower()
	end)
	return filename
end

-- Create a directory if it does not exist
function M.create_dir_if_not_exists(dir)
	if vim.fn.glob(dir) == "" then
		vim.fn.mkdir(dir, "p")
	end
end

--- This function creates a file if it does not exist and writes the provided content into it.
-- If no content is provided, it creates an empty file.
-- @param path The path of the file to create.
-- @param content The content to write into the file. Optional.
-- @usage
-- M.create_file_if_not_exists("./a/b/c/index.md", "Hello, World!")
function M.create_file_if_not_exists(path, content)
	if vim.fn.glob(path) == "" then
		local file = io.open(path, "w")
		if content then
			file:write(content)
		end
		file:close()
	end
end

-- This function retrieves a visual selection, which can be a relative path like `./path/to/file.md`
-- or an absolute path like `path/to/file.md`. If the file specified in the path does not exist,
-- the function will create it. Similarly, if the directories specified in the path do not exist,
-- the function will create them as well.
function M.create_file_from_visual_selection()
	local path = M.get_visual_selection()
	local current_dir = M.get_current_file_directory()
	path = current_dir .. "/" .. path
	local dir = path:match("(.*[/\\])")
	M.create_dir_if_not_exists(dir)
	M.create_file_if_not_exists(path)
end

--- This function calculates the relative path to the root from a given path.
function M.calculate_relative_path(path)
	if string.sub(path, 1, 2) == "./" then
		path = string.sub(path, 3)
	end

	local count = 0
	for _ in string.gmatch(path, "/") do
		count = count + 1
	end
	local relative_path = string.rep("../", count)
	return relative_path
end

--- This function creates a new file from a visual selection and adds a link to the original file.
-- It first retrieves the base path from the visual selection and the current directory and file.
-- Then it constructs the full path of the new file and extracts the directory part of the path.
-- It calculates the relative path from the base path to the current file and constructs the title of the new file in Pascal case.
-- The content of the new file includes a link to the original file and a title.
-- Finally, it creates the directory if it does not exist and creates the new file with the constructed content.
-- @usage
-- M.create_file_from_visual_selection_with_link()
function M.create_file_from_visual_selection_with_link()
	local basePath = M.get_visual_selection()
	local current_dir = M.get_current_file_directory()
	local current_file = M.get_current_file()
	local path = current_dir .. "/" .. basePath
	local dir = path:match("(.*[/\\])")
	local file_content_path = M.calculate_relative_path(basePath) .. current_file
	local title = M.get_pascal_case_filename(basePath)
	local file_content = "[go back](" .. file_content_path .. ")\n\n" .. "# " .. title .. "\n"
	M.create_dir_if_not_exists(dir)
	M.create_file_if_not_exists(path, file_content)
end

return M
