'use static';
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
import { Entry, Component, Builder, Column, Text, Canvas, Stack, CanvasRenderingContext2D, RenderingContextSettings } from '@ohos.arkui.component';

//[Start virtual_node_example_start]
@Entry
@Component
struct VirtualNodeExample {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  // 无障碍虚拟子节点，占位组件仅做布局不做显示，位置和大小与画布中绘制内容所在区域保持一致。
  @Builder customAccessibilityNode(): void {
    Stack() {
      Text('Submit')
        .position({ x: 50, y: 100 })
        .width(100)
        .height(50)
      Text('Reset')
        .position({ x: 200, y: 100 })
        .width(100)
        .height(50)
    }
    .width('100%')
    .height('100%')
  }

  build(): void {
    Column() {
      Canvas(this.context)
        .width(350)
        .height(300)
        .onReady(() => {
          // 绘制“Submit”按钮，绘制内容无法直接被无障碍服务识别。
          this.context.fillStyle = '#007DFF';
          this.context.fillRect(50, 100, 100, 50);
          this.context.fillStyle = '#FFFFFF';
          this.context.font = '30px sans-serif';
          this.context.fillText('Submit', 70, 132);
          // 绘制“Reset”按钮。
          this.context.fillStyle = '#007DFF';
          this.context.fillRect(200, 100, 100, 50);
          this.context.fillStyle = '#FFFFFF';
          this.context.fillText('Reset', 220, 132);
        })
        .accessibilityVirtualNode(this.customAccessibilityNode)
    }
  }
}
//[End virtual_node_example_start]