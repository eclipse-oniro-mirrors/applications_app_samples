'use static'

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

// [Start AsyncLoadPlaceholderSta]
import { UIUtils, ComponentInit, ComponentV2, Entry, Column, Text, Builder, wrapBuilder,
  LoadingProgress, FlexAlign } from '@kit.ArkUI';

// 占位模板须为全局、无参、只读静态渲染的受限Builder
@Builder({ isPlaceholder: true })
function HeavyPlaceholder() {
  Column() {
    LoadingProgress()
      .width(32)
      .height(32)
    Text('加载中...')
      .fontSize(14)
      .fontColor(0x999999)
  }
  .width('100%')
  .height(120)
  .justifyContent(FlexAlign.Center)
}

@ComponentV2
struct HeavyComponent {
  @ComponentInit
  init() {
    // 占位id须与注册的模板id一致；size为占位建议尺寸，数字单位为vp，
    // 越接近实际内容尺寸，占位替换为实际内容时视觉跳动越小
    UIUtils.getCustomComponentContext(this).enableAsyncLoad({
      placeholder: {
        id: 'heavyPlaceholder',
        size: { height: 120 }
      }
    });
  }

  build() {
    Column() {
      Text('实际内容')
    }
    .width('100%')
    .height(120)
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@ComponentV2
struct Index {
  aboutToAppear() {
    // 先注册占位模板（注册表经getPlaceholderRegister获取，按UI实例隔离）
    this.getUIContext().getPlaceholderRegister()
      .register('heavyPlaceholder', wrapBuilder(HeavyPlaceholder));
  }

  aboutToDisappear() {
    this.getUIContext().getPlaceholderRegister().unregister('heavyPlaceholder');
  }

  build() {
    Column() {
      Text('页面其余内容首个渲染帧正常呈现')
      HeavyComponent()
    }
  }
}
// [End AsyncLoadPlaceholderSta]
