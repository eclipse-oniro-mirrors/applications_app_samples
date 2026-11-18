/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { window, display } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import Constants from '../common/Constants';

interface WindowPosition {
  x: number
  y: number
}

const TAG = 'SubWindow';

@Entry
@Component
struct SubWindow {
  private windowPosition: WindowPosition | null = null;
  private subWindow: window.Window | null = null;
  private screenWidth: number = 0;
  private screenHeight: number = 0;
  private windowWidth: number = 0;
  private windowHeight: number = 0;

  aboutToAppear(): void {
    try {
      this.subWindow = window.findWindow(Constants.SUB_WINDOW_NAME);
      const defaultDisplay = display.getDefaultDisplaySync();
      this.screenWidth = defaultDisplay.width;
      this.screenHeight = defaultDisplay.height;
    } catch (error) {
      hilog.info(Constants.DOMAIN, TAG, 'findWindow or getDisplay failed.');
    }
  }

  build() {
    Column() {
      SymbolGlyph($r('sys.symbol.person_crop_circle_fill_1'))
        .fontSize(80)
        .fontColor([Color.White])
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#2E3A4B')
    .gesture(PanGesture()
      .onActionStart(() => {
        if (!this.subWindow) {
          return;
        }
        try {
          const props = this.subWindow.getWindowProperties();
          this.windowPosition = {
            x: props.windowRect.left,
            y: props.windowRect.top
          };
          this.windowWidth = props.windowRect.width;
          this.windowHeight = props.windowRect.height;
        } catch (error) {
          hilog.info(Constants.DOMAIN, TAG, 'getWindowProperties failed.');
        }
      })
      .onActionUpdate((event: GestureEvent) => {
        if (!this.windowPosition || !this.subWindow) {
          return;
        }
        let newX = this.windowPosition.x + event.offsetX;
        let newY = this.windowPosition.y + event.offsetY;
        newX = Math.max(0, Math.min(newX, this.screenWidth - this.windowWidth));
        newY = Math.max(0, Math.min(newY, this.screenHeight - this.windowHeight));
        this.subWindow.moveWindowTo(newX, newY).catch(() => {
          hilog.info(Constants.DOMAIN, TAG, 'moveWindowTo failed.');
        });
        this.windowPosition.x = newX;
        this.windowPosition.y = newY;
      })
    )
  }
}