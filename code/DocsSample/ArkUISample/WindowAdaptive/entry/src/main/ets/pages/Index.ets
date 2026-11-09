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

import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

/**
 * 断点：与系统推荐阈值一致，4个阈值分隔出xs/sm/md/lg/xl五档。
 * sm[320,600) md[600,840) lg[840,1440) xl[1440,+∞)，小于320为xs。
 * 阈值只由calcBreakpoint一处使用（currentBp单一数据源），列数由getColumns映射。
 */
enum Breakpoint { XS, SM, MD, LG, XL }

@Entry
@Component
struct AdaptiveWindow {
  // 断点与窗口宽度（vp）
  @State currentBp: Breakpoint = Breakpoint.SM;
  @State windowWidth: number = 0;
  // 系统状态栏 / 导航条避让区（vp）
  @State safeTop: number = 0;
  @State safeBottom: number = 0;
  // PC自由窗口标题栏高度（vp）
  @State decorHeight: number = 0;
  // 当前窗口尺寸限制（vp，来自getWindowLimitsVP）
  @State limitsMinWidth: number = 0;
  @State limitsMaxWidth: number = 0;

  private mainWindow: window.Window | null = null;
  private onResize: ((size: window.Size) => void) | null = null;
  private onRectChange: ((opts: window.RectChangeOptions) => void) | null = null;
  private onAvoidChange: ((opts: window.AvoidAreaOptions) => void) | null = null;

  // [Start breakpointGrid]
  // 把宽度（vp）换算成断点
  private calcBreakpoint(widthVp: number): Breakpoint {
    if (widthVp < 320) {
      return Breakpoint.XS;
    }
    if (widthVp < 600) {
      return Breakpoint.SM;
    }
    if (widthVp < 840) {
      return Breakpoint.MD;
    }
    if (widthVp < 1440) {
      return Breakpoint.LG;
    }
    return Breakpoint.XL;
  }

  // 统一入口：拿到宽度（vp）后同时更新宽度显示与断点（单一数据源）
  private applyWidth(widthVp: number): void {
    this.windowWidth = Math.round(widthVp);
    this.currentBp = this.calcBreakpoint(widthVp);
  }

  // 断点转标签字符串，用于信息条展示
  private bpLabel(bp: Breakpoint): string {
    return ['XS', 'SM', 'MD', 'LG', 'XL'][bp];
  }

  // 根据断点决定栅格列数（同时驱动信息展示与Grid.columnsTemplate，单一数据源）
  private getColumns(bp: Breakpoint): number {
    if (bp <= Breakpoint.SM) {
      return 1;
    }
    if (bp === Breakpoint.MD) {
      return 2;
    }
    return 3;
  }
  // [StartExclude breakpointGrid]

  // [Start avoidArea]
  // 单位px，需转vp
  private readAvoidArea(win: window.Window): void {
    try {
      const area: window.AvoidArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
      this.safeTop = Math.round(this.getUIContext().px2vp(area.topRect.height));
      this.safeBottom = Math.round(this.getUIContext().px2vp(area.bottomRect.height));
    } catch (err) {
      console.error('Could not read system avoid areas:', String(err));
    }
  }

  // 注意：该接口返回vp，避让区/矩形等其它接口返回px
  private readDecorHeight(win: window.Window): void {
    try {
      this.decorHeight = win.getWindowDecorHeight();
    } catch (err) {
      console.warn('Could not get title bar height:', String(err));
    }
  }
  // [End avoidArea]

  // 读取当前窗口尺寸限制（单位vp）
  private readWindowLimits(win: window.Window): void {
    try {
      const limits: window.WindowLimits = win.getWindowLimitsVP();
      this.limitsMinWidth = limits.minWidth ?? 0;
      this.limitsMaxWidth = limits.maxWidth ?? 0;
    } catch (err) {
      console.error('Reading size limits failed:', JSON.stringify(err));
    }
  }

