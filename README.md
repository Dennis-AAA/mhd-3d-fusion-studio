# 三维磁流体 (3D MHD) 解析平衡与聚变参数扫描实验室
**3D MHD Analytic Fusion Equilibrium Studio**

基于 [arXiv:2609.26742](https://arxiv.org/abs/2609.26742) (Matt Landreman, 2026) 与 [arXiv:2610.07304](https://arxiv.org/abs/2610.07304) (Opal Issan, Jonathan Citrin, Matt Landreman, Brendan Tracey, 2026) 中推翻 **Grad 猜想 (Grad's Conjecture)** 的两族三维理想磁流体 (3D Ideal MHD) 精确闭式解析平衡解构建的交互式 WebGL 三维仿真与平衡参数扫描系统。

---

## 核心功能 (Features)

1. **两族精确三维解析平衡解切换**：
   - **族 I：拉伸非对称 Solov'ev 平衡解 ($\iota = 2$)**（[arXiv:2609.26742 §2](https://arxiv.org/html/2609.26742), [arXiv:2610.07304 §2](https://arxiv.org/html/2610.07304v1)）：具备非平面马鞍形磁轴与全局恒定有理旋转变换 $\iota(\psi) = 2$，严格满足 Hamada 等弧长闭合积分条件 $\oint d\ell / |\mathbf{B}| = 2\pi / \Omega$。
   - **族 II：复相位椭圆坐标磁剪切平衡解 ($\iota'(\psi) 
eq 0$)**（[arXiv:2609.26742 §3](https://arxiv.org/html/2609.26742), [arXiv:2610.07304 §3](https://arxiv.org/html/2610.07304v1)）：具备平面椭圆形磁轴与连续变化的径向磁剪切剖面 $\iota(\psi)$，支持通过复相位对称破缺参数 $	au_1$ 观察磁剪切由正转负的反转效应。
2. **三维 WebGL 嵌套磁面与 Euler 流粒子追踪**：
   - 实时渲染 $\psi = \delta, 4\delta/9, \delta/9$ 三层嵌套环面剖面、磁轴曲线与三维磁力线。
   - 支持按磁场强度 $|\mathbf{B}|$、垂直磁场分量 $B_z$、等离子体压强 $p(\psi)$ 或磁张力势 $Q(\mathbf{x})$ 着色。
   - 利用静态理想 MHD 平衡 $(
abla	imes\mathbf{B})	imes\mathbf{B}=
abla p$ 与三维稳态不可压缩 Euler 流 $(\mathbf{u}\cdot
abla)\mathbf{u}=-
abla Q$ 的严格同构性，实时驱动沿磁力线运动的流体示踪粒子动画。
3. **平衡参数自动扫描与实时诊断**：
   - 自动往返扫描对称破缺参数 ($	au_0 / 	au_1$)、非轴对称拉长率 ($\epsilon$)、边界磁通量 ($\delta$) 等参数。
   - 实时绘制 $\phi = 0, \pi/4, \pi/2, 3\pi/4$ 四个环向角的极向截面轮廓（复现论文 Fig. 1, 2, 4, 8）、$\langleetaangle_V$ 与 $V(\delta)$ 参数扫描曲线（复现论文 Fig. 3, 7）以及 RK4 求解的旋转变换剖面 $\iota(\psi/\delta)$（复现论文 Fig. 6）。
   - 支持一键导出当前构型的 JSON 基准数据，用于验证 VMEC、DESC、SPEC 等三维平衡求解器。

---

## 快速发布到 GitHub Pages 指南

本压缩包已配置好 GitHub Pages 所需的全部文件结构：

```text
.
├── index.html                        # 网站主入口（单文件自包含 WebGL 仿真应用）
├── .nojekyll                         # 禁用 Jekyll 处理，直接托管静态资源
├── .github/workflows/deploy-pages.yml # GitHub Actions 自动部署工作流
├── deploy.sh                         # 命令行一键推送脚本
├── LICENSE                           # MIT 开源许可证
└── README.md                         # 项目说明文档
```

### 方式一：网页端直接上传（最简单，无需命令行）
1. 登录 GitHub，点击右上角 **+** -> **New repository** 创建一个新仓库（例如命名为 `mhd-3d-fusion-studio`，勾选 **Public**）。
2. 在新建的仓库页面点击 **uploading an existing file**（或 **Add file** -> **Upload files**）。
3. 将本压缩包解压后的所有文件（特别是 `index.html` 和 `.nojekyll`）拖入上传区域，点击底部 **Commit changes**。
4. 进入仓库顶部的 **Settings** -> 左侧菜单 **Pages**。
5. 在 **Build and deployment** -> **Branch** 下拉框中选择 `main`（或 `master`）分支与 `/ (root)` 目录，点击 **Save**。
6. 等待约 30~60 秒后刷新页面，即可通过 `https://<你的GitHub用户名>.github.io/<仓库名>/` 访问在线交互式实验室！

### 方式二：使用 Git 命令行或一键脚本推送
解压本目录后，在终端中执行：

```bash
chmod +x deploy.sh
./deploy.sh https://github.com/<你的GitHub用户名>/<你的仓库名>.git
```

推送完成后，在仓库 **Settings -> Pages -> Build and deployment -> Source** 中选择 **GitHub Actions**（或 **Deploy from a branch -> main**），即可自动发布。

---

## 参考文献与引用 (References)

```bibtex
@article{landreman2026analytic,
  title   = {Analytic toroidal 3D MHD equilibria and steady Euler flows with invariant surfaces},
  author  = {Landreman, Matt},
  journal = {arXiv preprint arXiv:2609.26742},
  year    = {2026},
  url     = {https://arxiv.org/abs/2609.26742}
}

@article{issan2026analytic,
  title   = {Analytic non-axisymmetric 3D MHD equilibria without stellarator symmetry},
  author  = {Issan, Opal and Citrin, Jonathan and Landreman, Matt and Tracey, Brendan},
  journal = {arXiv preprint arXiv:2610.07304},
  year    = {2026},
  url     = {https://arxiv.org/abs/2610.07304}
}
```
