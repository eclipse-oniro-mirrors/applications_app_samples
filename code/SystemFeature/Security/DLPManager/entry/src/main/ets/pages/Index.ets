/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FileInfo、dlpInfo、ListFileOption、Index、timestampToDate、sleep。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：FileInfo、dlpInfo、ListFileOption、Index、timestampToDate、sleep。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import promptAction from '@ohos.promptAction';
import picker from '@ohos.file.picker';
import util from '@ohos.util';
import router from '@ohos.router';
import fs, { Filter } from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Logger from '../utils/Logger';
import MediaFileUri from '../media/MediaFileUri';
import dlpPermission from '@ohos.dlpPermission';
import Want from '@ohos.app.ability.Want';
import fileUri from '@ohos.file.fileuri';
import account from '@ohos.account.distributedAccount';
import account_osAccount from '@ohos.account.osAccount';
import wantConstant from '@ohos.app.ability.wantConstant';

// const 语句
const accountAbility = account.getDistributedAccountAbility();

/**
 * FileInfo：接口定义，承载本文件对应的逻辑与数据。
 */
interface FileInfo {
  // 字段 uuid：声明并维护该成员的状态
  uuid: string;

  // 字段 name：声明并维护该成员的状态
  name: string;

  // 字段 path：声明并维护该成员的状态
  path: string;

  // 字段 uri：声明并维护该成员的状态
  uri: string,
  // 字段 time：声明并维护该成员的状态
  time: string;

  // 字段 icon：声明并维护该成员的状态
  icon: Resource;
}

/**
 * dlpInfo：接口定义，承载本文件对应的逻辑与数据。
 */
interface dlpInfo {
  // 字段 name：声明并维护该成员的状态
  name: string;

  // 字段 id：声明并维护该成员的状态
  id: string;

  // 字段 event：声明并维护该成员的状态
  event: string;

  // 字段 nickname：声明并维护该成员的状态
  nickname: string;

  // 字段 avatar：声明并维护该成员的状态
  avatar: string;
}

/**
 * ListFileOption：类定义，承载本文件对应的逻辑与数据。
 */
class ListFileOption {
  // 字段 recursion：声明并维护该成员的状态
  public recursion: boolean = false;

  // 字段 listNum：声明并维护该成员的状态
  public listNum: number = 0;

  // 字段 filter：声明并维护该成员的状态
  public filter: Filter = {};
}

// const 语句
const RECENT_MAX = 10; // 最近打开最大文件数
// const 语句
const TAG = '[dlpmanager_index]';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
export struct Index {
  // 字段 mediaFileUri：声明并维护该成员的状态
  mediaFileUri: MediaFileUri = new MediaFileUri();

  // @State uri：组件内部状态
  @State uri: string = 'Hello World';

  // @State filename：组件内部状态
  @State filename: string = '';

  // @State accountName：组件内部状态
  @State accountName: string = '';

  // @State isDLPFile：组件内部状态
  @State isDLPFile: boolean = false;

  // @StorageLink pathDir：与 AppStorage 双向绑定
  @StorageLink('pathDir') pathDir: string = '';

  // @State fileInfoList：组件内部状态
  @State fileInfoList: Array<FileInfo> = [];

  // @StorageLink fileUriList：与 AppStorage 双向绑定
  @StorageLink('fileUriList') fileUriList: Array<string> = [];

  // @StorageLink fileNameList：与 AppStorage 双向绑定
  @StorageLink('fileNameList') fileNameList: Array<string> = [];

  // @StorageLink filePathList：与 AppStorage 双向绑定
  @StorageLink('filePathList') filePathList: Array<string> = [];

  // @StorageLink fileTimeList：与 AppStorage 双向绑定
  @StorageLink('fileTimeList') fileTimeList: Array<string> = [];

  // 字段 scroller：声明并维护该成员的状态
  scroller: Scroller = new Scroller();

