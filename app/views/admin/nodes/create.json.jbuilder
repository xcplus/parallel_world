json.ret 1
json.data do
  json.ent do
    json.partial! 'admin/nodes/node', node: @node
  end
end