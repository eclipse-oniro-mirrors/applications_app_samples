# ArkGraphics 3D

## 介绍

本示例通过 ArkGraphics 3D 的接口，利用轻量级的 3D 引擎和渲染管线，实现了 3D 场景创建、3D 场景资源创建和 3D 动画创建。

本示例主要展现了如何利用 ArkGraphics 3D 来实现 3D 图像的渲染，其中利用 Scene、Camera 和 Light 来创建基础的场景，使用 Material、Shader、Image 和Environment 来实现场景资源，采用 Animation 的各种方法来播放 3D 动画。

## 效果预览

|                       Index                       |                       Scene                       |                       Resource                       |                       Animation                       |
| :-----------------------------------------------: | :-----------------------------------------------: | :--------------------------------------------------: | :---------------------------------------------------: |
| <img src=".\screenshots\index.png" width="360" /> | <img src=".\screenshots\scene.png" width="360" /> | <img src=".\screenshots\resource.png" width="360" /> | <img src="./screenshots\animation.png" width="360" /> |

|                    Material Common                     |                    PBR Material                    |
| :----------------------------------------------------: | :------------------------------------------------: |
| <img src="./screenshots\material.png" width="360" />  | <img src="./screenshots\pbr.png" width="360" />   |

**使用方法：**

1. 在 Index 页面点击 ` BUilding and Managing ArkGraphics 3D Scenes` 按钮，跳转至 Scene 页面；
   - 在 Scene 页面点击 `Model Loading and Display` 按钮，页面跳转至 Model 页面，显现 3D 头盔图像。点击 `Back` 按钮，返回至 Scene 页面；
   - 在 Scene 页面点击 `Creating and Managing a Camera` 按钮，页面跳转至 Camera 页面，显现几何体图像。通过调节 `X-axis`、`Y-axis` 和 `Z-axis` 滑动条，即可分别修改相机的 X 轴，Y 轴和 Z 轴。点击 `Back` 按钮，返回至 Scene 页面；
   - 在 Scene 页面点击 `Creating and Managing Light` 按钮，页面跳转至 Light 页面，显现几何体图像。通过调节 `Red`、`Green` 和 `Blue` 滑动条，即可分别调节光线的红、绿和蓝的颜色通道。点击 `Back` 按钮，返回至 Scene 页面；
   - 在 Scene 页面点击 `Back` 按钮，返回至 `Index` 页面；
2. 在 Index 页面点击 `Creating and using ArkGraphics 3D Resources` 按钮，跳转至 Resource 页面。点击 `Replace with a blank material` 按钮，几何体图像的材质被空白材质替换。点击 `Replace with a Shader material` 按钮，几何体图像的材质被着色器材质替换。点击 `Replace with a Image material`，几何体材质被图像材质替换。点击 `Add to Environment` 按钮，给几何体图像添加背景。点击 `Back` 按钮，返回至 Index 页面；
3. 在 Index 页面点击 `Controlling and Managing ArkGraphics 3D Scene Animations` 按钮，跳转至 Animation 页面。点击 `start` 按钮，播放动画。点击 `pause` 按钮，中止动画。点击 `stop` 按钮，暂停动画。点击 `finish` 按钮，结束动画。点击 `restart` 按钮，重新播放动画。点击 `seek to 30% progress` 按钮，动画从 30% 进度开始播放。点击 `Back` 按钮，返回至 Index 页面；
4. 在 Index 页面点击 `Use of general material properties` 按钮，跳转至 Material Common 页面；
   - 点击 `material alpha code (Blend & Cutoff)` 按钮，跳转至 Alpha 页面，显示透明混合和裁剪效果。点击 `Toggle blend` 按钮，切换材质的混合模式。点击 `Toggle alphaCutoff` 按钮，切换 Alpha 裁剪阈值。点击 `back` 按钮，返回至 Material Common 页面；
   - 点击 `material cull mode` 按钮，跳转至剔除模式页面，显示平面对象。点击 `No culling` 按钮，关闭面剔除；点击 `Front face culling` 按钮，启用正面剔除；点击 `Back face culling` 按钮，启用背面剔除（默认模式）。点击 `back` 按钮，返回至 Material Common 页面；
   - 点击 `material render slot` 按钮，跳转至渲染排序页面，显示两个半透明平面。通过调节滑动条调整 `renderSortLayer` 值以控制透明物体之间的绘制优先级。点击 `switch render sort layer order` 按钮，切换渲染层内的排序顺序。点击 `back` 按钮，返回至 Material Common 页面；
   - 点击 `material shadow receiver` 按钮，跳转至阴影接收页面，显示带聚光灯阴影的场景。点击 `Toggle shadowReceiver` 按钮，切换平面的阴影接收状态。点击 `animation speed change` 按钮，切换动画播放方向。点击 `back` 按钮，返回至 Material Common 页面；
   - 点击 `back` 按钮，返回至 Index 页面；
