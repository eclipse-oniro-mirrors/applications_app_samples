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
import { Camera, Scene, SceneResourceFactory } from '@kit.ArkGraphics3D';
import { Component3D, Column, Row, Button, Text, Component, Entry, $rawfile, SceneOptions, ModelType } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Model {
  scene: Scene | null = null;
  @State sceneOpt: SceneOptions | undefined = undefined;
  cam: Camera | null = null;

  aboutToAppear(): void {
    this.init();
  }

  aboutToDisappear(): void {
    if (this.scene) {
      this.scene!.destroy();
    }
    this.scene = null;
    this.cam = null;
  }

  init(): void {
    // [Start model_load]
    if (this.scene == null) {
      // 加载场景资源，支持.gltf和.glb格式，路径和文件名可根据项目实际资源自定义
      Scene.load($rawfile('gltf/DamagedHelmet/glTF/DamagedHelmet.glb'))
        .then(async (result: Scene) => {
          this.scene = result;
          let rf: SceneResourceFactory = this.scene!.getResourceFactory();
          // [StartExclude model_load]
          // [Start camera_scene_params]
          // 创建相机
          this.cam = await rf.createCamera({ 'name': 'Camera' });
          // 设置相机参数
          this.cam!.enabled = true;
          this.cam!.position.z = 5;

          this.sceneOpt = { scene: this.scene!, modelType: ModelType.SURFACE } as SceneOptions;
          // [End camera_scene_params]
          console.info('initialization completely.');
          // [EndExclude model_load]
        })
        .catch((error: Error) => {
          console.error('Scene load failed: ' + error);
        });
    }
    // [End model_load]
  }

  build() {
    Row() {
      Column() {
        if (this.sceneOpt) {
          // 使用Component3D显示3D场景
          Component3D(this.sceneOpt);
        } else {
          Text('Loading···');
        }
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
      }.width('100%')
    }.height('60%')
  }
}
