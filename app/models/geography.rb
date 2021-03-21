class Geography < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'ラテンアメリカ' },
    { id: 2, name: 'アフリカ' },
    { id: 3, name: 'アジア/太平洋' },
    { id: 4, name: 'マルチリージョン' }
  ]

  include ActiveHash::Associations
  has_many :notes
end
