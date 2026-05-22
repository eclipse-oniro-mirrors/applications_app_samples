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

import { CustomDataSource } from '../components/CustomDataSource';
import { FileModel, FileType, fileUtils, logger, requestDownload,
  BackgroundTaskState, TOAST_BOTTOM, documentDownload, audioDownload,
  mediaDownload, speedLimitDownload, wantAgentDownload } from '../utils/Exports';
import { common } from '@kit.AbilityKit';
import picker from '@ohos.file.picker';
import {
  Entry, Component, Column, Row, Text, Button, Image, List, ListItem, LazyForEach,
  Navigation, NavigationTitleMode, NavigationMode, LoadingProgress, Checkbox,
  ProgressType, HitTestMode, TextOverflow, BarState, Color, ImageFit, ButtonType,
  Blank, VerticalAlign, $r, Resource, ClickEvent
} from '@ohos.arkui.component';
import { StorageLink, State, AppStorage } from '@ohos.arkui.stateManagement';

const TAG: string = 'DownloadSample';
const userDir: string = 'file://docs/storage/Users/currentUser';
type StringArray = Array<string>;
type BooleanArray = Array<boolean>;

@Entry
@Component
struct Download {
  private fileData: CustomDataSource = new CustomDataSource();
  private documentSelectOptions: picker.DocumentSelectOptions = {};
  @StorageLink('backDownTaskState') backDownTaskState: BackgroundTaskState = BackgroundTaskState.NONE;
  @StorageLink('downloadServer') downloadServerStr: string = './';
  @StorageLink('downloadAction') downloadAction: string = 'Normal';
  @State downloadFolder: StringArray = [''];
  @State isGetData: boolean = false;
  @State checkFile: StringArray = [''];
  @State checkList: BooleanArray = [false];
  @State isRunning: boolean = false;
  @State isUserFolder: boolean = true;
  @State isPause: boolean = false;
  @State progress: number = 0;

