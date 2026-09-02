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
// [Start canvasContentOnVisibleAreaApproximateChange_start]
import { ColorMetrics } from '@kit.ArkUI';

@Entry
@Component
struct CanvasContentOnVisibleAreaApproximateChange {
  private canvasContext: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  private timerId: number = -1;

  drawRandomCircle(): void {
    let center: [number, number] = [Math.random() * 200 + 50, Math.random() * 200 + 50]
    let radius: number = Math.random() * 20 + 10
    let color: ColorMetrics =
      ColorMetrics.rgba(Math.floor(Math.random() * 255), Math.floor(Math.random() * 255),
        Math.floor(Math.random() * 255))

    // 清空原先内容与画布状态
    this.canvasContext.reset()

    // 开始绘制
    this.canvasContext.fillStyle = color.color
    let path: Path2D = new Path2D()
    path.ellipse(center[0], center[1], radius, radius, 0, 0, Math.PI * 2)
    this.canvasContext.fill(path)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.canvasContext)
        .width(300)
        .height(300)
        .onVisibleAreaApproximateChange({ ratios: [0.0] },
          (isVisible: boolean, currentRatio: number) => {
            // canvas不可见
            if (!isVisible && currentRatio <= 0) {
              clearInterval(this.timerId)
              this.timerId = -2
            }
            // canvas可见
            if (isVisible) {
              if (this.timerId == -2) {
                this.timerId = setInterval(() => {
                  this.drawRandomCircle()
                }, 500)
              }
            }
          })
      Button('draw sth')
        .onClick(() => {
          if (this.timerId < 0) {
            this.timerId = setInterval(() => {
              this.drawRandomCircle()
            }, 500)
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}
// [End canvasContentOnVisibleAreaApproximateChange_start]