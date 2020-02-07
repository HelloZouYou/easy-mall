package router

import (
	"easy-mall/admin_api/middleware"

	"github.com/gin-gonic/gin"
)

// RegisteRouterAuth 注册user登录相关的路由
func RegisteRouterAuth(app *gin.Engine) {
	g := app.Group("/user")
	g.Use(middleware.CasbinMiddleware())
	g.GET("/login")
	g.GET("/logout")
	g.GET("/info")
	g.GET("/refresh")
	g.GET("/update")
}
