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
const GAIN: number = 5;
const INIT: number = RESO / GAIN;

@Entry
@Component
struct pbr_sheen {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | null = null;
  cam: Camera | null = null;
  orbitCamera: OrbitCameraHelper = new OrbitCameraHelper();
  material: Material | null = null;
  textures: Image[] = [];
  textureInUse: number = 0;

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
      Scene.load($rawfile('gltf/CompareClearcoat/CompareClearcoat.glb'))
        .then(async (scene: Scene) => {
          this.scene = scene;
          if (!this.scene.root) {
            return;
          }
          let rf: SceneResourceFactory = scene.getResourceFactory();
          // 获取目标节点及其关联的PBR材质
          let pbrNode: Node | null | undefined = this.scene.root.getNodeByPath('Unnamed Node 1/GeoSphere002');
          if (pbrNode) {
            this.material = (pbrNode as Geometry).mesh.subMeshes[0].material;
            let mrMaterial = (this.material as MetallicRoughnessMaterial);
            let original: Image | null = mrMaterial.sheen.image;
            // 加载一张备选纹理用于光泽（Sheen）纹理对比
            const helmAlbedo: Resource = $rawfile('image/sheen.png');
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
          this.cam = await rf.createCamera({ 'name': 'SheenCam' });
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
          this.setSheenChannel(0, INIT);
          this.setSheenChannel(1, INIT);
          this.setSheenChannel(2, 0);
          this.setSheenChannel(3, 0);
        });
    }
  }

  // 在已加载的光泽层纹理之间切换
  changeSheenTex() {
    if (this.textures.length > 0) {
      let i = ++this.textureInUse % this.textures.length;
      (this.material as MetallicRoughnessMaterial).sheen.image = this.textures[i];
    }
  }

  // 调节光泽各通道值
  setSheenChannel(idx: number, v: number) {
    if (this.material) {
      const f: Vec4 = (this.material as MetallicRoughnessMaterial).sheen.factor;
      if (idx === 0) { f.x = GAIN * v / RESO; }
      if (idx === 1) { f.y = GAIN * v / RESO; }
      if (idx === 2) { f.z = GAIN * v / RESO; }
      if (idx === 3) { f.w = GAIN * v / RESO; }
      (this.material as MetallicRoughnessMaterial).sheen.factor = f;
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

      Button('Change texture').onClick(() => this.changeSheenTex());
      Text('Sheen red');
      Slider({ value: INIT, min: 0, max: RESO }).onChange(v => this.setSheenChannel(0, v));
      Text('Sheen green');
      Slider({ value: INIT, min: 0, max: RESO }).onChange(v => this.setSheenChannel(1, v));
      Text('Sheen blue');
      Slider({ value: INIT, min: 0, max: RESO }).onChange(v => this.setSheenChannel(2, v));
      Text('Sheen roughness');
      Slider({ value: INIT, min: 0, max: RESO }).onChange(v => this.setSheenChannel(3, v));

      Button('back').onClick(() => {
        router.back();
      });
    }.width('100%').height('50%');
  }
}