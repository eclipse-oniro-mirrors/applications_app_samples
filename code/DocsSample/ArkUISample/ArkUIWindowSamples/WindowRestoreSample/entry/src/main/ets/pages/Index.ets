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

// [Start quick_start]
import { common } from '@kit.AbilityKit';
import { BusinessError, emitter } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { statusBarManager } from '@kit.DeskTopExtensionKit';
import { image } from '@kit.ImageKit';
import { window } from '@kit.ArkUI';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_WindowRestore]';
// 默认弹窗高度，单位vp
const QUICK_OPERATION_HEIGHT: number = 300;

@Entry
@Component
struct Index {
  private mainWindow: window.Window | undefined;

  aboutToAppear() {
    this.mainWindow = AppStorage.get('mainWindow_Restore') as window.Window;
    if (!this.mainWindow) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Failed to get main window from AppStorage.');
      return;
    }
    const context = this.getUIContext().getHostContext() as common.Context;
    if (!context) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Failed to get host context.');
      return;
    }
    this.addToStatusBar(context);
  }

  onStatusBarIconClick = (eventData: emitter.EventData) => {
    // 自定义图标点击业务
    const data = eventData.data;
    if (data) {
      switch (data['iconClickType']) {
        case 'leftClick':
          this.restoreMainWindow();
          break;
        default:
          break;
      }
    }
  }

  async addToStatusBar(context: common.Context): Promise<void> {
    // 使用应用默认图标作为托盘图标
    const iconData = await context.resourceManager.getMediaContent($r('app.media.foreground'));
    const imageSource = image.createImageSource(iconData.buffer);
    const pixelMap: image.PixelMap = await imageSource.createPixelMap();
    const icon: statusBarManager.StatusBarIcon = {
      white: pixelMap,
      black: pixelMap
    };

    // 构建左键业务弹窗信息。abilityName传空字符串时，支持通过监听statusBarIconClick事件处理点击业务
    const operation: statusBarManager.QuickOperation = {
      abilityName: '',
      title: 'Demo',
      height: QUICK_OPERATION_HEIGHT
    };

    // 构建添加到状态栏的图标详细信息
    const item: statusBarManager.StatusBarItem = {
      icons: icon,
      quickOperation: operation
    };

    try {
      statusBarManager.addToStatusBar(context, item);
      statusBarManager.on('statusBarIconClick', this.onStatusBarIconClick);
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in adding icon to status bar.');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to add icon to status bar. Code: %{public}s, message: %{public}s',
        `${err.code}`, `${err.message}`);
    }
  }

  minimizeMainWindow() {
    if (!this.mainWindow) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Failed to minimize the window. Main window is not available.');
      return;
    }
    try {
      this.mainWindow.minimize();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to minimize the window. Code: %{public}s, message: %{public}s',
        `${err.code}`, `${err.message}`);
    }
  }

  restoreMainWindow() {
    if (!this.mainWindow) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Failed to restore the window. Main window is not available.');
      return;
    }
    try {
      // 调用restore()接口，将主窗口从最小化状态恢复到前台显示
      this.mainWindow.restore().then(() => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in restoring the window.');
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'Failed to restore the window. Code: %{public}s, message: %{public}s',
          `${err.code}`, `${err.message}`);
      });
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Failed to restore the window. Code: %{public}s, message: %{public}s',
        `${err.code}`, `${err.message}`);
    }
  }

  build() {
    Column() {
      Text($r('app.string.minimize_text'))
        .id('minimizeText')
        .fontSize(17)
      Button($r('app.string.minimize_button'))
        .id('minimizeButton')
        .onClick(() => {
          this.minimizeMainWindow();
        })
        .margin({ top: 20 })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}

// [End quick_start]
