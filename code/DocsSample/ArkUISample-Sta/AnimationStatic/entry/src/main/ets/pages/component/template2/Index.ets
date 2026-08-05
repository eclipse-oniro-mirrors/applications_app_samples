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

// [Start Component_Scroll]
import curves from '@ohos.curves';
import window from '@ohos.window';
import display from '@ohos.display';
import mediaquery from '@ohos.mediaquery';
import {
  Entry,
  Component,
  Builder,
  Column,
  Row,
  Stack,
  Scroll,
  Scroller,
  ForEach,
  Button,
  Color,
  BorderStyle,
  Alignment,
  ScrollDirection,
  BarState,
  GestureGroup,
  GestureMode,
  PanGesture,
  PanDirection,
  GestureEvent,
  GestureMask,
  ScaleOptions,
  TranslateOptions,
  Resource,
  RowOptions,
  UIContext,
  State,
  AppStorage
} from '@kit.ArkUI';
import UIAbility from '@ohos.app.ability.UIAbility';

export default class GlobalContext {
  static mainWin: window.Window | undefined = undefined;
  static mainWindowSize: window.Size | undefined = undefined;
}

/**
 * 窗口、屏幕相关信息管理类
 */
export class WindowManager {
  private static instance: WindowManager | null = null;
  private displayInfo: display.Display | null = null;
  private uiContext: UIContext;
  private orientationListener: mediaquery.MediaQueryListener;

  constructor(uiContext: UIContext) {
    this.uiContext = uiContext;
    this.orientationListener = this.uiContext.getMediaQuery().matchMediaSync('(orientation: landscape)');
    this.orientationListener.onChange((mediaQueryResult: mediaquery.MediaQueryResult): void => {
      this.onPortrait(mediaQueryResult);
    });
    this.loadDisplayInfo();
  }

  /**
   * 设置主window窗口
   * @param win 当前app窗口
   */
  setMainWin(win: window.Window): void {
    if (win == null) {
      return;
    }
    GlobalContext.mainWin = win;
    win.onWindowSizeChange((data: window.Size): void => {
      if (GlobalContext.mainWindowSize == undefined || GlobalContext.mainWindowSize == null) {
        GlobalContext.mainWindowSize = data;
      } else {
        if (GlobalContext.mainWindowSize!.width == data.width && GlobalContext.mainWindowSize!.height == data.height) {
          return;
        }
        GlobalContext.mainWindowSize = data;
      }

      let winWidth: double = this.getMainWindowWidth();
      AppStorage.setOrCreate<double>('mainWinWidth', winWidth);
      let winHeight: double = this.getMainWindowHeight();
      AppStorage.setOrCreate<double>('mainWinHeight', winHeight);
      let context: UIAbility = new UIAbility();
      context.context.eventHub.emit('windowSizeChange', winWidth, winHeight);
    });
  }

  static getInstance(uiContext: UIContext): WindowManager {
    if (WindowManager.instance == null) {
      WindowManager.instance = new WindowManager(uiContext);
    }
    return WindowManager.instance!;
  }

  private onPortrait(mediaQueryResult: mediaquery.MediaQueryResult): void {
    if (mediaQueryResult.matches == AppStorage.get<boolean>('isLandscape')) {
      return;
    }
    AppStorage.setOrCreate<boolean>('isLandscape', mediaQueryResult.matches);
    this.loadDisplayInfo();
  }

  /**
   * 切换屏幕方向
   * @param ori 常量枚举值：window.Orientation
   */
  changeOrientation(ori: window.Orientation): void {
    if (GlobalContext.mainWin != null) {
      GlobalContext.mainWin!.setPreferredOrientation(ori);
    }
  }

  private loadDisplayInfo(): void {
    this.displayInfo = display.getDefaultDisplaySync();
    AppStorage.setOrCreate<double>('displayWidth', this.getDisplayWidth());
    AppStorage.setOrCreate<double>('displayHeight', this.getDisplayHeight());
  }

  /**
   * 获取main窗口宽度，单位vp
   */
  getMainWindowWidth(): double {
    return GlobalContext.mainWindowSize != null ? this.uiContext.px2vp(GlobalContext.mainWindowSize!.width) : 0;
  }

  /**
   * 获取main窗口高度，单位vp
   */
  getMainWindowHeight(): double {
    return GlobalContext.mainWindowSize != null ? this.uiContext.px2vp(GlobalContext.mainWindowSize!.height) : 0;
  }

  /**
   * 获取屏幕宽度，单位vp
   */
  getDisplayWidth(): double {
    return this.displayInfo != null ? this.uiContext.px2vp(this.displayInfo!.width) : 0;
  }

  /**
   * 获取屏幕高度，单位vp
   */
  getDisplayHeight(): double {
    return this.displayInfo != null ? this.uiContext.px2vp(this.displayInfo!.height) : 0;
  }

  /**
   * 释放资源
   */
  release(): void {
    if (this.orientationListener) {
      this.orientationListener.offChange((mediaQueryResult: mediaquery.MediaQueryResult): void => {
        this.onPortrait(mediaQueryResult);
      });
    }
    if (GlobalContext.mainWin != null) {
      GlobalContext.mainWin!.offWindowSizeChange();
    }
    WindowManager.instance = null;
  }
}

/**
 * 封装任务卡片信息数据类
 */
export class TaskData {
  bgColor: Color | string | Resource = Color.White;
  index: int = 0;
  taskInfo: string = 'music';

  constructor(bgColor: Color | string | Resource, index: int, taskInfo: string) {
    this.bgColor = bgColor;
    this.index = index;
    this.taskInfo = taskInfo;
  }
}

