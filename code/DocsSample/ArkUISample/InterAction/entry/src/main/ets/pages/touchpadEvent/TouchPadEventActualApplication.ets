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

// [Start touchpad_event]
import { UIContext, display } from '@kit.ArkUI';

/**
 * TouchPadEvent 实际应用页：
 * childStack 基于触控板双指手势实现跟随 ——
 * 双指滑动 -> 平移；双指张开/捏合 -> 缩放；抬手 -> 动画还原。
 * positionX/Y 为触控板归一化坐标 [0,1]（API 26.1.0 d.ts 定义）。
 */
@Entry
@Component
struct TouchPadEventActualApplication {
  @State info: string = '操作提示\n' +
    '1. 点击 Enable 后，触控板双指悬于粉色区域操作\n' +
    '2. 双指滑动：组件跟随平移\n' +
    '3. 双指张开/捏合：组件放大/缩小\n' +
    '4. 抬手：组件动画还原至原位';

  // ===== 双指手势跟随（childStack）=====
  @State moveX: number = 0;
  @State moveY: number = 0;
  @State pinchScale: number = 1;
  // 基线（非渲染数据，不加 @State）
  private lastMidX: number = 0;
  private lastMidY: number = 0;
  private lastDist: number = 0;
  private hasBaseline: boolean = false;
  // 增益：触控板归一化坐标[0,1]位移 -> 屏幕 vp，满幅滑动约移动一个屏幕宽/高
  private gainX: number = 360; // 默认值，aboutToAppear 中按屏幕实际尺寸重算
  private gainY: number = 780;
  // 手势诊断信息
  @State gestureDebug: string = '等待触控板事件…';
  private debugLines: string[] = [];

  aboutToAppear(): void {
    try {
      const d = display.getDefaultDisplaySync();
      const density = d.densityPixels; // px / vp
      if (density > 0) {
        const screenWVp = d.width / density;
        const screenHVp = d.height / density;
        this.gainX = screenWVp;
        this.gainY = screenHVp;
      }
      console.log(`GestureDebug| screen=${d.width}x${d.height}px density=${density} px/vp gain=(${this.gainX.toFixed(1)}, ${this.gainY.toFixed(1)})vp`);
    } catch (e) {
      console.log(`GestureDebug| display获取失败，使用默认增益: ${JSON.stringify(e)}`);
    }
  }

  // 单位归一化：positionX/Y 规范取值范围[0,1]；
  // 防御性兼容：若设备异常上报百分比(0~100)或毫米绝对坐标(>100)，
  // 用 deviceWidth/deviceHeight(触控板物理尺寸mm) 一并折算回[0,1]
  static toFraction(v: number, deviceSpanMm: number): number {
    if (v >= 0 && v <= 1) {
      return v; // 规范路径：[0,1]
    }
    if (v <= 100) {
      return v / 100; // 兼容异常百分比上报
    }
    return deviceSpanMm > 0 ? v / deviceSpanMm : v / 100; // 兼容异常毫米上报
  }

  appendGestureDebug(line: string): void {
    this.debugLines.push(line);
    if (this.debugLines.length > 15) {
      this.debugLines.shift();
    }
    this.gestureDebug = this.debugLines.join('\n');
    console.log(`GestureDebug| ${line}`);
  }

  gestureReset(): void {
    this.moveX = 0;
    this.moveY = 0;
    this.pinchScale = 1;
    this.hasBaseline = false;
    this.debugLines = [];
    this.gestureDebug = '已重置，等待触控板事件…';
  }

  // 抬手还原：动画回弹到原始位置与缩放
  restoreOrigin(): void {
    this.hasBaseline = false;
    if (this.moveX === 0 && this.moveY === 0 && this.pinchScale === 1) {
      return;
    }
    this.getUIContext().animateTo({ duration: 300, curve: Curve.EaseOut }, () => {
      this.moveX = 0;
      this.moveY = 0;
      this.pinchScale = 1;
    });
  }

