/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';

import { Scene, Camera, Material, Node, Image, SceneResourceFactory, Geometry, EnvironmentBackgroundType,
  PostProcessSettings, ToneMappingType, MetallicRoughnessMaterial, Vec4 } from '@kit.ArkGraphics3D';
import {lookAt, OrbitCameraHelper } from '../common/utils';

const RESO: number = 255;

@Entry
@Component
struct pbr_basic {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | null = null;
  cam: Camera | null = null;
  cam2: Camera | null = null;
  orbitCamera: OrbitCameraHelper = new OrbitCameraHelper();
  material: Material | null = null;
  textures: Image[] = [];
  textureInUse: number = 0;
  @State label: boolean = true;

  onPageShow(): void {
    this.Init();
  }

  aboutToDisappear(): void {
    if (this.scene) {
      this.scene.destroy();
    }
    this.cam = null;
    this.scene = null;
  }

  Init(): void {
    if (this.scene == null) {
      // 加载场景资源，支持.gltf和.glb格式，路径和文件名可根据项目实际资源自定义
      Scene.load($rawfile('gltf/CompareMetallic/CompareMetallic.glb'))
        .then(async (scene: Scene) => {
          this.scene = scene;
          if (!this.scene.root) {
            return;
          }
          let rf: SceneResourceFactory = scene.getResourceFactory();
          // 获取PBR球体节点，缓存其材质和原始基础色纹理
          let pbrNode: Node | null | undefined = this.scene.root?.getNodeByPath('Unnamed Node 1/GeoSphere002');
          if (pbrNode) {
            this.material = (pbrNode as Geometry).mesh.subMeshes[0].material;
            let mrMaterial = (this.material as MetallicRoughnessMaterial);
            let original: Image | null = mrMaterial.baseColor.image;
            // 准备第二张纹理，用于运行时动态切换基础色纹理
            const helmAlbedo: Resource = $rawfile('gltf/DamagedHelmet/glTF/Default_albedo.jpg');
            let helmet: Image | null = await rf.createImage({name: 'helmetTexture', uri: helmAlbedo });

            if (original && helmet) {
              this.textures.push(original);
              this.textures.push(helmet);
            }
          }

          // 创建基于image的光照环境
          scene.environment = await rf.createEnvironment({ name: 'env' });
          scene.environment.backgroundType = EnvironmentBackgroundType.BACKGROUND_CUBEMAP;
          scene.environment.environmentImage = await rf.createImage({ name: 'cube', uri: $rawfile('Environment/quarry_02_2k_skybox.ktx') });
          scene.environment.radianceImage = await rf.createImage({ name: 'rad', uri: $rawfile('Environment/quarry_02_2k_radiance.ktx') });
          scene.environment.irradianceCoefficients =
            [{ x: 1.080343842506409, y: 0.936282396316528, z: 0.665518164634705 },
              { x: 0.959947884082794, y: 0.828918874263763, z: 0.569704353809357 },
              { x: 0.848236382007599, y: 0.715092182159424, z: 0.473145037889481 },
              { x: -0.591795265674591, y: -0.501678705215454, z: -0.334018945693970 },
              { x: -0.775423347949982, y: -0.655484378337860, z: -0.437325984239578 },
              { x: 1.053589701652527, y: 0.887459456920624, z: 0.587381422519684 },
              { x: -0.018954016268253, y: -0.014871496707201, z: -0.008891185745597 },
              { x: -0.566255271434784, y: -0.476870059967041, z: -0.314557582139969 },
              { x: -0.239390164613724, y: -0.200478553771973, z: -0.132790848612785 }];
          // 创建相机
          this.cam = await rf.createCamera({ 'name': 'BaseColorCam' });
          this.cam.enabled = true;
          lookAt(this.cam,{x:0,y:0,z:-3},{x:0,y:0,z:0},{x:0,y:1,z:0});
          this.sceneOpt = { scene: this.scene, modelType: ModelType.SURFACE } as SceneOptions;
          // 开启轨道控制
          this.orbitCamera.SetOrbitFromEye(this.cam.position, this.scene.root.position, this.cam.rotation);
          // 启用色调映射，提升HDR显示效果
          (this.cam.postProcess as PostProcessSettings) = {
            toneMapping: {
              type: ToneMappingType.ACES,
              exposure: 0.7,
            }
          };
          // 设置默认基础色为红色
          this.setBaseColorChannel(0, 1);  // 红色通道
          this.setBaseColorChannel(1, 0);  // 绿色通道
          this.setBaseColorChannel(2, 0);  // 蓝色通道
          this.setBaseColorChannel(3, 1);  // 透明度通道
        });
    }
  }

