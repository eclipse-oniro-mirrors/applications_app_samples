/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { fileIo } from '@kit.CoreFileKit'
import { display } from '@kit.ArkUI'
import { camera } from '@kit.CameraKit'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import { deviceInfo } from '@kit.BasicServicesKit'
import thermal from '@ohos.thermal'
import player from 'libplayer.so'
import recorder from 'librecorder.so'
import Logger from '../common/utils/Logger'
import DateTimeUtil from '../common/utils/DateTimeUtils'
import { CommonConstants as Const } from '../common/CommonConstants'
import { CameraDataModel } from '../model/CameraDateModel'
import { PlayerSettingsModel } from '../model/PlayerSettingsModel'
import { RecorderSettingsModel } from '../model/RecorderSettingsModel'
import { formatPlaybackInfo } from '../model/PlaybackInfoModel'
import { buildMediaInfoSections, MediaInfoRow, MediaInfoSection } from '../model/MediaInfoModel'
import { encoderProfileCameraCheck, setFirstCameraProfile } from '../common/utils/CameraCheck'
import { requestRecordPermissions } from '../common/utils/PermissionUtil'
import {
  getPickerSelectedIndex, getPickerSelectedValues, isMediaFileEmpty, isPickerIndexValid
} from '../common/utils/MediaUtils'
import picker from '@ohos.file.picker'

const TAG: string = 'Sample_Player';
const DATETIME: DateTimeUtil = new DateTimeUtil();

@Entry
@Component
export struct Player {
  @State buttonEnabled: boolean = true;
  @State isShow: boolean = false;
  @State isShowFlv: boolean = false;
  @State isSmartFluencySupported: boolean = false;
  @State isSmartFluencyAvailable: boolean = false;
  @State thermalWarningActive: boolean = false;
  @State isStopping: boolean = false;
  @State playbackInfoText: string = '';
  @State isHdrVividConfirmed: boolean = false;
  @State isMediaInfoVisible: boolean = false;
  @State mediaInfoSections: MediaInfoSection[] = [];
  private transformType: number = 0;
  private playerSettings: PlayerSettingsModel = new PlayerSettingsModel();
  private recorderSettings: RecorderSettingsModel = new RecorderSettingsModel();
  private cameraData: CameraDataModel = new CameraDataModel();
  private selectFilePath: string | null = null;
  private playbackInfoTimer: number = 0;
  private display = display.getDefaultDisplaySync();
  private sourcePath: string[] =
    [globalThis.context.resourceManager.getStringSync($r('app.string.select_from_filemanager').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.select_from_album').id)];

  aboutToAppear() {
    // API 26+ 设备支持智能流畅倍速解码
    const apiVersion = deviceInfo.sdkApiVersion;
    this.isSmartFluencySupported = apiVersion >= 26;
    if (this.isSmartFluencySupported) {
      player.setSmartFluencyEnabled(true);
      // 注册温控回调，当设备过热时自动切入 UNIFORM 低比例模式降低负载
      thermal.registerThermalLevelCallback((level: number) => {
        if (level >= thermal.ThermalLevel.OVERHEATED) {
          this.thermalWarningActive = true;
          player.onThermalWarningReceived(0.3);
          Logger.info(TAG, 'Thermal warning: level=' + level + ', UNIFORM mode activated');
        } else if (this.thermalWarningActive && level <= thermal.ThermalLevel.WARM) {
          this.thermalWarningActive = false;
          player.onThermalLevelRecovered();
          Logger.info(TAG, 'Thermal recovered: level=' + level);
        }
      });
    }
    Logger.info(TAG, 'Smart fluency supported: ' + this.isSmartFluencySupported + ', apiVersion: ' + apiVersion);
  }

  selectFile(): void {
    TextPickerDialog.show({
      range: this.sourcePath,
      canLoop: false,
      selected: 0,
      onAccept: (value: TextPickerResult) => {
        const selectedIndex = getPickerSelectedIndex(value.index);
        Logger.info(TAG, 'Media source accepted, selected index: ' + selectedIndex);
        switch (selectedIndex) {
          case 0:
            this.selectDocFile();
            break;
          case 1:
            this.selectAlbumFile();
            break;
          default:
            Logger.error(TAG, 'Invalid media source index: ' + selectedIndex);
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.media_file_select_failed'),
              duration: Const.DURATION,
              bottom: Const.BOTTOM
            });
            break;
        }
      },
      onCancel: () => {
        Logger.info(TAG, 'Media source selection canceled');
      }
    });
  }

