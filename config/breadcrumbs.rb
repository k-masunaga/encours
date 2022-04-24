crumb :root do
  link "Home", user_path(current_user.id)
end

crumb :input_new do
  link "入力", input_path(current_user.id)
  parent :root
end

crumb :history do
  link "履歴", history_path(current_user.id)
  parent :root
end

crumb :spending_edit do |spending|
  link "支出の編集", edit_spending_path(spending.id)
  parent :history
end

crumb :income_edit do |income|
  link "支出の編集", edit_income_path(income.id)
  parent :history
end

crumb :analysis do
  link "分析", analysis_path(current_user.id)
  parent :root
end

crumb :spending_edit_from_analysis do |spending|
  link "支出の編集", edit_spending_path(spending.id)
  parent :analysis
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).