  // 在原始基础色纹理和自定义纹理之间切换
  changeTexture() {
    if (this.textures.length > 0) {
      let i = ++this.textureInUse % this.textures.length;
      (this.material as MetallicRoughnessMaterial).baseColor.image = this.textures[i];
    }
  }

  // 更新基础色的单个RGBA通道值
  setBaseColorChannel(idx: number, value: number) {
    if (this.material) {
      const color: Vec4 = (this.material as MetallicRoughnessMaterial).baseColor.factor;
      if (idx === 0) { color.x = value; }
      if (idx === 1) { color.y = value; }
      if (idx === 2) { color.z = value; }
      if (idx === 3) { color.w = value; }
      (this.material as MetallicRoughnessMaterial).baseColor.factor = color;
    }
  }

  // 切换混合模式开关，用于验证Alpha透明效果
  toggleBlend(): void {
    if (this.material) {
      if (this.label) {
        this.material.blend = {enabled : true};
      } else {
        this.material.blend = {enabled : false};
      }
      this.label = !this.label;
    }
  }

  build() {
    Column() {
      if (this.sceneOpt) {
        // 使用Component3D呈现3D场景
        Component3D(this.sceneOpt)
          .onTouch((event: TouchEvent) => {
            // 处理轨道相机旋转的触控输入事件
            this.orbitCamera.HandleTouchEvent(event);
            if (this.cam) {
              this.cam.position = this.orbitCamera.GetCameraPosition();
              this.cam.rotation = this.orbitCamera.GetCameraRotation();
            }
          })
          .gesture(
            PinchGesture({ fingers: 2 })
              .onActionStart((event: GestureEvent) => {
                console.info('Pinch start');
              })
              .onActionUpdate((event: GestureEvent) => {
                // 响应双指捏合手势，控制相机的缩放操作
                this.orbitCamera.HandlePinchGestureActionUpdate(event);
                if (this.cam) {
                  this.cam.position = this.orbitCamera.GetCameraPosition();
                  this.cam.rotation = this.orbitCamera.GetCameraRotation();
                }
              })
              .onActionEnd(() => {
                this.orbitCamera.HandlePinchGestureActionEnd();
              }))
      } else {
        Text('loading ...');
      }

      Button('Change texture').onClick(() => this.changeTexture());
      Text('Base color red');
      Slider({ value: RESO, min: 0, max: RESO }).onChange(v => this.setBaseColorChannel(0, v / RESO));
      Text('Base color green');
      Slider({ value: 0, min: 0, max: RESO }).onChange(v => this.setBaseColorChannel(1, v / RESO));
      Text('Base color blue');
      Slider({ value: 0, min: 0, max: RESO }).onChange(v => this.setBaseColorChannel(2, v / RESO));
      Text('Base color alpha');
      Slider({ value: RESO, min: 0, max: RESO }).onChange(v => this.setBaseColorChannel(3, v / RESO));

      Button('enable blend').onClick(() => {
        this.toggleBlend();
      });

      Button('back').onClick(() => {
        router.back();
      });

    }.width('100%').height('50%');
  }
}