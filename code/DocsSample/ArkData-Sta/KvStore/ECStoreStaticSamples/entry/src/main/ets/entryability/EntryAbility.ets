'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AbilityConstant, application, contextConstant, UIAbility, Want, Context } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import distributedKVStore from '@ohos.data.distributedKVStore.d.ets';
import { ECStoreManager } from './ECStoreManager';
import { StoreInfo } from './Store';
import { Mover } from './Mover';
import { SecretKeyObserver } from './SecretKeyObserver';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../common/Logger';

export let storeManager: ECStoreManager = new ECStoreManager();
export let e_secretKeyObserver: SecretKeyObserver = new SecretKeyObserver();
let mover: Mover = new Mover();

let cInfo: StoreInfo | null = null;
let eInfo: StoreInfo | null = null;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let cContext = this.context;
    cInfo = {
      'kvManagerConfig': {
        context: cContext,
        bundleName: 'com.example.ecstoresamples'
      },
      'storeId': 'cstore',
      'option': {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: false,
        kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
        securityLevel: distributedKVStore.SecurityLevel.S3
      }
    };

    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
      events: ['COMMON_EVENT_SCREEN_LOCK_FILE_ACCESS_STATE_CHANGED']
    };

    let subscriber: commonEventManager.CommonEventSubscriber = commonEventManager.createSubscriberSync(subscribeInfo);
    Logger.info('ECDB_Encry createSubscriberSync success');

    try {
      commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined) => {
        if (err !== null) {
          Logger.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
        } else if (data !== undefined) {
          Logger.info(`ECDB_Encry SubscribeCB ${data.code}`);
          if (data.code !== undefined) {
            e_secretKeyObserver.updateLockStatus(data.code!);
          }
        }
      });
      Logger.info('ECDB_Encry success subscribe');
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
    }

    this.initEStore();
  }

  async initEStore(): Promise<void> {
    try {
      let eContext: Context = await application.createModuleContext(this.context, 'entry');
      eContext.area = contextConstant.AreaMode.EL5;
      eInfo = {
        'kvManagerConfig': {
          context: eContext,
          bundleName: 'com.example.ecstoresamples'
        },
        'storeId': 'estore',
        'option': {
          createIfMissing: true,
          encrypt: false,
          backup: false,
          autoSync: false,
          kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
          securityLevel: distributedKVStore.SecurityLevel.S3
        }
      };
      Logger.info(`ECDB_Encry store area : estore:${eContext.area}`);

      if (cInfo !== null && eInfo !== null) {
        storeManager.config(cInfo!, eInfo!);
      }
      storeManager.configDataMover(mover);
      e_secretKeyObserver.initialize(storeManager);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(`createModuleContext failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err: BusinessError | null): void => {
      if (err !== null && err.code !== 0) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}