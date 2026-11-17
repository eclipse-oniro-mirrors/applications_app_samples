/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
// Index.ets
// 示例应用的主页面
import { window } from '@kit.ArkUI';

const DEFAULT_WINDOW_DECOR_HEIGHT: number = 50;

@Entry
@Component
struct Index {
  @State message: string = 'Top layout area, do not hide the title bar.';
  private mainWindow: window.Window | null = null;
  @State private topAreaHeight: number = DEFAULT_WINDOW_DECOR_HEIGHT;
  @State private topAreaWidth: number | string = '100%';
  @State private titleButtonRect: window.TitleButtonRect = {
    right: 0,
    top: 0,
    width: 0,
    height: 0
  };
  @State private windowSize: window.Size = { width: 0, height: 0 }

  aboutToAppear(): void {
    let windowStage = AppStorage.get<window.WindowStage>('windowStage');
    if (!windowStage) {
      return;
    }
    this.mainWindow = windowStage.getMainWindowSync();
    try {
      this.topAreaHeight = this.mainWindow.getWindowDecorHeight();
    } catch (error) {
      this.topAreaHeight = DEFAULT_WINDOW_DECOR_HEIGHT;
    }
    this.mainWindow.on("windowSizeChange", (data) => {
      this.windowSize = data;
      this.topAreaWidth = this.getUIContext().px2vp(this.windowSize.width) - this.titleButtonRect.width;
    })
  }

  private updateTitleButtonRect(): void {
    if (!this.mainWindow) {
      return;
    }
    try {
      let windowProperties = this.mainWindow.getWindowProperties();
      this.windowSize.width = windowProperties.drawableRect.width;
      this.titleButtonRect = this.mainWindow.getTitleButtonRect();
      this.topAreaHeight = this.titleButtonRect.height;
      this.topAreaWidth = this.getUIContext().px2vp(this.windowSize.width) - this.titleButtonRect.width;
      console.info(`titleButtonRect: ${JSON.stringify(this.titleButtonRect)}`);
    } catch (exception) {
      console.error(`Failed to get the area of title buttons. Cause code: ${exception.code}, message: ${exception.message}`);
    }
  }

  build() {
    RelativeContainer() {
      Row() {
        Row() {
          Stack() {
            Row() {
              Text(this.message)
            }.width('100%').height('100%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor(Color.Pink)
          }.position({ x: 0, y: 0 })
          .width(this.topAreaWidth)
        }
        .position({ x: 0, y: 0 })
        .height(this.topAreaHeight)
        .width('100%')

        Row() {
          Button('hide the title bar and avoid the three buttons.')
            .onClick(() => {
              if (!this.mainWindow) {
                return;
              }
              this.message = 'Top layout area, hide the title bar and avoid the three buttons.';
              try {
                this.mainWindow.setWindowDecorVisible(false);
              } catch (error) {
                console.info('setWindowDecorVisible(false) is not supported on this device');
              }
              this.updateTitleButtonRect();
            })
          Button('do not hide the title bar.')
            .onClick(() => {
              if (!this.mainWindow) {
                return;
              }
              this.message = 'Top layout area, do not hide the title bar.';
              try {
                this.mainWindow.setWindowDecorVisible(true);
              } catch (error) {
                console.info('setWindowDecorVisible(true) is not supported on this device');
              }
              try {
                this.topAreaHeight = this.mainWindow.getWindowDecorHeight();
              } catch (error) {
                this.topAreaHeight = DEFAULT_WINDOW_DECOR_HEIGHT;
              }
              this.topAreaWidth = '100%';
            })
            .margin(20)
        }.height('50%')
        .width('100%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Center)
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}