class BookCategory < ActiveHash::Base
  self.data = [
    { id: 1,  name: '---' },
    { id: 2,  name: '文学・小説' },
    { id: 3,  name: '歴史・人物伝記' },
    { id: 4,  name: '自己啓発・心理学' },
    { id: 5,  name: '社会・経済・ビジネス' },
    { id: 6,  name: '政治・法律・行政' },
    { id: 7,  name: '科学・技術・IT' },
    { id: 8,  name: 'アート・芸術・デザイン' },
    { id: 9,  name: 'エンターテインメント・趣味' },
    { id: 10, name: 'スポーツ・アウトドア・健康' },
    { id: 11, name: '旅行・地理・文化' },
    { id: 12, name: '児童書・絵本・童話' },
    { id: 13, name: '漫画・アニメ・ゲーム' },
    { id: 14, name: '宗教・哲学・思想' },
    { id: 15, name: '自然・動物・環境' },
    { id: 16, name: '料理・食文化・栄養学' },
    { id: 17, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :books
end