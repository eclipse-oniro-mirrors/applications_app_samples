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
 * @file entry/src/main/ets/media/dlpPage.ets
 * 文件职责：dlpPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DLPUriObj、DLPNameObj、DLPLinkNameObj、DlpPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

/**
 * @file entry/src/main/ets/media/dlpPage.ets
 * 文件职责：dlpPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DLPUriObj、DLPNameObj、DLPLinkNameObj、DlpPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import MediaFileUri from './MediaFileUri';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import Logger from '../utils/Logger';
import dlpPermission from '@ohos.dlpPermission';
import picker from '@ohos.file.picker';
import wantConstant from '@ohos.app.ability.wantConstant';
import uriPermissionManager from '@ohos.application.uriPermissionManager';

// const 语句
const TAG = '[dlpmanager_dlpPage]';
// const 语句
const OPACITY_VALUE = 0.6; // 透明度

// let 语句
let storage = LocalStorage.getShared();

/**
 * DLPUriObj：接口定义，承载本文件对应的逻辑与数据。
 */
interface DLPUriObj {
  // 字段 name：声明并维护该成员的状态
  name: string
};

/**
 * DLPNameObj：接口定义，承载本文件对应的逻辑与数据。
 */
interface DLPNameObj {
  // 字段 dateModified：声明并维护该成员的状态
  dateModified: string,
  // 字段 displayName：声明并维护该成员的状态
  displayName: string,
  // 字段 relativePath：声明并维护该成员的状态
  relativePath: string,
};

/**
 * DLPLinkNameObj：接口定义，承载本文件对应的逻辑与数据。
 */
interface DLPLinkNameObj {
  // 字段 name：声明并维护该成员的状态
  name: string
}

