local vim = vim

local function convert_filename(filename)
  if string.find(filename, '_spec.rb') then
    return string.gsub(filename, '_spec.rb', '.rb')
  else
    return string.gsub(filename, '.rb', '_spec.rb')
  end
end

local function convert_directory(directory)
  if string.find(directory, 'controller') then
    return string.gsub(directory, 'app/controllers', 'spec/requests')
  else
    return string.gsub(directory, 'spec/requests', 'app/controllers')
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
