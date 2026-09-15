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
// [Start GradientTextFlowEffect]
// [Start StateDefinition]
import { PathShape } from '@kit.ArkUI';
import { text } from '@kit.ArkGraphics2D';

// 打字机每打出一个字的时间间隔（ms），值越大打字越慢
const TYPEWRITER_INTERVAL: number = 80;
// 渐变尾巴覆盖的字数，最后 N 个字做渐变着色
const GRADIENT_TAIL: number = 6;
// 已打出（非尾巴）文字的底色
const BASE_COLOR: ResourceColor = '#9A9A9A';
// 渐变起止色：紫 #BB99FF -> 青 #81E5FF
const GRADIENT_C1: ResourceColor = '#BB99FF';
const GRADIENT_C3: ResourceColor = '#81E5FF';

@Entry
@Component
export struct GradientTextFlowEffect {
  private fullText: string = '鸿蒙文字渐变打字机效果演示鸿蒙文字渐变打字机效果演示鸿蒙文字渐变打字机效果演示鸿蒙文字渐变打字机效果演示';
  private controller: TextController = new TextController();
  private layoutManager: LayoutManager | null = null;
  private timerId: number = -1;
  private started: boolean = false;

  // 组件宽高（px）
  private widthPx: number = 0;
  private heightPx: number = 0;
  // 已打出的字符数进度
  private progress: number = 0;

  // 动态裁剪路径与渐变配置
  @State revealPath: string = 'M 0,0 L 0,0 Z';
  @State tailPath: string = 'M 0,0 L 0,0 Z';
  @State gradientOpts: LinearGradientOptions = {
    direction: GradientDirection.Right,
    colors: [[GRADIENT_C1, 0], [GRADIENT_C3, 1]]
  };

  aboutToDisappear(): void {
    this.stopTimer();
  }

  private stopTimer(): void {
    if (this.timerId !== -1) {
      clearInterval(this.timerId);
      this.timerId = -1;
    }
  }

  private restart(): void {
    this.stopTimer();
    this.progress = 0;
    this.rebuild();
    this.timerId = setInterval((): void => this.tick(), TYPEWRITER_INTERVAL);
  }
// [End StateDefinition]

  // [Start SizeChange]
  private handleSizeChange(newSize: SizeOptions): void {
    const widthVp: number = this.toNumber(newSize.width);
    const heightVp: number = this.toNumber(newSize.height);
    if (widthVp <= 0 || heightVp <= 0) {
      return;
    }
    // 布局管理器接口返回的是 px 坐标，因此需要将 vp 统一转换为 px
    this.widthPx = vp2px(widthVp);
    this.heightPx = vp2px(heightVp);
    this.layoutManager = this.controller.getLayoutManager();
    if (this.layoutManager === null) {
      return;
    }
    this.rebuild();

    // 首次布局完成后启动定时器，避免在尺寸未就绪时空跑产生闪动
    if (!this.started) {
      this.started = true;
      this.timerId = setInterval((): void => this.tick(), TYPEWRITER_INTERVAL);
    }
  }

  private tick(): void {
    if (this.progress >= this.fullText.length) {
      this.stopTimer();
      return;
    }
    this.progress += 1;
    this.rebuild();
  }
  // [End SizeChange]