  // [Start getLastWindow]
  // [Start avoidAreaListener]
  aboutToAppear(): void {
    // [StartExclude avoidAreaListener]
    // 页面自包含获取主窗口：不依赖EntryAbility做任何改动。
    const ctx = this.getUIContext().getHostContext();
    if (!ctx) {
      // 预览器等非真机环境拿不到宿主上下文，改由onAreaChange驱动断点
      return;
    }
    window.getLastWindow(ctx).then((win: window.Window) => {
      this.mainWindow = win;   // 保存主窗口实例

      // 用当前窗口宽度做一次初始化，换算断点并同步界面
      try {
        this.applyWidth(this.getUIContext().px2vp(win.getWindowProperties().windowRect.width));
      } catch (err) {
        console.error('Failed to get initial window width:', JSON.stringify(err));
      }

      // [StartExclude getLastWindow]
      this.readAvoidArea(win);
      this.readDecorHeight(win);
      this.readWindowLimits(win);
      // [EndExclude getLastWindow]

      // 回调单位是px，需转vp
      this.onResize = (size: window.Size): void => {
        this.applyWidth(this.getUIContext().px2vp(size.width));
      };
      try {
        win.on('windowSizeChange', this.onResize);
      } catch (err) {
        console.error('Failed to subscribe to windowSizeChange:', String(err));
      }

      // [StartExclude getLastWindow]
      // 监听窗口位置/大小变化原因
      this.onRectChange = (opts: window.RectChangeOptions): void => {
        console.info(`Window rect changed, reason: ${opts.reason}`);
      };
      try {
        win.on('windowRectChange', this.onRectChange);
      } catch (err) {
        console.warn('windowRectChange subscription failed:', String(err));
      }

      // [EndExclude avoidAreaListener]
      // 避让区变化：回调返回的数据总是最新，避免在windowSizeChange里主动getWindowAvoidArea
      this.onAvoidChange = (opts: window.AvoidAreaOptions): void => {
        this.safeTop = Math.round(this.getUIContext().px2vp(opts.area.topRect.height));
        this.safeBottom = Math.round(this.getUIContext().px2vp(opts.area.bottomRect.height));
      };
      try {
        win.on('avoidAreaChange', this.onAvoidChange);
      } catch (err) {
        console.error('avoidAreaChange subscription failed:', JSON.stringify(err));
      }
      // [EndExclude getLastWindow]
    }).catch((err: BusinessError) => {
      console.error(`getLastWindow failed: ${err.code} ${err.message}`);
    });
  }

  aboutToDisappear(): void {
    // 必须解绑，否则页面反复进出会重复注册回调，造成内存泄漏与多次回调
    if (this.mainWindow) {
      try {
        // [StartExclude avoidAreaListener]
        if (this.onResize) {
          this.mainWindow.off('windowSizeChange', this.onResize);
        }
        // [StartExclude getLastWindow]
        if (this.onRectChange) {
          this.mainWindow.off('windowRectChange', this.onRectChange);
        }
        // [EndExclude avoidAreaListener]
        if (this.onAvoidChange) {
          this.mainWindow.off('avoidAreaChange', this.onAvoidChange);
        }
        // [EndExclude getLastWindow]
      } catch (err) {
        console.warn('Unsubscribe failed:', String(err));
      }
    }
    // [StartExclude avoidAreaListener]
    this.mainWindow = null;
    this.onResize = null;
    // [StartExclude getLastWindow]
    this.onRectChange = null;
    // [EndExclude avoidAreaListener]
    this.onAvoidChange = null;
    // [EndExclude getLastWindow]
  }
  // [End avoidAreaListener]
  // [End getLastWindow]

  build() {
    // [Start avoidAreaPadding]
    Column({ space: 16 }) {
      // [StartExclude avoidAreaPadding]
      // 实时信息条
      Row({ space: 12 }) {
        Text(`宽度: ${this.windowWidth}vp`)
          .fontSize(14)
          .fontColor('#666')
        Text(`断点: ${this.bpLabel(this.currentBp)}`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#007DFF')
        Text(`列数: ${this.getColumns(this.currentBp)}`)
          .fontSize(14)
          .fontColor('#666')
        Blank()
        Text(`标题栏: ${this.decorHeight}vp`)
          .fontSize(12)
          .fontColor('#999')
        Text(`限制: ${this.limitsMinWidth}~${this.limitsMaxWidth}vp`)
          .fontSize(12)
          .fontColor('#999')
        Text(`避让(上/下): ${this.safeTop}/${this.safeBottom}vp`)
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      // 非真机或预览器上演示：onAreaChange拿到的即vp，由组件宽度变化驱动断点，让列数随窗口尺寸变化
      .onAreaChange((_old: Area, newArea: Area) => {
        const w: number = newArea.width as number;
        this.applyWidth(w);
      })

      // [EndExclude breakpointGrid]
      // 自适应栅格：列数由currentBp单一数据源驱动，Grid + .animation()让换列时卡片平滑重排
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
          GridItem() {
            Column() {
              Text(`卡片 ${item}`)
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
            }
            .width('100%')
            .height(100)
            .backgroundColor('#E3F2FD')
            .borderRadius(12)
            .justifyContent(FlexAlign.Center)
          }
        }, (item: number) => item.toString())
      }
      .columnsTemplate('1fr '.repeat(this.getColumns(this.currentBp)))
      .columnsGap(12)
      .rowsGap(12)
      .width('100%')
      .layoutWeight(1)
      // 换列时卡片位置平滑动画：.animation隐式动画
      .animation({ duration: 300, curve: Curve.Smooth })
      // [End breakpointGrid]
      // [EndExclude avoidAreaPadding]
    }
    .width('100%')
    .height('100%')
    // 内容padding随系统避让区动态调整
    .padding({
      left: 16,
      right: 16,
      top: 16 + this.safeTop,
      bottom: 16 + this.safeBottom
    })
    // [End avoidAreaPadding]
  }
}