  aboutToDisappear(): void {
    this.stopPlaybackInfoUpdates();
    this.isHdrVividConfirmed = false;
  }

  startPlaybackInfoUpdates(): void {
    this.stopPlaybackInfoUpdates();
    this.updatePlaybackInfo();
    this.playbackInfoTimer = setInterval(() => {
      this.updatePlaybackInfo();
    }, 1000);
  }

  stopPlaybackInfoUpdates(): void {
    if (this.playbackInfoTimer !== 0) {
      clearInterval(this.playbackInfoTimer);
      this.playbackInfoTimer = 0;
    }
  }

  updatePlaybackInfo(): void {
    const info = player.getPlaybackInfo();
    this.isHdrVividConfirmed = info.isHdrVividConfirmed;
    this.playbackInfoText = formatPlaybackInfo(info.state, info.speed, info.durationUs, info.positionUs,
      info.hasVideo, info.hasAudio, info.isSmartFluencyAvailable);
  }

  updateMediaInfo(): void {
    this.mediaInfoSections = buildMediaInfoSections(player.getMediaInfo());
  }

  showMediaInfo(): void {
    this.updateMediaInfo();
    this.isMediaInfoVisible = this.mediaInfoSections.length > 0;
  }

  async selectDocFile(): Promise<void> {
    try {
      const documentSelectOptions = new picker.DocumentSelectOptions();
      const documentViewPicker = new picker.DocumentViewPicker();
      const documentSelectResult = await documentViewPicker.select(documentSelectOptions);
      if (documentSelectResult.length === 0) {
        Logger.info(TAG, 'No document selected');
        return;
      }
      this.selectFilePath = documentSelectResult[0];
      Logger.info(TAG, 'Document selected, start playback, URI: ' + this.selectFilePath);
      this.play();
    } catch (error) {
      Logger.error(TAG, 'Document selection failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_select_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
  }

  async selectAlbumFile(): Promise<void> {
    try {
      const photoPicker = new photoAccessHelper.PhotoViewPicker();
      const photoSelectResult = await photoPicker.select({
        MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE,
        maxSelectNumber: 1
      });
      if (photoSelectResult.photoUris.length === 0) {
        Logger.info(TAG, 'No album file selected');
        return;
      }
      this.selectFilePath = photoSelectResult.photoUris[0];
      Logger.info(TAG, 'Album file selected, start playback, URI: ' + this.selectFilePath);
      this.play();
    } catch (error) {
      Logger.error(TAG, 'Album selection failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_select_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
  }

  setPlaybackSpeed(speed: number) {
    player.setPlaybackSpeed(speed);
    this.updatePlaybackInfo();
  }

  setTransform(transformHint: number) {
    player.setTransform(transformHint);
  }

  stopPlayback(): void {
    if (this.isStopping) {
      return;
    }
    if (player.stop()) {
      this.isStopping = true;
      Logger.info(TAG, 'Player stop requested');
    } else {
      Logger.error(TAG, 'Player stop request rejected, state: ' + player.getState());
    }
  }

  play(): void {
    if (this.selectFilePath === null) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.alert'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
      return;
    }

    try {
      const inputFile = fileIo.openSync(this.selectFilePath, fileIo.OpenMode.READ_ONLY);
      let inputFileClosed = false;
      const closeInputFile = (): void => {
        if (inputFileClosed) {
          return;
        }
        try {
          fileIo.close(inputFile);
          inputFileClosed = true;
        } catch (error) {
          Logger.error(TAG, 'Close player input file failed: ' + JSON.stringify(error));
        }
      };
      let closeInCallback = false;
      try {
        const inputFileState = fileIo.statSync(inputFile.fd);
        if (isMediaFileEmpty(inputFileState.size)) {
          Logger.error(TAG, 'Player input file is empty');
          this.getUIContext().getPromptAction().showToast({
            message: $r('app.string.media_file_empty'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
          return;
        }

        this.buttonEnabled = false;
        this.isHdrVividConfirmed = false;
        let failurePromptShown = false;
        const started = player.play(this.playerSettings.createPlayOptions({
          inputFileFd: inputFile.fd,
          inputFileOffset: Const.DEFAULT_VALUE,
          inputFileSize: inputFileState.size,
          isSmartFluencySupported: this.isSmartFluencySupported
        }), (result) => {
          Logger.info(TAG, 'Player JS callback, success: ' + result.success + ', reason: ' + result.reason);
          this.buttonEnabled = true;
          this.isStopping = false;
          this.isSmartFluencyAvailable = false;
          this.isHdrVividConfirmed = false;
          this.stopPlaybackInfoUpdates();
          this.playbackInfoText = '';
          this.isMediaInfoVisible = false;
          this.mediaInfoSections = [];
          closeInputFile();
          if (!result.success && !failurePromptShown) {
            failurePromptShown = true;
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.media_file_invalid'),
              duration: Const.DURATION,
              bottom: Const.BOTTOM
            });
          }
        });
        closeInCallback = true;
        if (!started) {
          this.isSmartFluencyAvailable = false;
          this.isHdrVividConfirmed = false;
          failurePromptShown = true;
          Logger.error(TAG, 'Player initialization or startup failed');
          this.getUIContext().getPromptAction().showToast({
            message: $r('app.string.media_file_invalid'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
        } else {
          this.isSmartFluencyAvailable = player.isSmartFluencyAvailable();
          this.updateMediaInfo();
          this.startPlaybackInfoUpdates();
          Logger.info(TAG, 'Smart fluency available: ' + this.isSmartFluencyAvailable);
        }
      } finally {
        if (!closeInCallback) {
          closeInputFile();
        }
      }
    } catch (error) {
      this.buttonEnabled = true;
      this.isStopping = false;
      this.isSmartFluencyAvailable = false;
      this.isHdrVividConfirmed = false;
      Logger.error(TAG, 'Open or inspect player input file failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_open_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
  }

  async prepareRecording(outputFormat: number): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || !await requestRecordPermissions(context)) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.record_permission_required'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
      return;
    }

    this.cameraData.outputFormat = outputFormat;
    this.isShow = outputFormat === Const.FORMAT_MP4;
    this.isShowFlv = outputFormat === Const.FORMAT_FLV;
  }

  async checkIsProfileSupport(): Promise<void> {
    let cameraManager: camera.CameraManager = camera.getCameraManager(getContext(this));
    if (!cameraManager) {
      Logger.error(TAG, 'camera.getCameraManager error!');
    }

    let encoderProfile: undefined | camera.VideoProfile =
      await encoderProfileCameraCheck(cameraManager, this.cameraData);
    if (!encoderProfile) {
      Logger.error(TAG, 'encoderProfile is not found');
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.alert1'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM,
        backgroundColor: Color.White,
        backgroundBlurStyle: BlurStyle.NONE
      });
      this.cameraData = new CameraDataModel();
      encoderProfile = await encoderProfileCameraCheck(cameraManager, this.cameraData);
      if (!encoderProfile) {
        Logger.error(TAG, '1080P video profile is not found, set first camera profile');
        let encoderProfile: camera.VideoProfile = await setFirstCameraProfile(cameraManager) as camera.VideoProfile;
        this.cameraData.cameraWidth = encoderProfile.size.width;
        this.cameraData.cameraHeight = encoderProfile.size.height;
        this.cameraData.frameRate = encoderProfile.frameRateRange.max;
        this.cameraData.bitRate = Const.BITRATE_VIDEO_2M;
        this.cameraData.format = encoderProfile.format;
      }
      return;
    } else {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.success'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM,
        backgroundColor: Color.White,
        backgroundBlurStyle: BlurStyle.NONE
      });
    }
  }

  @Builder
  PlayerSettingButton() {
    Button($r('app.string.setting'))
      .size({
        width: '18.5%',
        height: $r('app.float.index_button_height')
      })// .enabled(this.buttonEnabled)
      .margin({ bottom: $r('app.float.button_margin_bottom') })
      .onClick(() => {
        this.getUIContext().showTextPickerDialog({
          defaultPickerItemHeight: Const.DEFAULT_PICKER_ITEM_HEIGHT,
          selectedTextStyle: ({
            font: ({
              size: Const.SELECTED_TEXT_STYLE_FONT_SIZE
            })
          }),
          textStyle: ({
            font: ({
              size: Const.SELECTED_TEXT_STYLE_FONT_SIZE
            })
          }),
          range: Const.PLAYER_INFO,
          canLoop: false,
          alignment: DialogAlignment.Center,
          backgroundColor: Color.White,
          backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
          onAccept: (value: TextPickerResult) => {
            const values = getPickerSelectedValues(value.value);
            if (!this.playerSettings.applyPickerValues(values)) {
              Logger.error(TAG, 'Invalid player settings: ' + JSON.stringify(values));
              return;
            }
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.success'),
              duration: Const.DURATION,
              bottom: Const.BOTTOM,
              backgroundColor: Color.White,
              backgroundBlurStyle: BlurStyle.NONE
            });
          }
        })
      })
  }

