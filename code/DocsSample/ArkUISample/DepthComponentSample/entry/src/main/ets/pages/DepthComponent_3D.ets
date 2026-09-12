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

// [Start depth_component_3d]
// xxx.ets
import { colorSpaceManager } from '@kit.ArkGraphics2D';

@Entry
@Component
struct DepthComponent3DExample {
  build() {
    Column() {
      // 请开发者替换为实际的3D模型资源文件（glTF/glb）
      DepthComponent($rawfile('model.glb'), {
        colorSpace: colorSpaceManager.ColorSpace.DISPLAY_P3
      }) {
        Text('Depth Component')
          .fontSize(100)
          .spatialEffect({
            // 通过四角坐标设置子组件在三维空间中的位置，形成倾斜形态
            position: {
              leftTop: { x: -0.355, y: 0.915, z: -1.941 },
              rightTop: { x: 0.483, y: 1.259, z: -2.295 },
              leftBottom: { x: -0.355, y: -0.281, z: -1.941 },
              rightBottom: { x: 0.483, y: 0.063, z: -2.295 }
            },
            // 遮挡权重，0表示不被遮挡，1表示完全被遮挡
            occlusionWeight: 0.5
          })
      }
      .width('100%')
      .height('100%')
      // 3D模型自带深度信息，无需设置depthMap
      .camera({
        position: { x: 0, y: 0, z: 0 },
        quaternion: { x: 0, y: 0, z: 0, w: 1 },
        yFov: 1.05,
        zNear: 0.1,
        zFar: 100
      })
      .light({
        direction: { x: 0, y: 0, z: -1 },
        color: { red: 255, green: 255, blue: 255 },
        intensity: 1
      })
      .onComplete((event: DepthComponentCompleteEvent) => {
        console.info(`Background loaded: ${event.componentWidth}x${event.componentHeight}`);
      })
      .onError((event: DepthComponentErrorEvent) => {
        console.error(`Background load failed: ${event.componentWidth}x${event.componentHeight}`);
        if (event.error) {
          console.error(`Error: ${event.error.code} - ${event.error.message}`);
        }
      })
    }
    .width('100%')
    .padding(16)
  }
}
// [End depth_component_3d]