export const taskDataArr: Array<TaskData> =
  [
    new TaskData('#317AF7', 0, 'music'),
    new TaskData('#D94838', 1, 'mall'),
    new TaskData('#DB6B42', 2, 'photos'),
    new TaskData('#5BA854', 3, 'setting'),
    new TaskData('#317AF7', 4, 'call'),
    new TaskData('#D94838', 5, 'music'),
    new TaskData('#DB6B42', 6, 'mall'),
    new TaskData('#5BA854', 7, 'photos'),
    new TaskData('#D94838', 8, 'setting'),
    new TaskData('#DB6B42', 9, 'call'),
    new TaskData('#5BA854', 10, 'music')

  ];

@Entry
@Component
export struct TaskSwitchMainPage {
  displayWidth: double = WindowManager.getInstance(this.getUIContext()).getDisplayWidth();
  scroller: Scroller = new Scroller();
  cardSpace: double = 0;
  cardWidth: double = this.displayWidth / 2 - this.cardSpace / 2;
  cardHeight: double = 400;
  cardPosition: Array<double> = [];
  clickIndex: boolean = false;
  @State taskViewOffsetX: double = 0;
  @State cardOffset: double = this.displayWidth / 4;
  lastCardOffset: double = this.cardOffset;
  startTime: long | undefined = undefined;

  aboutToAppear(): void {
    for (let i: int = 0; i < taskDataArr.length; i++) {
      this.cardPosition.push(i * (this.cardWidth + this.cardSpace));
    }
  }

  // 每个卡片位置
  getProgress(index: int): double {
    let progress: double = (this.cardOffset + this.cardPosition[index] - this.taskViewOffsetX +
      this.cardWidth / 2) / this.displayWidth;
    return progress;
  }

  build(): void {
    Stack({ alignContent: Alignment.Bottom }) {
      // 背景
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor(0xF0F0F0)

      // 滑动组件
      Scroll(this.scroller) {
        Row({ space: this.cardSpace } as RowOptions) {
          ForEach(taskDataArr, (item: TaskData, index: int) => {
            Column()
              .width(this.cardWidth)
              .height(this.cardHeight)
              .backgroundColor(item.bgColor)
              .borderStyle(BorderStyle.Solid)
              .borderWidth(1)
              .borderColor(0xAFEEEE)
              .borderRadius(15)
              // 计算子组件的仿射属性
              .scale((this.getProgress(index) >= 0.4 && this.getProgress(index) <= 0.6) ?
                {
                  x: 1.1 - Math.abs(0.5 - this.getProgress(index)),
                  y: 1.1 - Math.abs(0.5 - this.getProgress(index))
                } as ScaleOptions :
                { x: 1, y: 1 } as ScaleOptions)
              .animation({ curve: curves.Curve.Smooth })
              // 滑动动画
              .translate({ x: this.cardOffset } as TranslateOptions)
              .animation({ curve: curves.springMotion() })
              .zIndex((this.getProgress(index) >= 0.4 && this.getProgress(index) <= 0.6) ? 2 : 1)
          })
        }
        .width((this.cardWidth + this.cardSpace) * (taskDataArr.length + 1))
        .height('100%')
      }
      .gesture(
        GestureGroup(GestureMode.Parallel,
          PanGesture({ direction: PanDirection.Horizontal, distance: 5 })
            .onActionStart((event: GestureEvent): void => {
              this.startTime = event.timestamp;
            })
            .onActionUpdate((event: GestureEvent): void => {
              this.cardOffset = this.lastCardOffset + event.offsetX;
            })
            .onActionEnd((event: GestureEvent): void => {
              let time: long = 0;
              if (this.startTime) {
                time = event.timestamp - this.startTime!;
              }
              let speed: double = event.offsetX / (time / 1000000000);
              let moveX: double = Math.pow(speed, 2) / 7000 * (speed > 0 ? 1 : -1);

              this.cardOffset += moveX;
              let cardOffsetMax: double = -(taskDataArr.length - 1) * (this.displayWidth / 2);
              if (this.cardOffset < cardOffsetMax) {
                this.cardOffset = cardOffsetMax;
              }
              if (this.cardOffset > this.displayWidth / 4) {
                this.cardOffset = this.displayWidth / 4;
              }

              // 左右滑动距离不满足/满足切换关系时，补位/退回
              let remainMargin: double = this.cardOffset % (this.displayWidth / 2);
              if (remainMargin < 0) {
                remainMargin = this.cardOffset % (this.displayWidth / 2) + this.displayWidth / 2;
              }
              if (remainMargin <= this.displayWidth / 4) {
                this.cardOffset += this.displayWidth / 4 - remainMargin;
              } else {
                this.cardOffset -= this.displayWidth / 4 - (this.displayWidth / 2 - remainMargin);
              }

              // 记录本次滑动偏移量
              this.lastCardOffset = this.cardOffset;
            })
        ), GestureMask.IgnoreInternal)
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)

      // 滑动到首尾位置
      Button('Move to first/last')
        .backgroundColor(0x888888)
        .margin({ bottom: 30 })
        .onClick(() => {
          this.clickIndex = !this.clickIndex;

          if (this.clickIndex) {
            this.cardOffset = this.displayWidth / 4;
          } else {
            this.cardOffset = this.displayWidth / 4 - (taskDataArr.length - 1) * this.displayWidth / 2;
          }
          this.lastCardOffset = this.cardOffset;
        })
    }
    .width('100%')
    .height('100%')
  }
}

// [End Component_Scroll]
