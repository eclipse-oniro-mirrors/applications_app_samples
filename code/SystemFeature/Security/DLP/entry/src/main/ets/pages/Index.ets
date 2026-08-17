/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import picker from '@ohos.file.picker';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
// [Start dlp_include_dlpPermission]
import { dlpPermission } from '@kit.DataProtectionKit';
// [End dlp_include_dlpPermission]

// [Start dlp_include_identifySensitiveContent]
import { identifySensitiveContent } from '@kit.DataProtectionKit';
// [End dlp_include_identifySensitiveContent]


import { fileIo } from '@kit.CoreFileKit';
import { FileInfoType } from '../feature/FileManager';
import Want from '@ohos.app.ability.Want';
import Logger from '../util/Logger';
import { TestDlpFileInfo } from '../feature/DlpManager';
import { getResourceString } from '../util/ResourceUtils';
import { hilog } from '@kit.PerformanceAnalysisKit'
import { UIContext } from '@kit.ArkUI';
import { util } from '@kit.ArkTS';

let HILOG_DLP_DOMAIN: number = 0Xf888;
let HILOG_TAG: string = 'DLPManager';

interface Attribute {
  attributeId: string;
  attributeValues: Array<string>;
  valueType: number;
  opt: number;
}

interface Rule {
  ruleId: string;
  attributes: Array<Attribute>;
}

interface Policy {
  rules: Array<Rule>;
  policyId: string;
  ruleConflictAlg: number;
}

// 注册通信插件。
// [Start dlp_DlpConnPlugin]
export default class DataCapsulePlugin implements dlpPermission.DlpConnPlugin {
  connectServer(requestId: string, requestData: string, callback: Callback<string>): void {
    let callbackJson = JSON.stringify({
      'requestId': requestId,
    });
    callback(callbackJson);
  }
}
// [End dlp_DlpConnPlugin]

// 读取FUSE
// [Start dlp_PrepareOpenFuseFile]
interface DLPUriObj {
  name: string
};

interface DLPWriteable {
  name: boolean
};

interface DLPNameObj {
  dateModified: string,
  displayName: string,
  relativePath: string,
};

interface DLPLinkNameObj {
  name: string
};

function getParams(want: Want) {
  // 接收打开DLP文件传过来的参数
  let dlpFuseUri: string = want.uri ? want.uri : ''; // FUSE文件的uri, 存放解密后的明文
  let dlpFuseWriteable: boolean = (want.parameters?.linkFileWriteable as DLPWriteable).name; // 对FUSE文件是否有写权限
  let dlpUri: string = (want.parameters?.dlpUri as DLPUriObj).name; // DLP文件的uri
  let dlpName: string = (want.parameters?.fileAsset as DLPNameObj).displayName; // DLP文件的文件名
  let dlpFuseName: string = (want.parameters?.linkFileName as DLPLinkNameObj).name; // FUSE文件的文件名
}
// [End dlp_PrepareOpenFuseFile]

// [Start dlp_OpenFuseFile]
function readFileContent(dlpFuseUri: string): string {
  let content: string = '';
  let file: fileIo.File | undefined = undefined;
  try {
    file = fileIo.openSync(dlpFuseUri, fileIo.OpenMode.READ_ONLY);
  } catch (err) {
    console.error('error message', err.message);
    if (file) {
      try {
        fileIo.closeSync(file);
      } catch (e) {
        console.error('closeSync failed');
      }
    }
    return content;
  }

  try {
    let buffer = new ArrayBuffer(4096);
    let bytesRead = fileIo.readSync(file.fd, buffer);
    let actualBuffer = buffer.slice(0, bytesRead);
    content = bufferToString(actualBuffer);
  } catch (err) {
    console.error('error message', err.message);
  } finally {
    if (file) {
      try {
        fileIo.closeSync(file);
      } catch (e) {
        console.error('closeSync failed');
      }
    }
  }
  return content;
}

function bufferToString(buffer: ArrayBuffer): string {
  let textDecoder = new util.TextDecoder('utf-8', {
    ignoreBOM: true
  });
  return textDecoder.decodeToString(new Uint8Array(buffer), {
    stream: true
  });
}
// [End dlp_OpenFuseFile]