  /**
   * 拉起picker选择文件
   */
  async callFilePickerSelectFile(): Promise<void> {
    // try 语句
    try {
      // let 语句
      let DocumentSelectOptions = new picker.DocumentSelectOptions();
      DocumentSelectOptions.defaultFilePathUri = 'file://com.sample.dlpmanager/data/storage/el2/base/haps/entry/files';
      DocumentSelectOptions.maxSelectNumber = 20;
      // let 语句
      let documentPicker = new picker.DocumentViewPicker();
      documentPicker.select(DocumentSelectOptions).then((DocumentSelectResult) => {
        Logger.info(TAG, 'DocumentViewPicker.select successfully, DocumentSelectOptions : ' + JSON.stringify(DocumentSelectOptions));
        Logger.info(TAG, 'DocumentViewPicker.select successfully, DocumentSelectResult uri: ' + JSON.stringify(DocumentSelectResult));
        // let 语句
        let editFlag = false;
        // if 语句
        if (DocumentSelectResult !== null && DocumentSelectResult !== undefined) {
          DocumentSelectResult.forEach((value) => {
            // 更新 uri
            this.uri = value;
            // 字段 editFlag：声明并维护该成员的状态
            editFlag = true;
            Logger.info(TAG, `select file uri: ${this.uri}`);
          });
        }
        // if 语句
        if (editFlag) {
          // 更新 getFilenameByUri
          this.getFilenameByUri(this.uri);
        }
      }).catch((err: BusinessError) => {
        Logger.error(TAG, 'DocumentViewPicker.select failed with err: ' + JSON.stringify(err));
      });
    } catch (err) {
      Logger.error(TAG, 'DocumentViewPicker failed with err: ' + JSON.stringify(err));
    }
  }

  /**
   * getFilenameByUri：执行 getFilenameByUri 相关逻辑。
   */
  async getFilenameByUri(myUri: string): Promise<void> {
    // 更新 filename
    this.filename = (myUri.split('/').pop()) as string;
    // let 语句
    let fd: number = fs.openSync(myUri).fd;
    Logger.info(TAG, myUri + ';fd:' + fd);
    // let 语句
    let fileUriObject = new fileUri.FileUri(myUri);
    // let 语句
    let name = fileUriObject.name;
    // let 语句
    let path = fileUriObject.path;
    Logger.info(TAG, 'The name of FileUri is ' + name + ';The path is ' + path);
    // let 语句
    let fileSuffix = '.' + (this.filename.split('.').pop()) as string;
    // await 语句
    await this.isDlpFileFunc(fd);
    // await 语句
    await sleep(2);
    // if 语句
    if (this.isDLPFile) {
      // await 语句
      await this.OpenDlpFile(myUri, this.filename, fd);
    } else {
      // await 语句
      await this.routerUri(this.filename, path, fd, myUri, this.isDLPFile, fileSuffix);
    }
  }

