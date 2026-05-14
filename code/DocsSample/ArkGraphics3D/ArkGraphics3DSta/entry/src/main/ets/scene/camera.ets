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

import { Camera, Scene, SceneNodeParameters, SceneResourceFactory } from '@kit.ArkGraphics3D';
import router from '@ohos.router';
import { Component3D, Column, Row, Button, Text, Slider, Component, Entry, SceneOptions, ModelType,
  $rawfile, Slider, SliderStyle, SliderChangeMode } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

let globalScene: Scene | null = null;

async function createCameraPromise(): Promise<Camera> {
  // [Start cam_load_and_factory]
  try {
    // 加载场景资源，支持.gltf和.glb格式，路径和文件名可根据项目实际资源自定义
    let scene: Scene = await Scene.load($rawfile('gltf/CubeWithFloor/glTF/AnimatedCube.glb'));
    // [StartExclude cam_load_and_factory]
    // 全局保存已加载的场景，以便复用
    globalScene = scene;
    // [EndExclude cam_load_and_factory]
    let sceneFactory: SceneResourceFactory = scene.getResourceFactory();
    let sceneCameraParameter: SceneNodeParameters = { name: 'camera' };
    // [StartExclude cam_load_and_factory]
    // 创建相机
    // [Start cam_create_and_config]
    let cameraEntity: Camera = await sceneFactory.createCamera(sceneCameraParameter);

    // 使能相机
    cameraEntity.enabled = true;

    // 设置相机位置
    cameraEntity.position.z = 5;

    // 设置Fov
    cameraEntity.fov = 60 * Math.PI / 180;

    // 设置其他相机参数
    // ...
    // [End cam_create_and_config]
    return cameraEntity;
    // [EndExclude cam_load_and_factory]
  } catch (error) {
    console.error('Camera create failed: ' + error);
    // [StartExclude cam_load_and_factory]
    throw error;
    // [EndExclude cam_load_and_factory]
  }
  // [End cam_load_and_factory]
}

@Entry
@Component
struct CameraPage {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | undefined = undefined;
  camera: Camera | null = null;
  @State positionX: double = 0;
  @State positionY: double = 0;
  @State positionZ: double = 5;

  aboutToAppear(): void {
    this.init();
  }

  aboutToDisappear(): void {
    if (this.scene) {
      this.scene!.destroy();
    }
    this.scene = null;
    this.camera = null;
    globalScene = null;
  }

  async init(): Promise<void> {
    // [Start cam_init_bind]
    this.camera = await createCameraPromise();
    if (globalScene && this.camera) {
      this.scene = globalScene;
      this.positionX = this.camera!.position.x;
      this.positionY = this.camera!.position.y;
      this.positionZ = this.camera!.position.z;
      this.sceneOpt = { scene: this.scene!, modelType: ModelType.SURFACE } as SceneOptions;
    }
    // [End cam_init_bind]
  }

  build() {
    Row() {
      Column() {
        Column() {
          if (this.sceneOpt) {
            // 使用Component3D显示3D场景
            Component3D(this.sceneOpt);
          } else {
            Text('Loading...');
          }
        }

        Column() {
          Text('X-axis: ' + this.positionX.toFixed(1)).fontSize(12);
          Slider({
            value: this.positionX,
            min: 0,
            max: 5,
            step: 0.1,
            style: SliderStyle.OutSet
          })
            .id('xAxis')
            .showTips(false)
            .onChange((value: double, mode: SliderChangeMode) => {
              this.positionX = value;
              if (mode === SliderChangeMode.End) {
                if (!this.scene || !this.camera) {
                  return;
                }
                this.camera!.position.x = value;
              }
            })
            .width('100%')
        }
        .width('100%')

        Column() {
          Text('Y-axis: ' + this.positionY.toFixed(1)).fontSize(12);
          Slider({
            value: this.positionY,
            min: 0,
            max: 5,
            step: 0.1,
            style: SliderStyle.OutSet
          })
            .showTips(false)
            .onChange((value: double, mode: SliderChangeMode) => {
              this.positionY = value;
              if (mode === SliderChangeMode.End) {
                if (!this.scene || !this.camera) {
                  return;
                }
                this.camera!.position.y = value;
              }
            })
            .width('100%')
        }
        .width('100%')

        Column() {
          Text('Z-axis: ' + this.positionZ.toFixed(1)).fontSize(12)
          // [Start cam_ui_sliders]
          Slider({
            value: this.positionZ,
            min: 5,
            max: 10,
            step: 0.1,
            style: SliderStyle.OutSet
          })
            .showTips(false)
            .onChange((value: double, mode: SliderChangeMode) => {
              this.positionZ = value;
              if (mode === SliderChangeMode.End) {
                if (!this.scene || !this.camera) {
                  return;
                }
                this.camera!.position.z = value;
              }
            })
            .width('100%')
          // [End cam_ui_sliders]
        }
        .width('100%')

        Button('back')
          .id('back')
          .fontSize(16)
          .fontWeight(500)
          .margin({ top: 20, left: 6 })
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
          .width('80%')
          .height(40)
      }
    }.height('60%')
  }
}
