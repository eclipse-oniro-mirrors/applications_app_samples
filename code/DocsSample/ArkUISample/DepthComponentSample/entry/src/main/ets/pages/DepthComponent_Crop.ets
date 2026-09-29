/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start depth_component_crop]
// xxx.ets
@Entry
@Component
struct DepthComponentCropExample {
  build() {
    Column() {
      // 请开发者替换为实际的资源文件
      DepthComponent($r('app.media.background')) {
        Text('Spatial Effect')
          .fontSize(100)
          .spatialEffect({
            position: -10.0,      // 数值写法：设置子组件深度信息
            occlusionWeight: 1.0
          })
      }
      .width('100%')
      .height('100%')
      .depthMap($r('app.media.depth_map')) // 请开发者替换为实际的资源文件
      .camera({
        position: { x: 0, y: 0, z: 0 },
        quaternion: { x: 0, y: 0, z: 0, w: 1 },
        yFov: 1.05,
        zNear: 0.1,
        zFar: 100,
        cameraBufferCrop: {
          bufferWidth: 1262,       // 基准图宽度，需与背景图实际宽度一致
          bufferHeight: 2560,      // 基准图高度，需与背景图实际高度一致
          cropOffset: { x: 100.0, y: 100.0 },
          cropScale: 0.65
        }
      })
      .light({
        direction: { x: 0, y: 0, z: -1 },
        color: { red: 255, green: 255, blue: 255 },
        intensity: 1
      })
    }
    .width('100%')
    .padding(16)
  }
}
// [End depth_component_crop]