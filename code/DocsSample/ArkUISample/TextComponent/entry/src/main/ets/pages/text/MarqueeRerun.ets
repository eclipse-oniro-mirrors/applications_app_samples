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
// [Start MarqueeRerunSample]
// [Start StateDefinition]
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct MarqueeRerun {
  // 控制跑马灯是否启动
  @State isStart: boolean = false;
  // 控制跑马灯是否从头开始滚动
  @State fromStart: boolean = true;
  // 设置循环次数。注意：必须为有限次数才能触发 onFinish 回调
  @State loopCount: number = 1;
  @State displayTitle: string =
    '这是一段用来测试重跑逻辑的跑马灯文本，文本长度必须超过屏幕宽度才能触发真正的滚动效果...';
  @State displaySymbol: Resource = $r('sys.symbol.checkmark');
  // [End StateDefinition]

  // [Start MarqueeBuilder]
  @Builder
  buildMarquee() {
    Row() {
      Marquee({
        src: this.displayTitle,
        start: this.isStart, // 绑定启动状态
        step: 6, // 滚动步长（速度）
        loop: this.loopCount, // 绑定循环次数
        spacing: LengthMetrics.vp(40),
        fromStart: this.fromStart, // 绑定起始位置控制
      })
        .flexShrink(1)
        .fontSize(16)
        .fontColor(Color.White)
        .marqueeUpdateStrategy(MarqueeUpdateStrategy.PRESERVE_POSITION)
        // 关键逻辑：单次/有限次播放结束后，清理状态
        .onFinish(() => {
          console.info('onFinish');
          // 将启动状态和从头开始状态都置为 false，以便下次赋予 true 时触发 UI 刷新
          this.isStart = false;
          this.fromStart = false;
        })

      SymbolGlyph(this.displaySymbol)
        .fontSize(20)
        .fontColor([Color.White])
    }
    .width('100%')
    .backgroundColor('#182431')
    .padding(10)
  }
  // [End MarqueeBuilder]

  // [Start UIDescription]
  build() {
    NavDestination() {
      Column({ space: 40 }) {
        this.buildMarquee()

        // 触发重跑的操作入口
        Button($r('app.string.MarqueeRerun_button'))
          .onClick(() => {
            // 同时将状态置为 true，通知跑马灯组件：启动，并且从头开始！
            this.isStart = true;
            this.fromStart = true;
          })
          .width('120vp')
          .height('40vp')
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
    }
  }
  // [End UIDescription]
}

// [End MarqueeRerunSample]

export { MarqueeRerun };