  @Builder
  RecorderSettingButton() {
    Button($r('app.string.setting'))
      .enabled(this.buttonEnabled)
      .size({
        width: '18.5%',
        height: $r('app.float.index_button_height')
      })
      .enabled(this.buttonEnabled)
      .onClick(() => {
        this.getUIContext().showTextPickerDialog({
          defaultPickerItemHeight: Const.DEFAULT_PICKER_ITEM_HEIGHT,
          selectedTextStyle: ({
            font: ({
              size: Const.SELECTED_TEXT_STYLE_FONT_SIZE
            })
          }),
          textStyle: ({
            font: ({
              size: Const.SELECTED_TEXT_STYLE_FONT_SIZE
            })
          }),
          range: Const.RECORDER_INFO,
          canLoop: false,
          alignment: DialogAlignment.Center,
          backgroundColor: Color.White,
          backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
          onAccept: (value: TextPickerResult) => {
            const values = getPickerSelectedValues(value.value);
            if (!this.recorderSettings.applyPickerValues(values, this.cameraData)) {
              Logger.error(TAG, 'Invalid recorder settings: ' + JSON.stringify(values));
              return;
            }
            this.checkIsProfileSupport();
          }
        })
      })
  }

  @Builder
  Authorized() {
    Column() {
      Text($r('app.string.saveButtonNote'))
        .width('100%')
        .fontSize('16vp')
        .margin({ bottom: '12vp' })

      Row() {
        Button($r('app.string.saveButtonCancel'))
          .onClick(() => {
            this.isShow = false
          })
          .width('48%')

        Blank()

        SaveButton({ text: SaveDescription.SAVE })
          .onClick(async () => {
            const context = this.getUIContext().getHostContext();
            let helper = photoAccessHelper.getPhotoAccessHelper(context);
            let fileExt = this.cameraData.outputFormat === Const.FORMAT_FLV ? 'flv' : 'mp4';
            let uri = await helper.createAsset(photoAccessHelper.PhotoType.VIDEO, fileExt, {
              title: `AVCodecVideo_${DATETIME.getDate()}_${DATETIME.getTime()}`
            });
            await this.checkIsProfileSupport();
            let file = await fileIo.open(uri, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
            this.cameraData.outputfd = file.fd;
            if (this.cameraData.outputfd !== null) {
              recorder.initNative(this.cameraData.outputfd, this.cameraData.videoCodecMime, this.cameraData.cameraWidth,
                this.cameraData.cameraHeight, this.cameraData.frameRate, this.cameraData.isHDRVivid,
                this.cameraData.bitRate, this.cameraData.format, this.cameraData.isSync,
                this.cameraData.outputFormat).then((data) => {
                if (data.surfaceId !== null) {
                  this.cameraData.surfaceId = data.surfaceId;
                  this.getUIContext().getRouter().pushUrl({
                    url: 'recorder/Recorder',
                    params: this.cameraData
                  });
                }
              })
            } else {
              Logger.error(TAG, 'get outputfd failed!');
            }
          })
          .width('48%')
          .height('40vp')
      }
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Bottom)
      .margin({ bottom: '44vp' })
      .width('100%')
      .height('52vp')
    }
    .justifyContent(FlexAlign.End)
    .padding({ left: '16vp', right: '16vp' })
    .width('100%')
    .height('100%')
  }