  handleGesture(event: TouchPadEvent): void {
    const ph = event.changedContact.phase;
    const len = event.contacts.length;
    // 抬手（END/CANCEL）：动画还原组件
    if (ph === TouchPadEventPhase.END || ph === TouchPadEventPhase.CANCEL) {
      this.hasBaseline = false;
      this.restoreOrigin();
      this.appendGestureDebug(`phase=${ph} contacts=${len} 抬手 -> 还原原始位置`);
      return;
    }
    // 触点集发生增减（BEGIN/CANCEL）时重建基线，防跳变
    if (ph !== TouchPadEventPhase.MOVE) {
      this.hasBaseline = false;
    }
    if (len < 2) {
      // 少于两指：清基线，等待下次双指重新建立
      this.hasBaseline = false;
      this.appendGestureDebug(`phase=${ph} contacts=${len} (<2, 不做手势) ` +
        `changed[id=${event.changedContact.id} x=${event.changedContact.positionX} y=${event.changedContact.positionY}]`);
      return;
    }
    const a = event.contacts[0];
    const b = event.contacts[1];
    // 统一归一化为触控板[0,1]坐标（规范路径；兼容百分比/毫米异常上报）
    const ax = TouchPadEventActualApplication.toFraction(a.positionX, event.deviceWidth);
    const ay = TouchPadEventActualApplication.toFraction(a.positionY, event.deviceHeight);
    const bx = TouchPadEventActualApplication.toFraction(b.positionX, event.deviceWidth);
    const by = TouchPadEventActualApplication.toFraction(b.positionY, event.deviceHeight);
    const midX = (ax + bx) / 2;
    const midY = (ay + by) / 2;
    const dist = Math.sqrt((ax - bx) * (ax - bx) + (ay - by) * (ay - by));
    if (this.hasBaseline && this.lastDist > 0) {
      // 双指滑动：中点位移 -> 平移（[0,1]差值 × 屏幕增益换算为 vp）
      const dx = midX - this.lastMidX;
      const dy = midY - this.lastMidY;
      this.moveX += dx * this.gainX;
      this.moveY += dy * this.gainY;
      // 张开/捏合：间距比例 -> 缩放
      const ratio = dist / this.lastDist;
      let newScale = this.pinchScale * ratio;
      if (newScale < 0.3) {
        newScale = 0.3;
      } else if (newScale > 3.0) {
        newScale = 3.0;
      }
      this.pinchScale = newScale;
      this.appendGestureDebug(`phase=${ph} contacts=${len} ` +
        `a[${a.id}](${(ax * 100).toFixed(1)}%,${(ay * 100).toFixed(1)}%) b[${b.id}](${(bx * 100).toFixed(1)}%,${(by * 100).toFixed(1)}%) ` +
        `midΔ=(${(dx * 100).toFixed(2)},${(dy * 100).toFixed(2)})% dist=${(dist * 100).toFixed(1)}% ratio=${ratio.toFixed(3)} ` +
        `=> move=(${this.moveX.toFixed(1)},${this.moveY.toFixed(1)})vp scale=${this.pinchScale.toFixed(2)}`);
    } else {
      this.appendGestureDebug(`phase=${ph} contacts=${len} 建立基线 ` +
        `a[${a.id}](${(ax * 100).toFixed(1)}%,${(ay * 100).toFixed(1)}%) b[${b.id}](${(bx * 100).toFixed(1)}%,${(by * 100).toFixed(1)}%) ` +
        `dist=${(dist * 100).toFixed(1)}% rawMax=(${Math.max(a.positionX, b.positionX)},${Math.max(a.positionY, b.positionY)})`);
    }
    this.lastMidX = midX;
    this.lastMidY = midY;
    this.lastDist = dist;
    this.hasBaseline = true;
  }

  build() {
    Column() {
      Stack() {
        Stack()
          .id('childStack')
          .width(200)
          .height(200)
          .backgroundColor(Color.Pink)
          .translate({ x: this.moveX, y: this.moveY })
          .scale({ x: this.pinchScale, y: this.pinchScale })
          .onTouchPadEvent((event: TouchPadEvent) => {
            this.handleGesture(event);
          })
      }
      .width(200)
      .height(200)
      .backgroundColor(Color.Pink)
      .margin(5)

      Row() {
        Button('Enable TouchPad Event')
          .margin(5)
          .onClick(() => {
            UIContext.enableTouchPadEvent(true);
          })

        Button('Reset手势')
          .margin(5)
          .onClick(() => {
            this.gestureReset()
          })
      }

      Text(this.info)
        .width(320)
        .padding(10)
        .border({ width: 1, color: Color.Gray, radius: 4 })

      Text(`手势状态: move=(${this.moveX.toFixed(1)}, ${this.moveY.toFixed(1)}) scale=${this.pinchScale.toFixed(2)}\n` +
        `[诊断日志]\n${this.gestureDebug}`)
        .width(320)
        .fontSize(9)
        .fontFamily('monospace')
        .padding(10)
        .margin({ top: 5 })
        .border({ width: 1, color: Color.Blue, radius: 4 })
    }
    .width('100%')
    .height('100%')
  }
}
// [End touchpad_event]