5. 在 Index 页面点击 `Use of PBR material` 按钮，跳转至 PBR 页面；
   - 点击 `PBR material - baseColor` 按钮，跳转至基础色页面。通过调节 `Base color red/green/blue/alpha` 滑动条修改 PBR 材质的基础色 RGBA 分量。点击 `Change texture` 按钮切换基础色纹理贴图。点击 `enable blend` 按钮切换混合模式。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - clearcoat` 按钮，跳转至清漆页面。通过调节 `Clearcoat intensity` 滑动条调整清漆强度。点击 `Change clearcoat texture` 按钮切换清漆纹理。通过调节 `Clearcoat roughness` 滑动条调整清漆粗糙度。点击 `Change roughness texture` 按钮切换粗糙度纹理。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - clearcoat normal` 按钮，跳转至清漆法线页面，展示清漆法线贴图效果。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - ambientOcclusion` 按钮，跳转至环境光遮蔽页面，展示 AO 效果。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - emissive` 按钮，跳转至自发光页面。通过调节 `Emission red/green/blue/alpha` 滑动条修改自发光颜色。点击 `Change texture` 按钮切换自发光纹理。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - material` 按钮，跳转至材质综合页面，展示金属度和粗糙度调节效果。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - normal` 按钮，跳转至法线页面，展示法线贴图效果。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - sheen` 按钮，跳转至光泽页面。通过调节 `Sheen red/green/blue/roughness` 滑动条修改光泽属性。点击 `Change texture` 按钮切换光泽纹理。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `PBR material - specular` 按钮，跳转至高光页面，展示高光属性调节效果。点击 `back` 按钮，返回至 PBR 页面；
   - 点击 `back` 按钮，返回至 Index 页面；

## 工程目录

```
|--entry/src/main
│  |--ets // ets代码区
│  │  |--entryability
|  |  |  |--EntryAbility.ets // 程序入口类
|  |  |--arkgraphic
│  │  │  |--animation.ets // 动画
│  │  │  |--material_common.ets // 通用材质属性导航页
│  │  │  |--pbr.ets // PBR材质属性导航页
|  |  |  |--resource.ets // 场景资源
|  |  |  |--scene.ets // 场景搭建
|  |  |--common
│  │  │  |--util.ets // 工具函数
|  |  |--material // 材质子功能页面
│  │  │  |--material_alpha.ets // 材质透明混合与Alpha裁剪
│  │  │  |--material_cullmode.ets // 材质面剔除模式
│  │  │  |--material_render_slot.ets // 材质渲染排序
│  │  │  |--material_shadowReceiver.ets // 材质阴影接收
│  │  │  |--pbr_basic.ets // PBR基础色
│  │  │  |--pbr_clearcoat.ets // PBR清漆
│  │  │  |--pbr_clearcoat_normal.ets // PBR清漆法线
│  │  │  |--pbr_ao.ets // PBR环境光遮蔽
│  │  │  |--pbr_emissive.ets // PBR自发光
│  │  │  |--pbr_material.ets // PBR金属度与粗糙度
│  │  │  |--pbr_normal.ets // PBR法线贴图
│  │  │  |--pbr_sheen.ets // PBR光泽
│  │  │  |--pbr_specular.ets // PBR高光
|  |  |--scene
|  |  |  |--camera.ets // 相机
|  |  |  |--init.ets // 模型加载
|  |  |  |--light.ets // 光线
│  │  |--pages // 页面文件
│  │  |  |--Index.ets // 初始页面
│  │  |--utils // 工具类
|  |--resources // 资源文件目录
```

## 具体实现

1. 创建场景：一个 3D 场景通常由模型、相机和光源三个关键部分组成。其中先加载模型，再生成相机和光源。等 3D 图像加载完毕，可以使 Component3D 组件将渲染好的图像传递给用户。

   - | 接口名                                                 | 描述     |
     | ------------------------------------------------------ | -------- |
     | `Scene.load(): Promise<Scene>`                         | 加载模型 |
     | `SceneResourceFactory.createCamera(): Promise<Camera>` | 创建相机 |
     | `SceneResourceFactory.createLight(): Promise<Light>`   | 创建光源 |

   - | SceneOption 参数     | 描述                                                         |
     | -------------------- | ------------------------------------------------------------ |
     | scene: Scene         | 3D模型资源文件或场景对象，默认值为undefined。 <br/>**说明：目前仅支持GLTF格式资源。** |
     | modelType: ModelType | 3D场景显示合成方式。<br/>**说明：**<br/>一般开发者可以使用默认值而无需关心此项设置。 |

2. 创建场景资源：3D 场景中主要有以下常见资源：

   - 材质（Material）：材质是对场景中物体的光学物理性质的数学建模。在渲染计算的过程中，利用这些物理性质计算与光的相互作用，得到渲染的颜色。ArkGraphics 3D 提供的材质类型基于 PBR 渲染，支持用户参照 PBR 渲染材质类型创建材质资源，得到预期的渲染结果。

   - 图片（Image）： 图片本质上是上一个储存信息的二维内存块(buffer)，用于储存 3D 渲染计算过程需要的相关信息，比如基础色、法线等等。ArkGraphics 3D 提供基于 PNG、JPG、KTX格式创建 Image 资源的能力，支持用户自定义需要的 Image 资源。

   - 着色器（Shader）： 着色器是 GPU 上可以执行的一段程序，可以控制 GPU 执行哪些并行计算操作。AGP 引擎提供的默认着色器实现了 PBR 渲染，开发者只需要指定对应的参数就可以完成不同的 PBR 渲染。ArkGraphics 3D 支持开发者创建自定义的着色器，开发者可以通过自定义着色器自定义渲染计算过程，完全控制渲染计算流程，比如控制某物体不受某光源的影响等。

   - 环境（Environment）： 环境是 3D 场景背景的一种描述，可以基于图片进行创建。通过将一张图片进行正方体或者球体的映射处理，将图片贴在正方体或者球体上，在 3D 场景中模拟真实的环境。ArkGraphics 3D 支持用户创建环境资源，定义 3D 场景的背景。

   - | 接口名                                                       | 描述       |
     | ------------------------------------------------------------ | ---------- |
     | `SceneResourceFactory.createMaterial(): Promise<Material>`   | 创建材质   |
     | `SceneResourceFactory.createImage(): Promise<Image>`         | 创建图片   |
     | `SceneResourceFactory.createShader(): Promise<Shader>`       | 创建着色器 |
     | `SceneResourceFactory.createEnvironment(): Promise<Environment>` | 创建环境   |

	- 尤其需要注意：在 ArkGraphics 3D 中需要将材质（Material）给与子网格（SubMesh）才能成功替换材质。
	
	- | SubMesh 属性           | 说明                     |
	  | ---------------------- | ------------------------ |
	  | name: string           | 名称，没有特殊格式要求。 |
	  | **material: Material** | 材质。                   |
	  | aabb: Aabb             | 轴对齐边界盒。           |

3. 创建动画：动画是3D场景中重要的资源类型，用于控制场景中各种元素的运动。

   - 调用 `start` 方法控制动画开启；

   - 调用 `pause` 方法控制动画暂停；

   - 调用 `stop` 方法控制动画停止，并将动画状态设置为开头；

   - 调用`finish` 方法控制动画结束，并将动画状态设置为结尾；

   - 调用 `restart` 方法控制动画从头开始；

   - 调用 `seek` 方法控制动画设置到指定状态；

   - `onStarted` 方法在动画开始时执行传入的回调；

   - `onFinished` 方法在动画结束时执行传入的回调。

4. 通用材质属性：展示 Material 的常用属性控制，包括透明混合、面剔除、渲染排序和阴影接收。

   - 透明混合（Blend）：通过 `material.blend` 属性控制材质是否启用混合模式，结合 `material.alphaCutoff` 属性设置 Alpha 裁剪阈值，实现透明与半透明渲染效果；

   - 面剔除（Cull Mode）：通过 `material.cullMode` 属性设置剔除模式（`CullMode.NONE` 不剔除、`CullMode.FRONT` 正面剔除、`CullMode.BACK` 背面剔除），控制渲染时哪些面片被剔除；

   - 渲染排序（Render Sort）：通过 `material.renderSort` 属性设置 `renderSortLayer` 和 `renderSortLayerOrder`，控制透明物体之间的绘制优先级，解决透明物体的渲染顺序问题；

   - 阴影接收（Shadow Receiver）：通过 `material.shadowReceiver` 属性控制材质是否接收其他物体投射的阴影，结合聚光灯的 `shadowEnabled` 属性实现阴影效果。

   - | 接口名/属性                                  | 描述                       |
     | -------------------------------------------- | -------------------------- |
     | `material.blend`                             | 材质混合模式设置           |
     | `material.alphaCutoff`                       | Alpha 裁剪阈值             |
     | `material.cullMode`                          | 面剔除模式                 |
     | `material.renderSort`                        | 渲染排序层级设置           |
     | `material.shadowReceiver`                    | 是否接收阴影               |
     | `SceneResourceFactory.createMaterial()`      | 创建材质                   |
     | `SceneResourceFactory.createMesh()`          | 创建网格资源               |
     | `SceneResourceFactory.createGeometry()`      | 创建几何体                 |
     | `SceneResourceFactory.createLight()`         | 创建光源                   |

5. PBR 材质属性：基于 `MetallicRoughnessMaterial` 展示 PBR 渲染材质的各项属性调节。

   - 基础色（Base Color）：通过 `material.baseColor.factor` 设置 RGBA 颜色值，通过 `material.baseColor.image` 设置基础色纹理贴图；

   - 清漆（Clearcoat）：通过 `material.clearCoat.factor` 和 `material.clearCoat.image` 设置清漆强度和纹理，通过 `material.clearCoatRoughness.factor` 和 `material.clearCoatRoughness.image` 设置清漆粗糙度；

   - 自发光（Emissive）：通过 `material.emissive.factor` 设置自发光 RGBA 值，通过 `material.emissive.image` 设置自发光纹理；

   - 光泽（Sheen）：通过 `material.sheen.factor` 设置光泽颜色和粗糙度，通过 `material.sheen.image` 设置光泽纹理；

   - 其他属性：包括法线贴图（Normal）、环境光遮蔽（AO）、高光（Specular）、金属度与粗糙度（Metallic & Roughness）等 PBR 标准属性的展示。

   - | 接口名/属性                                                | 描述                         |
     | ---------------------------------------------------------- | ---------------------------- |
     | `MetallicRoughnessMaterial.baseColor`                      | 基础色（颜色因子 + 纹理）   |
     | `MetallicRoughnessMaterial.clearCoat`                      | 清漆强度                     |
     | `MetallicRoughnessMaterial.clearCoatRoughness`             | 清漆粗糙度                   |
     | `MetallicRoughnessMaterial.emissive`                       | 自发光                       |
     | `MetallicRoughnessMaterial.sheen`                          | 光泽                         |
     | `MetallicRoughnessMaterial.normal`                         | 法线贴图                     |
     | `MetallicRoughnessMaterial.metallic`                       | 金属度                       |
     | `MetallicRoughnessMaterial.roughness`                      | 粗糙度                       |
     | `MetallicRoughnessMaterial.specular`                       | 高光                         |
     | `MaterialType.SHADER`                                      | 着色器材质类型               |
     | `Camera.postProcess`                                       | 后处理设置（色调映射等）     |
     | `ToneMappingType.ACES`                                     | ACES 色调映射                |

## 相关权限

不涉及。

## 依赖

不涉及。

## 约束与限制

1.本示例仅支持在标准系统上运行；

2.本示例为 Stage 模型，已适配 API version 20 版本 SDK，SDK 版本号（API Version 20 6.0.0.47）；

3.本示例需要使用 DevEco Studio 版本号（5.1.1）及以上版本才可编译运行。

## 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/DocsSample/graphic/Arkgraphics3D/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```