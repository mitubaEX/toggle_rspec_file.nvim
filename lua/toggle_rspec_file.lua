local vim = vim

local function convert_filename(filename)
  if string.find(filename, '_spec.rb') then
    return string.gsub(filename, '_spec.rb', '.rb')
  else
    return string.gsub(filename, '.rb', '_spec.rb')
  end
end

local function convert_directory(directory)
  local return_directory = ''
  if string.find(directory, 'spec') then
    return_directory = string.gsub(directory, 'spec', 'app')
  else
    return_directory = string.gsub(directory, 'app', 'spec')
  end

  -- convert controller_spec to request_spec
  if string.find(return_directory, 'controllers') then
    return string.gsub(return_directory, 'controllers', 'requests')
  else
    return string.gsub(return_directory, 'requests', 'controllers')
  end
end

local function toggle_rspec_file()
  local relative_path = vim.fn.expand('%')
  local filename = vim.fn.expand('%:t')
  local current_directory = string.gsub(relative_path, filename, '')

  -- open file
  vim.api.nvim_command('e ' .. convert_directory(current_directory) .. convert_filename(filename))
end

return {
  toggle_rspec_file = toggle_rspec_file
}
