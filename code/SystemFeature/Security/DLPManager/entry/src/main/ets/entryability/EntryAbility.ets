/*
 * Copyright (c) 2023 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * @file entry/src/main/ets/entryability/EntryAbility.ets
 * 文件职责：EntryAbility 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：EntryAbility。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl , { Permissions } from '@ohos.abilityAccessCtrl';
import MediaFileUri from '../media/MediaFileUri';
import Logger from '../utils/Logger';
import { setTextResolver } from '../core/TextCatalog';

const TAG = '[dlpmanager_EntryAbility]';

/**
 * EntryAbility：类定义，承载本文件对应的逻辑与数据。
 */
export default class EntryAbility extends UIAbility {
  private mediaFileUri: MediaFileUri = new MediaFileUri();

  /**
   * onCreate：Ability 创建时回调。
   */
  onCreate( want : Want , launchParam : AbilityConstant.LaunchParam ) : void {
    Logger.info(TAG, 'Ability onCreate' );
    this.setTextResolver();
    this.getPermission( want );
  }

  private setTextResolver(): void {
    const manager = this.context.resourceManager;
    setTextResolver((key: string): string => {
      try {
        return manager.getStringByNameSync(key);
      } catch (err) {
        Logger.error(TAG, 'getStringByNameSync failed: ' + key);
        return key;
      }
    });
  }

  /**
   * onDestroy：Ability 销毁时回调。
   */
  onDestroy(): void {
    Logger.info(TAG, 'Ability onDestroy' );
  }

  /**
   * onWindowStageCreate：窗口舞台创建时回调。
   */
  onWindowStageCreate( windowStage: window.WindowStage ): void {
    // Main window is created, set main page for this ability
    Logger.info(TAG, 'Ability onWindowStageCreate' );
    windowStage.loadContent( 'pages/Index' , ( err , data ) => {
      if ( err.code ) {
        Logger.error(TAG, 'Failed to load the content. Cause: ' + (JSON.stringify(err) ?? ''));
        return;
      }
      Logger.info(TAG, 'Succeeded in loading the content. Data: ' + (JSON.stringify(data) ?? ''));
    } );
    let context = this.context;
    let pathDir = context.filesDir;
    AppStorage.setOrCreate( 'pathDir' , pathDir );
    AppStorage.setOrCreate( 'context' , context );
    Logger.info(TAG, 'context type:' + typeof ( this.context ) );

  }

  /**
   * onWindowStageDestroy：窗口舞台销毁时回调。
   */
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'Ability onWindowStageDestroy' );
  }

  /**
   * onForeground：应用进入前台时回调。
   */
  onForeground(): void {
    // Ability has brought to foreground
    Logger.info(TAG, 'Ability onForeground' );
  }

  /**
   * onBackground：应用退到后台时回调。
   */
  onBackground(): void {
    // Ability has back to background
    Logger.info(TAG, 'Ability onBackground' );
  }

  /**
   * getPermission：执行 getPermission 相关逻辑。
   */
  getPermission( want: Want ): void {
    let array: Permissions[] = [
      'ohos.permission.ACCESS_DLP_FILE',
      'ohos.permission.MEDIA_LOCATION',
      'ohos.permission.FILE_ACCESS_MANAGER',
      'ohos.permission.GET_BUNDLE_INFO_PRIVILEGED'
    ];
    let context = this.context;
    let atManager = abilityAccessCtrl.createAtManager();
    let missing: Permissions[] = [];
    try {
      let tokenId: number = context.applicationInfo.accessTokenId;
      for (let index = 0; index < array.length; index++) {
        let status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(tokenId, array[index]);
        if (status !== abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
          missing.push(array[index]);
        }
      }
    } catch (err) {
      Logger.error(TAG, 'checkAccessTokenSync failed: ' + err);
      missing = array;
    }
    if (missing.length === 0) {
      Logger.info(TAG, 'all permissions granted, skip request dialog');
      this.mediaFileUri.getAllFiles(context);
      return;
    }
    atManager.requestPermissionsFromUser( context , missing ).then( ( data ) => {
      Logger.info(TAG, 'data type:' + typeof ( data ) );
      Logger.info(TAG, 'data:' + JSON.stringify( data ) );
      Logger.info(TAG, 'data permissions:' + data.permissions );
      Logger.info(TAG, 'data result:' + data.authResults );

      this.mediaFileUri.getAllFiles( context );
      Logger.info(TAG, 'getPermission getWantInfo' );
    } ).catch( ( err: BusinessError ) => {
      Logger.error(TAG, 'Failed to start ability' + err.code );
    } );
  }
}
