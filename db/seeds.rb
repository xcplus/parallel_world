# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


rules = [
  # 品牌
  {mod_name: "品牌", act_name: "列表", control: "admin/brands", act: "index"},
  {mod_name: "品牌", act_name: "创建", control: "admin/brands", act: "create"},
  {mod_name: "品牌", act_name: "详情", control: "admin/brands", act: "show"},
  {mod_name: "品牌", act_name: "更新", control: "admin/brands", act: "update"},
  # 车系
  {mod_name: "车系", act_name: "列表", control: "admin/nodes", act: "index"},
  {mod_name: "车系", act_name: "创建", control: "admin/nodes", act: "create"},
  {mod_name: "车系", act_name: "详情", control: "admin/nodes", act: "show"},
  {mod_name: "车系", act_name: "更新", control: "admin/nodes", act: "update"},
  # 车分系
  {mod_name: "车分系", act_name: "列表", control: "admin/sub_nodes", act: "index"},
  {mod_name: "车分系", act_name: "创建", control: "admin/sub_nodes", act: "create"},
  {mod_name: "车分系", act_name: "详情", control: "admin/sub_nodes", act: "show"},
  {mod_name: "车分系", act_name: "更新", control: "admin/sub_nodes", act: "update"},
  # 配置项
  {mod_name: "配置项", act_name: "列表", control: "admin/codes", act: "index"},
  {mod_name: "配置项", act_name: "创建", control: "admin/codes", act: "create"},
  {mod_name: "配置项", act_name: "详情", control: "admin/codes", act: "show"},
  {mod_name: "配置项", act_name: "更新", control: "admin/codes", act: "update"},
  # 车源
  {mod_name: "车源", act_name: "列表", control: "admin/cars", act: "index"},
  {mod_name: "车源", act_name: "创建", control: "admin/cars", act: "create"},
  {mod_name: "车源", act_name: "详情", control: "admin/cars", act: "show"},
  {mod_name: "车源", act_name: "更新", control: "admin/cars", act: "update"},
]
