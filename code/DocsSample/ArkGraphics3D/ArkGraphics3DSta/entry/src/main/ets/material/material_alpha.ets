'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Scene, Camera, Material, Node, SceneResourceFactory, Geometry, EnvironmentBackgroundType,
  PostProcessSettings, ToneMappingType } from '@kit.ArkGraphics3D';
import { lookAt, OrbitCameraHelper } from '../common/utils';
import { Component3D, Column, Button, Text, Component, Entry, PinchGesture, GestureEvent, TouchEvent, $rawfile,
  SceneOptions, ModelType } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct material_alpha {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | undefined = undefined;
  cam: Camera | null = null;
  blendMaterial: Material | null = null;
  alphaMaterial: Material | null = null;
  orbitCamera: OrbitCameraHelper = new OrbitCameraHelper();

  aboutToAppear(): void {
    this.Init();
  }

  aboutToDisappear(): void {
    if (this.scene) {
      this.scene!.destroy();
    }
    this.cam = null;
    this.scene = null;
  }

  Init(): void {
    if (this.scene == null) {
      // 加载场景资源，支持.gltf和.glb格式，路径和文件名可根据项目实际资源自定义
      Scene.load($rawfile('gltf/AlphaBlendModeTest/AlphaBlendModeTest.glb'))
        .then(async (scene: Scene) => {
          this.scene = scene;
          if (!this.scene!.root) {
            return;
          }
          let rf: SceneResourceFactory = scene.getResourceFactory();
          // 获取Blend与Cutoff节点对应的材质
          let blendNode: Node | null | undefined = this.scene!.root!.getNodeByPath('Scene/TestBlend');
          let alphaNode: Node | null | undefined = this.scene!.root!.getNodeByPath('Scene/TestCutoffDefault');
          if (blendNode) {
            this.blendMaterial = (blendNode as Geometry).mesh.subMeshes[0].material;
          }
          if (alphaNode) {
            this.alphaMaterial = (alphaNode as Geometry).mesh.subMeshes[0].material;
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
          this.cam = await rf.createCamera({ 'name': 'AlphaCam' });
          this.cam!.enabled = true;
          lookAt(this.cam!, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });
          this.sceneOpt = { scene: this.scene!, modelType: ModelType.SURFACE } as SceneOptions;
          // 开启轨道控制
          this.orbitCamera.SetOrbitFromEye(this.cam!.position, this.scene!.root!.position, this.cam!.rotation);
          // 启用色调映射，提升HDR显示效果
          this.cam!.postProcess = {
            toneMapping: {
              type: ToneMappingType.ACES,
              exposure: 0.7,
            }
          };
        });
    }
  }

  // 切换透明和不透明材质的混合模式
  toggleBlend(): void {
    if (this.blendMaterial) {
      if (this.blendMaterial!.blend!.enabled) {
        // 若当前为混合模式，切换为非混合模式
        this.blendMaterial!.blend = { enabled: false };
      } else {
        // 若当前为非混合模式，切换为混合模式
        this.blendMaterial!.blend = { enabled: true };
      }
    }
  }

  // 切换非混合材质的alpha-cutoff阈值
  toggleAlphaCutoff(): void {
    if (!this.alphaMaterial) {
      return;
    }
    if (this.alphaMaterial!.alphaCutoff && this.alphaMaterial!.alphaCutoff! < 1.0) {
      // 若alphaCutoff小于 1.0，则切换为完全不透明模式
      this.alphaMaterial!.alphaCutoff = 1.0;
    } else {
      // 若alphaCutoff等于1或尚未设置，则切换为半透明裁剪（semi-transparent clipping）模式
      this.alphaMaterial!.alphaCutoff = 0.5;
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
              this.cam!.position = this.orbitCamera.GetCameraPosition();
              this.cam!.rotation = this.orbitCamera.GetCameraRotation();
            }
          })
          .gesture(
            PinchGesture({ fingers: 2 })
              .onActionUpdate((event: GestureEvent) => {
                // 响应双指捏合手势，控制相机的缩放操作
                this.orbitCamera.HandlePinchGestureActionUpdate(event);
                if (this.cam) {
                  this.cam!.position = this.orbitCamera.GetCameraPosition();
                  this.cam!.rotation = this.orbitCamera.GetCameraRotation();
                }
              })
              .onActionEnd(() => {
                this.orbitCamera.HandlePinchGestureActionEnd();
              })
          )
      } else {
        Text('loading ...');
      }

      Text('Alpha / AlphaCutoff demo');
      Button('Toggle blend').onClick(() => this.toggleBlend());
      Button('Toggle alphaCutoff').onClick(() => this.toggleAlphaCutoff());

      Button('back').onClick(() => this.getUIContext().getRouter().back());

    }.width('100%').height('70%');
  }
}
