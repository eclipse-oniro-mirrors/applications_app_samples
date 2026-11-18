/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { HARNESS, HARNESS_ID, HARNESS_SIZE } from '../../test/PixelHarness';

// Area 上报的 Length 转数值，RenderNode.frame 使用 vp。
function toVp(value: Length): number {
  if (typeof value === 'number') {
    return value;
  }
  if (typeof value === 'string') {
    const parsed: number = Number(value);
    return Number.isNaN(parsed) ? 0 : parsed;
  }
  return 0;
}

// 测试页：只承载像素探针画布，用例通过组件快照回读绘制结果。
@Entry
@Component
struct Index {
  @State message: string = 'NdkRenderNode pixel harness';

  aboutToAppear(): void {
    // 测试进程拿不到窗口句柄，把页面自己的 UIContext 交给探针，供用例做组件快照。
    HARNESS.attachUi(this.getUIContext());
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(12)
        .width('100%')
      NodeContainer(HARNESS)
        .id(HARNESS_ID)
        .width(HARNESS_SIZE)
        .height(HARNESS_SIZE)
        .onAreaChange((_oldValue: Area, newValue: Area) => {
          HARNESS.resize(toVp(newValue.width), toVp(newValue.height));
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
