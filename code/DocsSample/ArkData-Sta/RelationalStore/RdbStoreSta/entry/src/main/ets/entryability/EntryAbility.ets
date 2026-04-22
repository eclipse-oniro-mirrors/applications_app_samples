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

// [Start rdb_EntryAbility]
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { relationalStore } from '@kit.ArkData';
import { ECStoreManager } from '../encryptedEStoreGuidelines/ECStoreManager';
import { StoreInfo } from '../encryptedEStoreGuidelines/Store';
import { Mover } from '../encryptedEStoreGuidelines/Mover';
import { SecretKeyObserver } from '../encryptedEStoreGuidelines/SecretKeyObserver';
import { commonEventManager } from '@kit.BasicServicesKit';
import { application, contextConstant } from '@kit.AbilityKit';

const DOMAIN = 0x0000;

export let storeManager = new ECStoreManager();

export let e_secretKeyObserver = new SecretKeyObserver();

let mover = new Mover();
let subscriber: commonEventManager.CommonEventSubscriber | undefined;

export function createCB(err: BusinessError | null,
  commonEventSubscriber: commonEventManager.CommonEventSubscriber | undefined) {
  if (!err) {
    console.info('ECDB_Encrypt createSubscriber');
    subscriber = commonEventSubscriber;
    if (subscriber !== undefined) {
      try {
        commonEventManager.subscribe(subscriber!,
          (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined) => {
            if (err) {
              console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
            } else {
              if (data !== undefined && data.code !== undefined) {
                console.info(`ECDB_Encrypt SubscribeCB ${data.code}`);
                e_secretKeyObserver.updateLockStatus(data.code!);
              }
            }
          });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
      }
    }
  } else {
    console.error(`createSubscriber failed, code is ${err.code}, message is ${err.message}`);
  }
}

let cInfo: StoreInfo | null = null;
let eInfo: StoreInfo | null = null;

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
    let cContext = this.context;
    cInfo = {
      context: cContext,
      config: {
        name: 'cstore.db',
        securityLevel: relationalStore.SecurityLevel.S3,
      },
      storeId: 'cstore.db'
    };
    application.createModuleContext(this.context, 'entry').then((eContext) => {
      eContext.area = contextConstant.AreaMode.EL5;
      eInfo = {
        context: eContext,
        config: {
          name: 'estore.db',
          securityLevel: relationalStore.SecurityLevel.S3,
        },
        storeId: 'estore.db',
      };
      // 监听COMMON_EVENT_SCREEN_LOCK_FILE_ACCESS_STATE_CHANGED事件 code == 1解锁状态，code==0加锁状态
      console.info('ECDB_Encry store area : estore:' + eContext.area + ',cstore' + cContext.area);
      try {
        commonEventManager.createSubscriber({
          events: ['COMMON_EVENT_SCREEN_LOCK_FILE_ACCESS_STATE_CHANGED']
        }, createCB);
        console.info('ECDB_Encry success subscribe');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        console.error(`createSubscriber failed, code is ${err.code}, message is ${err.message}`);
      }
      storeManager.config(cInfo!, eInfo!);
      storeManager.configDataMover(mover);
      e_secretKeyObserver.initialize(storeManager);
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
      if (err?.code) {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
        return;
      }
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
    });
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onDestroy');
    return undefined
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}

// [End rdb_EntryAbility]