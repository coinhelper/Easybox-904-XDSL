#
# Copyright (C) 2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

VIDEO_MENU:=Video Support

#
# FB TFT Display
#

define KernelPackage/fb-tft
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=Framebuffer support for small TFT displays
  DEPENDS:=@DISPLAY_SUPPORT kmod-fb kmod-fb-cfb-copyarea kmod-fb-cfb-fillrect kmod-fb-cfb-imgblt kmod-fb-sys-fops kmod-fbcon
  KCONFIG:= \
	CONFIG_STAGING=y \
	CONFIG_FB_TFT=y \
	CONFIG_FB_TFT_AGM1264K_FL=n \
	CONFIG_FB_TFT_BD663474=n \
	CONFIG_FB_TFT_HX8340BN=n \
	CONFIG_FB_TFT_HX8347D=n \
	CONFIG_FB_TFT_HX8353D=n \
	CONFIG_FB_TFT_HX8357D=n \
	CONFIG_FB_TFT_ILI9163=n \
	CONFIG_FB_TFT_ILI9320=n \
	CONFIG_FB_TFT_ILI9325=n \
	CONFIG_FB_TFT_ILI9340=n \
	CONFIG_FB_TFT_ILI9341=n \
	CONFIG_FB_TFT_ILI9341_EB904=m \
	CONFIG_FB_TFT_ILI9481=n \
	CONFIG_FB_TFT_ILI9486=n \
	CONFIG_FB_TFT_PCD8544=n \
	CONFIG_FB_TFT_RA8875=n \
	CONFIG_FB_TFT_S6D02A1=n \
	CONFIG_FB_TFT_S6D1121=n \
	CONFIG_FB_TFT_SSD1289=n \
	CONFIG_FB_TFT_SSD1306=n \
	CONFIG_FB_TFT_SSD1331=n \
	CONFIG_FB_TFT_SSD1351=n \
	CONFIG_FB_TFT_ST7735R=n \
	CONFIG_FB_TFT_ST7789V=n \
	CONFIG_FB_TFT_TINYLCD=n \
	CONFIG_FB_TFT_TLS8204=n \
	CONFIG_FB_TFT_UC1611=n \
	CONFIG_FB_TFT_UC1701=n \
	CONFIG_FB_TFT_UPD161704=n \
	CONFIG_FB_TFT_WATTEROTT=n \
	CONFIG_FB_FLEX=n \
	CONFIG_LCD_CLASS_DEVICE=n \
	CONFIG_VGA_CONSOLE=n \
	CONFIG_FB_TFT_SSD1305=n \
	CONFIG_FB_TFT_SSD1325=n \
	CONFIG_FB_TFT_FBTFT_DEVICE=m\
	CONFIG_VGA_CONSOLE=n\
	CONFIG_VT=y\
	CONFIG_VT_CONSOLE=y\
	CONFIG_VT_HW_CONSOLE_BINDING=y\
	CONFIG_FB_CMDLINE=y\
	CONFIG_CONSOLE_TRANSLATIONS=y\
	CONFIG_FONT_8x16=y\
	CONFIG_FONT_8x8=y\
	CONFIG_FONT_SUPPORT=m\
	CONFIG_FRAMEBUFFER_CONSOLE=m\
	CONFIG_HW_CONSOLE=y

  FILES:=\
	$(LINUX_DIR)/drivers/video/fbdev/core/syscopyarea.ko \
	$(LINUX_DIR)/drivers/video/fbdev/core/sysfillrect.ko \
	$(LINUX_DIR)/drivers/video/fbdev/core/sysimgblt.ko \
	$(LINUX_DIR)/drivers/staging/fbtft/fbtft_device.ko \
	$(LINUX_DIR)/drivers/video/backlight/backlight.ko \
	$(LINUX_DIR)/drivers/staging/fbtft/fbtft.ko \
	$(LINUX_DIR)/drivers/staging/fbtft/fb_ili9341_eb904.ko
	
	AUTOLOAD:=$(call AutoLoad,06,fb_ili9341_eb904 fbtft)
endef

define KernelPackage/fb-tft/description
 Kernel support for small TFT LCD display modules
endef

$(eval $(call KernelPackage,fb-tft))
