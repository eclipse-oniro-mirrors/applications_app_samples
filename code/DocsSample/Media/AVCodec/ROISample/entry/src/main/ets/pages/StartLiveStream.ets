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

import { ApplicationStateChangeCallback, common } from '@kit.AbilityKit';
import Logger from '../common/utils/Logger';
import { BackgroundTaskManager } from '../common/utils/BackgroundTaskManager';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import { CameraController } from '../controller/CameraController';
import { StartLiveDecorationView } from '../view/StartLiveDecorationView';
import { StartLiveRenderView } from '../view/StartLiveRenderView';
import { BgmController } from '../controller/BgmController';
import { DistributeFileManager } from '../controller/DistributeFileManager';
import { CommonConstants } from '../common/CommonConstants';
import { SettingPopupDialog } from '../components/SettingPopupDialog';
import { SettingPopupOptionItem } from '../model/SettingPopupOptionItem';
import { fileIo } from '@kit.CoreFileKit';

const TAG: string = CommonConstants.RECORDER_TAG;
const uiContext: UIContext | undefined = AppStorage.get(CommonConstants.KEY_PREFIX + 'UIContext');

@Builder
export function StartLiveStreamBuilder() {
  StartLiveStream();
}

@Component
export struct StartLiveStream {
  @Consume('pageStack') pageStack: NavPathStack;
  @Consume('cameraController') cameraController: CameraController;
  @Consume('bgmController') bgmController: BgmController;
  @Consume('fileNameSandbox') fileNameSandbox: string;
  @Consume('roiFileNameSandbox') roiFileNameSandbox: string;
  @StorageLink(CommonConstants.KEY_PREFIX + 'statusBarHeight') statusBarHeight: number = CommonConstants.DEFAULT_STATUS_BAR_HEIGHT;
  @State settingTitle: string | undefined = '';
  @State isOpenROI: boolean = true;
  @State isOpenBGM: boolean = false;
  @State isPlayBgm: boolean = false;
  private playBgmInterVal: number | undefined = undefined;
  private dialogController: CustomDialogController = new CustomDialogController({
    builder: SettingPopupDialog({
      title: this.settingTitle,
      options: [
        new SettingPopupOptionItem(CommonConstants.ROI_ID,
          $r('app.string.set_roi'),
          this.isOpenROI,
          (checked: boolean) => {
            this.isOpenROI = checked;
            this.cameraController.setIsOpenROI(this.isOpenROI);
          }
        ),
        new SettingPopupOptionItem(CommonConstants.BGM_ID,
          $r('app.string.set_bgm'),
          this.isOpenBGM,
          (checked: boolean) => {
            this.isOpenBGM = checked;
            if (this.isOpenBGM) {
              this.playBgm();
              this.playBgmInterVal = setInterval(() => {
                this.playBgm();
              }, CommonConstants.BGM_REPLAY_INTERVAL)
            } else {
              clearInterval(this.playBgmInterVal);
              this.playBgmInterVal = undefined;
              this.bgmController.stopPlay();
              this.isPlayBgm = false;
            }
          }
        ),
      ],
    }),
    cornerRadius: CommonConstants.SETTINGS_DIALOG_CORNER_RADIUS
  });

  async playBgm() {
    if (this.isPlayBgm) {
      this.bgmController.stopPlay();
      this.isPlayBgm = false;
    }
    let fileName = CommonConstants.BGM_FILENAME;
    try {
      this.getUIContext().getHostContext()?.resourceManager.getRawFileContent(fileName, (_err, value) => {
        if (_err) {
          Logger.error(TAG, `get raw file failed: ${_err}`);
          return;
        }
        let fileBuffer: ArrayBufferLike = value.buffer;
        let context = this.getUIContext().getHostContext();
        let bgmFilePath = context!.filesDir + '/' + fileName;
        Logger.info(TAG, `bgm file filePath: ${bgmFilePath}.`);
        let file = fileIo.openSync(bgmFilePath, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        let writeLen = fileIo.writeSync(file.fd, fileBuffer);
        Logger.info(TAG, `write bgm raw data to file succeed and size is: ${writeLen}.`);
        fileIo.closeSync(file);
        let callback: () => void = () => {
          Logger.info(TAG, `player JSCallback.`);
          this.isOpenBGM = false;
        }
        this.bgmController?.play(bgmFilePath, callback);
        this.isPlayBgm = true;
      });
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `getRawFileContent failed, errCode = ${err.code}, errMessage = ${err.message}.`);
    }
  }

