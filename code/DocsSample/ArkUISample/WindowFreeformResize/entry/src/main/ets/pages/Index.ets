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

@Entry
@Component
struct Index {
  @State winWidthPx: number = 0;   // 当前窗口宽（px）
  @State winHeightPx: number = 0;  // 当前窗口高（px）
  @State limitsMinW: number = 0;   // 最小宽（vp）
  @State limitsMaxW: number = 0;   // 最大宽（vp）
  @State limitsMinH: number = 0;   // 最小高（vp）
  @State limitsMaxH: number = 0;   // 最大高（vp）

  private mainWindow: window.Window | null = null;   // 主窗口实例，后续缩放、尺寸范围、尺寸监听都基于它
  private sizeListener: ((size: window.Size) => void) | null = null;   // 尺寸变化监听回调，注销时需传入同一引用

  // [Start init]
  // 把窗口宽高（px）写回状态变量，驱动界面刷新
  private applySize(widthPx: number, heightPx: number): void {
    this.winWidthPx = Math.round(widthPx);
    this.winHeightPx = Math.round(heightPx);
  }

  // 读取生效尺寸范围（入参与系统限制的交集），存到状态变量供界面展示
  private readLimits(win: window.Window): void {
    try {
      const l: window.WindowLimits = win.getWindowLimitsVP();   // 返回单位vp
      // 把生效范围分别存到状态变量
      this.limitsMinW = l.minWidth ?? 0;
      this.limitsMaxW = l.maxWidth ?? 0;
      this.limitsMinH = l.minHeight ?? 0;
      this.limitsMaxH = l.maxHeight ?? 0;
      console.info(`Effective range: ${l.minWidth}~${l.maxWidth} × ${l.minHeight}~${l.maxHeight}`);
    } catch (err) {
      console.error('Failed to read effective size range:', String(err));
    }
  }

  // 窗口初始化：使能拖拽缩放、设置尺寸范围、同步初始尺寸
  private setupWindow(win: window.Window): void {
    // 默认已支持拖拽缩放，显式开启以防被关闭
    win.setResizeByDragEnabled(true).then(() => {
      console.info('Drag-to-resize enabled');
    }).catch((err: BusinessError) => {
      console.error(`setResizeByDragEnabled failed: ${err.code} ${err.message}`);
    });

    // 防止过度缩放导致内容截断或布局错乱
    const limits: window.WindowLimits = {
      minWidth: 480,
      minHeight: 360,
      maxWidth: 1600,
      maxHeight: 1000,
      pixelUnit: window.PixelUnit.VP
    };
    win.setWindowLimits(limits).then(() => {
      this.readLimits(win);   // 读取“入参与系统限制的交集”，并打印生效范围
    }).catch((err: BusinessError) => {
      console.error(`setWindowLimits failed: ${err.code} ${err.message}`);
    });

    // 读取初始窗口尺寸，同步到界面
    try {
      this.applySize(win.getWindowProperties().windowRect.width,
        win.getWindowProperties().windowRect.height);
    } catch (err) {
      console.error('Failed to get initial window size:', JSON.stringify(err));
    }
  }

  // [Start resizeChange]
  // 获取主窗口、完成初始化，并注册尺寸变化监听
  aboutToAppear(): void {
    // [StartExclude resizeChange]
    const ctx = this.getUIContext().getHostContext();   // 获取宿主上下文作为getLastWindow入参
    if (!ctx) {
      return;   // 预览器等环境拿不到宿主上下文，本示例依赖真实窗口，直接跳过
    }
    window.getLastWindow(ctx).then((win: window.Window) => {
      this.mainWindow = win;   // 保存主窗口实例
      this.setupWindow(win);   // 完成初始化：使能拖拽缩放、设置尺寸范围、同步初始尺寸
    // [EndExclude resizeChange]

      // [StartExclude init]
      // 尺寸变化回调：把新宽高写回状态变量，驱动界面刷新
      this.sizeListener = (size: window.Size): void => {
        this.applySize(size.width, size.height);
      };
      // 注册监听，窗口拖动/拖拽缩放后回调sizeListener
      try {
        win.on('windowSizeChange', this.sizeListener);
      } catch (err) {
        console.error('windowSizeChange subscription failed:', String(err));
      }
      // [EndExclude init]
    }).catch((err: BusinessError) => {
      console.error(`getLastWindow failed: ${err.code} ${err.message}`);
    });
  }

  // [StartExclude init]
  // 注销尺寸变化监听并释放引用，避免内存泄漏
  aboutToDisappear(): void {
    if (this.mainWindow && this.sizeListener) {
      try {
        this.mainWindow.off('windowSizeChange', this.sizeListener);   // 注销监听
      } catch (err) {
        console.warn('windowSizeChange unsubscribe failed:', String(err));
      }
    }
    this.mainWindow = null;   // 释放主窗口引用
    this.sizeListener = null; // 释放监听回调引用
  }
  // [EndExclude init]
  // [End resizeChange]
  // [End init]

  // 界面布局：标题栏 + 实时尺寸信息 + 内容区
  build() {
    Column({ space: 16 }) {
      Text('窗口自由缩放')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .width('100%')
        .height(56)
        .textAlign(TextAlign.Center)
        .backgroundColor('#0A59F7')

      // 实时窗口尺寸信息
      Column({ space: 6 }) {
        Row() {
          Text(`${this.winWidthPx} × ${this.winHeightPx} px`)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#0A59F7')
          Blank()
          Text(`≈ ${Math.round(this.getUIContext().px2vp(this.winWidthPx))} × ${Math.round(this.getUIContext().px2vp(this.winHeightPx))} vp`)
            .fontSize(12)
            .fontColor('#888')
        }
        .width('100%')

        Row() {
          Text(`尺寸范围: ${this.limitsMinW}~${this.limitsMaxW} × ${this.limitsMinH}~${this.limitsMaxH} vp`)
            .fontSize(12)
            .fontColor('#666')
        }
        .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)

      // [Start contentLayout]
      // 内容区：百分比 + layoutWeight铺满剩余空间，任意窗口尺寸下都完整显示
      Column({ space: 8 }) {
        Text('窗口预览').fontSize(64)
        Text('拖动窗口边框或角，体验自由缩放').fontSize(12).fontColor('#888')
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#E3F2FD')
      .borderRadius(12)
      // [End contentLayout]
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F1F3F5')
  }
}