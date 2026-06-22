'use static'

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

// [Start age_friendly_tab]
import { abilityManager, Configuration } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

import {
  Entry,
  Column,
  Component,
  $r,
  BottomTabBarStyle,
  Tabs,
  BarMode,
  Row,
  Button,
  Text,
  BarPosition,
  Color,
  TabContent,
  HorizontalAlign,
  NavDestination,
  State
} from '@kit.ArkUI';
import uiAppearance from '@ohos.uiAppearance';

const DOMAIN = 0x0000;
const TAG: string = 'AgeFriendlyTabs';

// 如需作为页面入口，请取消@Entry的注释并删除export关键字
@Entry
@Component
export struct AgeFriendlyTabs {
  @State fontColor: string = '#182431';
  @State selectedFontColor: string = '#007DFF';
  @State currentIndex: int = 0;
  @State currentFontSizeScale: string = '';
  @State showBuilderTab: boolean = false;
  @State fontSize: number = 15;

  setFontScale(scale: number): Promise<void> {
    let configInit: Configuration = {
      fontSizeScale: scale,
    };
    return abilityManager.updateConfiguration(configInit).then(() => {
      this.currentFontSizeScale = String(scale);
      if (scale > 1) {
        this.fontSize = 8;
      } else {
        this.fontSize = 15;
      }
      hilog.info(DOMAIN, TAG, 'updateConfiguration success.');
      this.getUIContext().getPromptAction().showToast({ message: `scale:${scale}, updateConfiguration success.` });
    });
  }

  darkMode(isDarkMode: boolean): void {
    let mode: uiAppearance.DarkMode = uiAppearance.DarkMode.ALWAYS_LIGHT;
    if (isDarkMode) {
      mode = uiAppearance.DarkMode.ALWAYS_DARK;
    }
    if (mode == uiAppearance.getDarkMode()) {
      return;
    }
    try {
      uiAppearance.setDarkMode(mode).then(() => {
        hilog.info(DOMAIN, TAG, `TitleDarkMode Set ${mode} successfully.`);
      }).catch((error: Error) => {
        hilog.error(DOMAIN, TAG, `TitleDarkMode Set ${mode} failed, ${error.message}`);
      });
    } catch (error) {
      let message = (error as BusinessError).message;
      hilog.error(DOMAIN, TAG, `TitleDarkMode Set dark-mode failed, ${message}`);
    }
  }

  build(): void {
    NavDestination() {
      Column() {
        Column() {
          Row() {
            Text(`current fontSizeScale:${this.currentFontSizeScale}`)
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
          }

          Row() {
            Button('1.75')
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
              .width('40%')
              .onClick(() => {
                this.setFontScale(1.75);
              })
            Button('2')
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
              .width('40%')
              .onClick(() => {
                this.setFontScale(2);
              })
          }.margin({ top: 25 })

          Row() {
            Button('3.2')
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
              .width('40%')
              .onClick(() => {
                this.setFontScale(3.2);
              })
            Button('1')
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
              .width('40%')
              .onClick(() => {
                this.setFontScale(1);
              })
          }

          Row() {
            // app.string.app_name资源文件中的value值为“深色模式”
            Button($r('app.string.app_name'))
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
              .width('40%')
              .onClick(() => {
                this.darkMode(true);
              })
            // app.string.app_name资源文件中的value值为“浅色模式”
            Button($r('app.string.app_name'))
              .margin({ top: 5, bottom: 5 })
              .fontSize(this.fontSize)
              .width('40%')
              .onClick(() => {
                this.darkMode(false);
              })
          }
        }.alignItems(HorizontalAlign.Start)

        Column() {
          Tabs({ barPosition: BarPosition.End }) {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'OverLength'))
            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Yellow)
            }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'SixLine'))
            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Blue)
            }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Blue'))
            TabContent() {
              Column().width('100%').height('100%').backgroundColor(Color.Green)
            }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Green'))
          }
          .vertical(false)
          .scrollable(true)
          .barMode(BarMode.Fixed)
          .onChange((index: int) => {
            hilog.info(DOMAIN, TAG, index.toString());
          })
          .width('100%')
          .backgroundColor(0xF1F3F5)
        }.width('80%').height(200)
        .margin({ top: 200 })
      }.width('100%')
    }
  }
}
// [End age_friendly_tab]