  async aboutToAppear(): Promise<void> {
    this.cameraController?.updateImageRotation();
    this.cameraController?.onDisplayCallback();

    let appContext = uiContext?.getHostContext()!!.getApplicationContext();
    if (appContext) {
      appContext.on('applicationStateChange', this.thisApplicationStateChangeCallback);
    }

    try {
      this.settingTitle = uiContext?.getHostContext()?.resourceManager.getStringSync($r('app.string.setting_title').id);
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `get setting_title failed, errCode = ${err.code}, errMessage = ${err.message}.`);
      this.settingTitle = 'Setting';
    }
  }

  aboutToDisappear(): void {
    this.cameraController?.offDisplayCallback();
    let appContext = uiContext?.getHostContext()!!.getApplicationContext();
    if (appContext) {
      appContext.off('applicationStateChange', this.thisApplicationStateChangeCallback);
    }
  }

  build() {
    NavDestination() {
      Stack() {
        StartLiveRenderView();
        StartLiveDecorationView();
        Row() {
          Text($r('app.string.home_page_title'))
            .fontSize(CommonConstants.HOME_TITLE_FONT_SIZE)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Blank()
          Image($r('app.media.gearshape'))
            .width(CommonConstants.ICON_BUTTON_SIZE)
            .height(CommonConstants.ICON_BUTTON_SIZE)
            .fillColor(Color.White)
            .onClick(() => {
              this.dialogController.open();
            })
          Image($r('app.media.close'))
            .width(CommonConstants.ICON_BUTTON_SIZE)
            .height(CommonConstants.ICON_BUTTON_SIZE)
            .margin({ left: CommonConstants.ICON_MARGIN_LEFT })
            .fillColor(Color.White)
            .onClick(async () => {
              BackgroundTaskManager.stopContinuousTask(uiContext?.getHostContext() as common.UIAbilityContext);
              await this.cameraController.release();
              this.bgmController.release();
              const distributeFileManager = new DistributeFileManager();
              await distributeFileManager.copyFileToDistribute(uiContext?.getHostContext() as common.UIAbilityContext,
                this.fileNameSandbox, this.roiFileNameSandbox);
              this.pageStack.pop();
            })
        }
        .width('100%')
        .padding({ left: CommonConstants.TOP_BAR_PADDING, right: CommonConstants.TOP_BAR_PADDING })
        .margin({ top: this.statusBarHeight })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
      .alignContent(Alignment.TopStart)
    }
    .onBackPressed(() => {
      BackgroundTaskManager.stopContinuousTask(uiContext?.getHostContext() as common.UIAbilityContext);
      this.cameraController.release();
      this.bgmController.release();
      this.pageStack.pop();
      return true;
    })
    .onAppear(() => {
      BackgroundTaskManager.startContinuousTask(backgroundTaskManager.BackgroundMode.AUDIO_RECORDING,
        uiContext?.getHostContext() as common.UIAbilityContext);
    })
    .onDisAppear(async () => {
      const distributeFileManager = new DistributeFileManager();
      await distributeFileManager.copyFileToDistribute(uiContext?.getHostContext() as common.UIAbilityContext,
        this.fileNameSandbox, this.roiFileNameSandbox);
    })
    .hideTitleBar(true)
    .hideBackButton(true)
    .width('100%')
    .height('100%')
    .expandSafeArea()
  }

  private thisApplicationStateChangeCallback: ApplicationStateChangeCallback = {
    onApplicationForeground: () => {
      Logger.info(TAG, `onApplicationForeground.`);
      this.cameraController?.createRecorder();
    },
    onApplicationBackground: () => {
      Logger.info(TAG, `onApplicationBackground.`);
      this.cameraController?.releaseCamera();
    }
  }
}