  build() {
    Navigation() {
      Column() {
        if (this.isGetData) {
          LoadingProgress()
            .width(100)
            .layoutWeight(1)
        } else {
          List() {
            LazyForEach(this.fileData, (item: FileModel, index: int): void => {
              ListItem() {
                this.FileItem(item, index)
              }
            }, (item: FileModel, index: int): string => JSON.stringify(item))
          }
          .width('100%')
          .scrollBar(BarState.Off)
          .layoutWeight(1)
          .backgroundColor(Color.White)
          .borderRadius(24)
          .padding({ top: 4, bottom: 4 })
          .divider({ strokeWidth: 1, startMargin: 44, endMargin: 12 })
        }
        this.BottomView()
      }
      .padding({ left: 12, right: 12, bottom: 12 })
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .hideBackButton(false)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .backgroundColor($r('app.color.light_gray'))
    .hideToolBar(false)
    .title(this.isUserFolder ? $r('app.string.downloadToUser') : $r('app.string.download'))
  }

  @Builder
  FileItem(file: FileModel, index: int): void {
    Button({ type: ButtonType.Normal }) {
      Row() {
        Row() {
          if (file.fileType === FileType.FOLDER) {
            Image($r('app.media.ic_files_folder'))
              .size({ width: 24, height: 24 })
              .objectFit(ImageFit.Contain)
          } else if (file.fileType === FileType.IMAGE) {
            Image($r('app.media.ic_public_picture'))
              .size({ width: 24, height: 24 })
              .objectFit(ImageFit.Contain)
          } else if (file.fileType === FileType.MUSIC) {
            Image($r('app.media.ic_public_music'))
              .size({ width: 24, height: 24 })
              .objectFit(ImageFit.Contain)
          } else if (file.fileType === FileType.Video) {
            Image($r('app.media.ic_public_video'))
              .size({ width: 24, height: 24 })
              .objectFit(ImageFit.Contain)
          } else {
            Image($r('app.media.ic_public_document'))
              .size({ width: 24, height: 24 })
              .objectFit(ImageFit.Contain)
          }

          Text(decodeURIComponent(file.name))
            .fontSize(16)
            .fontWeight(400)
            .layoutWeight(1)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ left: 12 })
        }
        .layoutWeight(1)

        Checkbox({ name: '', group: 'checkboxGroup' })
          .select(this.checkList[index])
          .selectedColor($r('app.color.button_blue'))
          .margin({ left: 12 })
          .hitTestBehavior(HitTestMode.None)
      }
      .width('100%')
      .padding({ left: 12, right: 12 })
      .height(48)
    }
    .width('100%')
    .height(48)
    .backgroundColor(Color.White)
    .margin({ top: 12 })
    .onClick((e: ClickEvent) => {
      this.fileCheck(index);
    })
  }

  @Builder
  BottomView(): void {
    Column() {
      Button() {
        Row() {
          if (this.isRunning) {
            Text(`${this.progress}%`)
              .fontColor(Color.White)
              .fontSize(16)
            Text($r('app.string.downloading'))
              .fontColor(Color.White)
              .fontSize(16)
              .margin({ left: 12 })
          } else {
            Text(this.isUserFolder ? $r('app.string.downloadToUser') : $r('app.string.download'))
              .fontColor(Color.White)
              .fontSize(16)
          }
        }
      }
      .id('download_to')
      .type(ButtonType.Capsule)
      .height(45)
      .width('100%')
      .backgroundColor($r('app.color.button_blue'))
      .margin({ top: 12 })
      .onClick((e: ClickEvent) => {
        if (!this.isRunning) {
          if (this.isUserFolder) {
            this.downloadUser();
          } else {
            this.download();
          }
        }
      })

      Button($r('app.string.view_download_files'))
        .id('view_download_files')
        .type(ButtonType.Capsule)
        .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
        .width('100%')
        .fontSize(16)
        .margin({ top: 12, bottom: 12 })
        .fontColor($r('app.color.btn_text_blue'))
        .onClick((e: ClickEvent) => {
          if (this.isUserFolder) {
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            logger.info(TAG, `context: ${JSON.stringify(context)}`);
            const documentViewPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker(context);
            logger.info(TAG, `documentViewPicker: ${JSON.stringify(documentViewPicker)}`);
            logger.info(TAG, `documentSelectOptions: ${JSON.stringify(this.documentSelectOptions)}`);
            documentViewPicker.select(this.documentSelectOptions).then((documentSelectResult: string[]) => {
              logger.info(TAG, `documentSelectResult: ${documentSelectResult}`);
            });
          } else {
            let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
            AppStorage.setOrCreate('downloadDir', context.cacheDir);
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/DownloadFiles'
            });
          }
        })
    }
    .width('100%')
    .margin({ top: 12, left: 12, right: 12 })
  }

  aboutToAppear(): void {
    logger.debug(TAG, 'aboutToAppear');
    this.isRunning = false;
    this.isPause = false;
    this.isGetData = true;
    logger.info(`downloadAction: ${this.downloadAction}`);
    if (this.downloadAction === 'ToUser') {
      this.isUserFolder = true;
      let itemtxt: FileModel = new FileModel('test.txt', false, [this.downloadServerStr + 'test.txt']);
      let itemjpg: FileModel = new FileModel('edge_picture.jpg', false, [this.downloadServerStr + 'edge_picture.jpg']);
      let itemmp3: FileModel = new FileModel('audio_test.mp3', false, [this.downloadServerStr + 'audio_test.mp3']);
      this.fileData.setData([itemtxt, itemjpg, itemmp3]);
      this.checkList = [false];
      this.fileData.dataArray?.forEach((item: FileModel): void => {
        logger.debug(TAG, `item:${JSON.stringify(item)}`);
        this.checkList.push(false);
      });
      this.checkList.shift();
      this.isGetData = false;
      this.fileData.notifyDataReload();
      fileUtils.listFolders(userDir).then((folders: string[]) => {
        logger.debug(TAG, `folders:${JSON.stringify(folders)}`);
        this.downloadFolder = folders;
      });
    } else {
      this.isUserFolder = false;
      let itemtxt: FileModel = new FileModel('test.txt', false, [this.downloadServerStr + 'test.txt']);
      let itemjpg: FileModel = new FileModel('edge_picture.jpg', false, [this.downloadServerStr + 'edge_picture.jpg']);
      let itemmp3: FileModel = new FileModel('audio_test.mp3', false, [this.downloadServerStr + 'audio_test.mp3']);
      let itemmp4: FileModel = new FileModel('video_media.mp4', false, [this.downloadServerStr + 'video_media.mp4']);
      this.fileData.setData([itemtxt, itemjpg, itemmp3, itemmp4]);
      this.checkList = [false];
      this.fileData.dataArray?.forEach((item: FileModel): void => {
        logger.debug(TAG, `item:${JSON.stringify(item)}`);
        this.checkList.push(false);
      });
      this.checkList.shift();
      this.isGetData = false;
      this.fileData.notifyDataReload();
      let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
      fileUtils.listFolders(context.cacheDir).then((folders: string[]) => {
        logger.debug(TAG, `folders:${JSON.stringify(folders)}`);
        this.downloadFolder = folders;
      });
    }
  }

  fileCheck(index: int): void {
    logger.debug(TAG, `fileCheck= ${index}`);
    for (let i: int = 0; i < this.checkList.length; i++) {
      if (i !== index) {
        this.checkList[i] = false;
      }
    }
    this.checkList[index] = !this.checkList[index];
    logger.info(TAG, `this.checkList = ${JSON.stringify(this.checkList)}`);
  }

  download(): void {
    this.checkFile = [''];
    if (this.checkList === undefined) {
      return;
    }
    let index: int = 0;
    logger.info(TAG, `this.checkList = ${JSON.stringify(this.checkList)}`);
    for (let i: int = 0; i < this.checkList.length; i++) {
      if (this.checkList[i]) {
        let fileModel = this.fileData.getData(i);
        logger.info(TAG, `fileModel = ${JSON.stringify(fileModel)}`);
        fileModel.files.forEach((url: string): void => {
          let splitUrl = url.split('//')[1].split('/');
          if (splitUrl[splitUrl.length - 1] !== '') {
            index = i;
            logger.info(TAG, `this.checkFile = ${JSON.stringify(this.checkFile)}`);
            this.checkFile.push(url);
          }
        });
      }
    }
    this.checkFile.shift();
    logger.info(TAG, `this.checkFile = ${JSON.stringify(this.checkFile)}`);
    if (this.checkFile.length === 0) {
      try {
        this.getUIContext().getPromptAction().showToast({ message: $r('app.string.check_file_tips'), bottom: TOAST_BOTTOM });
      } catch (error) {
        logger.error(TAG, 'Failed to show check file toast in download(): ' + JSON.stringify(error));
      }
      return;
    }
    this.progress = 0;
    this.isRunning = true;
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    if (index == 0) {
      requestDownload.requestDownloadFile(this.checkFile[0], 'Others/test.txt', this.downloadFileCallback, context);
    } else if (index == 1) {
      requestDownload.requestAgentDownload(this.checkFile[0], 'Pictures/edge_picture.jpg', this.downloadFileCallback, context);
    } else if (index == 2) {
      speedLimitDownload.speedLimitDownload(this.checkFile[0], 'Others/audio_test.mp3', this.downloadFileCallback, context);
    } else if (index == 3) {
      wantAgentDownload.wantAgentDownload(this.checkFile[0], 'Videos/video_media.mp4', this.downloadFileCallback, context);
    } else {
      logger.error(TAG, `download user file index = ${index}`);
    }
  }

  downloadUser(): void {
    this.checkFile = [''];
    if (this.checkList === undefined) {
      return;
    }
    let index: int = 0;
    logger.info(TAG, `this.checkList = ${JSON.stringify(this.checkList)}`);
    for (let i: int = 0; i < this.checkList.length; i++) {
      if (this.checkList[i]) {
        let fileModel = this.fileData.getData(i);
        logger.info(TAG, `fileModel = ${JSON.stringify(fileModel)}`);
        fileModel.files.forEach((url: string): void => {
          let splitUrl = url.split('//')[1].split('/');
          if (splitUrl[splitUrl.length - 1] !== '') {
            index = i;
            this.checkFile.push(url);
          }
        });
      }
    }
    this.checkFile.shift();
    logger.info(TAG, `this.checkFile = ${JSON.stringify(this.checkFile)}`);
    if (this.checkFile.length === 0) {
      try {
        this.getUIContext().getPromptAction().showToast({ message: $r('app.string.check_file_tips'), bottom: TOAST_BOTTOM });
      } catch (error) {
        logger.error(TAG, 'Failed to show check file toast in downloadUser(): ' + JSON.stringify(error));
      }
      return;
    }
    this.progress = 0;
    this.isRunning = true;
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    if (index == 0) {
      documentDownload.docFileAgentTask(this.checkFile[0], 'test.txt', this.downloadFileCallback, context);
    } else if (index == 1) {
      mediaDownload.mediaFileAgentTask(this.checkFile[0], this.downloadFileCallback, context);
    } else if (index == 2) {
      audioDownload.audioFileAgentTask(this.checkFile[0], 'audio_test.mp3', this.downloadFileCallback, context);
    } else {
      logger.error(TAG, `download user file index = ${index}`);
    }
  }

  downloadFileCallback: (progress: int, isSuccess: boolean) => void = (progress: int, isSuccess: boolean): void => {
    logger.debug(TAG, 'downloadFileCallback');
    this.progress = progress;
    if (this.progress === 100) {
      this.downloadFinish(isSuccess);
    }
  }

  downloadFinish(isSuccess: boolean): void {
    logger.debug(TAG, 'downloadFinish');
    this.isRunning = false;
    this.checkFile = [''];
    this.checkList = [false];
    this.fileData.dataArray?.forEach((item: FileModel): void => {
      this.checkList.push(false);
    });
    this.checkList.shift();
    this.fileData.notifyDataReload();
    let message: Resource = isSuccess ? $r('app.string.download_finish') : $r('app.string.download_fail');
    try {
      this.getUIContext().getPromptAction().showToast({ message: message, bottom: TOAST_BOTTOM });
    } catch (error) {
      logger.error(TAG, 'Failed to show download finish toast: ' + JSON.stringify(error));
    }
  }
}