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

import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import Logger from '../common/utils/Logger';
import DateTimeUtil from '../common/utils/DateTimeUtils';
import { CommonConstants as Const } from '../common/CommonConstants';
import { CameraDataModel } from '../model/CameraDateModel';
import { CameraController } from '../controller/CameraController';
import { BgmController } from '../controller/BgmController';
import { CommonConstants } from '../common/CommonConstants';
import { StartLiveStream } from '../pages/StartLiveStream';
import {
  checkPermission,
  isGlobalMicToggle,
  isMicrophoneMute,
  isGlobalCameraToggle,
  requestPermissions,
} from '../common/utils/PermissionUtil';

const TAG: string = Const.INDEX_TAG;
const DATETIME: DateTimeUtil = new DateTimeUtil();
const uiContext: UIContext | undefined = AppStorage.get(CommonConstants.KEY_PREFIX + 'UIContext');

@Entry
@Component
struct Player {
  @State buttonEnabled: boolean = true;
  @State isFold: boolean = false;
  @State isTablet: boolean = false;
  @State isToStartLiveStream: boolean = false;
  @State selectedRoiPathType: number = 0;
  @StorageLink(CommonConstants.KEY_PREFIX + 'statusBarHeight') statusBarHeight: number = 48;
  @Provide('pageStack') pageStack: NavPathStack = new NavPathStack();
  @Provide('cameraController') cameraController: CameraController | undefined = undefined;
  @Provide('bgmController') bgmController: BgmController | undefined = undefined;
  @Provide('fileNameSandbox') fileNameSandbox: string | undefined = undefined;
  @Provide('roiFileNameSandbox') roiFileNameSandbox: string | undefined = undefined;
  @Provide('roiPathLabel') roiPathLabel: ResourceStr = $r('app.string.roi_path_native_buffer');
  @StorageLink(CommonConstants.KEY_PREFIX + 'currentWidthBreakpoint') @Watch('onWidthBpChange') currentWidthBreakpoint: string = 'md';
  private context: Context = this.getUIContext().getHostContext()!;
  private cameraData: CameraDataModel = new CameraDataModel();
  private confirmDialog: CustomDialogController = new CustomDialogController({
    builder: () => {
      this.ConfirmDialogBuilder();
    },
    cancel: () => {
    },
  });

