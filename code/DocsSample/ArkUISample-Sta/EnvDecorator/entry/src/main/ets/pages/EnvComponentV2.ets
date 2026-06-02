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

import { NavDestination, $r } from '@kit.ArkUI';
// [Start env_component_v2]
import {
  Env,
  Entry,
  Component,
  ComponentV2,
  Column,
  Require,
  Param,
  ObjectLink,
  SystemProperties,
  Text,
  UIUtils,
  IMonitor,
  Button,
  IMonitorDecoratedVariable
} from '@kit.ArkUI';
import uiObserver from '@ohos.arkui.observer';
import window from '@ohos.window';
import { common } from '@kit.AbilityKit';

@Entry
@ComponentV2
struct EnvComponentV2Example {
  @Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;
  @Env(SystemProperties.WINDOW_SIZE) sizeInVP: window.SizeInVP;
  @Env(SystemProperties.WINDOW_SIZE_PX) sizeInPX: window.Size;
  valueMonitor?: IMonitorDecoratedVariable;

  orientationChange(mon: IMonitor) {
    // 当前窗口宽、高度对应的布局断点信息变化时，触发该回调将变化前后值打印。
    mon.dirty.forEach((path: string) => {
      console.info(`[Env] ${path} changes from ${mon.value<Any>(path)?.before} to ${mon.value<Any>(path)?.now}`);
    })
  }

  aboutToAppear(): void {
    // @Env装饰变量的属性的改变可以通过addMonitor监听
    const callBackArray: Array<() => Any> = [];
    callBackArray.push(() => this.breakpoint.widthBreakpoint);
    callBackArray.push(() => this.breakpoint.heightBreakpoint);
    this.valueMonitor = UIUtils.addMonitor(callBackArray, this.orientationChange);
  }

  private changeOrientation(isLandscape: boolean) {
    // 页面横竖屏切换
    const context = this.getUIContext()?.getHostContext() as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT);
    });
  }

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`Index breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`Index breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口宽度（单位vp）
      Text(`Index sizeInVP width: ${this.sizeInVP.width}`)
        .fontSize(20)
      // 打印当前窗口高度（单位vp）
      Text(`Index sizeInVP height: ${this.sizeInVP.height}`)
        .fontSize(20)
      // 打印当前窗口宽度（单位px）
      Text(`Index sizeInPX width: ${this.sizeInPX.width}`)
        .fontSize(20)
      // 打印当前窗口高度（单位px）
      Text(`Index sizeInPX height: ${this.sizeInPX.height}`)
        .fontSize(20)

      Button('Landscape')
        .onClick(() => {
          this.changeOrientation(true);
        })

      Button('Portrait')
        .onClick(() => {
          this.changeOrientation(false);
        })

      CompV2({ breakpoint: this.breakpoint, sizeInVP: this.sizeInVP, sizeInPX: this.sizeInPX })
      Comp({ breakpoint: this.breakpoint, sizeInVP: this.sizeInVP, sizeInPX: this.sizeInPX })
    }
  }
}

@ComponentV2
struct CompV2 {
  @Require @Param breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;
  @Require @Param sizeInVP: window.SizeInVP;
  @Require @Param sizeInPX: window.Size;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`CompV2 breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`CompV2 breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口宽度（单位vp）
      Text(`CompV2 sizeInVP width: ${this.sizeInVP.width}`)
        .fontSize(20)
      // 打印当前窗口高度（单位vp）
      Text(`CompV2 sizeInVP height: ${this.sizeInVP.height}`)
        .fontSize(20)
      // 打印当前窗口宽度（单位px）
      Text(`CompV2 sizeInPX width: ${this.sizeInPX.width}`)
        .fontSize(20)
      // 打印当前窗口高度（单位px）
      Text(`CompV2 sizeInPX height: ${this.sizeInPX.height}`)
        .fontSize(20)
    }
  }
}

@Component
struct Comp {
  @Require breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo;
  @Require sizeInVP: window.SizeInVP;
  @Require sizeInPX: window.Size;

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`Comp breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`Comp breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .fontSize(20)
      // 打印当前窗口宽度（单位vp）
      Text(`Comp sizeInVP width: ${this.sizeInVP.width}`)
        .fontSize(20)
      // 打印当前窗口高度（单位vp）
      Text(`Comp sizeInVP height: ${this.sizeInVP.height}`)
        .fontSize(20)
      // 打印当前窗口宽度（单位px）
      Text(`Comp sizeInPX width: ${this.sizeInPX.width}`)
        .fontSize(20)
      // 打印当前窗口高度（单位px）
      Text(`Comp sizeInPX height: ${this.sizeInPX.height}`)
        .fontSize(20)
    }
  }
}
// [End env_component_v2]

@Builder
export function envComponentV2(): void {
  NavDestination() {
    EnvComponentV2Example();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.env_component_v2_title'))
}