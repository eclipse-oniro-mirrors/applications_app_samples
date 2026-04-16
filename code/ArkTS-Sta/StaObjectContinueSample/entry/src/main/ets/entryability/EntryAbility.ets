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

// [Start dataObject_onContinue]
import { UIContext } from '@kit.ArkUI';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { UIAbility } from '@kit.AbilityKit';
import distributedObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType';
import { AppStorage } from '@ohos.arkui.stateManagement';
import image from '@ohos.multimedia.image.d.ets';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { RecordData } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';

// [StartExclude onContinue]
// 业务数据定义
let g_object: distributedObject.DataObject | undefined = undefined;

class Note {
  title: string | undefined
  text: string | undefined
  attachment: commonType.Asset

  constructor(title: string | undefined, text: string | undefined, attachment: commonType.Asset) {
    this.title = title;
    this.text = text;
    this.attachment = attachment;
  }
}
// [EndExclude onContinue]

class EntryAbility extends UIAbility {
  async onContinue(wantParam: Record<string, Object | undefined>): Promise<AbilityConstant.OnContinueResult> {
    // 获取需要设置的分布式对象的资产关键uri
    try {
      console.info('OnContinue start');
      let attachment: commonType.Asset = {
        name: 'test_img.jpg',
        uri: 'file://com.example.staticcontinue/data/storage/el2/distributedfiles/dir/test_img.jpg',
        path: '/dir/test_img.jpg',
        createTime: '2024-01-02 10:00:00',
        modifyTime: '2024-01-02 10:00:00',
        size: '5',
        status: commonType.AssetStatus.ASSET_NORMAL
      }
      // 创建分布式数据对象
      let sessionId: string = distributedObject.genSessionId();
      (wantParam as Record<string, Object | undefined>)['distributedSessionId'] = sessionId;
      let note: Note = new Note('data_object_title', 'data_object_text', attachment);
      let uri = 'file://com.example.staticcontinue/data/storage/el2/distributedfiles/dir/test_img.jpg';
      g_object = distributedObject.create(this.context, note);
      g_object!.setAsset('attachment', uri).then(() => {
        console.info('setAsset success.');
      }).catch((err: Error) => {
        console.error('setAsset failed, error code = ' + err.code);
      });
      // 将设置的资产或资产数组保存至迁移发起端
      await g_object!.setSessionId(sessionId);
      g_object!.save((wantParam as Record<string, Object | undefined>)['targetDevice'] as string).then((result:
        distributedObject.SaveSuccessResponse) => {
        console.info('Succeeded in saving. SessionId: ' + result.sessionId);
      }).catch((err) => {
        console.error('OnContinue failed to save. code: ' + err.code);
        console.error('OnContinue failed to save. message: ', err.message);
      });
    } catch (error) {
      console.error('OnContinue failed code: ', error.code);
      console.error('OnContinue failed message: ', error.message);
    }
    console.info('OnContinue end!');
    return AbilityConstant.OnContinueResult.AGREE;
  }

  // 2. 接收端在onCreate和onNewWant接口中创建分布式数据对象并加入组网进行数据恢复
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.info('onCreate start!');
    AppStorage.setOrCreate<common.UIAbilityContext>('UIAbilityContext', this.context)
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      if (want.parameters && (want.parameters as Record<string, RecordData>)['distributedSessionId']) {
        this.restoreDistributedObject(want);
      }
    }
  }

  // 2. 接收端在onCreate和onNewWant接口中创建分布式数据对象并加入组网进行数据恢复
  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      if (want.parameters && (want.parameters as Record<string, RecordData>)['distributedSessionId']) {
        this.restoreDistributedObject(want);
      }
    }
  }

  async restoreDistributedObject(want: Want): Promise<void> {
    console.info('restoreDistributedObject start!');
    if (!want.parameters) {
      console.error('want.parameters');
      return;
    }
    if (!(want.parameters as Record<string, RecordData>)['distributedSessionId']) {
      console.error('want.parameters as');
      return;
    }
    // 调用create接口创建并得到一个分布式数据对象实例
    let attachment: commonType.Asset = {
      name: '',
      uri: '',
      path: '',
      createTime: '',
      modifyTime: '',
      size: '',
      status: commonType.AssetStatus.ASSET_NORMAL
    }

    let note: Note = new Note(undefined, undefined, attachment);
    g_object = distributedObject.create(this.context, note);
    // 注册恢复状态监听。收到状态为'restored'的回调通知时，表示接收端分布式数据对象已恢复发起端保存过来的数据（有资产数据时，对应的文件也迁移过来了）
    let statusCallback: distributedObject.StatusObserver = (sessionId: string, networkId: string, status: string) => {
      console.info(`status change, sessionId:  ${sessionId}`);
      console.info(`status change, networkId:  ${networkId}`);
      if (status === 'restored') { // 收到'restored'的状态通知表示已恢复发起端保存的数据
        console.info('restored title:' + g_object!['title']);
        console.info('restored text:' + g_object!['text']);
      }
    }
    g_object!.onStatus(statusCallback);

    // 从want.parameters中获取发起端放入的sessionId，调用setSessionId接口设置同步的sessionId
    let sessionId = (want.parameters as Record<string, RecordData>)['distributedSessionId'] as string;
    await g_object!.setSessionId(sessionId);
    console.info('restoreDistributedObject end');
  }
}
// [End dataObject_onContinue]