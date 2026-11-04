/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { router, window } from '@kit.ArkUI';
import { Log } from 'library';
import { emitter } from '@kit.BasicServicesKit';

const TAG = 'TvAbility';

export default class TvAbility extends UIAbility {
  public pageUrl: string = ''
  private isBackground: boolean = false;
  private pendingWant?: Want;

  private safeGetRouterLength(): number {
    try {
      return Number(router.getLength());
    } catch (error) {
      Log.error(TAG, `safeGetRouterLength failed: ${JSON.stringify(error)}`);
      return -1;
    }
  }

  private safePushPlayerPage(): boolean {
    try {
      router.push({
        url: 'pages/PlayerPage'
      });
      return true;
    } catch (error) {
      Log.error(TAG, `safePushPlayerPage failed: ${JSON.stringify(error)}`);
      return false;
    }
  }

  private safeResetToIndex(): boolean {
    try {
      router.clear();
      router.replaceUrl({
        url: 'pages/Index'
      });
      return true;
    } catch (error) {
      Log.error(TAG, `safeResetToIndex failed: ${JSON.stringify(error)}`);
      return false;
    }
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      Log.info(TAG, `---- onCreate ---- want = ${JSON.stringify(want)}`);
    } catch (error) {
      Log.error(TAG, 'onCreate want stringify failed');
    }

    this.isBackground = false;

    globalThis.context = this.context;
    globalThis.resourceManager = this.context.resourceManager;
    globalThis.playerShow = false;
    if (want.parameters?.['startPlayer'] == true) {
      this.pageUrl = 'pages/PlayerPage';
      this.onPostPlayerData(want);
    } else {
      this.pageUrl = 'pages/Index';
    }
  }

  onDestroy(): void {
    Log.info(TAG, `---- onDestroy ----`);
    emitter.off(1001);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      Log.info(TAG, `---- onNewWant ---- want = ${JSON.stringify(want)}`);
    } catch (error) {
      Log.error(TAG, 'onNewWant want stringify failed');
    }
    if (want.parameters?.['startPlayer'] == true) {
      let playerShow: boolean = globalThis.playerShow;
      Log.info(TAG, `playerShow = ${playerShow}`);
      if (!playerShow) {
        if (!this.safePushPlayerPage()) {
          // 无 UI 上下文时延后到前台再处理，避免崩溃
          this.pendingWant = want;
          return;
        }
      }
      this.onPostPlayerData(want);
    } else {
      // 检查路由栈状态，避免页面重复堆叠
      const length = this.safeGetRouterLength();
      const playerShow: boolean = Boolean(globalThis.playerShow);
      Log.info(TAG, `onNewWant: current router stack length = ${length}`);

      if (length > 1 && !playerShow) {
        // 如果路由栈有多个页面（说明有页面堆叠），清空栈并重新加载Index
        Log.info(TAG, `router stack has multiple pages, clearing and reload Index`);
        this.safeResetToIndex();
      } else {
        Log.info(TAG, `keep current page, playerShow=${playerShow}`);
      }
      // 如果只有一个页面，不做任何操作，应用会自动回到前台显示当前页面
    }
  }

  onBackPressed(): boolean {
    return false;
  }

  onPostPlayerData(want: Want) {
    let event: emitter.InnerEvent = {
      eventId: 1001
    }
    Log.info(TAG, `send emitter. event = ${JSON.stringify(event)}`);
    // 加延迟，等待page启动
    setTimeout(() => {
      let eventData: emitter.EventData = {
        data: {
          device: want.parameters?.['deviceId'],
          deviceName: want.parameters?.['deviceName']
        }
      }
      emitter.emit(event, eventData);
      Log.info(TAG, `send emitter success. globalThis.parameters
      = ${JSON.stringify(want.parameters)}`)
    }, 500);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Log.info(TAG, `---- onWindowStageCreate ---- windowStage = ${JSON.stringify(windowStage)}`);

    // 全屏
    window.getLastWindow(this.context).then(win => {
      win.setWindowLayoutFullScreen(true);
      win.setWindowSystemBarEnable([]);
    });
    windowStage.loadContent(this.pageUrl, (err) => {
      if (err.code) {
        Log.error(TAG, 'Failed to load the content. Cause: ' + JSON.stringify(err) ?? '');
        return;
      }
      Log.info(TAG, 'Succeeded in loading the content.');
    });
  }

  // 获取系统状态栏和导航栏高度
  async getWindowAvoidArea(context: common.UIAbilityContext): Promise<window.AvoidArea> {
    const mainWindow = await window.getLastWindow(context);
    const avoidAreaType = window.AvoidAreaType.TYPE_SYSTEM; // 系统默认区域，包括状态栏，导航栏
    const avoidArea = mainWindow.getWindowAvoidArea(avoidAreaType);
    return avoidArea;
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Log.info(TAG, `---- onWindowStageDestroy ----`);
  }

  onForeground(): void {
    // Ability has brought to foreground
    Log.info(TAG, `---- onForeground ----`);
    if (this.pendingWant) {
      const want = this.pendingWant;
      this.pendingWant = undefined;
      if (this.safePushPlayerPage()) {
        this.onPostPlayerData(want);
      }
    }
  }

  onBackground(): void {
    // Ability has back to background
    Log.info(TAG, `---- onBackground ----`);
    this.isBackground = true;
    if (globalThis.playerShow && typeof globalThis.playerForceDisconnect === 'function') {
      Log.info(TAG, 'onBackground trigger player force disconnect');
      globalThis.playerForceDisconnect();
    }
  }
}
