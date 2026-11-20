/*
* Copyright (C) 2025 Huawei Device Co., Ltd.
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

// [Start calendarData_entryAbilityImport]
import { abilityAccessCtrl, UIAbility } from '@kit.AbilityKit';
import type { AbilityConstant, common, PermissionRequestResult, Permissions, Want } from '@kit.AbilityKit';
import type { BusinessError } from '@kit.BasicServicesKit';
import { calendarManager } from '@kit.CalendarKit';
import { window } from '@kit.ArkUI';
import { CalendarPermissionGate } from '../CalendarPermission';
// [End calendarData_entryAbilityImport]

// [Start calendarData_entryAbility]

export let calendarMgr: calendarManager.CalendarManager | null = null;

export let mContext: common.UIAbilityContext | null = null;

export default class EntryAbility extends UIAbility {
  private readonly permissionGate: CalendarPermissionGate = new CalendarPermissionGate();
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    this.permissionGate.invalidate();
    calendarMgr = null;
    mContext = null;
    console.info('%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // 主窗口已创建，请为此Ability设置主页
    console.info('%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        console.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      console.info('Succeeded in loading the content.');
    });
    mContext = this.context;
    const permissions: Permissions[] = ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'];
    calendarMgr = null;
    const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    this.permissionGate.request(
      (): Promise<PermissionRequestResult> => atManager.requestPermissionsFromUser(this.context, permissions),
      {
        onGranted: (): void => { calendarMgr = calendarManager.getCalendarManager(this.context); },
        onDenied: (): void => {
          calendarMgr = null;
          console.error('Calendar permission denied');
        },
        onFailed: (): void => { calendarMgr = null; }
      }
    ).catch((error: BusinessError) => {
      console.error(`Calendar permission request failed. Code: ${error.code}`);
    });
  }

  onWindowStageDestroy(): void {
    // 主窗口已销毁，释放 UI 相关资源
    this.permissionGate.invalidate();
    calendarMgr = null;
    mContext = null;
    console.info('%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability 进入前台
    console.info('%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability 进入后台
    console.info('%{public}s', 'Ability onBackground');
  }
}
// [End calendarData_entryAbility]