  // [Start TextGradientEffect]
  // 每个 tick 后重建两条裁剪路径与渐变区间
  private rebuild(): void {
    if (this.layoutManager === null || this.widthPx <= 0 || this.heightPx <= 0) {
      return;
    }
    const length: number = this.fullText.length;
    const progress: number = Math.max(0, Math.min(this.progress, length));

    // 计算基底裁剪路径
    if (progress <= 0) {
      this.revealPath = 'M 0,0 L 0,0 Z';
    } else if (progress >= length) {
      this.revealPath = `M 0,0 L ${this.widthPx},0 L ${this.widthPx},${this.heightPx} L 0,${this.heightPx} Z`;
    } else {
      this.revealPath = this.buildPathFromBoxes(this.getBoxes(0, progress));
    }

    // 计算尾巴裁剪路径（最后 GRADIENT_TAIL 个字）
    const tailStart: number = Math.max(0, progress - GRADIENT_TAIL);
    const tailBoxes: text.TextBox[] = this.getBoxes(tailStart, progress);
    this.tailPath = this.buildPathFromBoxes(tailBoxes);

    // 动态调整渐变 stops，保证渐变效果精准附着在尾部字符上
    let startStop: number = 0;
    let endStop: number = 0;
    if (tailBoxes.length > 0) {
      const last: text.TextBox = tailBoxes[tailBoxes.length - 1];
      startStop = this.clamp(last.rect.left / this.widthPx, 0, 1);
      endStop = this.clamp(last.rect.right / this.widthPx, 0, 1);
    }
    if (endStop <= startStop) {
      endStop = Math.min(1, startStop + 0.001);
    }
    this.gradientOpts = {
      direction: GradientDirection.Right,
      colors: [
        [BASE_COLOR, 0],
        [BASE_COLOR, startStop],
        [GRADIENT_C1, startStop],
        [GRADIENT_C3, endStop],
        [GRADIENT_C3, 1]
      ]
    };
  }

  // 按 [start, end) 字符区间查询字形外接框 (TIGHT 级别)
  private getBoxes(start: number, end: number): text.TextBox[] {
    if (this.layoutManager === null || start >= end) {
      return [];
    }
    const range: TextRange = { start, end };
    return this.layoutManager.getRectsForRange(
      range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT);
  }

  // 把多个外接框拼成一条 Path 命令
  private buildPathFromBoxes(boxes: text.TextBox[]): string {
    let path: string = '';
    for (let i = 0; i < boxes.length; i++) {
      const left: number = this.clamp(boxes[i].rect.left, 0, this.widthPx);
      const top: number = this.clamp(boxes[i].rect.top, 0, this.heightPx);
      const right: number = this.clamp(boxes[i].rect.right, 0, this.widthPx);
      const bottom: number = this.clamp(boxes[i].rect.bottom, 0, this.heightPx);
      if (right <= left || bottom <= top) {
        continue;
      }
      path += `M ${left},${top} L ${right},${top} L ${right},${bottom} L ${left},${bottom} Z `;
    }
    return path.length > 0 ? path : 'M 0,0 L 0,0 Z';
  }

  private clamp(value: number, min: number, max: number): number {
    return Math.max(min, Math.min(value, max));
  }

  private toNumber(value: Length | undefined): number {
    return Number(value) || 0;
  }
  // [End TextGradientEffect]

  // [Start UIDescription]
  build() {
    NavDestination() {
      Column() {
        Stack() {
          // 【基底层】：整段文字以 BASE_COLOR 纯色绘制，用 revealPath 裁出已打出的字
          Text(this.fullText, { controller: this.controller })
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor(BASE_COLOR)
            .width('100%')
            .clipShape(new PathShape({ commands: this.revealPath }))

          // 【渐变尾层】：将同一文字作为 DST_IN 蒙版，把 Row 的线性渐变裁成渐变文字
          Row() {
            Text(this.fullText)
              .fontSize(26)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .blendMode(BlendMode.DST_IN, BlendApplyType.OFFSCREEN)
          }
          .width('100%')
          .alignItems(VerticalAlign.Top)
          .linearGradient(this.gradientOpts)
          .blendMode(BlendMode.SRC_OVER, BlendApplyType.OFFSCREEN)
          .clipShape(new PathShape({ commands: this.tailPath }))
        }
        .width('100%')
        .alignContent(Alignment.TopStart)
        .onSizeChange((_oldValue: SizeOptions, newValue: SizeOptions) => {
          this.handleSizeChange(newValue);
        })

        // 触发重播测试
        Button($r('app.string.GradientTextFlowEffect_replay'))
          .margin({ top: 40 })
          .onClick(() => this.restart())
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
  }
  // [End UIDescription]
}
// [End GradientTextFlowEffect]
