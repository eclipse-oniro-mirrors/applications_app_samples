| 测试功能    | 预置条件         | 输入             | 预期输出                  | 是否自动 | 测试结果 |
|:-------:|:------------:|:--------------:|:---------------------:|:----:|:----:|
| 拉起应用 |    设备正常运行      |                 | 成功拉起应用                                                                                        | 是    | Pass |
| 主页展示 |    设备正常运行      |                 | 展示 Building and Managing ArkGraphics 3D Scenes、Creating and Using ArkGraphics 3D Resources、Controlling and Managing ArkGraphics 3D Scene Animations、Use of general material properties 和 Use of PBR material 五种按钮 | 是    | Pass |
| 主页按钮点击 |  位于主页        |  点击 Building and Managing ArkGraphics 3D Scenes 按钮  |     跳转 Scene 页面                                                                    | 是    | Pass |
| Scene 页面按钮点击 | 位于 Scene 页面 | 点击 Model Loading and Display 按钮 | 跳转至 Model 页面，显现头盔                                      | 是    | Pass |
| Model 页面按钮点击 | 位于 Model 页面 | 点击 Back 按钮 |  返回 Scene 页面                                                                        | 是    | Pass |
| Scene 页面按钮点击 | 位于 Scene 页面 | 点击 Creating and Managing a Camera 按钮 |  跳转至 Camera 页面，显现几何体                                     | 是    | Pass |
| Camera 页面按钮点击 | 位于 Camera 页面 | 点击 Back 按钮 |  返回 Scene 页面                                                                         | 是    | Pass |
| Scene 页面 按钮点击 | 位于 Scene 页面 |  点击 Creating and Managing Light 按钮  |     跳转至 Light 页面                                                              | 是    | Pass |
| Light 页面按钮点击 |   位于 Light 页面   |                        点击 Back 按钮                        |                       返回 Scene 页面                        | 是    | Pass |
|  Scene 页面 按钮点击   |   位于 Scene 页面   |                        点击 Back 按钮                        |                           返回主页                           | 是    | Pass |
|      主页按钮点击      |      位于主页       |    点击 Creating and Using ArkGraphics 3D Resources 按钮     |               跳转至 Resource 页面，显现几何体               | 是    | Pass |
| Resource 页面按钮点击 | 位于 Resource 页面 | 点击 Replace with a blank material 按钮 |     用空白材质替换原有的材质                                        | 是    | Pass |
| Resource 页面按钮点击  | 位于 Resource 页面  |           点击 Replace with a image material 按钮            |                   用图像材质替换原有的材质                   | 是    | Pass |
| Resource 页面按钮点击  | 位于 Resource 页面  |           点击 Replace with a shader material 按钮           |                  用着色器材质替换原有的材质                  | 是    | Pass |
| Resource 页面按钮点击  | 位于 Resource 页面  |                 点击 Add to Environment 按钮                 |                           添加场景                           | 是    | Pass |
| Resource 页面按钮点击  | 位于 Resource 页面  |                        点击 Back 按钮                        |                           返回主页                           | 是    | Pass |
| 主页按钮点击 | 位于主页 | 点击 Controlling and Managing ArkGraphics 3D Scene Animations按钮 |    跳转至 Animation 页面                                                                      | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 | 点击 Start 按钮 |     开始播放动画                                                                                  | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 |                       点击 Pause 按钮                        |                         暂停播放动画                         | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 |                        点击 Stop 按钮                        |                         停止播放动画                         | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 |                       点击 Finish 按钮                       |                         结束播放动画                         | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 |                      点击 Restart 按钮                       |                         重新播放动画                         | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 |                点击 seek to 30% progress 按钮                |                     从 30% 开始播放动画                      | 是    | Pass |
| Animation 页面按钮点击 | 位于 Animation 页面 |                        点击 Back 按钮                        |                           返回主页                           | 是    | Pass |
| 主页按钮点击 | 位于主页 | 点击 Use of general material properties 按钮 | 跳转至 Material Common 页面 | 是    | Pass |
| Material Common 页面按钮点击 | 位于 Material Common 页面 | 点击 material alpha code (Blend & Cutoff) 按钮 | 跳转至 Alpha 页面，显示透明混合和裁剪场景 | 是    | Pass |
| Alpha 页面按钮点击 | 位于 Alpha 页面 | 点击 Toggle blend 按钮 | 切换材质的混合模式，场景透明效果发生变化 | 是    | Pass |
| Alpha 页面按钮点击 | 位于 Alpha 页面 | 点击 Toggle alphaCutoff 按钮 | 切换 Alpha 裁剪阈值，场景裁剪效果发生变化 | 是    | Pass |
| Alpha 页面按钮点击 | 位于 Alpha 页面 | 点击 back 按钮 | 返回 Material Common 页面 | 是    | Pass |
| Material Common 页面按钮点击 | 位于 Material Common 页面 | 点击 material cull mode 按钮 | 跳转至剔除模式页面，显示平面对象 | 是    | Pass |
| Cull Mode 页面按钮点击 | 位于 Cull Mode 页面 | 点击 No culling 按钮 | 关闭面剔除，平面正反面均可见 | 是    | Pass |
| Cull Mode 页面按钮点击 | 位于 Cull Mode 页面 | 点击 Front face culling 按钮 | 启用正面剔除，只保留背面片元 | 是    | Pass |
| Cull Mode 页面按钮点击 | 位于 Cull Mode 页面 | 点击 Back face culling 按钮 | 启用背面剔除，只保留正面片元（默认模式） | 是    | Pass |
| Cull Mode 页面按钮点击 | 位于 Cull Mode 页面 | 点击 back 按钮 | 返回 Material Common 页面 | 是    | Pass |
| Material Common 页面按钮点击 | 位于 Material Common 页面 | 点击 material render slot 按钮 | 跳转至渲染排序页面，显示两个半透明平面 | 是    | Pass |
| Render Slot 页面滑动条调节 | 位于 Render Slot 页面 | 调节 renderSortLayer 滑动条 | 透明物体之间的绘制优先级发生变化 | 是    | Pass |
| Render Slot 页面按钮点击 | 位于 Render Slot 页面 | 点击 switch render sort layer order 按钮 | 切换渲染层内的排序顺序 | 是    | Pass |
| Render Slot 页面按钮点击 | 位于 Render Slot 页面 | 点击 back 按钮 | 返回 Material Common 页面 | 是    | Pass |
| Material Common 页面按钮点击 | 位于 Material Common 页面 | 点击 material shadow receiver 按钮 | 跳转至阴影接收页面，显示带聚光灯阴影的场景 | 是    | Pass |
| Shadow Receiver 页面按钮点击 | 位于 Shadow Receiver 页面 | 点击 Toggle shadowReceiver 按钮 | 切换平面的阴影接收状态 | 是    | Pass |
| Shadow Receiver 页面按钮点击 | 位于 Shadow Receiver 页面 | 点击 animation speed change 按钮 | 切换动画播放方向 | 是    | Pass |
| Shadow Receiver 页面按钮点击 | 位于 Shadow Receiver 页面 | 点击 back 按钮 | 返回 Material Common 页面 | 是    | Pass |
| Material Common 页面按钮点击 | 位于 Material Common 页面 | 点击 back 按钮 | 返回主页 | 是    | Pass |
| 主页按钮点击 | 位于主页 | 点击 Use of PBR material 按钮 | 跳转至 PBR 页面 | 是    | Pass |
| BaseColor 页面滑动条调节 | 位于 BaseColor 页面 | 调节 Base color red/green/blue/alpha 滑动条 | PBR 材质的基础色 RGBA 分量随之变化 | 是    | Pass |
| BaseColor 页面按钮点击 | 位于 BaseColor 页面 | 点击 Change texture 按钮 | 切换基础色纹理贴图 | 是    | Pass |
| BaseColor 页面按钮点击 | 位于 BaseColor 页面 | 点击 enable blend 按钮 | 切换混合模式开关 | 是    | Pass |
| BaseColor 页面按钮点击 | 位于 BaseColor 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - clearcoat 按钮 | 跳转至清漆页面，显示 PBR 球体 | 是    | Pass |
| Clearcoat 页面滑动条调节 | 位于 Clearcoat 页面 | 调节 Clearcoat intensity 滑动条 | 清漆强度随之变化 | 是    | Pass |
| Clearcoat 页面按钮点击 | 位于 Clearcoat 页面 | 点击 Change clearcoat texture 按钮 | 切换清漆纹理 | 是    | Pass |
| Clearcoat 页面滑动条调节 | 位于 Clearcoat 页面 | 调节 Clearcoat roughness 滑动条 | 清漆粗糙度随之变化 | 是    | Pass |
| Clearcoat 页面按钮点击 | 位于 Clearcoat 页面 | 点击 Change roughness texture 按钮 | 切换粗糙度纹理 | 是    | Pass |
| Clearcoat 页面按钮点击 | 位于 Clearcoat 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - clearcoat normal 按钮 | 跳转至清漆法线页面，展示清漆法线贴图效果 | 是    | Pass |
| Clearcoat Normal 页面按钮点击 | 位于 Clearcoat Normal 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - ambientOcclusion 按钮 | 跳转至环境光遮蔽页面，展示 AO 效果 | 是    | Pass |
| AO 页面按钮点击 | 位于 AO 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - emissive 按钮 | 跳转至自发光页面，显示 PBR 球体 | 是    | Pass |
| Emissive 页面滑动条调节 | 位于 Emissive 页面 | 调节 Emission red/green/blue/alpha 滑动条 | 自发光颜色 RGBA 分量随之变化 | 是    | Pass |
| Emissive 页面按钮点击 | 位于 Emissive 页面 | 点击 Change texture 按钮 | 切换自发光纹理 | 是    | Pass |
| Emissive 页面按钮点击 | 位于 Emissive 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - material 按钮 | 跳转至材质综合页面，展示金属度和粗糙度调节效果 | 是    | Pass |
| Material 页面按钮点击 | 位于 Material 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - normal 按钮 | 跳转至法线页面，展示法线贴图效果 | 是    | Pass |
| Normal 页面按钮点击 | 位于 Normal 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - sheen 按钮 | 跳转至光泽页面，显示 PBR 球体 | 是    | Pass |
| Sheen 页面滑动条调节 | 位于 Sheen 页面 | 调节 Sheen red/green/blue/roughness 滑动条 | 光泽属性随之变化 | 是    | Pass |
| Sheen 页面按钮点击 | 位于 Sheen 页面 | 点击 Change texture 按钮 | 切换光泽纹理 | 是    | Pass |
| Sheen 页面按钮点击 | 位于 Sheen 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 PBR material - specular 按钮 | 跳转至高光页面，显示 PBR 球体 | 是    | Pass |
| Specular 页面滑动条调节 | 位于 Specular 页面 | 调节 Specular red 滑动条 | 镜面反射红色通道随之变化 | 是    | Pass |
| Specular 页面滑动条调节 | 位于 Specular 页面 | 调节 Specular green 滑动条 | 镜面反射绿色通道随之变化 | 是    | Pass |
| Specular 页面滑动条调节 | 位于 Specular 页面 | 调节 Specular blue 滑动条 | 镜面反射蓝色通道随之变化 | 是    | Pass |
| Specular 页面滑动条调节 | 位于 Specular 页面 | 调节 Specular intensity 滑动条 | 镜面反射强度随之变化 | 是    | Pass |
| Specular 页面按钮点击 | 位于 Specular 页面 | 点击 back 按钮 | 返回 PBR 页面 | 是    | Pass |
| PBR 页面按钮点击 | 位于 PBR 页面 | 点击 back 按钮 | 返回主页 | 是    | Pass |