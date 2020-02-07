package orm

// Roles 角色表
type Roles struct {
	Base
	CnName string `gorm:"column:cn_name;type:varchar(255);not null;" json:"cn_name" form:"cn_name"` // 角色中文简称
	Name   string `gorm:"column:name;type:varchar(255);not null;" json:"name" form:"name"`          // 角色名称
	Remark string `gorm:"column:remark;type:varchar(255);" json:"remark" form:"remark"`             // 角色备注
}
