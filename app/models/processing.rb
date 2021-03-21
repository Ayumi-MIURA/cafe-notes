class Processing < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '水洗式' },
    { id: 2, name: '半水洗式' },
    { id: 3, name: '乾燥式' }
  ]

  include ActiveHash::Associations
  has_many :notes
end
