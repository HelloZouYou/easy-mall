package orm

// Permissions 权限表
type Permissions struct {
	Base
	CnName string `gorm:"column:cn_name;type:varchar(255);not null;" json:"cn_name" form:"cn_name"` // 权限的中文简称
	Name   string `gorm:"column:name;type:varchar(255);not null;" json:"name" form:"name"`          // 权限资源名称，如 order
	Action string `gorm:"column:action;type:varchar(255);not null;" json:"action" form:"action"`    // 权限操作名称，如 read
}