  onWidthBpChange() {
    try {
      let curFoldStatus: display.FoldStatus = display.getFoldStatus();
      this.isFold = this.currentWidthBreakpoint === 'md' && curFoldStatus != 0;
      this.isTablet = this.currentWidthBreakpoint === 'lg' || this.currentWidthBreakpoint === 'xl';
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `getFoldStatus failed, errCode = ${err.code}, errMessage = ${err.message}.`);
    }
  }

  @Builder
  pageMap(name: string) {
    if (name === 'StartLiveStream') {
      StartLiveStream();
    }
  }

  aboutToAppear(): void {
    this.onWidthBpChange();
    isGlobalMicToggle(this.context as common.UIAbilityContext).then(() => {
      isMicrophoneMute().then((isMute) => {
        if (!isMute) {
          checkPermission(CommonConstants.MICROPHONE_PERMISSION)
            .then((status: abilityAccessCtrl.GrantStatus) => {
              if (status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {
                requestPermissions(this.context as common.UIAbilityContext, [CommonConstants.MICROPHONE_PERMISSION]);
              } else {
                Logger.info(TAG, 'Authorized');
              }
            })
            .catch((err: BusinessError) => {
              Logger.error(TAG, `Check permission failed, ${JSON.stringify(err)}`);
            });
        }
      })
    });
    isGlobalCameraToggle(this.context as common.UIAbilityContext).then(() => {
      checkPermission(CommonConstants.CAMERA_PERMISSION)
        .then((status: abilityAccessCtrl.GrantStatus) => {
          if (status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {
            requestPermissions(this.context as common.UIAbilityContext, [CommonConstants.CAMERA_PERMISSION]);
          } else {
            Logger.info(TAG, 'Authorized');
          }
        })
        .catch((err: BusinessError) => {
          Logger.error(TAG, `Check permission failed, ${JSON.stringify(err)}`);
        });
    });
    checkPermission(CommonConstants.DISTRIBUTED_DATASYNC)
      .then((status: abilityAccessCtrl.GrantStatus) => {
        if (status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED) {
          requestPermissions(this.context as common.UIAbilityContext, [CommonConstants.DISTRIBUTED_DATASYNC]);
        } else {
          Logger.info(TAG, 'Authorized');
        }
      })
      .catch((err: BusinessError) => {
        Logger.error(TAG, `Check permission failed, ${JSON.stringify(err)}`);
      });
  }

  aboutToDisappear(): void {
    if (this.cameraData.outputFd !== undefined && this.cameraData.outputFd >= 0) {
      fileIo.close(this.cameraData.outputFd).catch((error: BusinessError) => {
        Logger.error(TAG, `fileIo close fail ${error}`);
      });
    }
    if (this.cameraData.roiFd !== undefined && this.cameraData.roiFd >= 0) {
      fileIo.close(this.cameraData.roiFd).catch((error: BusinessError) => {
        Logger.error(TAG, `fileIo close roi file fail ${error}`);
      });
    }
    AppStorage.delete(CommonConstants.KEY_PREFIX + 'UIContext');
  }

  @Builder
  ConfirmDialogBuilder() {
    Column() {
      Text($r('app.string.saveButtonTitle'))
        .fontSize(20)
        .margin({ bottom: 15 })
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.font_primary'))

      Text($r('app.string.saveButtonNote'))
        .width('100%')
        .fontSize('16vp')
        .margin({ bottom: '12vp' })

      Row() {
        Button($r('app.string.setting_cancel'), { buttonStyle: ButtonStyleMode.TEXTUAL })
          .width(this.isFold || this.isTablet ? '176vp' : '140vp')
          .height(40)
          .onClick(() => {
            this.confirmDialog.close();
          })
        Button($r('app.string.setting_ok'), { buttonStyle: ButtonStyleMode.EMPHASIZED })
          .width(this.isFold || this.isTablet ? '176vp' : '140vp')
          .height(40)
          .enabled(this.isToStartLiveStream)
          .onClick(async () => {
            this.isToStartLiveStream = false;
            let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
            let pathDir: string = context.filesDir;
            let fileName: string = `/HMOSLiveStream_${DATETIME.getDate()}_${DATETIME.getTime()}.mp4`;
            let roiFileName: string = `/HMOSLiveStream_${DATETIME.getDate()}_${DATETIME.getTime()}_roi.txt`;
            let filePath: string = pathDir + fileName;
            let roiFilePath: string = pathDir + roiFileName;
            let file: fileIo.File;
            let roiFile: fileIo.File;
            try {
              file = await fileIo.open(filePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
            } catch (error) {
              let err = error as BusinessError;
              Logger.error(TAG, `open file failed, errCode = ${err.code}, errMessage = ${err.message}.`);
              return;
            }
            try {
              roiFile = await fileIo.open(roiFilePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
            } catch (error) {
              let err = error as BusinessError;
              Logger.error(TAG, `open roi file failed, errCode = ${err.code}, errMessage = ${err.message}.`);
              return;
            }
            if (file.fd == undefined) {
              Logger.error(TAG, `get outputfd failed!`);
              return;
            }
            this.cameraData.reset();
            this.cameraData.outputFd = file.fd;
            this.cameraData.roiFd = roiFile.fd;
            this.cameraData.isOpenEchoCancel = 1;
            this.cameraData.roiPathType = this.selectedRoiPathType;
            if (this.cameraData.outputFd >= 0) {
              let context = uiContext?.getHostContext() as common.UIAbilityContext;
              this.cameraController = new CameraController(this.cameraData, context);

              this.cameraController.initNative().then((data) => {
                if (data.surfaceId !== undefined) {
                  this.cameraData.surfaceId = data.surfaceId;
                  this.confirmDialog.close();
                  this.pageStack.pushPath({ name: 'StartLiveStream' });
                }
                this.bgmController = new BgmController(this.cameraController?.getNativeRecorderObj());
                this.fileNameSandbox = fileName;
                this.roiFileNameSandbox = roiFileName;
              })
            } else {
              Logger.error(TAG, `get outputfd failed!`);
            }
          })
      }
      .width('100%')
      .margin({ top: 8 })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .padding({
      left: 24,
      right: 24,
      top: 15,
      bottom: 15
    })
  }

  build() {
    Navigation(this.pageStack) {
      RelativeContainer() {
        Text($r('app.string.home_page_title'))
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.font_primary'))
          .padding({ left: '16vp', top: this.statusBarHeight })
          .alignRules({
            'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
            'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
          })
          .id('title')
        Column() {
          Column() {
            Button($r('app.string.roi_path_native_buffer'), { buttonStyle: ButtonStyleMode.NORMAL })
              .size({
                width: this.isFold || this.isTablet ? '328vp' : '100%',
                height: '40vp'
              })
              .fontSize('16vp')
              .fontWeight(FontWeight.Medium)
              .onClick(() => {
                this.selectedRoiPathType = 0;
                this.roiPathLabel = $r('app.string.roi_path_native_buffer');
                this.isToStartLiveStream = true;
                this.confirmDialog.open();
              })
            Button($r('app.string.roi_path_metadata_callback'), { buttonStyle: ButtonStyleMode.NORMAL })
              .size({
                width: this.isFold || this.isTablet ? '328vp' : '100%',
                height: '40vp'
              })
              .fontSize('16vp')
              .fontWeight(FontWeight.Medium)
              .margin({ top: '8vp' })
              .onClick(() => {
                this.selectedRoiPathType = 1;
                this.roiPathLabel = $r('app.string.roi_path_metadata_callback');
                this.isToStartLiveStream = true;
                this.confirmDialog.open();
              })
            Button($r('app.string.roi_path_buffer_mode'), { buttonStyle: ButtonStyleMode.NORMAL })
              .size({
                width: this.isFold || this.isTablet ? '328vp' : '100%',
                height: '40vp'
              })
              .fontSize('16vp')
              .fontWeight(FontWeight.Medium)
              .margin({ top: '8vp' })
              .onClick(() => {
                this.selectedRoiPathType = 2;
                this.roiPathLabel = $r('app.string.roi_path_buffer_mode');
                this.isToStartLiveStream = true;
                this.confirmDialog.open();
              })
          }
        }
        .alignRules({
          'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
          'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
        })
        .padding({ left: '16vp', right: '16vp', bottom: '32vp' })
        .width('100%')
        .height('200vp')
        .justifyContent(FlexAlign.End)
        .id('buttons')
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .hideBackButton(true)
    .width('100%')
    .height('100%')
    .mode(NavigationMode.Stack)
    .navDestination(this.pageMap)
    .backgroundColor('#F1F3F5')
    .expandSafeArea()
  }
}