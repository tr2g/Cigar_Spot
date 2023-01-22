# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 Admin.create!(
    email: 'admin@mail.com',
    password: 'adminpass'
 )

Tag.create([
    { name: '居心地が良い' },
    { name: 'ご飯がおいしい' },
    { name: 'スイーツがおいしい'},
    { name: '飲み物がおいしい'},
    { name: 'サービスが良い'},
    { name: 'コスパが良い'},
    { name: '内装がおしゃれ'},
    { name: 'デート向き'},
    { name: '一人でも利用しやすい'},
    { name: 'ランチにおすすめ'},
    { name: 'ディナーにおすすめ'},
    { name: '隠れ家'},
    { name: 'アクセスしやすい'},
    ])