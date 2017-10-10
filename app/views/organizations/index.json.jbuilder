json.organizations @organizations do |organization|
  json.name organization.name
  json.display_name organization.display_name
  json.url organization_path(organization)
end
