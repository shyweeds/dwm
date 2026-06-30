
<p align="center">
  <img src="dwm.png" alt="dwm" width="80" />
</p>

<h1 align="center">dwm — 动态窗口管理器</h1>

<p align="center">
  <b>一个快速、小巧、动态的 X 窗口管理器</b><br>
  <sub>个人构建版本，包含自定义补丁、快捷键和脚本</sub>
</p>

<p align="center">
  <a href="README.md">English</a>
  &nbsp;·&nbsp;
  <a href="#安装">安装</a>
  &nbsp;·&nbsp;
  <a href="#快捷键">快捷键</a>
  &nbsp;·&nbsp;
  <a href="#自定义配置">自定义配置</a>
  &nbsp;·&nbsp;
  <a href="#许可证">许可证</a>
</p>

---

## 概述

[dwm](https://dwm.suckless.org) 是一个 X 的动态窗口管理器。它以**平铺（tiled）**、**单窗口（monocle）**和**浮动（floating）**布局管理窗口。所有布局均可动态切换，以适配当前应用和任务。

此仓库是基于 **dwm 6.8** 的个人构建版本，包含以下自定义修改：

- 由 **pywal16** 驱动的动态配色方案
- 媒体快捷键控制**亮度**、**音量**、**播放**和**麦克风**，配合 Dunst 通知
- **截图**工具绑定到功能键
- **真正全屏**补丁（使用 `_NET_WM_STATE_FULLSCREEN`，而非仅隐藏状态栏）
- 默认终端为 **kitty**
- 使用 **Super** 键作为主修饰键

---

## 依赖

- Xlib 头文件
- Xinerama *(可选)*
- libXft 和 fontconfig
- `brightnessctl` — 亮度脚本所需
- `pactl`（PipeWire/PulseAudio）— 音量和麦克风脚本所需
- `scrot` — 截图所需
- `dunst` — 屏幕通知所需
- `playerctl` — 媒体播放控制
- `dmenu` — 应用菜单后端
- `j4-dmenu-desktop` — 桌面应用启动器
- `kitty` — 默认终端

---

## 安装

编辑 `config.mk` 以适配你的系统路径，然后执行：

```sh
make clean install
```

如需 root 权限：

```sh
sudo make clean install
```

---

## 运行 dwm

在 `.xinitrc` 中添加以下行以通过 `startx` 启动 dwm：

```sh
exec dwm
```

若要在状态栏中显示动态状态信息：

```sh
while xsetroot -name "$(date)"
do
    sleep 1
done &
exec dwm
```

---

## 布局

| 符号   | 布局       | 描述                               |
|--------|------------|------------------------------------|
| `[ ]=` | 平铺 Tiled | 主区域（左）+ 堆叠区域（右）         |
| `><>`  | 浮动 Floating | 窗口可自由移动和调整大小          |
| `[M]`  | 单窗口 Monocle | 聚焦窗口最大化至全屏             |

对话框窗口会自动应用浮动布局。

---

## 快捷键

> **Mod** = `Super`（Windows 键）

### 启动

| 快捷键                | 操作                      |
|----------------------|---------------------------|
| `Mod + Return`       | 缩放 / 交换聚焦窗口         |
| `Mod + Shift + Return` | 启动终端 (kitty)          |
| `Mod + d`            | 启动应用菜单                   |
| `Mod + b`            | 切换状态栏显示                   |

### 窗口管理

| 快捷键                | 操作                       |
|----------------------|----------------------------|
| `Mod + j`            | 聚焦下一个窗口               |
| `Mod + k`            | 聚焦上一个窗口               |
| `Mod + Shift + i`    | 增加主区域窗口数              |
| `Mod + Shift + d`    | 减少主区域窗口数              |
| `Mod + h`            | 缩小主区域                   |
| `Mod + l`            | 扩大主区域                   |
| `Mod + Shift + q`    | 关闭聚焦窗口                 |
| `Mod + Shift + space` | 切换浮动                    |
| `Mod + Shift + f`    | 切换真正全屏                 |

### 布局切换

| 快捷键              | 操作                    |
|--------------------|-------------------------|
| `Mod + t`          | 平铺布局                |
| `Mod + f`          | 浮动布局                |
| `Mod + m`          | 单窗口布局              |
| `Mod + space`      | 切换上一个布局          |

### 标签

| 快捷键                              | 操作                       |
|-------------------------------------|----------------------------|
| `Mod + [1–9]`                       | 查看该标签                  |
| `Mod + Shift + [1–9]`               | 将窗口移至该标签             |
| `Mod + Ctrl + [1–9]`                | 切换该标签的显示             |
| `Mod + Ctrl + Shift + [1–9]`        | 切换窗口的该标签             |
| `Mod + 0`                           | 查看所有标签                |
| `Mod + Shift + 0`                   | 应用所有标签                |
| `Mod + Tab`                         | 切换上一次的标签集合         |

### 多显示器

| 快捷键                | 操作                        |
|----------------------|-----------------------------|
| `Mod + ,`            | 聚焦上一个显示器              |
| `Mod + .`            | 聚焦下一个显示器              |
| `Mod + Shift + ,`    | 将窗口移至上一个显示器         |
| `Mod + Shift + .`    | 将窗口移至下一个显示器         |

### 系统与媒体

| 快捷键                | 操作                     |
|----------------------|--------------------------|
| `F2`                 | 全屏截图                  |
| `Shift + F2`         | 区域截图                  |
| `BrightnessUp`       | 提高亮度 (+5%)            |
| `BrightnessDown`     | 降低亮度 (-5%)            |
| `VolumeUp`           | 增加音量 (+5%)            |
| `VolumeDown`         | 减少音量 (-5%)            |
| `VolumeMute`         | 切换静音                  |
| `AudioPlay`          | 播放 / 暂停媒体              |
| `MicToggle`          | 切换麦克风静音                |
| `Mod + Shift + e`    | 退出 dwm                  |

---

## 鼠标操作

| 操作                        | 效果                           |
|-----------------------------|--------------------------------|
| 在标签上 `Button1`           | 查看该标签                       |
| 在标签上 `Button3`           | 切换该标签的显示                  |
| 在标签上 `Mod + Button1`    | 将标签应用到聚焦窗口              |
| 在标签上 `Mod + Button3`    | 切换聚焦窗口的该标签              |
| 在布局符号上 `Button1`       | 循环切换布局                     |
| 在布局符号上 `Button3`       | 单窗口布局                       |
| 在窗口上 `Mod + Button1`    | 移动窗口                         |
| 在窗口上 `Mod + Button2`    | 切换浮动                         |
| 在窗口上 `Mod + Button3`    | 调整窗口大小                     |

---

## 项目结构

```
dwm/
├── dwm.c                  # 核心源码（2173+ 行）
├── drw.c / drw.h          # 绘制抽象层
├── util.c / util.h        # 工具宏和辅助函数
├── transient.c            # 瞬态窗口测试程序
├── config.def.h           # 默认配置模板
├── config.h               # 当前生效的配置（已自定义）
├── config.mk              # 构建配置和依赖
├── Makefile               # 构建系统
├── dwm.1                  # 手册页
├── dwm.png                # 图标
├── LICENSE                # MIT/X Consortium 许可证
├── colorscheme/
│   └── colors-wal-dwm.h   # pywal16 动态配色方案
├── patches/
│   └── dwm-actualfullscreen-*.diff  # 全屏补丁
├── scripts/
│   ├── audioplay.sh              # 媒体播放/暂停 + 通知
│   ├── brightness.sh             # 亮度控制 + 通知
│   ├── dmenucmd.sh               # 应用启动器 (j4-dmenu-desktop)
│   ├── dunst_show_playerctl.sh   # Playerctl 状态通知
│   ├── screenshot.sh             # 全屏截图
│   ├── screenshotsel.sh          # 区域截图
│   ├── toggle_mic.sh             # 麦克风静音切换 + 通知
│   └── volume.sh                 # 音量控制 + 通知
└── wallpaper/
    ├── 1.png                                  # 自定义壁纸
    └── please_put_an_png_wallpaper_here.txt    # 壁纸说明
```

---

## 自定义配置

dwm 通过编辑 `config.h` 并在编译时完成配置：

```sh
make clean install
```

可调整的关键配置项：

- **`MODKEY`** — 修饰键（`Mod1Mask` = Alt，`Mod4Mask` = Super）
- **`fonts[]`** — 状态栏字体
- **`colors[][]`** — 配色方案（从 `colorscheme/` 导入）
- **`tags[]`** — 标签名称
- **`rules[]`** — 应用规则（浮动、标签放置等）
- **`keys[]`** — 键盘快捷键
- **`buttons[]`** — 鼠标绑定
- **`layouts[]`** — 可用布局
- **`mfact`** — 主区域宽度比例（默认 0.55）
- **`borderpx`** — 窗口边框宽度
- **`resizehints`** — 平铺调整时遵循窗口大小提示
- **`lockfullscreen`** — 强制全屏窗口获取焦点
- **`refreshrate`** — 窗口移动/调整刷新率

---

## 已应用的补丁

| 补丁                  | 描述                                                      |
|----------------------|----------------------------------------------------------|
| **actualfullscreen** | 真正全屏，使用 `_NET_WM_STATE_FULLSCREEN`，而非仅切换单窗口布局并隐藏状态栏 |

---

## 许可证

MIT/X Consortium License — 详见 [LICENSE](LICENSE)。

---

<p align="center">
  <sub>以 <code>keep it simple, stupid</code> 理念构建 &mdash; <a href="https://suckless.org">suckless.org</a></sub>
</p>
