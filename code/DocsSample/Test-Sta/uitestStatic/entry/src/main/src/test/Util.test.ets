'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import  hilog  from '@ohos.hilog'
import { Want } from '@kit.AbilityKit';
import { RecordData } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

const abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

class Utils{

  static async msSleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async pushUrl(pageUrl: string, pageName:string) {
    let options: router.RouterOptions = {
      url: pageUrl,
    }
  try {
    console.info("pushUrl state, " + JSON.stringify(pageUrl));
    const routerInstance = AppStorage.get<Router>("router") as Router
    routerInstance!.clear();
    let pages = routerInstance!.getState();
    console.info("pushUrl state success " + JSON.stringify(pages));
    if (!(pageName == pages.name)) {
      console.info("pushUrl state success " + JSON.stringify(pages.name));
      routerInstance!.pushUrl(options);
      await Utils.msSleep(2000);
    }
  } catch (err) {
    console.error("push checkBoxGroup page error: " + err);
  }
}
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
  try {
    let want: Want = {
      bundleName: bundleName,
      abilityName: 'EntryAbility',
      parameters: {
        'pageUrl': abilityName
      }
    };
    await delegator.startAbility(want);
    return true;
  } catch(error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
    hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: string): Promise<boolean>{
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    console.info(`UiTestCase, stop application finished`);
    return true;
  } catch(error) {
    console.error(`UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

export {
  Utils,
  startAbility,
  stopApplication,
}