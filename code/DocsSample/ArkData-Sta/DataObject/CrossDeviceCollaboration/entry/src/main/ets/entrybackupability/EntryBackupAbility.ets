'use static'
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
// [Start data_sync_on_distributed_data_object_cross_device_collaboration_static]
import { AbilityConstant, Caller, UIAbility, Want } from '@kit.AbilityKit';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import distributedDataObject from '@ohos.data.distributedDataObject';
import { RecordData } from '@ohos.base';

// 业务数据定义
class Data {
  public title: string | undefined;
  public text: string | undefined;

  constructor(title: string | undefined, text: string | undefined) {
    this.title = title;
    this.text = text;
  }
}

let sessionId: string;
let caller: Caller;
let dataObject: distributedDataObject.DataObject;
const changeCallBack: distributedDataObject.DataObserver = (sessionId: string, fields: Array<string>) => {
  console.info(`change, sessionId: ${sessionId}, fields: ${JSON.stringify(fields)}`);
}

export default class EntryAbility extends UIAbility {
  // 1. 调用端调用startAbilityByCall接口拉起对端Ability
  callRemote(): void {
    if (caller) {
      console.error('call remote already');
      return;
    }

    // 1.1 调用genSessionId接口创建一个sessionId，通过分布式设备管理接口获取对端设备networkId
    sessionId = distributedDataObject.genSessionId();
    console.info('gen sessionId: ' + sessionId);
    let deviceId = getRemoteDeviceId();
    if (deviceId === '') {
      console.warn('no remote device');
      return;
    }
    console.info('get remote deviceId: ' + deviceId);

    // 1.2 组装want，并将sessionId放入want
    let want: Want = {
      bundleName: 'com.example.collaboration',
      abilityName: 'EntryAbility',
      deviceId: deviceId,
      parameters: {
        'ohos.aafwk.param.callAbilityToForeground': true, // 前台启动，非必须
        'distributedSessionId': sessionId
      }
    }
    try {
      // 1.3 调用startAbilityByCall接口拉起对端Ability
      this.context.startAbilityByCall(want).then((res) => {
        if (!res) {
          console.error('startAbilityByCall failed');
        }
        caller = res;
      })
    } catch (e) {
      let err = e as BusinessError;
      console.error('get remote deviceId error, error code: ' + err.code + 'error message: ' + err.message);
    }
  }

  // 2. 拉起对端Ability后创建分布式数据对象
  createDataObject(): void {
    if (!caller) {
      console.error('call remote first');
      return;
    }
    if (dataObject) {
      console.error('create dataObject already');
      return;
    }

    // 2.1 创建分布式数据对象实例
    let data = new Data('The title', 'The text');
    dataObject = distributedDataObject.create(this.context, data);

    // 2.2 注册数据变更监听
    dataObject.onChange(changeCallBack);
    // 2.3 设置同步sessionId加入组网
    dataObject.setSessionId(sessionId);
  }

  // 3. 被调用端被拉起后创建和恢复分布式数据对象
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    //(want.parameters as Record<string, RecordData>)['distributedSessionId']
    if (want.parameters && (want.parameters as Record<string, RecordData>)['distributedSessionId']) {
      // 3.1 创建分布式数据对象实例
      let data = new Data(undefined, undefined);
      dataObject = distributedDataObject.create(this.context, data);

      // 3.2 注册数据变更监听
      dataObject.onChange(changeCallBack);
      // 3.3 从want中获取源端放入的sessionId，使用这个sessionId加入组网
      let sessionId = (want.parameters as Record<string, RecordData>)['distributedSessionId'] as string;
      console.info(`onCreate get sessionId: ${sessionId}`);
      dataObject.setSessionId(sessionId);
    }
  }
}

// 获取可信组网中的设备
function getRemoteDeviceId(): string {
  let deviceId: string = '';
  try {
    let deviceManager = distributedDeviceManager.createDeviceManager('com.example.collaboration');
    let devices = deviceManager.getAvailableDeviceListSync();
    if (devices[0]! && devices[0]!.networkId) {
      deviceId = devices[0].networkId!;
    }
  } catch (e) {
    let err = e as BusinessError;
    console.error('get remote deviceId error, error code: ' + err.code + 'error message: ' + err.message);
  }
  return deviceId;
}

// [End data_sync_on_distributed_data_object_cross_device_collaboration_static]