/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { media } from '@kit.MediaKit'
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
import { formatMediaTime, formatPlaybackInfo, normalizeSeekPosition } from '../model/PlaybackInfoModel'
import { buildMediaInfoSections, MediaInfoRow, MediaInfoSection } from '../model/MediaInfoModel'
import { encoderProfileCameraCheck, setFirstCameraProfile } from '../common/utils/CameraCheck'
import { requestRecordPermissions } from '../common/utils/PermissionUtil'
import {
  getPickerSelectedIndex, isMediaFileEmpty, isPickerIndexValid
} from '../common/utils/MediaUtils'
import picker from '@ohos.file.picker'

const TAG: string = 'Sample_Player';
const DATETIME: DateTimeUtil = new DateTimeUtil();
const PLAYBACK_INFO_UPDATE_INTERVAL_MS: number = 250;
const PLAYBACK_SEEK_STEP_US: number = 100000;
const SEEK_PREVIEW_INTERVAL_MS: number = 100;
const SEEK_PREVIEW_WIDTH: number = 320;
const SEEK_PREVIEW_HEIGHT: number = 180;

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
  @State playbackPositionUs: number = 0;
  @State playbackDurationUs: number = 0;
  @State seekPreviewUs: number = 0;
  @State isSeeking: boolean = false;
  @State playbackState: number = player.PlayerState.IDLE;
  @State playbackHasVideo: boolean = false;
  @State seekPreviewFrame: PixelMap | undefined = undefined;
  @State isHdrVividConfirmed: boolean = false;
  @State isMediaInfoVisible: boolean = false;
  @State isPlayerSettingsVisible: boolean = false;
  @State isRecorderSettingsVisible: boolean = false;
  @State draftPlayerDecoderType: number = 0;
  @State draftPlayerRunMode: number = 0;
  @State draftPlayerSyncMode: number = 0;
  @State draftPlayerDump: boolean = false;
  @State draftRecorderCodec: number = 1;
  @State draftRecorderResolution: number = 1;
  @State draftRecorderFrameRate: number = 0;
  @State draftRecorderSyncMode: number = 0;
  @State mediaInfoSections: MediaInfoSection[] = [];
  private transformType: number = 0;
  private playerSettings: PlayerSettingsModel = new PlayerSettingsModel();
  private recorderSettings: RecorderSettingsModel = new RecorderSettingsModel();
  private cameraData: CameraDataModel = new CameraDataModel();
  private selectFilePath: string | null = null;
  private playbackInfoTimer: number = 0;
  private seekPreviewTimer: number = 0;
  private seekPreviewRequestId: number = 0;
  private seekPreviewGeneration: number = 0;
  private seekPreviewFetchRunning: boolean = false;
  private seekPreviewLastFetchTimeMs: number = 0;
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
    this.resetPlaybackProgress();
    this.isHdrVividConfirmed = false;
  }

  startPlaybackInfoUpdates(): void {
    this.stopPlaybackInfoUpdates();
    this.updatePlaybackInfo();
    this.playbackInfoTimer = setInterval(() => {
      this.updatePlaybackInfo();
    }, PLAYBACK_INFO_UPDATE_INTERVAL_MS);
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
    this.playbackState = info.state;
    this.playbackHasVideo = info.hasVideo;
    this.playbackDurationUs = Math.max(0, info.durationUs);
    if (!this.isSeeking) {
      this.playbackPositionUs = normalizeSeekPosition(info.positionUs, this.playbackDurationUs);
      this.seekPreviewUs = this.playbackPositionUs;
    }
    this.playbackInfoText = formatPlaybackInfo(info.state, info.speed, info.durationUs, info.positionUs,
      info.hasVideo, info.hasAudio, info.isSmartFluencyAvailable);
  }

  resetPlaybackProgress(): void {
    this.seekPreviewGeneration++;
    this.cancelSeekPreviewRequest();
    this.releaseSeekPreviewFrame();
    this.playbackPositionUs = 0;
    this.playbackDurationUs = 0;
    this.seekPreviewUs = 0;
    this.isSeeking = false;
    this.playbackState = player.PlayerState.IDLE;
    this.playbackHasVideo = false;
    this.seekPreviewLastFetchTimeMs = 0;
  }

  releaseSeekPreviewFrame(): void {
    if (this.seekPreviewFrame === undefined) {
      return;
    }
    const frame = this.seekPreviewFrame;
    this.seekPreviewFrame = undefined;
    frame.release((error) => {
      if (error !== undefined) {
        Logger.error(TAG, 'Release seek preview frame failed: ' + JSON.stringify(error));
      }
    });
  }

  cancelSeekPreviewRequest(): void {
    this.seekPreviewRequestId++;
    if (this.seekPreviewTimer !== 0) {
      clearTimeout(this.seekPreviewTimer);
      this.seekPreviewTimer = 0;
    }
  }

  scheduleSeekPreview(): void {
    if (!this.playbackHasVideo || this.selectFilePath === null) {
      return;
    }
    this.seekPreviewRequestId++;
    if (this.seekPreviewTimer !== 0 || this.seekPreviewFetchRunning) {
      return;
    }
    const elapsedMs = Date.now() - this.seekPreviewLastFetchTimeMs;
    const delayMs = Math.max(0, SEEK_PREVIEW_INTERVAL_MS - elapsedMs);
    this.seekPreviewTimer = setTimeout(() => {
      this.seekPreviewTimer = 0;
      this.seekPreviewLastFetchTimeMs = Date.now();
      this.fetchSeekPreview(this.seekPreviewUs, this.seekPreviewRequestId, this.seekPreviewGeneration);
    }, delayMs);
  }

  async fetchSeekPreview(targetUs: number, requestId: number, generation: number): Promise<void> {
    if (this.seekPreviewFetchRunning || this.selectFilePath === null) {
      return;
    }
    this.seekPreviewFetchRunning = true;
    let previewFile: fileIo.File | undefined = undefined;
    let imageGenerator: media.AVImageGenerator | undefined = undefined;
    try {
      previewFile = fileIo.openSync(this.selectFilePath, fileIo.OpenMode.READ_ONLY);
      const previewFileState = fileIo.statSync(previewFile.fd);
      imageGenerator = await media.createAVImageGenerator();
      imageGenerator.fdSrc = {
        fd: previewFile.fd,
        offset: Const.DEFAULT_VALUE,
        length: previewFileState.size
      };
      const frame = await imageGenerator.fetchFrameByTime(targetUs,
        media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, {
          width: SEEK_PREVIEW_WIDTH,
          height: SEEK_PREVIEW_HEIGHT
        });
      if (!this.isSeeking || generation !== this.seekPreviewGeneration) {
        frame.release((error) => {
          if (error !== undefined) {
            Logger.error(TAG, 'Release stale seek preview frame failed: ' + JSON.stringify(error));
          }
        });
        return;
      }
      this.releaseSeekPreviewFrame();
      this.seekPreviewFrame = frame;
    } catch (error) {
      if (this.isSeeking && generation === this.seekPreviewGeneration) {
        Logger.error(TAG, 'Fetch seek preview failed: ' + JSON.stringify(error));
      }
    } finally {
      if (imageGenerator !== undefined) {
        try {
          await imageGenerator.release();
        } catch (error) {
          Logger.error(TAG, 'Release image generator failed: ' + JSON.stringify(error));
        }
      }
      if (previewFile !== undefined) {
        try {
          fileIo.closeSync(previewFile);
        } catch (error) {
          Logger.error(TAG, 'Close seek preview file failed: ' + JSON.stringify(error));
        }
      }
      this.seekPreviewFetchRunning = false;
      if (this.isSeeking && (generation !== this.seekPreviewGeneration ||
        requestId !== this.seekPreviewRequestId)) {
        this.scheduleSeekPreview();
      }
    }
  }

  handlePlaybackProgressChange(value: number, mode: SliderChangeMode): void {
    const targetUs = normalizeSeekPosition(value, this.playbackDurationUs);
    this.seekPreviewUs = targetUs;
    this.playbackPositionUs = targetUs;
    if (mode === SliderChangeMode.Begin || mode === SliderChangeMode.Moving) {
      this.isSeeking = true;
      this.scheduleSeekPreview();
      return;
    }
    if (mode !== SliderChangeMode.End && mode !== SliderChangeMode.Click) {
      return;
    }

    this.isSeeking = true;
    this.cancelSeekPreviewRequest();
    let seekSucceeded = false;
    try {
      if (this.playbackState === player.PlayerState.PLAYING) {
        seekSucceeded = player.seekTo(targetUs);
      }
    } catch (error) {
      Logger.error(TAG, 'Seek playback exception: ' + JSON.stringify(error));
    }
    this.isSeeking = false;
    this.releaseSeekPreviewFrame();
    if (!seekSucceeded) {
      Logger.error(TAG, 'Seek playback failed, targetUs: ' + targetUs);
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.seek_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
    this.updatePlaybackInfo();
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
        this.resetPlaybackProgress();
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
          this.resetPlaybackProgress();
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
          this.resetPlaybackProgress();
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
      this.resetPlaybackProgress();
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

  private preparePlayerSettings(): void {
    this.draftPlayerDecoderType = this.playerSettings.videoDecoderType;
    this.draftPlayerRunMode = this.playerSettings.videoDecoderRunMode;
    this.draftPlayerSyncMode = this.playerSettings.videoDecoderSyncMode;
    this.draftPlayerDump = this.playerSettings.enableVideoDump;
  }

  private prepareRecorderSettings(): void {
    this.draftRecorderCodec = this.cameraData.isHDRVivid === Const.TRUE ? 0 :
      this.cameraData.videoCodecMime === Const.MIME_VIDEO_AVC ? 1 : 2;
    this.draftRecorderResolution = this.cameraData.cameraWidth >= Const.VIDEO_WIDTH_4K ? 0 :
      this.cameraData.cameraWidth >= Const.VIDEO_WIDTH_1080P ? 1 : 2;
    this.draftRecorderFrameRate = this.cameraData.frameRate >= Const.FRAMERATE_VIDEO_60FPS ? 1 : 0;
    this.draftRecorderSyncMode = this.cameraData.isSync;
  }

  private getSettingText(resource: Resource): string {
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id);
    } catch (error) {
      Logger.error(TAG, 'Get setting text failed: ' + JSON.stringify(error));
      return '';
    }
  }

  private getDecoderTypeLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_decoder_auto')),
      this.getSettingText($r('app.string.setting_decoder_hardware')),
      this.getSettingText($r('app.string.setting_decoder_software'))
    ];
  }

  private getRenderModeLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_render_direct')),
      this.getSettingText($r('app.string.setting_render_buffer'))
    ];
  }

  private getSyncModeLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_mode_async')),
      this.getSettingText($r('app.string.setting_mode_sync'))
    ];
  }

  private getRecorderCodecLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_codec_hdr_vivid')),
      this.getSettingText($r('app.string.setting_codec_h264')),
      this.getSettingText($r('app.string.setting_codec_h265'))
    ];
  }

  private getResolutionLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_resolution_4k')),
      this.getSettingText($r('app.string.setting_resolution_1080p')),
      this.getSettingText($r('app.string.setting_resolution_720p'))
    ];
  }

  private getFrameRateLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_fps_30')),
      this.getSettingText($r('app.string.setting_fps_60'))
    ];
  }

  private showSettingPicker(range: string[], selected: number, onSelected: (index: number) => void): void {
    this.getUIContext().showTextPickerDialog({
      defaultPickerItemHeight: '48vp',
      selected,
      selectedTextStyle: ({
        font: ({
          size: '18fp'
        })
      }),
      textStyle: ({
        font: ({
          size: '16fp'
        })
      }),
      range,
      canLoop: false,
      alignment: DialogAlignment.Center,
      backgroundColor: Color.White,
      backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK,
      onAccept: (value: TextPickerResult) => {
        const index = getPickerSelectedIndex(value.index);
        if (isPickerIndexValid(index, range.length)) {
          onSelected(index);
        }
      }
    });
  }

  private applyPlayerSettings(): void {
    const values: string[] = [
      Const.VIDEO_DECODE_TYPE[this.draftPlayerDecoderType],
      Const.VIDEO_DECODER_RUN_MODE[this.draftPlayerRunMode],
      Const.VIDEO_DECODER_SYNC_MODE[this.draftPlayerSyncMode],
      this.draftPlayerDump ? Const.VIDEO_DUMP_MODE[1] : Const.VIDEO_DUMP_MODE[0]
    ];
    if (!this.playerSettings.applyPickerValues(values)) {
      Logger.error(TAG, 'Invalid player settings: ' + JSON.stringify(values));
      return;
    }
    this.isPlayerSettingsVisible = false;
    try {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.success'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    } catch (error) {
      Logger.error(TAG, 'Show player settings success prompt failed: ' + JSON.stringify(error));
    }
  }

  private applyRecorderSettings(): void {
    const values: string[] = [
      Const.VIDEO_MIMETYPE[this.draftRecorderCodec],
      Const.VIDEO_RESOLUTION[this.draftRecorderResolution],
      Const.VIDEO_FRAMERATE[this.draftRecorderFrameRate],
      Const.VIDEO_DECODER_SYNC_MODE[this.draftRecorderSyncMode]
    ];
    if (!this.recorderSettings.applyPickerValues(values, this.cameraData)) {
      Logger.error(TAG, 'Invalid recorder settings: ' + JSON.stringify(values));
      return;
    }
    this.isRecorderSettingsVisible = false;
    this.checkIsProfileSupport();
  }

  @Builder
  SettingOptionRow(title: Resource, value: string, onClick: () => void) {
    Row() {
      Text(title)
        .fontSize('16fp')
        .fontColor('#202124')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .layoutWeight(1)
      Text(value)
        .fontSize('14fp')
        .fontColor('#5F6368')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      Text('›')
        .fontSize('24fp')
        .fontColor('#8A8A8A')
        .margin({ left: '8vp' })
    }
      .width('100%')
      .height('56vp')
      .padding({ left: '4vp', right: '4vp' })
      .onClick(onClick)
  }

  @Builder
  SettingSheetFooter(onCancel: () => void, onReset: () => void, onApply: () => void) {
    Row({ space: '8vp' }) {
      Button($r('app.string.setting_restore_defaults'))
        .layoutWeight(1)
        .height('44vp')
        .backgroundColor('#E9EEF6')
        .fontColor('#1A5FB4')
        .onClick(onReset)
      Button($r('app.string.setting_cancel'))
        .layoutWeight(1)
        .height('44vp')
        .backgroundColor('#E9EEF6')
        .fontColor('#1A5FB4')
        .onClick(onCancel)
      Button($r('app.string.setting_apply'))
        .layoutWeight(1)
        .height('44vp')
        .backgroundColor('#0A59F7')
        .fontColor(Color.White)
        .onClick(onApply)
    }
      .width('100%')
      .padding({ top: '12vp', bottom: '8vp' })
  }

  @Builder
  PlayerSettingsSheet() {
    Column() {
      Scroll() {
        Column() {
          this.SettingOptionRow($r('app.string.setting_decoder_type'),
            this.getDecoderTypeLabels()[this.draftPlayerDecoderType], () => {
              this.showSettingPicker(this.getDecoderTypeLabels(), this.draftPlayerDecoderType,
                (index: number) => this.draftPlayerDecoderType = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_run_mode'),
            this.getRenderModeLabels()[this.draftPlayerRunMode], () => {
              this.showSettingPicker(this.getRenderModeLabels(), this.draftPlayerRunMode,
                (index: number) => this.draftPlayerRunMode = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_sync_mode'),
            this.getSyncModeLabels()[this.draftPlayerSyncMode], () => {
              this.showSettingPicker(this.getSyncModeLabels(), this.draftPlayerSyncMode,
                (index: number) => this.draftPlayerSyncMode = index);
            })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_dump'))
              .fontSize('16fp')
              .fontColor('#202124')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerDump })
              .onChange((isOn: boolean) => this.draftPlayerDump = isOn)
          }
            .width('100%')
            .height('56vp')
            .padding({ left: '4vp', right: '4vp' })
        }
          .width('100%')
      }
        .layoutWeight(1)
        .scrollBar(BarState.Auto)
      this.SettingSheetFooter(
        () => this.isPlayerSettingsVisible = false,
        () => {
          this.draftPlayerDecoderType = 0;
          this.draftPlayerRunMode = 0;
          this.draftPlayerSyncMode = 0;
          this.draftPlayerDump = false;
        },
        () => this.applyPlayerSettings()
      )
    }
      .width('100%')
      .height('100%')
      .padding({ left: '20vp', right: '20vp' })
      .backgroundColor('#F8F9FA')
  }

  @Builder
  RecorderSettingsSheet() {
    Column() {
      Scroll() {
        Column() {
          this.SettingOptionRow($r('app.string.setting_codec'),
            this.getRecorderCodecLabels()[this.draftRecorderCodec], () => {
              this.showSettingPicker(this.getRecorderCodecLabels(), this.draftRecorderCodec,
                (index: number) => this.draftRecorderCodec = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_resolution'),
            this.getResolutionLabels()[this.draftRecorderResolution], () => {
              this.showSettingPicker(this.getResolutionLabels(), this.draftRecorderResolution,
                (index: number) => this.draftRecorderResolution = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_frame_rate'),
            this.getFrameRateLabels()[this.draftRecorderFrameRate], () => {
              this.showSettingPicker(this.getFrameRateLabels(), this.draftRecorderFrameRate,
                (index: number) => this.draftRecorderFrameRate = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_sync_mode'),
            this.getSyncModeLabels()[this.draftRecorderSyncMode], () => {
              this.showSettingPicker(this.getSyncModeLabels(), this.draftRecorderSyncMode,
                (index: number) => this.draftRecorderSyncMode = index);
            })
        }
          .width('100%')
      }
        .layoutWeight(1)
        .scrollBar(BarState.Auto)
      this.SettingSheetFooter(
        () => this.isRecorderSettingsVisible = false,
        () => {
          this.draftRecorderCodec = 1;
          this.draftRecorderResolution = 1;
          this.draftRecorderFrameRate = 0;
          this.draftRecorderSyncMode = 0;
        },
        () => this.applyRecorderSettings()
      )
    }
      .width('100%')
      .height('100%')
      .padding({ left: '20vp', right: '20vp' })
      .backgroundColor('#F8F9FA')
  }

  @Builder
  PlayerSettingButton() {
    Button($r('app.string.setting'))
      .size({
        width: '18.5%',
        height: $r('app.float.index_button_height')
      })
      .margin({ bottom: $r('app.float.button_margin_bottom') })
      .onClick(() => {
        this.preparePlayerSettings();
        this.isPlayerSettingsVisible = true;
      })
      .bindSheet($$this.isPlayerSettingsVisible, this.PlayerSettingsSheet(), {
        height: '70%',
        title: {
          title: $r('app.string.player_settings_title'),
          subtitle: $r('app.string.player_settings_subtitle')
        }
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
      .onClick(() => {
        this.prepareRecorderSettings();
        this.isRecorderSettingsVisible = true;
      })
      .bindSheet($$this.isRecorderSettingsVisible, this.RecorderSettingsSheet(), {
        height: '70%',
        title: {
          title: $r('app.string.recorder_settings_title'),
          subtitle: $r('app.string.recorder_settings_subtitle')
        }
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

  @Builder
  SeekPreviewPanel() {
    if (this.isSeeking && this.seekPreviewFrame !== undefined) {
      Column() {
        Image(this.seekPreviewFrame)
          .width('160vp')
          .height('90vp')
          .objectFit(ImageFit.Contain)
        Text(formatMediaTime(this.seekPreviewUs))
          .fontSize('12fp')
          .fontColor(Color.White)
          .margin({ top: '4vp' })
      }
        .padding('6vp')
        .backgroundColor('#CC101820')
        .borderRadius('6vp')
        .margin({ bottom: '6vp' })
        .hitTestBehavior(HitTestMode.None)
    }
  }

  @Builder
  PlaybackProgressPanel() {
    Column() {
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
      Row({ space: '8vp' }) {
        Text(formatMediaTime(this.isSeeking ? this.seekPreviewUs : this.playbackPositionUs))
          .width('48vp')
          .fontSize('12fp')
          .fontColor(Color.White)
          .textAlign(TextAlign.End)
        Slider({
          value: this.isSeeking ? this.seekPreviewUs : this.playbackPositionUs,
          min: 0,
          max: Math.max(this.playbackDurationUs, 1),
          step: Math.min(PLAYBACK_SEEK_STEP_US, Math.max(this.playbackDurationUs, 1)),
          style: SliderStyle.OutSet
        })
          .layoutWeight(1)
          .height('28vp')
          .blockColor(Color.White)
          .trackColor('#667080')
          .selectedColor('#5DA9FF')
          .showTips(false)
          .enabled(this.playbackState === player.PlayerState.PLAYING &&
            !this.isStopping && this.playbackDurationUs > 0)
          .onChange((value: number, mode: SliderChangeMode) => {
            this.handlePlaybackProgressChange(value, mode);
          })
        Text(formatMediaTime(this.playbackDurationUs))
          .width('48vp')
          .fontSize('12fp')
          .fontColor(Color.White)
      }
        .width('100%')
        .height('32vp')
    }
      .width('100%')
      .height('64vp')
      .padding({ left: '8vp', right: '8vp' })
      .backgroundColor('#99000000')
      .margin({ bottom: '8vp' })
      .clip(false)
      .overlay(this.SeekPreviewPanel(), {
        align: Alignment.Top,
        offset: { x: 0, y: -124 }
      })
      .bindSheet($$this.isMediaInfoVisible, this.MediaInfoPanel(), {
        height: '85%',
        title: {
          title: $r('app.string.media_info_title'),
          subtitle: $r('app.string.media_info_subtitle')
        }
      })
  }

  build() {
    Stack() {
      this.Window()

      Column() {
        if (this.playbackInfoText.length > 0) {
          this.PlaybackProgressPanel()
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
