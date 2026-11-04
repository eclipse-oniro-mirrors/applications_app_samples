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

import { window } from '@kit.ArkUI';
import { BusinessError, emitter } from '@kit.BasicServicesKit';
import * as PermissionChoosePage from '../components/PermissionChoosePage'; // 导入命名路由页面
import { PermissionPanelSizeUtils, PermissionType, Log } from 'library';

const TAG = 'PermissionWindowManager';

export class PermissionWindowManager {
  public windowClass: window.Window | null = null;
  private static manager: PermissionWindowManager | null = null;

  static getIns(): PermissionWindowManager {
    if (!PermissionWindowManager.manager) {
      PermissionWindowManager.manager = new PermissionWindowManager();
    }
    return PermissionWindowManager.manager;
  }

  /**
   * 创建窗口
   * @param context
   * @param callback
   */
  createWindow(context: Context, deviceName: string, callback: (x: PermissionType) => void) {
    Log.info(TAG, 'start to createWindow');
    let config: window.Configuration = {
      name: 'ConnectWindow', windowType: window.WindowType.TYPE_FLOAT, ctx: context
    };
    window.createWindow(config, (err: BusinessError, data) => {
      let errCode: number = err.code;
      if (errCode) {
        Log.error(TAG, 'Failed to create the floatWindow. Cause: ' + JSON.stringify(err));
        return;
      }
      Log.info(TAG, 'Succeeded in creating the floatWindow. Data: ' + JSON.stringify(data));
      this.windowClass = data;

      this.moveWindowTo();
      this.resize();
      this.setUIContent(deviceName, callback);
    });
  }

  /**
   * 移动窗口位置
   */
  private moveWindowTo() {
    this.windowClass?.moveWindowTo(
      (PermissionPanelSizeUtils.getIns().getScreenSize().width / 2) -
        (PermissionPanelSizeUtils.getIns().getRealSize().width / 2),
      (PermissionPanelSizeUtils.getIns().getScreenSize().height / 2) -
        (PermissionPanelSizeUtils.getIns().getRealSize().height / 2),
      (err: BusinessError) => {
        let errCode: number = err.code;
        if (errCode) {
          Log.error(TAG, 'Failed to move the window. Cause:' + JSON.stringify(err));
          return;
        }
        Log.info(TAG, 'Succeeded in moving the window.');
      });
  }

  /**
   * 设置窗口大小
   */
  private resize() {
    this.windowClass?.resize(PermissionPanelSizeUtils.getIns().getRealSize().width,
      PermissionPanelSizeUtils.getIns().getRealSize().height,
      (err: BusinessError) => {
        let errCode: number = err.code;
        if (errCode) {
          Log.error(TAG, 'Failed to change the window size. Cause:' + JSON.stringify(err));
          return;
        }
        Log.info(TAG, 'Succeeded in changing the window size.');
      });
  }

  /**
   * 为悬浮窗加载对应的目标页面
   * @param callback
   */
  private setUIContent(deviceName: string, callback: (x: PermissionType) => void) {
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('deviceName', deviceName);

    (this.windowClass as window.Window).loadContentByName(PermissionChoosePage.entryName, storage,
      (err: BusinessError) => {
        let errCode: number = err.code;
        if (errCode) {
          Log.error(TAG, 'Failed to load the content. Cause:' + JSON.stringify(err));
          return;
        }
        Log.info(TAG, 'Succeeded in loading the content.');
        // 3.显示悬浮窗。
        (this.windowClass as window.Window).show((err: BusinessError) => {
          let errCode: number = err.code;
          if (errCode) {
            Log.error(TAG, 'Failed to show the window. Cause: ' + JSON.stringify(err));
            return;
          }
          Log.info(TAG, 'Succeeded in showing the window.');

          this.windowClass?.setWindowBackgroundColor('#00000000');

          this.registerEmitter((res: PermissionType) => {
            callback(res);
          });
        });
      });
  }

  /**
   * 注册监听回调
   * @param callback
   */
  private registerEmitter(callback: (x: PermissionType) => void) {
    let event: emitter.InnerEvent = {
      eventId: 1000
    }
    emitter.on(event, (data: emitter.EventData) => {
      Log.info(TAG, `data = ${JSON.stringify(data)}`);
      let type: PermissionType = data.data?.PermissionType;
      callback(type);
      this.destroyWindow();
      emitter.off(1000);
    });
  }

  /**
   * 销毁窗口
   */
  private destroyWindow() {
    if (this.windowClass) {
      this.windowClass.destroyWindow((err: BusinessError) => {
        let errCode: number = err.code;
        if (errCode) {
          Log.error(TAG, 'Failed to destroy the window. Cause: ' + JSON.stringify(err));
          return;
        }
        Log.info(TAG, 'Succeeded in destroying the window.');
        this.windowClass = null;
      });
    }
  }
}
