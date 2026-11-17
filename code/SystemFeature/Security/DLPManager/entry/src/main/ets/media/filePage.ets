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
 * @file entry/src/main/ets/media/filePage.ets
 * 文件职责：filePage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：myParams、FilePage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * @file entry/src/main/ets/media/filePage.ets
 * 文件职责：filePage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：myParams、FilePage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import MediaFileUri from './MediaFileUri';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import Logger from '../utils/Logger';
import dlpPermission from '@ohos.dlpPermission';
import picker from '@ohos.file.picker';
import wantConstant from '@ohos.app.ability.wantConstant';
import uriPermissionManager from '@ohos.application.uriPermissionManager';

// const 语句
const TAG = '[dlpmanager_filePage]';
// const 语句
const OPACITY_VALUE = 0.6; // 透明度

/**
 * myParams：接口定义，承载本文件对应的逻辑与数据。
 */
interface myParams extends Object {
  // 字段 fileName：声明并维护该成员的状态
  fileName: string,
  // 字段 myPath：声明并维护该成员的状态
  myPath: string,
  // 字段 fd：声明并维护该成员的状态
  fd: number,
  // 字段 myUri：声明并维护该成员的状态
  myUri: string,
  // 字段 isDlpFile：声明并维护该成员的状态
  isDlpFile: boolean,
  // 字段 fileSuffix：声明并维护该成员的状态
  fileSuffix: string,
}

// let 语句
let storage = LocalStorage.getShared();

