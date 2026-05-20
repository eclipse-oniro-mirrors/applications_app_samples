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
 
'use static'

// [Start sub_move_resize]
// EntryAbility.ets
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { display } from '@kit.ArkUI';
import window from '@ohos.window';
import hilog from '@ohos.hilog';

const DOMAIN = 0x0000;
const TAG = 'MainAbility';

// [StartExclude sub_move_resize]
export default class MainAbility extends UIAbility {
  private mainWindow: window.Window | null = null;
  private subWindow: window.Window | null = null;

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'onWindowStageCreate start');

    this.mainWindow = windowStage.getMainWindowSync();
    AppStorage.setOrCreate<window.Window>('MAIN_WINDOW', windowStage.getMainWindowSync());

    // 初始化参数
    this.initAppStorageState();

    try {
      // 加载主窗口页面内容
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        if (err && err.code) {
          hilog.info(DOMAIN, TAG, 'load Index failed: ${err.code}');
          return;
        }
        hilog.info(DOMAIN, TAG, 'load Index callback success');
      });
    } catch (e) {
      hilog.info(DOMAIN, TAG, 'loadContent catch error：-----------' + e.message);
    }

    // 步骤2：注册主窗口尺寸变化监听
    this.mainWindow.onWindowRectChange((data: window.RectChangeOptions) => {
      this.onWindowRectChange(data);
    });

    // 设置主窗口尺寸限制
    this.setMainWindowLimitsSafe();

    // 步骤4：创建子窗口，为子窗口指定初始位置大小
    this.createSubWindow(windowStage);

  }

  /**
   初始化应用存储状态
   设置窗口相关的默认配置参数
   */
  private initAppStorageState(): void {
    AppStorage.setOrCreate('WINDOW_ASPECT_RATIO_ENABLED', false);
    AppStorage.setOrCreate('SUB_WINDOW_VISIBILITY_ENABLED', false);
    AppStorage.setOrCreate('SUB_WINDOW_RESIZE_ENABLED', true);
    AppStorage.setOrCreate('SUB_WINDOW_MOVE_ENABLED', true);
    AppStorage.setOrCreate<window.Size>('WINDOW_SIZE', {
      width: 600,
      height: 300
    });
  }

  /**
   注册主窗口尺寸变化监听
   监听主窗口rect变化事件并记录日志
   */
  private onWindowRectChange(options: window.RectChangeOptions): void {
    // ...
    hilog.info(DOMAIN, TAG, `main rect change: ${JSON.stringify(options)}`);
  }

  /**
   设置主窗口安全尺寸限制
   根据屏幕尺寸设置主窗口的最小和最大宽高限制
   */
  private setMainWindowLimitsSafe(): void {
    let defaultDisplay: display.Display | null = null;

    try {
      defaultDisplay = display.getDefaultDisplaySync();
    } catch (err) {
      hilog.error(DOMAIN, TAG, `get display failed: ${JSON.stringify(err)}`);
      return;
    }

    if (!defaultDisplay) {
      return;
    }

    if (!this.mainWindow) {
      return;
    }

    const windowLimits: window.WindowLimits = {
      minWidth: Math.floor(defaultDisplay.width * 0.5).toInt(),
      minHeight: Math.floor(defaultDisplay.height * 0.5).toInt(),
      maxWidth: Math.floor(defaultDisplay.width * 1.2).toInt(),
      maxHeight: Math.floor(defaultDisplay.height * 1.2).toInt()
    }
    this.mainWindow!.setWindowLimits(windowLimits)
      .then((): void => {
        hilog.info(DOMAIN, TAG, 'set main window limits success');
      })
      .catch((err: Error): void => {
        hilog.error(DOMAIN, TAG, `set main window limits failed: ${JSON.stringify(err)}`);
      });

  }

// [EndExclude sub_move_resize]
  /**
   * 创建子窗口并调整位置大小
   */
  private createSubWindow(windowStage: window.WindowStage): void {
    if (!this.mainWindow) {
      return;
    }

    const mainRect = this.mainWindow!.getWindowProperties().windowRect;
    const subWidth: int = 600;
    const subHeight: int = 300;
    const margin: int = 24;

    const subX: int = Math.max(
      mainRect.left + margin,
      mainRect.left + mainRect.width - subWidth - margin
    ).toInt();

    const subY: int = Math.max(
      mainRect.top + margin,
      mainRect.top + mainRect.height - subHeight - margin
    ).toInt();

    windowStage.createSubWindow('DemoSubWindow').then((subWindow: window.Window) => {
      hilog.info(DOMAIN, TAG, 'createSubWindow success');

      this.subWindow = subWindow;
      AppStorage.setOrCreate<window.Window>('SUB_WINDOW', subWindow);
      AppStorage.setOrCreate<window.Size>('WINDOW_SIZE', {
        width: subWidth,
        height: subHeight
      });

      // 注册子窗口尺寸变化监听
      this.registerSubWindowRectChange(subWindow);
      // 设置子窗口尺寸
      this.subWindow!.resizeAsync(subWidth, subHeight);
      // 移动子窗口位置
      this.subWindow!.moveWindowToAsync(subX, subY);
      // 子窗口设置为默认可拖拽
      this.subWindow!.enableDrag(true);
      // 加载子窗口内容页面
      this.loadSubWindowContent(this.subWindow!);
    }).catch((err: Error) => {
      const businessError = err as BusinessError;
      hilog.error(DOMAIN, TAG, `createSubWindow failed: ${JSON.stringify(businessError)}`);
    });
  }
// [End sub_move_resize]

  /**
   注册子窗口尺寸变化监听
   监听子窗口rect变化事件并更新应用存储中的窗口尺寸信息
   */
  private registerSubWindowRectChange(subWindow: window.Window): void {
    subWindow.onWindowRectChange((data: window.RectChangeOptions): void => {
      const rect = data.rect;
      AppStorage.setOrCreate<window.Size>('WINDOW_SIZE', {
        width: rect.width,
        height: rect.height
      });
      hilog.info(DOMAIN, TAG, `sub rect change: ${JSON.stringify(data)}`);
    });
  }

  /**
   加载子窗口内容页面
   设置子窗口的UI内容为SubWindowPage页面
   */
  private loadSubWindowContent(subWindow: window.Window): void {
    subWindow.setUIContent("pages/SubWindowPage").then(() => {
      console.info('Succeeded in loading the content.');
    }).catch((err: Error) => {
      const businessError = err as BusinessError;
      console.error(Failed to load the content. Cause code: ${businessError.code}, message: ${businessError.message});
    });
  }

  onWindowStageDestroy(): void {
    try {
      this.mainWindow?.offWindowRectChange();
      this.subWindow?.offWindowRectChange();
      this.subWindow?.destroyWindow();
    } catch (err) {
      const businessError = err as BusinessError;
      hilog.error(DOMAIN, TAG, `destroy window failed: ${JSON.stringify(businessError)}`);
    }
  }
}