// [Start dlp_WriteFuseFile]
function writeFileContent(dlpFuseUri: string, content: string): void {
  let file: fileIo.File | undefined = undefined;

  try {
    file = fileIo.openSync(dlpFuseUri, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
    // O_RDWR: 读写模式, O_CREAT: 文件不存在时创建
    let writeLen: number = fileIo.writeSync(file.fd, content);

  } catch (err) {
    console.error('error message', err.message);
  } finally {
    if (file) {
      try {
        fileIo.closeSync(file);
      } catch (e) {
        console.error('closeSync failed');
      }
    }
  }
}
// [End dlp_WriteFuseFile]

@Entry
@Component
struct FilePicker {
  @State uri: string = '';
  @State result: string = '';
  // 文件名
  @State fileName: string = '';
  // 长按开关
  @State itemShowDeleteButton: boolean = false;
  // 当前权限
  @State currentPerssion: number = -1;
  @State currentSelectedFileUri: string = '';
  // 避免aboutToAppear函数重复执行的标识
  @State isFlag: boolean = false;
  // 文件集合信息
  @StorageLink('fileInfos') fileInfos: Array<FileInfoType> = [];
  // dlp文件信息
  @StorageLink('dlpFileInfos') dlpFileInfos: Array<TestDlpFileInfo> = [];
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;

  async aboutToAppear() {
    Logger.info(`aboutToAppear start`);
    hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'aboutToAppear start');
    this.isFlag = true;
  }

  async onPageShow() {
    if (!this.isFlag) {
      Logger.info(`onPageShow start`);
      hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'onPageShow start');
    }
  }

  async onPageHide() {
    Logger.info(`onPageHide start`);
    hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'onPageHide start');
    this.isFlag = false;
  }

  // 拉起picker保存文件
  async callFilePickerSaveFile(): Promise<void> {
    this.isFlag = false;
    try {
      let DocumentSaveOptions = new picker.DocumentSaveOptions();
      DocumentSaveOptions.newFileNames = [getResourceString(this.context, $r('app.string.init_file_name'))];
      let documentPicker = new picker.DocumentViewPicker();
      documentPicker.save(DocumentSaveOptions).then((DocumentSaveResult) => {
        Logger.info('DocumentViewPicker.save successfully');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'DocumentViewPicker.save successfully');
        if (DocumentSaveResult !== null && DocumentSaveResult !== undefined) {
          this.uri = DocumentSaveResult[0];
          Logger.info(`file saved`);
          hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'file saved');
        }
        this.getFilenameByUri(this.uri);
      })
    } catch (err) {
      Logger.error('DocumentViewPicker failed with err: ' + err);
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'DocumentViewPicker failed with err: ' + err);
    }
  }

  /**
   * 拉起picker选择文件
   */
  async callFilePickerSelectFile(): Promise<void> {
    try {
      let DocumentSelectOptions = new picker.DocumentSelectOptions();
      let documentPicker = new picker.DocumentViewPicker();
      documentPicker.select(DocumentSelectOptions).then((DocumentSelectResult) => {
        Logger.info('DocumentViewPicker.select successfully');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'DocumentViewPicker.select successfully');
        let editFlag = false;
        if (DocumentSelectResult !== null && DocumentSelectResult !== undefined) {
          DocumentSelectResult.forEach((value) => {
            this.uri = value;
            editFlag = true;
            Logger.info('file selected');
            hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'file selected');
          })
        }
        if (editFlag) {
          this.getFilenameByUri(this.uri);
        }
      })
    } catch (err) {
      Logger.error('DocumentViewPicker failed with err: ' + JSON.stringify(err));
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'DocumentViewPicker failed with err: ' + JSON.stringify(err));
    }
  }

  // 获取文件名称
  async getFilenameByUri(myUri: string): Promise<void> {
    // 获取文件名称
    this.fileName = (myUri.split('/').pop()) as string;
    Logger.info('the fileName is' + this.fileName);
    hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'the fileName is' + this.fileName);
    await this.onPageShow();
  }

  // 打开文件编辑应用
  async startAbility(fileName: string, myUri: string) {
    let want: Want = {
      bundleName: 'com.example.fileEdit',
      abilityName: 'EntryAbility',
      parameters: {
        fileName: fileName,
        myUri: myUri,
      },
    };
    this.context.startAbility(want, (err: BusinessError) => {
      Logger.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, `Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
    });
  }

  openFile(filePath: string): fileIo.File | undefined {
    let file: fileIo.File | undefined = undefined;
    try {
      file = fileIo.openSync(filePath, fileIo.OpenMode.READ_ONLY);
    } catch (error) {
      Logger.error(`OpenSync failed. Code: ${error.code}, message : ${error.message}`);
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, `OpenSync failed. Code: ${error.code}, message : ${error.message}`);
    }
    return file;
  }

  // 2，打开Dlp文件
  // [Start dlp_prepareForOpenDlpFile]
  openDlpFile(dlpUri: string, fileName: string, fd: number) {
    let want: Want = {
      'action': 'ohos.want.action.viewData',
      'uri': dlpUri,
      'parameters': {
        'fileName': {
          'name': fileName
        },
        'keyFd': {
          'type': 'FD',
          'value': fd
        }
      }
    }

    let context = new UIContext().getHostContext() as common.UIAbilityContext; // 获取当前UIAbilityContext

    try {
      console.info('openDLPFile:' + JSON.stringify(want));
      console.info('openDLPFile: delegator:' + JSON.stringify(context));
      hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'openDLPFile:' + JSON.stringify(want));
      hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'openDLPFile: delegator:' + JSON.stringify(context));
      context.startAbility(want);
    } catch (err) {
      console.error('openDLPFile startAbility failed' + (err as BusinessError).code);
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'openDLPFile startAbility failed' + (err as BusinessError).code);
      this.result = 'openDLPFile startAbility failed' + (err as BusinessError).code;
      return;
    }
  }

  prepareForOpenDlpFile() {
    let file = this.openFile(this.uri);
    if (!file) {
      return;
    }
    this.openDlpFile(this.uri, this.fileName, file.fd);

  }
  // [End dlp_prepareForOpenDlpFile]

  //3，生成DLP文件
  // [Start dlp_generateDlpFiles]
  generateDlpFiles() {
    try {
      let fileUri: string = this.uri;
      let fileName: string = this.fileName;
      let context = new UIContext().getHostContext() as common.UIAbilityContext; // 获取当前UIAbilityContext
      let want: Want = {
        'uri': fileUri,
        'parameters': {
          'displayName': fileName
        }
      }; // 请求参数
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        dlpPermission.startDLPManagerForResult(context, want).then((res: dlpPermission.DLPManagerResult) => {
          this.result = 'startDLPManagerForResult result.resultCode:' + res.resultCode;
          console.info('startDLPManagerForResult res.resultCode:' + res.resultCode);
          console.info('startDLPManagerForResult res.want:' + JSON.stringify(res.want));
          hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'startDLPManagerForResult res.resultCode:' + res.resultCode);
          hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'startDLPManagerForResult res.want:' + JSON.stringify(res.want));
        });
      }
    } catch (err) {
      this.result = 'startDLPManagerForResult error:' + (err as BusinessError).code + (err as BusinessError).message;
      console.error('startDLPManagerForResult error:' + (err as BusinessError).code + (err as BusinessError).message);
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
        'startDLPManagerForResult error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }
  // [End dlp_generateDlpFiles]

  // 4，查询当前应用是否在沙箱中
  // [Start dlp_isInSandBox]
  isInSandbox() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.isInSandbox().then((data) => {
        this.result = 'isInSandbox result: ' + JSON.stringify(data);
        console.info('isInSandbox result: ' + JSON.stringify(data));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'isInSandbox result: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        this.result = 'isInSandbox error: ' + JSON.stringify(err);
        console.error('isInSandbox error: ' + JSON.stringify(err));
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'isInSandbox error: ' + JSON.stringify(err));
      });
    }
  }
  // [End dlp_isInSandBox]

  // 5，查询当前编辑的文件权限
  // [Start dlp_getDLPPermissionInfo]
  getDLPPermissionInfo() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.getDLPPermissionInfo().then((data) => {
        this.result = 'getDLPPermissionInfo result: ' + JSON.stringify(data);
        console.info('getDLPPermissionInfo, result: ' + JSON.stringify(data));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getDLPPermissionInfo result: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        this.result = 'getDLPPermissionInfo error: ' + JSON.stringify(err);
        console.error('getDLPPermissionInfo: ' + JSON.stringify(err));
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'getDLPPermissionInfo error: ' + JSON.stringify(err));
      });
    }
  }
  // [End dlp_getDLPPermissionInfo]

  //6，获取当前可支持DLP方案的文件拓展名类型列表
  // [Start dlp_getDLPSupportedFileTypes]
  getDLPSupportedFileTypes() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.getDLPSupportedFileTypes((err, result) => {
        console.info('getDLPSupportedFileTypes: ' + JSON.stringify(err));
        console.info('getDLPSupportedFileTypes: ' + JSON.stringify(result));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getDLPSupportedFileTypes: ' + JSON.stringify(err));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getDLPSupportedFileTypes: ' + JSON.stringify(result));
        this.result = 'getDLPSupportedFileTypes result: ' + JSON.stringify(result);
      });
    }
  }
  // [End dlp_getDLPSupportedFileTypes]

  //7，判断当前打开文件是否是DLP文件
  // [Start dlp_isCurrentDlpFile]
  isCurrentDlpFile() {
    let file = this.openFile(this.uri);
    if (!file) {
      this.result = '请打开一个文件！';
      return;
    }
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.isDLPFile(file.fd).then((res) => {
        if (res.valueOf()) {
          this.result = 'isDLPFile result: ' + JSON.stringify(res);
        } else {
          this.result = '请打开一个dlp文件! ';
        }
        console.info('res', res);
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'res' + res);
      }).catch((err: BusinessError) => {
        this.result = 'isDLPFile error: ' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      }).finally(() => {
        try {
          fileIo.closeSync(file);
        } catch (e) {
          console.error('closeSync failed', e);
        }
      });
    }
  }
  // [End dlp_isCurrentDlpFile]

  // 8，订阅、取消订阅DLP打开事件
  // [Start dlp_subscribe]
  event(info: dlpPermission.AccessedDLPFileInfo) {
    console.info('openDlpFile event');
    hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'openDlpFile event');
  }

  unSubscribe() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        dlpPermission.off('openDLPFile', this.event); // 取消订阅
        this.result = 'unSubscribe result: 已取消注册';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'unSubscribe result: 已取消注册');
      } catch (err) {
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
        this.result = 'unSubscribe error: 取消注册失败';
      }
    }
  }

  subscribe() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        dlpPermission.on('openDLPFile', this.event); // 订阅
        this.result = 'subscribe result: 已注册';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'subscribe result: 已注册');
      } catch (err) {
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
        this.result = 'subscribe error: 注册失败';
      }
    }
  }
  // [End dlp_subscribe]

  // 9，获取DLP文件打开记录
  // [Start dlp_getDLPFileAccessRecords]
  getDLPFileAccessRecords() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.getDLPFileAccessRecords().then((res) => {
        this.result = 'getDLPFileAccessRecords result: ' + JSON.stringify(res);
        console.info('res', JSON.stringify(res));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'res' + JSON.stringify(res));
      }).catch((err: BusinessError) => {
        this.result = 'getDLPFileAccessRecords error: ' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error: ', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      });
    }
  }
  // [End dlp_getDLPFileAccessRecords]

  // 10，获取DLP文件保留沙箱记录
  // [Start dlp_getRetentionSandboxList]
  getRetentionSandboxList() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.getRetentionSandboxList().then((res) => {
        this.result = 'getRetentionSandboxList result: ' + JSON.stringify(res);
        console.info('res', JSON.stringify(res));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'res' + JSON.stringify(res));
      }).catch((err: BusinessError) => {
        this.result = 'getRetentionSandboxList error' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      });
    }
  }
  // [End dlp_getRetentionSandboxList]

  // 11，设置沙箱应用配置
  // [Start dlp_setSandboxAppConfig]
  setSandboxAppConfig() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.setSandboxAppConfig('configInfo').then(() => {
        this.result = 'setSandboxAppConfig result: 设置沙箱应用配置信息成功';
        console.info('res', '设置沙箱应用配置信息成功');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'setSandboxAppConfig result: 设置沙箱应用配置信息成功');
      }).catch((err: BusinessError) => {
        this.result = 'setSandboxAppConfig error: ' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      });
    }
  }
  // [End dlp_setSandboxAppConfig]

  // 12，清理沙箱应用配置信息
  // [Start dlp_cleanSandboxAppConfig]
  cleanSandboxAppConfig() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.cleanSandboxAppConfig().then(() => {
        this.result = 'cleanSandboxAppConfig result: 清理沙箱成功';
        console.info('res', '清理沙箱成功');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'cleanSandboxAppConfig result: 清理沙箱成功');
      }).catch((err: BusinessError) => {
        this.result = 'cleanSandboxAppConfig error: ' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      });
    }
  }
  // [End dlp_cleanSandboxAppConfig]

  // 13，获取DLP文件保留沙箱记录
  // [Start dlp_getSandboxAppConfig]
  getSandboxAppConfig() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.getSandboxAppConfig().then((res) => {
        this.result = 'getSandboxAppConfig result: ' + JSON.stringify(res);
        console.info('res', JSON.stringify(res));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getSandboxAppConfig result: ' + JSON.stringify(res));
      }).catch((err: BusinessError) => {
        this.result = 'getSandboxAppConfig error: ' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      });
    }
  }
  // [End dlp_getSandboxAppConfig]

  // 14，以无边框形式打开DLP权限管理应用
  // [Start dlp_startDLPManagerForResult]
  startDLPManagerForResult() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        let context = new UIContext().getHostContext() as common.UIAbilityContext; // 获取当前UIAbilityContext
        let want: Want = {
          'uri': this.uri,
          'parameters': {
            'displayName': this.fileName
          }
        }; // 请求参数
        dlpPermission.startDLPManagerForResult(context, want).then((res) => {
          this.result = 'startDLPManagerForResult resultCode: ' + res.resultCode;
          console.info('res.resultCode', res.resultCode);
          console.info('res.want', JSON.stringify(res.want));
          hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'res.resultCode' + res.resultCode);
          hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'res.want' + JSON.stringify(res.want));
        }); // 打开DLP权限管理应用
      } catch (err) {
        this.result = 'startDLPManagerForResult error' + err.code + err.message;
        console.error('error', err.code, err.message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      }
    }
  }
  // [End dlp_startDLPManagerForResult]

  // 15，查询当前系统是否提供DLP特性
  // [Start dlp_isDLPFeature]
  isDLPFeature() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      dlpPermission.isDLPFeatureProvided().then((res) => {
        this.result = 'isDLPFeatureProvided result: ' + JSON.stringify(res.valueOf());
        console.info('res', JSON.stringify(res.valueOf()));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'isDLPFeatureProvided result: ' + JSON.stringify(res.valueOf()));
      }).catch((err: BusinessError) => {
        this.result = 'isDLPFeatureProvided error: ' + (err as BusinessError).code + (err as BusinessError).message;
        console.error('error: ', (err as BusinessError).code, (err as BusinessError).message); // 失败报错
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      });
    }
  }
  // [End dlp_isDLPFeature]

  // 16，设置企业应用防护策略
  // [Start dlp_setDLPProtectPolicy]
  setDLPProtectPolicy() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        let attributeValues: string[] = ['1'];
        let attribute: Attribute = {
          attributeId: 'DeviceHealthyStatus',
          attributeValues: attributeValues,
          valueType: 0,
          opt: 2
        }; // 属性信息。
        let rule: Rule = {
          ruleId: 'ruleId',
          attributes: [attribute]
        }; // 规则。
        let policy: Policy = {
          rules: [rule],
          policyId: 'policyId',
          ruleConflictAlg: 0
        }; // 策略。
        let enterprisePolicy: dlpPermission.EnterprisePolicy = {
          policyString: JSON.stringify(policy)
        };
        dlpPermission.setEnterprisePolicy(enterprisePolicy);
        console.info('set enterprise policy success');
        this.result = 'set enterprise policy success';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'set enterprise policy success');
      } catch (err) {
        console.error('error:' + err.code + err.message); // 失败报错。
        this.result = 'error:' + err.code + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG,
          'error' + (err as BusinessError).code + (err as BusinessError).message);
      }
    }
  }
  // [End dlp_setDLPProtectPolicy]

  // 17，识别指定文件中的敏感内容
  // [Start dlp_scanSensitiveInfo]
  scanSensitiveInfo() {
    let filepath = this.uri;
    let policies: identifySensitiveContent.Policy[] = [
      { 'sensitiveLabel': '1', 'keywords': [], 'regex': '' }
    ];
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        identifySensitiveContent.scanFile(filepath, policies).then(records => {
          console.info('scanFile finish');
          this.result = 'scanFile finish';
          hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'scanFile finish');
        }).catch((err: Error) => {
          console.error('error message', err.message);
          this.result = 'error message' + err.message;
          hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
        })
      } catch (err) {
        console.error('error message', err.message);
        this.result = 'error message' + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
      }
    }
  }
  // [End dlp_scanSensitiveInfo]

  // 18. 加密文件
  // [Start dlp_generateDlpFileForEnterprise]
  async generateDlpFileForEnterprise() {
    let fileName: string = 'test.txt';
    try {
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        let property: dlpPermission.DLPProperty = {
          ownerAccount: 'accountInfo.accountName',
          ownerAccountType: dlpPermission.AccountType.ENTERPRISE_ACCOUNT,
          authUserList: [{
            authAccount: 'a012345678',
            authAccountType: 1,
            dlpFileAccess: 2,
            permExpiryTime: 3,
          }],

          contactAccount: 'b012345678',
          offlineAccess: true,
          ownerAccountID: 'accountInfo.ownerAccountID',
          everyoneAccessList: [],
          expireTime: 666666666666666,
          actionUponExpiry: dlpPermission.ActionType.NOT_OPEN,
          fileId: 'abc123456789123456789',
        };

        let customProperty: dlpPermission.CustomProperty = {
          enterprise: 'testString'
        };
        let context = this.context as common.UIAbilityContext;
        let fileDir = context.getApplicationContext().filesDir;
        let plaintextFd = fileIo.openSync(fileDir + '/' + fileName, fileIo.OpenMode.READ_ONLY).fd;
        let ciphertextFd =
          fileIo.openSync(fileDir + '/' + fileName + '.dlp', fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE).fd;
        await dlpPermission.generateDlpFileForEnterprise(plaintextFd, ciphertextFd, property, customProperty);
        this.result = 'generate DLP file for enterprise successful'
        console.info('generate DLP file for enterprise successful');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'generate DLP file for enterprise successful');
      }
    } catch (err) {
      console.error('error message', err.message);
      this.result = 'error message' + err.message;
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
    }
  }
  // [End dlp_generateDlpFileForEnterprise]

  // 19. 加密文件
  // [Start dlp_decryptDlpFile]
  async decryptDlpFile() {
    let fileName = 'test.pptx.dlp';

    try {
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        let context = this.context as common.UIAbilityContext;
        let fileDir = context.getApplicationContext().filesDir;
        let oriFileName: string = fileName.split('.dlp')[0];
        let plaintextFd =
          fileIo.openSync(fileDir + '/' + oriFileName, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE).fd;
        let ciphertextFd = fileIo.openSync(fileDir + '/' + fileName, fileIo.OpenMode.READ_ONLY).fd;
        await dlpPermission.decryptDlpFile(ciphertextFd, plaintextFd);
      }
      this.result = 'decrypt DLP file for enterprise successful'
      console.info('decrypt DLP file for enterprise successful');
      hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'decrypt DLP file for enterprise successful');
    } catch (err) {
      console.error('error message', err.message);
      this.result = 'error message' + err.message;
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
    }
  }
  // [End dlp_decryptDlpFile]

  // 20. 设置防护策略
  // [Start dlp_setEnterprisePolicy]
  setEnterprisePolicy() {
    try {
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        let attributeValues: string[] = ['1'];
        let attribute: Attribute = {
          attributeId: 'DeviceHealthyStatus',
          attributeValues: attributeValues,
          valueType: 0,
          opt: 2
        }; // 属性信息。
        let rule: Rule = {
          ruleId: 'ruleId',
          attributes: [attribute]
        }; // 规则。
        let policy: Policy = {
          rules: [rule],
          policyId: 'policyId',
          ruleConflictAlg: 0
        }; // 策略。
        let enterprisePolicy: dlpPermission.EnterprisePolicy = {
          policyString: JSON.stringify(policy)
        };
        dlpPermission.setEnterprisePolicy(enterprisePolicy);
        console.info('set enterprise policy success');
        this.result = 'set enterprise policy success';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'set enterprise policy success');
      }
    } catch (err) {
      console.error('error message', err.message);
      this.result = 'error message' + err.message;
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
    }
  }
  // [End dlp_setEnterprisePolicy]

  // 21. 设置防护策略
  // [Start dlp_queryOpenedEnterpriseDlpFiles]
  queryOpenedEnterpriseDlpFiles() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      let options: dlpPermission.DlpFileQueryOptions = {
        classificationLabel: 'label1'
      };
      dlpPermission.queryOpenedEnterpriseDlpFiles(options).then((uris: Array<string>) => {
        console.info('try to query opened enterprise dlp files, result: ', JSON.stringify(uris));
        this.result = 'try to query opened enterprise dlp files, result: ' + JSON.stringify(uris);
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'try to query opened enterprise dlp files, result: ',
          JSON.stringify(uris));
      }).catch((err: BusinessError) => {
        console.error('error message', err.message);
        this.result = 'error message' + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
      }).finally(() => {
        console.info('after querying opened enterprise dlp files');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'after querying opened enterprise dlp files');
      });
    }
  }
  // [End dlp_queryOpenedEnterpriseDlpFiles]

  // 21. 输入指定的文件标签，关闭当前正打开的拥有该标签的 DLP 文件。
  // [Start dlp_closeOpenedEnterpriseDlpFiles]
  closeOpenedEnterpriseDlpFiles() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      let options: dlpPermission.DlpFileQueryOptions = {
        classificationLabel: 'label1'
      };
      dlpPermission.closeOpenedEnterpriseDlpFiles(options).then(() => {
        console.info('try to close opened enterprise dlp files');
        this.result = 'try to close opened enterprise dlp files';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'try to close opened enterprise dlp files');
      }).catch((err: BusinessError) => {
        console.error('error message', err.message);
        this.result = 'error message' + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
      }).finally(() => {
        console.info('after closing opened enterprise dlp files');
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'after closing opened enterprise dlp files');
      });
    }
  }
  // [End dlp_closeOpenedEnterpriseDlpFiles]

  // 22. 注册通信插件。
  // [Start dlp_registerPlugin]
  registerPlugin() {
    try {
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        let pluginId: number = dlpPermission.DlpConnManager.registerPlugin(new DataCapsulePlugin());
        console.info('registerPlugin pluginId:', JSON.stringify(pluginId));
        this.result = 'try to close opened enterprise dlp files';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'registerPlugin pluginId:', JSON.stringify(pluginId));
      }
    } catch (err) {
      console.error('error message', err.message);
      this.result = 'error message' + err.message;
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
    }
  }
  // [End dlp_registerPlugin]

  // 23. 保留沙箱。
  // [Start dlp_setRetentionState]
  async setRetentionState() {
    let docUris: string[]= ['file://docs/storage/Users/currentUser/Desktop/test.txt.dlp']
    try {
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        await dlpPermission.setRetentionState(docUris); // 设置沙箱保留
        console.info('set RetentionState successful');
        this.result = 'set RetentionState successful';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'set RetentionState successful');
      }
    } catch (err) {
      console.error('error message', err.message);
      this.result = 'error message' + err.message;
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
    }
  }
  // [End dlp_setRetentionState]

  // 24. 取消沙箱。
  // [Start dlp_cancelRetentionState]
  async cancelRetentionState() {
    let docUris: string[] = ['file://docs/storage/Users/currentUser/Desktop/test.txt.dlp']
    try {
      if (canIUse('SystemCapability.Security.DataLossPrevention')) {
        await dlpPermission.cancelRetentionState(docUris); // 取消保留沙箱
        console.info('cancel RetentionState successful');
        this.result = 'cancel RetentionState successful';
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'cancel RetentionState successful');
      }
    } catch (err) {
      console.error('error message', err.message);
      this.result = 'error message' + err.message;
      hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
    }
  }
  // [End dlp_cancelRetentionState]

  // 25. 获取dlp文件原始名。
  // [Start dlp_getOriginalFileName]
  getOriginalFileName() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        this.result = dlpPermission.getOriginalFileName('test.txt.dlp');
        console.info('res', JSON.stringify(this.result));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getOriginalFileName result: ' + JSON.stringify(this.result));
      } catch (err) {
        console.error('error message', err.message);
        this.result = 'error message' + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
      }
    }
  }
  // [End dlp_getOriginalFileName]

  // 26. 获取dlp文件的后缀名。
  // [Start dlp_getDLPSuffix]
  getDLPSuffix() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      try {
        this.result = dlpPermission.getDLPSuffix();
        console.info('res', JSON.stringify(this.result));
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getDLPSuffix result: ' + JSON.stringify(this.result));
      } catch (err) {
        console.error('error message', err.message);
        this.result = 'error message' + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
      }
    }
  }
  // [End dlp_getDLPSuffix]

  // 27. 获取dlp文件的后缀名。
  // [Start dlp_queryDlpPolicy]
  async queryDlpPolicy() {
    if (canIUse('SystemCapability.Security.DataLossPrevention')) {
      let fileName = 'test.pptx.dlp';
      try {
        let context = this.context as common.UIAbilityContext;
        let fileDir = context.getApplicationContext().filesDir;
        let ciphertextFd = fileIo.openSync(fileDir + '/' + fileName, fileIo.OpenMode.READ_ONLY).fd;
        this.result = await dlpPermission.queryDlpPolicy(ciphertextFd);
        console.info('res', this.result);
        hilog.info(HILOG_DLP_DOMAIN, HILOG_TAG, 'getDLPSuffix result: ' + this.result);
      } catch (err) {
        console.error('error message', err.message);
        this.result = 'error message' + err.message;
        hilog.error(HILOG_DLP_DOMAIN, HILOG_TAG, 'error message' + err.message);
      }
    }
  }
  // [End dlp_queryDlpPolicy]

  build() {
    Column() {
      Row() {
        Text($r('app.string.file_list'))
          .fontFamily('HarmonyHeiTi-Bold')
          .fontSize(30)
          .fontWeight(700)
          .fontColor(Color.Black)
        Row() {
          Image($r('app.media.ic_saveas'))
            .width(25)
            .height(25)
            .id('newFile')
            .onClick(() => {
              // 使用默认预览打开文件
              this.prepareForOpenDlpFile();
            })
          Image($r('app.media.ic_folder'))
            .width(25)
            .height(25)
            .id('folder')
            .margin({ left: 30 })
            .onClick(() => {
              // 读入文件的基本信息
              this.callFilePickerSelectFile();
            })
        }
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

      Row() {
        Text('3, 生成DLP文件')
          .id('generateDlpFiles')
          .width(50)
          .backgroundColor(Color.Blue)
          .onClick(() => {
            this.generateDlpFiles();
          })
        Text('')
          .width(10)
        Text('4, 是否在沙箱中')
          .id('isInSandBox')
          .width(50)
          .backgroundColor(Color.Green)
          .onClick(() => {
            this.isInSandbox();
          })
        Text('')
          .width(10)
        Text('5, 查询当前编辑的文件权限')
          .id('getDLPPermissionInfo')
          .width(50)
          .backgroundColor(Color.Pink)
          .onClick(() => {
            this.getDLPPermissionInfo();
          })
        Text('')
          .width(10)
        Text('6, 查看支持加密的文件类型')
          .id('getDLPSupportedFileTypes')
          .width(50)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.getDLPSupportedFileTypes();
          })
        Text('')
          .width(10)
        Text('7, 判断当前打开文件是否是DLP文件')
          .id('isCurrentDlpFile')
          .width(50)
          .backgroundColor(Color.Red)
          .onClick(() => {
            this.isCurrentDlpFile();
          })
      }

      Row() {
        Text('8, 订阅DLP打开事件')
          .id('subscribe')
          .width(50)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.subscribe();
          })
        Text('')
          .width(5)
        Text('8, 取消订阅DLP打开事件')
          .id('unSubscribe')
          .width(50)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.unSubscribe();
          })
        Text('')
          .width(10)
        Text('9, 获取DLP文件打开记录')
          .id('getDLPFileAccessRecords')
          .width(50)
          .backgroundColor(Color.Pink)
          .onClick(() => {
            this.getDLPFileAccessRecords();
          })
        Text('')
          .width(10)
        Text('10, 获取DLP文件保留沙箱记录')
          .id('getRetentionSandboxList')
          .width(50)
          .backgroundColor(Color.Orange)
          .onClick(() => {
            this.getRetentionSandboxList();
          })
        Text('')
          .width(10)
        Text('11, 设置沙箱应用配置信息')
          .id('setSandboxAppConfig')
          .width(50)
          .backgroundColor(Color.Blue)
          .onClick(() => {
            this.setSandboxAppConfig();
          })
      }

      Row() {
        Text('12, 清理沙箱应用配置信息')
          .id('cleanSandboxAppConfig')
          .width(50)
          .backgroundColor(Color.Green)
          .onClick(() => {
            this.cleanSandboxAppConfig();
          })
        Text('')
          .width(10)
        Text('13, 查询沙箱应用配置信息')
          .id('getSandboxAppConfig')
          .width(50)
          .backgroundColor(Color.Pink)
          .onClick(() => {
            this.getSandboxAppConfig();
          })
        Text('')
          .width(10)
        Text('14, 以无边框形式打开DLP权限管理应用')
          .id('startDLPManagerForResult')
          .width(50)
          .backgroundColor(Color.Red)
          .onClick(() => {
            this.startDLPManagerForResult();
          })
        Text('')
          .width(10)
        Text('15, 查询提供DLP特性')
          .id('isDLPFeature')
          .width(50)
          .backgroundColor(Color.Orange)
          .onClick(() => {
            this.isDLPFeature();
          })
        Text('')
          .width(10)
        Text('16, 设置企业应用防护策略')
          .id('setDLPProtectPolicy')
          .width(50)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.setDLPProtectPolicy();
          })
        Text('')
          .width(10)
        Text('17, 识别指定文件中的敏感内容')
          .id('scanSensitiveInfo')
          .width(50)
          .backgroundColor(Color.Green)
          .onClick(() => {
            this.scanSensitiveInfo();
          })
      }

      Row() {
        Text('运行结果: ' + `${this.result}`)
      }

    }.width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor('#f1f3f5')
  }


}