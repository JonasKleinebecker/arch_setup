return{
  "ahmedkhalf/project.nvim",
  config = function() -- doesnt work with just opts={}
    require("project_nvim").setup {
    }
  end
}