  @Builder
  MediaInfoRowView(row: MediaInfoRow) {
    Row() {
      Text(row.label)
        .width('42%')
        .fontSize('14fp')
        .fontColor('#66727D')
      Text(row.value)
        .width('58%')
        .fontSize('14fp')
        .fontColor('#182431')
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
  }

  @Builder
  MediaInfoSectionView(section: MediaInfoSection) {
    Column({ space: 8 }) {
      Text(section.title)
        .width('100%')
        .fontSize('18fp')
        .fontWeight(FontWeight.Bold)
        .fontColor('#182431')
      ForEach(section.rows, (row: MediaInfoRow) => {
        this.MediaInfoRowView(row)
      }, (row: MediaInfoRow) => row.label)
      if (section.rawText.length > 0) {
        Text(section.rawText)
          .width('100%')
          .fontSize('12fp')
          .fontFamily('monospace')
          .fontColor('#E6EDF3')
          .backgroundColor('#202830')
          .borderRadius('8vp')
          .padding('12vp')
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White)
    .borderRadius('8vp')
    .padding('14vp')
  }

  @Builder
  MediaInfoPanel() {
    Scroll() {
      Column({ space: 12 }) {
        ForEach(this.mediaInfoSections, (section: MediaInfoSection) => {
          this.MediaInfoSectionView(section)
        }, (section: MediaInfoSection) => section.title)
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', bottom: '24vp' })
    }
    .size({ width: '100%', height: '100%' })
    .scrollBar(BarState.Auto)
  }

  @Builder
  Window() {
    Stack({ alignContent: Alignment.TopEnd }) {
      XComponent({
        id: 'player',
        type: XComponentType.SURFACE,
        libraryname: 'player'
      })
        .height(Const.FULL_SIZE)
        .width(Const.FULL_SIZE)
        .gesture(
          GestureGroup(GestureMode.Exclusive,
            LongPressGesture({ repeat: true })// 长按动作存在会连续触发
              .onAction((event: GestureEvent | undefined) => {
                if (!this.buttonEnabled && !this.isStopping) {
                  this.setPlaybackSpeed(2);
                  const message = this.isSmartFluencyAvailable ?
                    $r('app.string.smart_fluency_x2') : 'X2';
                  this.getUIContext().getPromptAction().showToast({ message: message });
                }
              })// 长按动作一结束触发
              .onActionEnd(() => {
                if (!this.buttonEnabled && !this.isStopping) {
                  this.setPlaybackSpeed(1);
                  this.getUIContext().getPromptAction().showToast({ message: 'X1' });
                }
              }),
            /**
             * todo:单击播放窗口播放/暂停
             * TapGesture({ count: 1, fingers: 1 })
             *   .onAction(() => {
             *     if (!this.isStart) {
             *       this.resume()
             *     } else {
             *       this.pause()
             *     }
             *     this.isStart = !this.isStart
             *   })
              */
          )
        )

      if (this.isHdrVividConfirmed) {
        Text('HDR Vivid')
          .fontSize('13fp')
          .fontColor('#E8FFFFFF')
          .backgroundColor('#4D101820')
          .padding({ left: '10vp', right: '10vp', top: '5vp', bottom: '5vp' })
          .borderRadius('4vp')
          .margin({ top: '48vp', right: '16vp' })
          .hitTestBehavior(HitTestMode.None)
      }
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
    .alignRules({
      'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
    })
  }

  build() {
    Stack() {
      this.Window()

      Column() {
        if (this.playbackInfoText.length > 0) {
          Row() {
            Text(this.playbackInfoText)
              .layoutWeight(1)
              .fontSize('12fp')
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
            Button($r('app.string.media_info'))
              .height('24vp')
              .fontSize('12fp')
              .fontColor(Color.White)
              .backgroundColor('#335F8C')
              .onClick(() => {
                this.showMediaInfo();
              })
          }
            .width('100%')
            .height('28vp')
            .backgroundColor('#99000000')
            .margin({ bottom: '8vp' })
            .bindSheet($$this.isMediaInfoVisible, this.MediaInfoPanel(), {
              height: '85%',
              title: {
                title: $r('app.string.media_info_title'),
                subtitle: $r('app.string.media_info_subtitle')
              }
            })
        }
        Row() {
          if (this.buttonEnabled) {
            this.PlayerSettingButton()
          } else {
            Button('Flip')
              .size({
                width: '18.5%',
                height: $r('app.float.index_button_height')
              })
              .margin({ bottom: $r('app.float.button_margin_bottom') })
              .enabled(!this.isStopping)
              .onClick(() => {
                this.getUIContext().showTextPickerDialog({
                  defaultPickerItemHeight: Const.DEFAULT_PICKER_ITEM_HEIGHT,
                  selectedTextStyle: ({
                    font: ({
                      size: Const.SELECTED_TEXT_STYLE_FONT_SIZE
                    })
                  }),
                  range: Const.getTransformTypes(),
                  canLoop: false,
                  alignment: DialogAlignment.Center,
                  backgroundColor: Color.White,
                  backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
                  onAccept: (value: TextPickerResult) => {
                    const transformIndex = getPickerSelectedIndex(value.index);
                    if (isPickerIndexValid(transformIndex, Const.TRANSFORM_TYPE_COUNT)) {
                      this.transformType = transformIndex;
                      this.setTransform(this.transformType);
                    }
                  }
                })
              })
          }


          Blank(5)
          Button(this.buttonEnabled ? $r('app.string.play') :
            this.isStopping ? $r('app.string.stopping') : $r('app.string.stop_playback'))
            .onClick(() => {
              if (this.buttonEnabled) {
                this.selectFile()
              } else {
                this.stopPlayback()
              }
            })
            .size({
              width: '60%',
              height: $r('app.float.index_button_height')
            })
            .enabled(this.buttonEnabled || !this.isStopping)
            .margin({ bottom: $r('app.float.button_margin_bottom') })
          Blank(5)
          Button($r('app.string.adjust_playback_speed'))
            .enabled(!this.buttonEnabled && !this.isStopping)
            .size({
              width: '18.5%',
              height: $r('app.float.index_button_height')
            })
            .margin({ bottom: $r('app.float.button_margin_bottom') })
            .onClick(() => {
              this.getUIContext().getPromptAction().showToast({ message: $r('app.string.alert2') });
              TextPickerDialog.show({
                defaultPickerItemHeight: Const.DEFAULT_PICKER_ITEM_HEIGHT,
                selectedTextStyle: ({
                  font: ({
                    size: Const.SELECTED_TEXT_STYLE_FONT_SIZE
                  })
                }),
                range: Const.PLAYBACK_SPEED,
                canLoop: false,
                alignment: DialogAlignment.Center,
                backgroundColor: Color.White,
                backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
                onAccept: (value: TextPickerResult) => {
                  switch (value.value) {
                    case Const.PLAYBACK_SPEED[0]: {
                      this.setPlaybackSpeed(1);
                      this.getUIContext().getPromptAction().showToast({ message: 'X1' });
                      break;
                    }
                    case Const.PLAYBACK_SPEED[1]: {
                      this.setPlaybackSpeed(2);
                      const message = this.isSmartFluencyAvailable ?
                        $r('app.string.smart_fluency_x2') : 'X2';
                      this.getUIContext().getPromptAction().showToast({ message: message });
                      break;
                    }
                    case Const.PLAYBACK_SPEED[2]: {
                      this.setPlaybackSpeed(3);
                      const message = this.isSmartFluencyAvailable ?
                        $r('app.string.smart_fluency_x3') : 'X3';
                      this.getUIContext().getPromptAction().showToast({ message: message });
                      break;
                    }
                    default:
                      break;
                  }
                }
              })
            })
        }

        Row() {
          this.RecorderSettingButton()
          Blank(5)
          Button($r('app.string.record_mp4'))
            .onClick(async () => {
              await this.prepareRecording(Const.FORMAT_MP4);
            })
            .bindSheet($$this.isShow, this.Authorized, {
              height: 210,
              title: {
                title: $r('app.string.saveButtonTitle')
              }
            })
            .size({
              width: '38%',
              height: $r('app.float.index_button_height')
            })
            .enabled(this.buttonEnabled)
          Blank(5)
          Button($r('app.string.record_flv'))
            .onClick(async () => {
              await this.prepareRecording(Const.FORMAT_FLV);
            })
            .bindSheet($$this.isShowFlv, this.Authorized, {
              height: 210,
              title: {
                title: $r('app.string.saveButtonTitle')
              }
            })
            .size({
              width: '38%',
              height: $r('app.float.index_button_height')
            })
            .enabled(this.buttonEnabled)
        }
      }
      .margin({ top: (this.display.height * 0.7) + 'px' })
      .alignRules({
        'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
        'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
      })
      .padding({ left: '16vp', right: '16vp', bottom: '16vp' })
      .width($r('app.string.full_width'))
      .height($r('app.float.index_column_height'))
      .justifyContent(FlexAlign.End)
    }
    .width($r('app.string.full_width'))
    .height($r('app.string.full_height'))
  }
}