/**
 * FilePage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry(storage)
@Component
struct FilePage {
  // @State inSandbox：组件内部状态
  @State inSandbox: boolean = false;

  // @State opacityValue：组件内部状态
  @State opacityValue: number = OPACITY_VALUE;

  // @State myFileName：组件内部状态
  @State myFileName: string = '';

  // @State myUri：组件内部状态
  @State myUri: string = '';

  // @State fd：组件内部状态
  @State fd: number = 0;

  // @State myPath：组件内部状态
  @State myPath: string = '';

  // @State isDLPFile：组件内部状态
  @State isDLPFile: boolean = false;

  // @State fileSuffix：组件内部状态
  @State fileSuffix: string = '';

  // @State fileSuffixIncludes：组件内部状态
  @State fileSuffixIncludes: boolean = false;

  // @StorageLink editable：与 AppStorage 双向绑定
  @StorageLink('editable') editable: Boolean = false;

  // @StorageLink myFileContent：与 AppStorage 双向绑定
  @StorageLink('myFileContent') myFileContent: string = '';

  // 字段 controller：声明并维护该成员的状态
  controller: TextAreaController = new TextAreaController();

  // 字段 newFileContent：声明并维护该成员的状态
  newFileContent: string = '';

  // @State uriSave：组件内部状态
  @State uriSave: string = '';

  // 字段 mediaFileUri：声明并维护该成员的状态
  mediaFileUri: MediaFileUri = new MediaFileUri();

  // 字段 scroller：声明并维护该成员的状态
  scroller: Scroller = new Scroller();

  /**
   * getFileInfo：执行 getFileInfo 相关逻辑。
   */
  getFileInfo(): void {
    // 更新 myFileName
    this.myFileName = decodeURIComponent((router.getParams() as myParams).fileName);
    // 更新 myPath
    this.myPath = (router.getParams() as myParams).myPath;
    // 更新 myUri
    this.myUri = (router.getParams() as myParams).myUri;
    // 更新 fd
    this.fd = (router.getParams() as myParams).fd;
    // 更新 isDLPFile
    this.isDLPFile = (router.getParams() as myParams).isDlpFile;
    // 更新 fileSuffix
    this.fileSuffix = (router.getParams() as myParams).fileSuffix;
    // 更新 myFileContent
    this.myFileContent = this.mediaFileUri.readFileContent(this.myUri);
    // 更新 isDlpFileFunc
    this.isDlpFileFunc(this.fd, this.fileSuffix);
    Logger.info(TAG, 'The count of getFileInfo is myUri is: ' + JSON.stringify(this.myUri));
    Logger.info(TAG, 'The count of getFileInfo is myFileName is: ' + JSON.stringify(this.myFileName));
    Logger.info(TAG, 'The count of getFileInfo is myFileContent ' + this.myFileContent);
    AppStorage.setOrCreate('myFileContent', this.myFileContent);
  }

  /**
   * 是否为沙箱应用
   */
  async isSandboxFunc(): Promise<void> {
    // try 语句
    try {
      // 更新 inSandbox
      this.inSandbox = await dlpPermission.isInSandbox();
      Logger.info(TAG, 'inSandbox:' + this.inSandbox);
      promptAction.showToast({ message: 'isSandbox:' + this.inSandbox, duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'error' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 获取dlp文件的uri和访问时间
   */
  async getDLPFile(): Promise<void> {
    // try 语句
    try {
      // let 语句
      let info: Array<dlpPermission.AccessedDLPFileInfo> = await dlpPermission.getDLPFileAccessRecords();
      promptAction.showToast({ message: 'getDLPFile:' + decodeURIComponent(JSON.stringify(info)), duration: 2000 });
      Logger.info(TAG, 'getDLPFile:', JSON.stringify(info));
    } catch (err) {
      Logger.error(TAG, 'getDLPFileAccessRecords error:' + (err as BusinessError).code + (err as BusinessError).message);
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
      Logger.info(TAG, 'res', JSON.stringify(res));
      promptAction.showToast({ message: 'getSandboxList:' + decodeURIComponent(JSON.stringify(res)), duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'getRetentionSandboxList error:' + (err as BusinessError).code + (err as BusinessError).message); // 失败报错
    }
  }

  /**
   * 获取沙箱权限
   */
  async getDlpPermission(): Promise<void> {
    dlpPermission.getDLPPermissionInfo().then((data: dlpPermission.DLPPermissionInfo) => {
      Logger.info(TAG, 'getDLPPermissionInfo, result: ' + JSON.stringify(data));
      promptAction.showToast({ message: 'permission：' + decodeURIComponent(JSON.stringify(data)), duration: 2000 });
    }).catch((err: BusinessError) => {
      Logger.info(TAG, 'getDLPPermissionInfo: ' + JSON.stringify(err));
    });
  }

  /**
   * 是否为dlp文件
   */
  async isDlpFileFunc(fd: number, fileSuffix: string): Promise<boolean> {
    // try 语句
    try {
      // 更新 isDLPFile
      this.isDLPFile = await dlpPermission.isDLPFile(fd); // 是否加密DLP文件
      Logger.info(TAG, 'isDlpFile:' + this.isDLPFile);
      // 更新 inSandbox
      this.inSandbox = await dlpPermission.isInSandbox();
      // let 语句
      let msg = 'isDlpFile:' + this.isDLPFile + ';inSandbox:' + this.inSandbox;
      promptAction.showToast({ message: decodeURIComponent(msg), duration: 2000 });
      // 更新 getDLPSupported
      this.getDLPSupported(fileSuffix);
    } catch (err) {
      Logger.error(TAG, 'isDLPFile error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
    // return 语句
    return this.isDLPFile;
  }

  /**
   * 查询当前可支持权限设置和校验的文件扩展名类型列表
   */
  async getDLPSupported(fileSuffix: string): Promise<void> {
    // try 语句
    try {
      // let 语句
      let res: Array<string> = await dlpPermission.getDLPSupportedFileTypes(); // 获取支持DLP的文件类型
      Logger.info(TAG, 'file extension support permission :' + JSON.stringify(res));
      Logger.info(TAG, 'file extension is:' + fileSuffix);
      // 更新 fileSuffixIncludes
      this.fileSuffixIncludes = res.includes(fileSuffix);
      Logger.info(TAG, 'the file extension in the list:' + this.fileSuffixIncludes);
      promptAction.showToast({
        // 字段 message：声明并维护该成员的状态
        message: 'file extension is:' + fileSuffix + ',in the list:' + this.fileSuffixIncludes,
        duration: 2000
      });
    } catch (err) {
      Logger.error(TAG, 'getDLPSupportedFileTypes error' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 另存为
   */
  async callFilePickerSaveFile(fileName: string): Promise<void> {
    try {
      let DocumentSaveOptions = new picker.DocumentSaveOptions();
      DocumentSaveOptions.newFileNames = [fileName];
      let documentPicker = new picker.DocumentViewPicker();
      documentPicker.save(DocumentSaveOptions).then((DocumentSaveResult) => {
        Logger.info(TAG, 'DocumentViewPicker.save successfully, DocumentSaveResult uri: ' + JSON.stringify(DocumentSaveResult));
        if (DocumentSaveResult !== null && DocumentSaveResult !== undefined) {
          this.uriSave = DocumentSaveResult[0];
          Logger.info(TAG, `save callFilePickerSaveFile file this.uriSave: ${this.uriSave}`);
        }
        ;
        Logger.info(TAG, 'fileAsset.displayName wrFlag myFileContent :' + this.myFileContent);
        this.writeContentForSaveAsFile(this.uriSave, true); // 用 medialibrary 重新获取uri，进行写入操作
      }).catch((err: BusinessError) => {
        Logger.error(TAG, 'DocumentViewPicker.save failed with err: ' + JSON.stringify(err));
      });
    } catch (err) {
      Logger.error(TAG, 'DocumentViewPicker failed with err: ' + err);
    }
  }

  /**
   * writeContentForSaveAsFile：执行 writeContentForSaveAsFile 相关逻辑。
   */
  async writeContentForSaveAsFile(myUri: string, wrFlag: Boolean = false): Promise<void> {
    if (wrFlag) {
      Logger.info(TAG, 'fileAsset.displayName wrFlag is true');
      Logger.info(TAG, 'fileAsset.displayName wrFlag myFileContent :' + this.myFileContent);
      this.mediaFileUri.writeFileContent(myUri, this.myFileContent);
    }
  }

  /**
   * 生成dlp文件
   */
  async onEncrypt() {
    Logger.info(TAG + 'new file and encrypt');
    let flag = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION |
    wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
    let targetBundleName = 'com.ohos.dlpmanager';
    uriPermissionManager.grantUriPermission(this.myUri, flag, targetBundleName, (result) => {
      Logger.info(TAG, `grandUriPermission result: ${JSON.stringify(result)}`);
    });
    try {
      let context = getContext() as common.UIAbilityContext; // 获取当前UIAbilityContext
      let want: Want = {
        'uri': this.myUri,
        'parameters': {
          'displayName': this.myFileName
        }
      }; // 请求参数
      Logger.info(TAG, 'onEncrypt:' + JSON.stringify(want));
      dlpPermission.startDLPManagerForResult(context, want).then((res: dlpPermission.DLPManagerResult) => {
        Logger.info(TAG, 'startDLPManagerForResult res.resultCode:' + res.resultCode);
        Logger.info(TAG, 'startDLPManagerForResult res.want:' + JSON.stringify(res.want));
      }); // 打开DLP权限管理应用
    } catch (err) {
      Logger.error(TAG, 'startDLPManagerForResult error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
  }

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow(): void {
    this.getFileInfo();
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    // Column：垂直布局容器
    // 关键属性：宽度、高度
    Column() {
      // Row：水平布局容器
      // 关键属性：高度、宽度
      // Row：水平布局容器
      // 关键属性：高度、宽度
      Row() {
        // Image：图片
        // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
        // 交互：可点击交互
        // Image：图片
        // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
        // 交互：可点击交互
        Image($r('app.media.ic_public_back'))
          .width('24vp')
          .height('24vp')
          .margin({ left: '24vp', right: '16vp', top: '16vp', bottom: '16vp' })
          .objectFit(ImageFit.Contain)
          .id('filePageBack')
          .onClick(() => {
            router.back();
          })
        // Text：文本
        // 关键属性：宽度、高度、字号、字体、字体颜色、文本对齐
        // Text：文本
        // 关键属性：宽度、高度、字号、字体、字体颜色、文本对齐
        Text(this.myFileName)
          .width('296vp')
          .height('28vp')
          .fontSize('20vp')
          .fontFamily('HarmonyHeiTi-Bold')
          .fontColor($r('app.color.font_color_182431'))
          .textAlign(TextAlign.Start)
          .lineHeight('28vp')
          .fontWeight(700)
          .margin({ top: '13vp', bottom: '15vp' })
          .id('filePageTitle')
      }.id('file_page_row_2')
      .height('56vp')
      .width('480vp')

      // Scroll：滚动容器
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距
        // Column：垂直布局容器
        // 关键属性：宽度、高度、外边距
        Column() {
          // TextArea：多行输入框
          // 关键属性：宽度、高度、字号、字体、字体颜色、文本对齐
          // TextArea：多行输入框
          // 关键属性：宽度、高度、字号、字体、字体颜色、文本对齐
          TextArea({ text: this.myFileContent, placeholder: 'Input text here...', controller: this.controller })
            .width('372vp')
            .height('100vp')
            .fontSize('16vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Start)
            .fontWeight(500)
            .margin({ top: '10vp', bottom: '32vp', right: '8vp' })
            .id('fileTextArea')
            .padding({
              top: 0,
              right: 0,
              left: 0,
              bottom: 0
            })
            .focusable(this.editable ? true : false)
            .focusOnTouch(true)
            .defaultFocus(false)
            .onFocus(() => {
              this.opacityValue = 1;
            })
            .onBlur(() => {
              this.opacityValue = OPACITY_VALUE;
            })
            .onChange((value: string) => {
              this.myFileContent = value;
            })
            .backgroundColor('#FFFFFF')

        }.id('file_page_column_4')
        .width('380vp')
        .height('64vp')
        .margin({ left: '28vp', right: '72vp', top: '4vp', bottom: '576vp' })
      }.id('file_page_scroll_3')

      // Blank：占位空白
      Blank().id('file_page_blank_5')

      // Flex：弹性布局容器
      // 关键属性：align、高度、宽度、背景色
      // Flex：弹性布局容器
      // 关键属性：align、高度、宽度、背景色
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center }) {
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        Column() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、点击事件回调
          // 交互：可点击交互
          // Image：图片
          // 关键属性：宽度、高度、外边距、点击事件回调
          // 交互：可点击交互
          Image($r('app.media.ic_public_edit'))
            .width('24vp')
            .height('24vp')
            .margin({ top: '8vp', bottom: '3vp', left: '40vp', right: '40vp' })
            .id('fileEdit')
            .onClick(() => {
              this.editable = true;
              AppStorage.setOrCreate('editable', this.editable);
              Logger.info(TAG, 'EditFile caretPosition length = ' + this.myFileContent.length);
              this.controller.caretPosition(this.myFileContent.length);
              promptAction.showToast({ message: $r('app.string.editable'), duration: 2000 });
            })

          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          Text($r('app.string.edit')).id('file_page_text_8')
            .fontSize('10vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Center)
            .lineHeight('14vp')
            .fontWeight(500)
            .width('136vp')
            .height('14vp')
            .margin({ left: '4vp', right: '4vp', bottom: '7vp' })
        }.id('file_page_column_7').width('144vp').height('56vp')

        // Column：垂直布局容器
        // 关键属性：宽度、高度
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        Column() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、点击事件回调、info
          // 交互：可点击交互
          // Image：图片
          // 关键属性：宽度、高度、外边距、点击事件回调、info
          // 交互：可点击交互
          Image($r('app.media.ic_public_save'))
            .width('24vp')
            .height('24vp')
            .margin({ top: '8vp', bottom: '3vp', left: '40vp', right: '40vp' })
            .id('fileSave')
            .onClick(() => {
              Logger.info(TAG, 'save onClick myFileContent is: ' + this.myFileContent);
              Logger.info(TAG, 'save onClick this.myUri: ' + this.myUri);
              this.mediaFileUri.writeFileContent(this.myUri, this.myFileContent);
              this.editable = false;
              AppStorage.setOrCreate('editable', this.editable);
              promptAction.showToast({ message: $r('app.string.saved'), duration: 2000 });
            })
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          Text($r('app.string.save')).id('file_page_text_10')
            .fontSize('10vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Center)
            .lineHeight('14vp')
            .fontWeight(500)
            .width('136vp')
            .height('14vp')
            .margin({ left: '4vp', right: '4vp', bottom: '7vp' })
        }.id('file_page_column_9').width('144vp').height('56vp')

        // Column：垂直布局容器
        // 关键属性：宽度、高度
        // Column：垂直布局容器
        // 关键属性：宽度、高度
        Column() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、bindMenu
          // Image：图片
          // 关键属性：宽度、高度、外边距、bindMenu
          Image($r('app.media.ic_public_more'))
            .width('24vp')
            .height('24vp')
            .margin({ top: '8vp', bottom: '3vp', left: '40vp', right: '40vp' })
            .id('fileMore')
            .bindMenu(this.filePageMenu, { placement: Placement.TopRight, offset: { x: '52vp', y: '12vp' } })
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          Text($r('app.string.more')).id('file_page_text_12')
            .fontSize('10vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Center)
            .lineHeight('14vp')
            .fontWeight(500)
            .width('136vp')
            .height('14vp')
            .margin({ left: '4vp', right: '4vp', bottom: '7vp' })
        }.id('file_page_column_11').width('144vp').height('56vp')
      }.id('file_page_flex_6')
      .align(Alignment.Bottom)
      .height('56vp')
      .width('100%')
      .backgroundColor($r('app.color.bg_color_F1F3F5'))
    }.id('file_page_column_1').width('100%').height('100%')
  }

  /**
   * filePageMenu：执行 filePageMenu 相关逻辑。
   */
  @Builder
  filePageMenu() {
    // Menu：菜单
    // 关键属性：宽度、高度、背景色、圆角
    // Menu：菜单
    // 关键属性：宽度、高度、背景色、圆角
    Menu() {
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、callFilePickerSaveFile
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、callFilePickerSaveFile
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu1).id('file_page_menu_item_14')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.callFilePickerSaveFile(this.myFileName);
        })

      // MenuItem：菜单项
      MenuItem(this.filePageDivider).id('file_page_menu_item_15')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、onEncrypt
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、onEncrypt
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu2).id('file_page_menu_item_16')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.onEncrypt();
        })
        .enabled(this.fileSuffixIncludes ? true : false)

      // MenuItem：菜单项
      MenuItem(this.filePageDivider).id('file_page_menu_item_17')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、getDLPFile
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、getDLPFile
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu3).id('file_page_menu_item_18')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.getDLPFile();
        })
        .enabled(true)

      // MenuItem：菜单项
      MenuItem(this.filePageDivider).id('file_page_menu_item_19')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、getSandboxList
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、getSandboxList
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu4).id('file_page_menu_item_20')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.getSandboxList();
        })
        .enabled(true)
    }.id('file_page_menu_13')
    .width('176vp').height('202vp')
    .backgroundColor('#FFFFFF')
    .borderRadius('16vp')
  }

  /**
   * filePageTextMenu1：执行 filePageTextMenu1 相关逻辑。
   */
  @Builder
  filePageTextMenu1() {
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    Text($r('app.string.save_as'))
      .width('91vp')
      .height('22vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '13vp', right: '33vp' })
      .id('file_save_as')
  }

  /**
   * filePageTextMenu2：执行 filePageTextMenu2 相关逻辑。
   */
  @Builder
  filePageTextMenu2() {
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    Text($r('app.string.set_permissions'))
      .width('122vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor(this.fileSuffixIncludes ? $r('app.color.font_color_182431') : $r('app.color.font_color_66182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '2vp' })
      .id('file_set_permissions')
  }

  /**
   * filePageTextMenu3：执行 filePageTextMenu3 相关逻辑。
   */
  @Builder
  filePageTextMenu3() {
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    Text($r('app.string.query_AccessList'))
      .width('122vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '2vp' })
      .id('file_query_AccessList')
  }

  /**
   * filePageTextMenu4：执行 filePageTextMenu4 相关逻辑。
   */
  @Builder
  filePageTextMenu4() {
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    // Text：文本
    // 关键属性：宽度、高度、字号、字体、字重、字体颜色
    Text($r('app.string.query_retentionList'))
      .width('122vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '2vp' })
      .id('file_query_retentionList')
  }

  /**
   * filePageDivider：执行 filePageDivider 相关逻辑。
   */
  @Builder
  filePageDivider() {
    // Divider：分割线
    // 关键属性：宽度、高度、透明度、背景色、外边距
    // Divider：分割线
    // 关键属性：宽度、高度、透明度、背景色、外边距
    Divider().id('file_page_divider_21')
      .width('124vp')
      .height('0.5vp')
      .opacity(0.05)
      .backgroundColor($r('app.color.divider_color_182431'))
      .margin({ left: '16vp', right: '16vp' })
  }
}