package orm

// GoodsSpecification 商品规格表
type GoodsSpecification struct {
	Base
	GoodsID uint64 `gorm:"column:goods_id;not null;default:0;" json:"goods_id" form:"goods_id"` // 商品ID
	Name    string `gorm:"column:name;type:varchar(255);" json:"name" form:"name"`              // 商品规格名称
	Value   string `gorm:"column:value;type:varchar(255);" json:"value" form:"value"`           // 商品规格值
}
