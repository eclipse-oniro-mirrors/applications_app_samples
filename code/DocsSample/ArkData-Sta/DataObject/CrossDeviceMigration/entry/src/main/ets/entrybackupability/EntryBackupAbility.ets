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
// [Start data_sync_on_distributed_data_object_cross_device_migration_static]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AbilityConstant, Want } from '@kit.AbilityKit';
import { UIAbility } from '@kit.AbilityKit';
import distributedObject from '@ohos.data.distributedDataObject';
import commonType from '@ohos.data.commonType';
import { AppStorage } from '@ohos.arkui.stateManagement';
import image from '@ohos.multimedia.image.d.ets';
import { BusinessError } from "@ohos.base";
import common from "@ohos.app.ability.common";
import { RecordData } from '@ohos.base';

// 业务数据定义
export class ContentInfo {
  public mainTitle: string | undefined;
  public textContent: string | undefined;
  public imageUriArray: Array<ImageInfo> | undefined;
  public isShowLocalInfo: boolean | undefined;
  public isAddLocalInfo: boolean | undefined;
  public selectLocalInfo: string | undefined;
  public attachments?: commonType.Assets | undefined;

  constructor(
    mainTitle: string | undefined,
    textContent: string | undefined,
    imageUriArray: Array<ImageInfo> | undefined,
    isShowLocalInfo: boolean | undefined,
    isAddLocalInfo: boolean | undefined,
    selectLocalInfo: string | undefined,
    attachments?: commonType.Assets | undefined
  ) {
    this.mainTitle = mainTitle;
    this.textContent = textContent;
    this.imageUriArray = imageUriArray;
    this.isShowLocalInfo = isShowLocalInfo;
    this.isAddLocalInfo = isAddLocalInfo;
    this.selectLocalInfo = selectLocalInfo;
    this.attachments = attachments;
  }

  flatAssets(): Record<string, Object> {
    let obj: Record<string, Object> = {};
    if (!this.attachments) {
      return obj;
    }
    for (let i = 0; i < this.attachments!.length; i++) {
      let asset: commonType.Asset = this.attachments![i];
      if (asset) {
        obj[`attachments${i}`] = asset;
      }
    }
    return obj;
  }
}

export interface ImageInfo {
  /**
   * image PixelMap.
   */
  imagePixelMap: image.PixelMap;

  /**
   * Image name.
   */
  imageName: string;
}

let g_object: distributedObject.DataObject | undefined = undefined;
let context1: common.UIAbilityContext;

export default class EntryBackupAbility extends UIAbility {
  private imageUriArray: Array<ImageInfo> = [];

  // 1. 迁移发起端在onContinue接口中创建分布式数据对象并保存数据到接收端
  async onContinue(wantParam: Record<string, Object | undefined>): Promise<AbilityConstant.OnContinueResult> {
    // 1.1 获取需要设置的分布式对象的资产关键uri
    try {
      let sessionId: string = distributedObject.genSessionId();
      (wantParam as Record<string, Object | undefined>)['distributedSessionId'] = sessionId;

      let distrUriArray: string[] = [];
      let assetUriArray: string[] | undefined = AppStorage.get<Array<string>>('assetUriArray');
      if (assetUriArray) {
        distrUriArray =  [];
      }
      // 1.2 创建分布式数据对象
      let contentInfo: ContentInfo = new ContentInfo(
        AppStorage.get<string>('mainTitle'),
        AppStorage.get<string>('textContent'),
        AppStorage.get<Array<ImageInfo>>('imageUriArray'),
        AppStorage.get<boolean>('isShowLocalInfo'),
        AppStorage.get<boolean>('isAddLocalInfo'),
        AppStorage.get<string>('selectLocalInfo'),
      );
      let source = contentInfo.flatAssets();
      context1 = AppStorage.get<common.UIAbilityContext>("context")! as common.UIAbilityContext;
      g_object = distributedObject.create(context1, source);


      // 1.3 将需要设置的分布式对象的资产或资产数组填充完成
      if (assetUriArray?.length == 1) {
        g_object!.setAsset('attachments', distrUriArray[0]).then(() => {
          console.info('OnContinue setAsset');
        })
      } else {
        g_object!.setAssets('attachments', distrUriArray).then(() => {
          console.info('OnContinue setAssets');
        })
      }
      // 1.4 将设置的资产或资产数组保存至迁移发起端
      g_object!.setSessionId(sessionId);
      g_object!.save((wantParam as Record<string, Object | undefined>)['targetDevice'] as string)
        .catch((err) => {
          console.error('OnContinue failed to save. code: ' + err.code);
          console.error('OnContinue failed to save. message: ', err.message);
        });
    } catch (error) {
      console.error('OnContinue failed code: ', error.code);
      console.error('OnContinue failed message: ', error.message);
    }
    console.info('OnContinue success!');
    return AbilityConstant.OnContinueResult.AGREE;
  }

  // 2. 接收端在onCreate和onNewWant接口中创建分布式数据对象并加入组网进行数据恢复
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
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
    if (!want.parameters || (want.parameters as Record<string, RecordData>)['distributedSessionId']) {
      console.error('missing sessionId');
      return;
    }

    // 2.1 调用create接口创建并得到一个分布式数据对象实例
    let mailInfo: ContentInfo = new ContentInfo(undefined, undefined, [], undefined, undefined, undefined, undefined);
    g_object = distributedObject.create(this.context, mailInfo);

    // 2.2 注册恢复状态监听。收到状态为'restored'的回调通知时，表示接收端分布式数据对象已恢复发起端保存过来的数据（有资产数据时，对应的文件也迁移过来了）
    let statusCallback: distributedObject.StatusObserver = (sessionId: string, networkId: string, status: string) => {
      console.info(`status change, sessionId:  ${sessionId}`);
      console.info(`status change, networkId:  ${networkId}`);
      if (status === 'restored') { // 收到'restored'的状态通知表示已恢复发起端保存的数据
        console.info(`status change, sessionId:  ${sessionId}`);
        AppStorage.setOrCreate<string>('mainTitle', g_object!['mainTitle'] as string);
        AppStorage.setOrCreate<string>('textContent', g_object!['textContent'] as string);
        AppStorage.setOrCreate<string>('imageUriArray', g_object!['imageUriArray'] as string);
        AppStorage.setOrCreate<boolean>('isShowLocalInfo', g_object!['isShowLocalInfo'] as boolean);
        AppStorage.setOrCreate<boolean>('isAddLocalInfo', g_object!['isAddLocalInfo'] as boolean);
        AppStorage.setOrCreate<string>('selectLocalInfo', g_object!['selectLocalInfo'] as string);
        AppStorage.setOrCreate<Array<ImageInfo>>('imageUriArray', this.imageUriArray);
      }
    }

    g_object!.onStatus(statusCallback);

    // 2.3 从want.parameters中获取发起端放入的sessionId，调用setSessionId接口设置同步的sessionId
    let sessionId = (want.parameters as Record<string, RecordData>)['distributedSessionId'] as string;
    console.info('get sessionId:' + sessionId);
    g_object!.setSessionId(sessionId);
  }
}

// [End data_sync_on_distributed_data_object_cross_device_migration_static]