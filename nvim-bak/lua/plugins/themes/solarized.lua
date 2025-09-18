-- solarized Osako
return {
  'craftzdog/solarized-osaka.nvim',
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
      require('solarized-osaka')._load 'moon',
    }
  end,
}
