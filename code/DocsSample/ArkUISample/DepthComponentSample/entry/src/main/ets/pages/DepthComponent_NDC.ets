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

// [Start depth_component_ndc]
// xxx.ets
@Entry
@Component
struct DepthComponentNdcExample {
  build() {
    Column() {
      // 请开发者替换为实际的资源文件
      DepthComponent($r('app.media.background')) {
        Text('NDC Mode')
          .textAlign(TextAlign.Center)
          .fontSize(120)
          .spatialEffect({
            position: {
              leftTop: { x: -0.2, y: -0.5, z: -2.0 },
              rightTop: { x: 0.2, y: -0.5, z: -2.0 },
              leftBottom: { x: -0.5, y: 0.5, z: -2.0 },
              rightBottom: { x: 0.5, y: 0.5, z: -2.0 },
              positionMode: SpatialPositionMode.NDC_XY_WORLD_Z,
            },
            occlusionWeight: 0.5   // 遮挡权重，0表示不被遮挡，1表示完全被遮挡
          })
          .borderWidth(3)
          .borderColor(Color.Red)
      }
      .width('100%')
      .height('100%')
      .depthMap($r('app.media.depth_map')) // 请开发者替换为实际的资源文件
      .camera({
        position: { x: 0, y: 0, z: 0 },
        quaternion: { x: 0, y: 0, z: 0, w: 1 },
        yFov: 1.05,
        zNear: 0.1,
        zFar: 100
      })
    }
    .width('100%')
    .padding(16)
  }
}
// [End depth_component_ndc]