  /**
   * 获取文件夹下所有文件的文件名和访问时间
   */
  async getListFileName(): Promise<void> {
    // let 语句
    let option = new ListFileOption();
    // let 语句
    let uuidList: string[] = [];
    option.filter.suffix = ['.txt', '.doc', '.docx', '.dlp'];
    fs.listFile(this.pathDir, option).then((filenames: Array<string>) => {
      Logger.info(TAG, 'listFile succeed');
      // for 语句
      for (let i = 0; i < filenames.length && this.fileInfoList.length < filenames.length && i < RECENT_MAX; i++) {
        uuidList[i] = util.generateRandomUUID(true);
        Logger.info(TAG, 'filename: ', filenames[i]);
        // 更新 fileNameList
        this.fileNameList[i] = filenames[i];
        // 更新 filePathList
        this.filePathList[i] = this.pathDir + '/' + this.fileNameList[i];
        // 更新 fileUriList
        this.fileUriList[i] = fileUri.getUriFromPath(this.filePathList[i]);
        fs.stat(this.filePathList[i]).then((stat: fs.Stat) => {
          Logger.info(TAG, 'get file info succeed, the size of file is ' + stat.mode);
          Logger.info(TAG, 'get file info succeed, the size of file is ' + stat.atime);
          // 更新 fileTimeList
          this.fileTimeList[i] = timestampToDate(stat.atime);
          Logger.info(TAG, 'get file info succeed, the size of fileTimeList: ' + this.fileTimeList[i]);
          // let 语句
          let fileSuffix = (this.fileNameList[i].split('.').pop()) as string;
          // 更新 fileInfoList
          this.fileInfoList.push(
            {
              // 字段 uuid：声明并维护该成员的状态
              uuid: uuidList[i],
              // 字段 name：声明并维护该成员的状态
              name: this.fileNameList[i],
              // 字段 path：声明并维护该成员的状态
              path: this.filePathList[i],
              // 字段 uri：声明并维护该成员的状态
              uri: this.fileUriList[i],
              // 字段 time：声明并维护该成员的状态
              time: this.fileTimeList[i],
              // 字段 icon：声明并维护该成员的状态
              icon: fileSuffix == 'txt' ? $r('app.media.ic_normal_white_grid_txt') : $r('app.media.ic_normal_dark_grid_dlp')
            });
        }).catch((err: BusinessError) => {
          Logger.info(TAG, 'get file info failed with error message: ' + err.message + ', error code: ' + err.code);
        });
      }
      AppStorage.setOrCreate('fileNameList', this.fileNameList);
      AppStorage.setOrCreate('filePathList', this.filePathList);
      AppStorage.setOrCreate('fileUriList', this.fileUriList);
      AppStorage.setOrCreate('fileTimeList', this.fileTimeList);
    }).catch((err: BusinessError) => {
      Logger.info(TAG, 'list file failed with error message: ' + err.message + ', error code: ' + err.code);
    });
  }

  /**
   * 获取文件夹下所有文件的文件名和访问时间
   */
  async getRecentFileName(): Promise<void> {
    // let 语句
    let option = new ListFileOption();
    // let 语句
    let uuidList: string[] = [];
    option.filter.suffix = ['.txt', '.doc', '.docx', '.dlp'];
    // try 语句
    try {
      // let 语句
      let info: Array<dlpPermission.AccessedDLPFileInfo> = await dlpPermission.getDLPFileAccessRecords();
      Logger.info(TAG, 'getRecentFile：' + JSON.stringify(info));
      // if 语句
      if (info.length === 0) {
        return;
      }
      // for 语句
      for (let i = 0; i < info.length; i++) {
        uuidList[i] = util.generateRandomUUID(true);
        Logger.info(TAG, 'filename: ', info[i].uri);
        // let 语句
        let file = fs.openSync(info[i].uri);
        // 更新 fileNameList
        this.fileNameList[i] = file.name;
        // 更新 filePathList
        this.filePathList[i] = file.path;
        // 更新 fileUriList
        this.fileUriList[i] = info[i].uri;
        fs.stat(this.filePathList[i]).then((stat: fs.Stat) => {
          Logger.info(TAG, 'get file info succeed, the size of file is ' + stat.mode);
          Logger.info(TAG, 'get file info succeed, the size of file is ' + stat.atime);
          // 更新 fileTimeList
          this.fileTimeList[i] = timestampToDate(stat.atime);
          Logger.info(TAG, 'get file info succeed, the size of fileTimeList: ' + this.fileTimeList[i]);
          // 更新 fileInfoList
          this.fileInfoList.push(
            {
              // 字段 uuid：声明并维护该成员的状态
              uuid: uuidList[i],
              // 字段 name：声明并维护该成员的状态
              name: this.fileNameList[i],
              // 字段 path：声明并维护该成员的状态
              path: this.filePathList[i],
              // 字段 uri：声明并维护该成员的状态
              uri: this.fileUriList[i],
              // 字段 time：声明并维护该成员的状态
              time: this.fileTimeList[i],
              // 字段 icon：声明并维护该成员的状态
              icon: $r('app.media.ic_normal_dark_grid_dlp')
            });
        }).catch((err: BusinessError) => {
          Logger.info(TAG, "get file info failed with error message: " + err.message + ", error code: " + err.code);
        });

        AppStorage.setOrCreate('fileNameList', this.fileNameList);
        AppStorage.setOrCreate('filePathList', this.filePathList);
        AppStorage.setOrCreate('fileUriList', this.fileUriList);
        AppStorage.setOrCreate('fileTimeList', this.fileTimeList);
      }
    } catch (err) {
      Logger.info(TAG, "list file failed with error message: ", err);
    }
  }