/**
 * DlpPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry(storage)
@Component
struct DlpPage {
  // @State inSandbox：组件内部状态
  @State inSandbox: boolean = false;

  // @State opacityValue：组件内部状态
  @State opacityValue: number = OPACITY_VALUE;

  // @State dlpName：组件内部状态
  @State dlpName: string = '';

  // @State dlpLinkName：组件内部状态
  @State dlpLinkName: string = '';

  // @State dlpUri：组件内部状态
  @State dlpUri: string = '';

  // @State dlpLinkUri：组件内部状态
  @State dlpLinkUri: string = '';

  // @State fd：组件内部状态
  @State fd: number = 0;

  // @State isDLPFile：组件内部状态
  @State isDLPFile: boolean = false;

  // @State dlpSuffix：组件内部状态
  @State dlpSuffix: string = '';

  // @State dlpSuffixIncludes：组件内部状态
  @State dlpSuffixIncludes: boolean = false;

  // @StorageLink editable：与 AppStorage 双向绑定
  @StorageLink('editable') editable: Boolean = false;

  // @State dlpContent：组件内部状态
  @State dlpContent: string = '';

  // 字段 controller：声明并维护该成员的状态
  controller: TextAreaController = new TextAreaController();

  // @State uriSave：组件内部状态
  @State uriSave: string = '';

  // 字段 mediaFileUri：声明并维护该成员的状态
  mediaFileUri: MediaFileUri = new MediaFileUri();

  // 字段 scroller：声明并维护该成员的状态
  scroller: Scroller = new Scroller();

  /**
   * 是否为沙箱应用
   */
  async isSandboxFunc(): Promise<void> {
    // try 语句
    try {
      // 更新 inSandbox
      this.inSandbox = await dlpPermission.isInSandbox(); // 是否在沙箱内
      Logger.info(TAG, 'inSandbox:' + this.inSandbox);
      promptAction.showToast({ message: 'inSandbox:' + this.inSandbox, duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'error' + (err as BusinessError).code + (err as BusinessError).message);
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
  async isDlpFileFunc(fd: number): Promise<boolean> {
    // try 语句
    try {
      // 更新 isDLPFile
      this.isDLPFile = await dlpPermission.isDLPFile(fd); // 是否加密DLP文件
      Logger.info(TAG, 'isDlpFile:' + this.isDLPFile);
      // 更新 inSandbox
      this.inSandbox = await dlpPermission.isInSandbox();
      // let 语句
      let msg = 'isDlpFile:' + true + ';inSandbox:' + this.inSandbox;
      dlpPermission.getDLPPermissionInfo().then((data: dlpPermission.DLPPermissionInfo) => {
        Logger.info(TAG, 'getDLPPermissionInfo, result: ' + JSON.stringify(data));
        promptAction.showToast({
          // 字段 message：声明并维护该成员的状态
          message: msg + ' permission：' + decodeURIComponent(JSON.stringify(data)),
          // 字段 duration：声明并维护该成员的状态
          duration: 2000
        });
      }).catch((err: BusinessError) => {
        Logger.info(TAG, 'getDLPPermissionInfo: ' + JSON.stringify(err));
      });
    } catch (err) {
      Logger.error(TAG, 'isDLPFile error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
    // return 语句
    return this.isDLPFile;
  }

  /**
   * 另存为
   */
  async callFilePickerSaveFile(fileName: string): Promise<void> {
    // try 语句
    try {
      // let 语句
      let DocumentSaveOptions = new picker.DocumentSaveOptions();
      DocumentSaveOptions.newFileNames = [fileName];
      // let 语句
      let documentPicker = new picker.DocumentViewPicker();
      documentPicker.save(DocumentSaveOptions).then(async (DocumentSaveResult) => {
        Logger.info(TAG, 'DocumentViewPicker.save successfully, DocumentSaveResult uri: ' + JSON.stringify(DocumentSaveResult));
        // if 语句
        if (DocumentSaveResult !== null && DocumentSaveResult !== undefined) {
          // 更新 uriSave
          this.uriSave = DocumentSaveResult[0];
          Logger.info(TAG, `save callFilePickerSaveFile file this.uriSave: ${this.uriSave}`);
        }
        Logger.info(TAG, 'fileAsset.displayName wrFlag myFileContent :' + this.dlpContent);
        // 更新 writeContentForSaveAsFile
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
    // if 语句
    if (wrFlag) {
      Logger.info(TAG, 'fileAsset.displayName wrFlag is true');
      Logger.info(TAG, 'fileAsset.displayName wrFlag myFileContent :' + this.dlpContent);
      // 更新 mediaFileUri
      this.mediaFileUri.writeFileContent(myUri, this.dlpContent);
    }
  }

  /**
   * 生成dlp文件
   */
  async onEncrypt() {
    Logger.info(TAG + 'new file and encrypt');
    // let 语句
    let context = getContext() as common.UIAbilityContext; // 获取当前UIAbilityContext
    // let 语句
    let flag = wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION |
    wantConstant.Flags.FLAG_AUTH_PERSISTABLE_URI_PERMISSION;
    // let 语句
    let targetBundleName = 'com.ohos.dlpmanager';
    uriPermissionManager.grantUriPermission(this.dlpUri, flag, targetBundleName, (result) => {
      Logger.info(TAG, `grandUriPermission result: ${JSON.stringify(result)}`);
    });
    // try 语句
    try {
      // let 语句
      let context = getContext() as common.UIAbilityContext;
      // 请求参数
      let want: Want = {
        'uri': this.dlpUri,
        'parameters': {
          'displayName': this.dlpName
        }
      };
      Logger.info(TAG, 'onEncrypt:' + JSON.stringify(want));
      // 打开DLP权限管理应用
      dlpPermission.startDLPManagerForResult(context, want).then((res: dlpPermission.DLPManagerResult) => {
        Logger.info(TAG, 'startDLPManagerForResult res.resultCode:' + res.resultCode);
        Logger.info(TAG, 'startDLPManagerForResult res.want:' + JSON.stringify(res.want));
      });
    } catch (err) {
      Logger.error(TAG, 'startDLPManagerForResult error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * getOriginalFileNameFunc：执行 getOriginalFileNameFunc 相关逻辑。
   */
  async getOriginalFileNameFunc(fileName: string) {
    // try 语句
    try {
      // let 语句
      let res = dlpPermission.getOriginalFileName(fileName); // 获取原始文件名
      Logger.info(TAG, 'OriginalFileName:' + res);
      promptAction.showToast({ message: 'OriginalFileName:' + decodeURIComponent(res), duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'getOriginalFileNameFunc error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * getDLPSuffixFunc：执行 getDLPSuffixFunc 相关逻辑。
   */
  async getDLPSuffixFunc() {
    // try 语句
    try {
      // let 语句
      let res = dlpPermission.getDLPSuffix(); // 获取DLP拓展名
      Logger.info(TAG, 'Extension name:' + res);
      promptAction.showToast({ message: 'Extension name:' + res, duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'getDLPSuffix error:' + (err as BusinessError).code + (err as BusinessError).message);
    }
  }

  /**
   * 设置沙箱保留
   */
  async setSandboxFile(): Promise<void> {
    // try 语句
    try {
      // let 语句
      let docUris: Array<string> = [this.dlpUri];
      dlpPermission.setRetentionState(docUris); // 设置沙箱保留
      promptAction.showToast({ message: 'set success', duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'setRetentionState error' + (err as BusinessError).code + (err as BusinessError).message); // 失败报错
    }
  }

  /**
   * 取消沙箱保留
   */
  async cancelSandboxFile(): Promise<void> {
    // try 语句
    try {
      let docUris: Array<string> = [this.dlpUri];
      dlpPermission.cancelRetentionState(docUris); // 设置沙箱保留
      promptAction.showToast({ message: 'cancel success', duration: 2000 });
    } catch (err) {
      Logger.error(TAG, 'setRetentionState error' + (err as BusinessError).code + (err as BusinessError).message); // 失败报错
    }
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    Logger.info(TAG, 'aboutToAppear ------');
  }

  /**
   * onPageShow：页面进入前台时回调。
   */
  onPageShow(): void {
    Logger.info(TAG, "onPageShow begin ------");
    let wantInfo: Want = AppStorage.get("funcAbilityWant") as Want;
    Logger.info(TAG, "funcAbilityWant:" + JSON.stringify(wantInfo));
    this.dlpLinkUri = wantInfo.uri as string;
    this.dlpUri = (wantInfo.parameters?.dlpUri as DLPUriObj).name;
    this.dlpName = decodeURIComponent((wantInfo.parameters?.fileAsset as DLPNameObj).displayName);
    this.dlpLinkName = (wantInfo.parameters?.linkFileName as DLPLinkNameObj).name;

    this.dlpContent = this.mediaFileUri.readFileContent(this.dlpLinkUri);
    Logger.info(TAG, "funcAbilityWant dlpLinkUri:" + this.dlpLinkUri);
    Logger.info(TAG, "funcAbilityWant dlpUri:" + this.dlpUri);
    Logger.info(TAG, "funcAbilityWant dlpName:" + this.dlpName);
    Logger.info(TAG, "funcAbilityWant dlpLinkName:" + this.dlpLinkName);
    Logger.info(TAG, "funcAbilityWant fd:" + this.fd);
    Logger.info(TAG, "funcAbilityWant dlpContent:" + this.dlpContent);
    try {
      this.fd = fs.openSync(this.dlpLinkUri).fd;
      this.isDlpFileFunc(this.fd);
      this.getOriginalFileNameFunc(this.dlpName);
      this.getDLPSuffixFunc();
    } catch (err) {
      Logger.error(TAG, "open DlpError:" + JSON.stringify(err));
    }

    Logger.info(TAG, "onPageShow end ------");
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
          .id('dlpPageBack')
          .onClick(() => {
            router.back();
          })
        // Text：文本
        // 关键属性：宽度、高度、字号、字体、字体颜色、文本对齐
        // Text：文本
        // 关键属性：宽度、高度、字号、字体、字体颜色、文本对齐
        Text(this.dlpName).id('dlp_page_text_3')
          .width('296vp')
          .height('28vp')
          .fontSize('20vp')
          .fontFamily('HarmonyHeiTi-Bold')
          .fontColor($r('app.color.font_color_182431'))
          .textAlign(TextAlign.Start)
          .lineHeight('28vp')
          .fontWeight(700)
          .margin({ top: '13vp', bottom: '15vp' })
      }.id('dlp_page_row_2')
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
          TextArea({ text: this.dlpContent, placeholder: 'Input text here...', controller: this.controller })
            .width('90%')
            .height('100vp')
            .fontSize('16vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Start)
            .fontWeight(500)
            .margin({ top: '10vp', bottom: '32vp', right: '8vp' })
            .id('dlpTextArea')
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
              this.dlpContent = value;
            })
            .backgroundColor('#FFFFFF')
        }.id('dlp_page_column_5')
        .width('100%')
        .height('64vp')
        .margin({ top: '4vp', bottom: '576vp' })
      }.id('dlp_page_scroll_4')

      // Blank：占位空白
      Blank().id('dlp_page_blank_6')

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
          // 关键属性：宽度、高度、外边距、点击事件回调、showToast
          // 交互：可点击交互
          // Image：图片
          // 关键属性：宽度、高度、外边距、点击事件回调、showToast
          // 交互：可点击交互
          Image($r('app.media.ic_public_edit'))
            .width('24vp')
            .height('24vp')
            .margin({ top: '8vp', bottom: '3vp', left: '40vp', right: '40vp' })
            .id('dlpEdit')
            .onClick(() => {
              promptAction.showToast({ message: $r('app.string.dlp_edit_tip'), duration: 2000 });
              return;
              // 不再支持编辑dlp文件
              this.editable = true;
              AppStorage.setOrCreate('editable', this.editable);
              Logger.info(TAG, 'EditFile caretPosition length = ' + this.dlpContent.length);
              this.controller.caretPosition(this.dlpContent.length);
              promptAction.showToast({ message: $r('app.string.editable'), duration: 2000 });
            })

          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          Text($r('app.string.edit')).id('dlp_page_text_9')
            .fontSize('10vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Center)
            .lineHeight('14vp')
            .fontWeight(500)
            .width('136vp')
            .height('14vp')
            .margin({ left: '4vp', right: '4vp', bottom: '7vp' })

        }.id('dlp_page_column_8').width('144vp').height('56vp')

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
            .id('dlpSave')
            .onClick(() => {
              Logger.info(TAG, 'save onClick dlpContent is: ' + this.dlpContent);
              Logger.info(TAG, 'save onClick this.myUri: ' + this.dlpLinkUri);
              this.mediaFileUri.writeFileContent(this.dlpLinkUri, this.dlpContent);
              this.editable = false;
              AppStorage.setOrCreate('editable', this.editable);
              promptAction.showToast({ message: $r('app.string.saved'), duration: 2000 });
            })
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          Text($r('app.string.save')).id('dlp_page_text_11')
            .fontSize('10vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Center)
            .lineHeight('14vp')
            .fontWeight(500)
            .width('136vp')
            .height('14vp')
            .margin({ left: '4vp', right: '4vp', bottom: '7vp' })
        }.id('dlp_page_column_10').width('144vp').height('56vp')

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
            .bindMenu(this.filePageMenu, { placement: Placement.TopRight, offset: { x: '52vp', y: '12vp' } })
            .id('dlpMore')
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          // Text：文本
          // 关键属性：字号、字体、字体颜色、文本对齐、行高、字重
          Text($r('app.string.more')).id('dlp_page_text_13')
            .fontSize('10vp')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontColor($r('app.color.font_color_182431'))
            .textAlign(TextAlign.Center)
            .lineHeight('14vp')
            .fontWeight(500)
            .width('136vp')
            .height('14vp')
            .margin({ left: '4vp', right: '4vp', bottom: '7vp' })
        }.id('dlp_page_column_12').width('144vp').height('56vp')
      }.id('dlp_page_flex_7')
      .align(Alignment.Bottom)
      .height('56vp')
      .width('100%')
      .backgroundColor($r('app.color.bg_color_F1F3F5'))

    }.id('dlp_page_column_1').width('100%').height('100%')
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
      MenuItem(this.filePageTextMenu1).id('dlp_page_menu_item_15')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.callFilePickerSaveFile(this.dlpName);
        })

      // MenuItem：菜单项
      MenuItem(this.filePageDivider).id('dlp_page_menu_item_16')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、onEncrypt
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、onEncrypt
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu2).id('dlp_page_menu_item_17')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.onEncrypt();
        })
        .enabled(true)

      // MenuItem：菜单项
      MenuItem(this.filePageDivider).id('dlp_page_menu_item_18')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、setSandboxFile
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、setSandboxFile
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu3).id('dlp_page_menu_item_19')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.setSandboxFile();
        })
        .enabled(true)

      // MenuItem：菜单项
      MenuItem(this.filePageDivider).id('dlp_page_menu_item_20')

      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、cancelSandboxFile
      // 交互：可点击交互
      // MenuItem：菜单项
      // 关键属性：宽度、高度、外边距、点击事件回调、cancelSandboxFile
      // 交互：可点击交互
      MenuItem(this.filePageTextMenu4).id('dlp_page_menu_item_21')
        .width('124vp')
        .height('48vp')
        .margin({ left: '16vp', right: '16vp' })
        .onClick(() => {
          this.cancelSandboxFile();
        })
        .enabled(true)

    }.id('dlp_page_menu_14')
    .width('156vp').height('202vp')
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
      .id('dlp_save_as')
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
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '2vp' })
      .id('dlp_set_permissions')
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
    Text($r('app.string.Set_retention_sandbox'))
      .width('122vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '2vp' })
      .id('set_retention_sandbox')
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
    Text($r('app.string.cancel_retention_sandbox'))
      .width('122vp')
      .height('21vp')
      .fontSize('16vp')
      .fontFamily('HarmonyHeiTi')
      .fontWeight(400)
      .fontColor($r('app.color.font_color_182431'))
      .align(Alignment.Start)
      .margin({ top: '13vp', bottom: '14vp', right: '2vp' })
      .id('cancel_retention_sandbox')
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
    Divider().id('dlp_page_divider_22')
      .width('124vp')
      .height('0.5vp')
      .opacity(0.05)
      .backgroundColor($r('app.color.divider_color_182431'))
      .margin({ left: '16vp', right: '16vp' })
  }
}