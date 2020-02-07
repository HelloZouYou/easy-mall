package orm

// GoodsAttr 商品参数表
type GoodsAttr struct {
	Base
	GoodsID uint64 `gorm:"column:goods_id;not null;default:0;" json:"goods_id" form:"goods_id"` // 商品ID
	Attr    string `gorm:"column:attr;type:varchar(255);" json:"attr" form:"attr"`              // 商品参数名称
	Value   string `gorm:"column:value;type:varchar(255);" json:"value" form:"value"`           // 商品参数值
}