  /**
   * 获取dlp文件的uri和访问时间
   */
  async getDLPFile(): Promise<void> {
    // try 语句
    try {
      // let 语句
      let info: Array<dlpPermission.AccessedDLPFileInfo> = await dlpPermission.getDLPFileAccessRecords(); // 获取DLP访问列表
      promptAction.showToast({ message: "getDLPFile：" + decodeURIComponent(JSON.stringify(info)), duration: 2000 });
      Logger.info(TAG, 'getDLPFile:', JSON.stringify(info));
    } catch (err) {
      Logger.error(TAG, 'getDLPFileAccessRecords error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 设置沙箱保留
   */
  async setSandboxFile(docUris: Array<string>): Promise<void> {
    // try 语句
    try {
      dlpPermission.setRetentionState(docUris); // 设置沙箱保留
    } catch (err) {
      Logger.error(TAG, 'setRetentionState error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 取消沙箱保留
   */
  async cancelSandboxFile(docUris: Array<string>): Promise<void> {
    // try 语句
    try {
      dlpPermission.cancelRetentionState(docUris); // 取消沙箱保留
    } catch (err) {
      Logger.error(TAG, 'cancelRetentionState error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 获取沙箱保留信息
   */
  async getSandboxList(): Promise<void> {
    // try 语句
    try {
      // let 语句
      let res: Array<dlpPermission.RetentionSandboxInfo> = await dlpPermission.getRetentionSandboxList(); // 获取沙箱保留列表
      Logger.info(TAG, 'getRetentionSandboxList:' + JSON.stringify(res));
      promptAction.showToast({
        message: 'getRetentionSandboxList:' + decodeURIComponent(JSON.stringify(res)),
        duration: 2000
      });
    } catch (err) {
      Logger.error(TAG, 'getRetentionSandboxList error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 打开dlp文件
   */
  async OpenDlpFile(dlpUri: string, dlpName: string, fd: number) {
    let context = getContext(this) as common.UIAbilityContext;
    let want: Want = {
      'action': 'ohos.want.action.viewData',
      'bundleName': 'com.sample.dlpmanager',
      'abilityName': 'FuncAbility',
      'flags': wantConstant.Flags.FLAG_AUTH_READ_URI_PERMISSION | wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
      'uri': dlpUri,
      'parameters': {
        'fileName': {
          'name': dlpName,
        },
        'keyFd': {
          'type': 'FD',
          'value': fd,
        }
      }
    };
    try {
      Logger.info(TAG, 'openDLPFile:' + JSON.stringify(want));
      context.startAbility(want, (error: BusinessError) => {
        Logger.error(TAG, 'want error.code =' + error.code + ',error.message =' + error.message);
      });
    } catch (err) {
      Logger.error('openDLPFile startAbility failed' + (err as BusinessError).code + (err as BusinessError).message);
      return;
    }
  }

  /**
   * 监听DLP文件打开
   */
  async onOpenDlpFile() {
    try {
      dlpPermission.on('openDLPFile', (info: dlpPermission.AccessedDLPFileInfo) => {
        Logger.info(TAG, 'openDlpFile event:' + info.uri + info.lastOpenTime);
        promptAction.showToast({
          message: 'openDlpFile event:' + decodeURIComponent(info.uri) + info.lastOpenTime,
          duration: 2000
        });
      });
    } catch (err) {
      Logger.error(TAG, 'onOpenDLPFile error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 是否为dlp文件
   */
  async isDlpFileFunc(fd: number): Promise<boolean> {
    try {
      this.isDLPFile = await dlpPermission.isDLPFile(fd); // 是否加密DLP文件
      Logger.info(TAG, 'isDlpFile:' + this.isDLPFile);
      promptAction.showToast({ message: 'isDlpFile:' + this.isDLPFile, duration: 2000 });
      return this.isDLPFile;
    } catch (err) {
      Logger.error(TAG, 'isDLPFile error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
    return this.isDLPFile;
  }

  // 获取帐号信息
  /**
   * getOsAccountInfo：执行 getOsAccountInfo 相关逻辑。
   */
  async getOsAccountInfo() {
    let accountMgr: account_osAccount.AccountManager;
    try {
      accountMgr = account_osAccount.getAccountManager();
      let user = await accountMgr.getCurrentOsAccount();
      Logger.info(TAG, "accountLogin user:" + JSON.stringify(user));
    } catch (err) {
      Logger.error(TAG, 'getCurrentOsAccount failed:' + err.code + err.message);
    }
  }

  // 帐号登录
  /**
   * accountLogin：执行 accountLogin 相关逻辑。
   */
  async accountLogin(accountName: string) {
    let info: dlpInfo = {
      name: "aa",
      id: "1234",
      event: "Ohos.account.event.LOGIN",
      nickname: "nickname",
      avatar: "avatar",
    };
    if (accountName) {
      info.name = accountName;
      Logger.info(TAG, "info.name:" + accountName);
    } else {
      Logger.info(TAG, "info.name:aa");
    }
    info.event = "Ohos.account.event.LOGIN";
    try {
      await accountAbility.setOsAccountDistributedInfo(info);
      Logger.info(TAG, "login success;info:" + JSON.stringify(info))
      promptAction.showToast({
        message: "login success;info:" + decodeURIComponent(JSON.stringify(info)),
        duration: 2000
      })
    } catch (err) {
      Logger.error(TAG, "setOsAccountDistributedInfo LOGIN failed：" + err.code + err.message);
      return
    }
    let user = await accountAbility.getOsAccountDistributedInfo();
    Logger.info(TAG, "accountLogin user:" + JSON.stringify(user));
  }

  //跳转页面
  /**
   * routerUri：执行 routerUri 相关逻辑。
   */
  async routerUri(name: string, path: string, fd: number, uri: string, isDlpFile: boolean, fileSuffix: string) {
    router.pushUrl({
      url: 'media/filePage',
      params: {
        fileName: name,
        myPath: path,
        fd: fd,
        myUri: uri,
        isDlpFile: isDlpFile,
        fileSuffix: fileSuffix,
      }
    }, router.RouterMode.Standard).then(() => {
      Logger.info(TAG, 'Succeeded in jumping to the second page');
    }).catch((err: BusinessError) => {
      Logger.error(TAG, `Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`);
    })
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear(): void {
    this.fileNameList = [];
    this.fileUriList = [];
    this.filePathList = [];
    this.fileTimeList = [];
    dlpPermission.off('openDLPFile', (info: dlpPermission.AccessedDLPFileInfo) => {
      Logger.info(TAG, 'openDlpFile event' + info.uri + info.lastOpenTime);
    });
  }

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow(): void {
    this.getListFileName();
    this.getRecentFileName();
    this.onOpenDlpFile();
    Logger.info(TAG, 'sandbox path is:' + this.pathDir);
    this.accountLogin(this.accountName);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    // Column：垂直布局容器
    // 关键属性：高度、宽度
    Column() {
      // Stack：层叠布局容器
      // 关键属性：宽度、高度
      // Stack：层叠布局容器
      // 关键属性：宽度、高度
      Stack({ alignContent: Alignment.TopEnd }) {
        // Column：垂直布局容器
        // 关键属性：层级、宽度、高度
        // Column：垂直布局容器
        // 关键属性：层级、宽度、高度
        Column() {
          // Text：文本
          // 关键属性：字体、字号、字体颜色、align、文本对齐、内边距
          // Text：文本
          // 关键属性：字体、字号、字体颜色、align、文本对齐、内边距
          Text($r('app.string.file_manager'))
            .fontFamily('HarmonyHeiTi-Bold')
            .fontSize('30vp')
            .fontColor($r('app.color.font_color_182431'))
            .align(Alignment.TopStart)
            .textAlign(TextAlign.Start)
            .padding({ left: '24vp', right: '24vp', top: '8vp', bottom: '2vp' })
            .fontWeight(700)
            .height('50vp')
            .width('100%')
            .id('noteBook')
          // Text：文本
          // 关键属性：透明度、字体、字号、字体颜色、文本对齐、内边距
          // Text：文本
          // 关键属性：透明度、字体、字号、字体颜色、文本对齐、内边距
          Text($r('app.string.file'))
            .opacity(0.6)
            .fontFamily('HarmonyHeiTi')
            .fontSize('14vp')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Start)
            .padding({ left: '24vp', right: '24vp', bottom: '12vp' })
            .fontWeight(400)
            .height('30vp')
            .width('100%')
            .id('latestFile')
        }.id('index_column_3').zIndex(1).width('100%').height('82vp')

        // Image：图片
        // 关键属性：高度、宽度、外边距、层级、bindMenu
        // Image：图片
        // 关键属性：高度、宽度、外边距、层级、bindMenu
        Image($r('app.media.ic_public_more'))
          .height('24vp')
          .width('24vp')
          .margin({ left: '312vp', right: '24vp', top: '34vp', bottom: '24vp' })
          .zIndex(2)
          .bindMenu(this.homePageMenu, { placement: Placement.BottomRight, offset: { y: '16vp' } })
          .id('moreIcon')
      }.id('index_stack_2').width('100%').height('84vp')

      // Stack：层叠布局容器
      // 关键属性：布局权重、宽度
      // Stack：层叠布局容器
      // 关键属性：布局权重、宽度
      Stack({ alignContent: Alignment.TopEnd }) {
        // List：列表容器
        // 关键属性：层级、宽度、高度、列表方向、边缘效果、滚动条
        // List：列表容器
        // 关键属性：层级、宽度、高度、列表方向、边缘效果、滚动条
        List({ scroller: this.scroller }) {
          ForEach(this.fileInfoList, (item: FileInfo, index: number) => {
            // ListItem：列表项
            // 关键属性：宽度、高度
            // ListItem：列表项
            // 关键属性：宽度、高度
            ListItem() {
              // Column：垂直布局容器
              // 关键属性：宽度、高度
              // Column：垂直布局容器
              // 关键属性：宽度、高度
              Column() {
                // Row：水平布局容器
                // 关键属性：宽度
                // Row：水平布局容器
                // 关键属性：宽度
                Row() {
                  // Image：图片
                  // 关键属性：宽度、高度、外边距
                  // Image：图片
                  // 关键属性：宽度、高度、外边距
                  Image(item.icon).id('index_image_8')
                    .width('30vp')
                    .height('34vp')
                    .margin({ left: '20vp', right: '18vp', top: '12vp', bottom: '8vp' })
                  // Column：垂直布局容器
                  // 关键属性：点击事件回调
                  // 交互：可点击交互
                  // Column：垂直布局容器
                  // 关键属性：点击事件回调
                  // 交互：可点击交互
                  Column() {
                    // Text：文本
                    // 关键属性：字号、字体、字体颜色、文本对齐、字重、宽度
                    // Text：文本
                    // 关键属性：字号、字体、字体颜色、文本对齐、字重、宽度
                    Text(item.name).id('index_text_9')
                      .fontSize('14vp')
                      .fontFamily('HarmonyHeiTi-Medium')
                      .fontColor($r('app.color.font_color_182431'))
                      .textAlign(TextAlign.Start)
                      .fontWeight(500)
                      .width('135vp')
                      .height('19vp')
                      .margin({ right: '157vp', top: '7vp', bottom: '4vp' })
                    // Text：文本
                    // 关键属性：字号、字体、字体颜色、文本对齐、字重、宽度
                    // Text：文本
                    // 关键属性：字号、字体、字体颜色、文本对齐、字重、宽度
                    Text(item.time).id('index_text_10')
                      .fontSize('12vp')
                      .fontFamily('HarmonyHeiTi-Medium')
                      .fontColor($r('app.color.font_color_66182431'))
                      .textAlign(TextAlign.Start)
                      .fontWeight(500)
                      .width('149vp')
                      .height('16vp')
                      .margin({ right: '143vp', bottom: '8vp' })
                  }
                  .id('file' + index)
                  .onClick(async () => {
                    let path = this.pathDir + '/' + item.name;
                    let fd: number = fs.openSync(path).fd;
                    Logger.info(TAG, "path:" + path + ";fd:" + fd);
                    let uri = fileUri.getUriFromPath(path);
                    Logger.info(TAG, "uri:" + uri);
                    let fileSuffix = "." + (item.name.split(".").pop()) as string;
                    await this.isDlpFileFunc(fd);
                    await sleep(2);
                    if (this.isDLPFile) {
                      await this.OpenDlpFile(uri, item.name, fd);
                    } else {
                      await this.routerUri(item.name, this.filePathList[index], fd, uri, this.isDLPFile, fileSuffix);
                    }
                  })
                }.id('index_row_7').width('100%')

                // Divider：分割线
                // 关键属性：宽度、高度、透明度、背景色、外边距
                // Divider：分割线
                // 关键属性：宽度、高度、透明度、背景色、外边距
                Divider().id('index_divider_11')
                  .width('448vp')
                  .height('0.5vp')
                  .opacity(0.05)
                  .backgroundColor($r('app.color.divider_color_182431'))
                  .margin({ left: '16vp', right: '16vp' })
              }.id('index_column_6').width('100%').height('54vp')
            }.id('index_list_item_5').width('100%').height('54vp')
          }, (item: FileInfo) => item.uuid)
        }
        .zIndex(1)
        .width('100%')
        .height('100%')
        .listDirection(Axis.Vertical) // 排列方向
        .id('indexList')
        .edgeEffect(EdgeEffect.Spring) // 滑动到边缘无效果
        .scrollBar(BarState.Auto)

        // Image：图片
        // 关键属性：高度、宽度、外边距、层级、点击事件回调、callFilePickerSelectFile
        // 交互：可点击交互
        // Image：图片
        // 关键属性：高度、宽度、外边距、层级、点击事件回调、callFilePickerSelectFile
        // 交互：可点击交互
        Image($r('app.media.add'))
          .height('48vp')
          .width('48vp')
          .margin({ left: '288vp', right: '24vp', top: '546vp', bottom: '80vp' })
          .zIndex(2)
          .id('add')
          .onClick(() => {
            this.callFilePickerSelectFile();
          })
      }.id('index_stack_4')
      .layoutWeight(1)
      .width('100%')
    }.id('index_column_1')
    .height('100%')
    .width('100%')
  }

  /**
   * homePageMenu：执行 homePageMenu 相关逻辑。
   */
  @Builder
  homePageMenu() {
    // Menu：菜单
    // 关键属性：宽度、高度、背景色、圆角
    // Menu：菜单
    // 关键属性：宽度、高度、背景色、圆角
    Menu() {
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、getDLPFile
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、getDLPFile
      // 交互：可点击交互
      MenuItem(this.homePageTextMenu1).id('index_menu_item_13')
        .width('128vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.getDLPFile();
        })

      // MenuItem：菜单项
      MenuItem(this.homePageDivider).id('index_menu_item_14')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、点击事件回调、getSandboxList
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、点击事件回调、getSandboxList
      // 交互：可点击交互
      MenuItem(this.homePageTextMenu2).id('index_menu_item_15')
        .width('160vp')
        .height('48vp')
        .onClick(() => {
          this.getSandboxList();
        })

      MenuItem(this.homePageDivider).id('index_menu_item_16')

      MenuItem(this.homePageTextMenu3).id('index_menu_item_17')
        .width('160vp')
        .height('48vp')
        .onClick(() => {
          router.pushUrl({ url: 'pages/SearchPage' }).catch((err: BusinessError) => {
            Logger.error(TAG, 'jump to search page failed: ' + err.message);
          });
        })

      MenuItem(this.homePageDivider).id('index_menu_item_18')

      MenuItem(this.homePageTextMenu4).id('index_menu_item_19')
        .width('160vp')
        .height('48vp')
        .onClick(() => {
          router.pushUrl({ url: 'pages/RecentsPage' }).catch((err: BusinessError) => {
            Logger.error(TAG, 'jump to recents page failed: ' + err.message);
          });
        })

      MenuItem(this.homePageTextMenu5).id('index_menu_item_20')
        .width('160vp')
        .height('48vp')
        .onClick(() => {
          router.pushUrl({ url: 'pages/TemplatePage' }).catch((err: BusinessError) => {
            Logger.error(TAG, 'jump to template page failed: ' + err.message);
          });
        })

      MenuItem(this.homePageTextMenu6).id('index_menu_item_21')
        .width('160vp')
        .height('48vp')
        .onClick(() => {
          router.pushUrl({ url: 'pages/SettingsPage' }).catch((err: BusinessError) => {
            Logger.error(TAG, 'jump to settings page failed: ' + err.message);
          });
        })

    }.id('index_menu_12')
    .width('160vp')
    .height('296vp')
    .backgroundColor('#FFFFFF')
    .borderRadius('16.00vp')
  }

  /**
   * homePageTextMenu1：执行 homePageTextMenu1 相关逻辑。
   */
  @Builder
  homePageTextMenu1() {
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    Text($r('app.string.obtain_visit_record'))
      .width('99vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '29vp' })
      .id('obtain_visit_record')
  }

  /**
   * homePageTextMenu2：执行 homePageTextMenu2 相关逻辑。
   */
  @Builder
  homePageTextMenu2() {
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    Text($r('app.string.obtain_sandbox_retention_information'))
      .width('128vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', left: '16vp', right: '16vp' })
      .id('obtain_sandbox_retention_information')
  }

  /**
   * homePageTextMenu3：搜索文件入口。
   */
  @Builder
  homePageTextMenu3() {
    Text($r('app.string.search_files'))
      .width('128vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', left: '16vp', right: '16vp' })
      .id('search_files_entry')
  }

  /**
   * homePageTextMenu4：最近与收藏入口。
   */
  @Builder
  homePageTextMenu4() {
    Text($r('app.string.recent_files'))
      .width('128vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', left: '16vp', right: '16vp' })
      .id('recent_files_entry')
  }

  /**
   * homePageTextMenu5：权限模板入口。
   */
  @Builder
  homePageTextMenu5() {
    Text($r('app.string.policy_templates'))
      .width('128vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', left: '16vp', right: '16vp' })
      .id('policy_templates_entry')
  }

  /**
   * homePageTextMenu6：设置入口。
   */
  @Builder
  homePageTextMenu6() {
    Text($r('app.string.app_settings'))
      .width('128vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', left: '16vp', right: '16vp' })
      .id('settings_entry')
  }

  /**
   * homePageDivider：执行 homePageDivider 相关逻辑。
   */
  @Builder
  homePageDivider() {
    // Divider：分割线
    // 关键属性：宽度、高度、透明度、背景色、外边距
    // Divider：分割线
    // 关键属性：宽度、高度、透明度、背景色、外边距
    Divider().id('index_divider_16')
      .width('128vp')
      .height('0.5vp')
      .opacity(0.05)
      .backgroundColor($r('app.color.divider_color_182431'))
      .margin({ left: '16vp', right: '16vp' })
  }
}

/**
 * timestampToDate：函数定义，承载本文件对应的逻辑与数据。
 */
export function timestampToDate(timestamp: number): string {
  const date = new Date(timestamp * 1000);
  let year = date.getFullYear();
  let month: string | number = date.getMonth() + 1;
  month = month >= 10 ? month : ('0' + month);
  let day: string | number = date.getDate();
  day = day >= 10 ? day : ('0' + day);
  let hours: string | number = date.getHours();
  hours = hours >= 10 ? hours : ('0' + hours);
  let minutes: string | number = date.getMinutes();
  minutes = minutes >= 10 ? minutes : ('0' + minutes);
  let seconds: string | number = date.getSeconds();
  seconds = seconds >= 10 ? seconds : ('0' + seconds);
  return `${year}/${month}/${day} ${hours}:${minutes}:${seconds}`;
}

/**
 * sleep：函数定义，承载本文件对应的逻辑与数据。
 */
export function sleep(time: number) {
  /**
   * setTimeout：执行 setTimeout 相关逻辑。
   */
  setTimeout(() => {
    Logger.info('delay ' + time);
  }, time * 1000)
}
