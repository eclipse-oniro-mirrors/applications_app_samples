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
import player, { MediaTrackInfo } from 'libplayer.so'
import recorder from 'librecorder.so'
import Logger from '../common/utils/Logger'
import DateTimeUtil from '../common/utils/DateTimeUtil'
import { CommonConstants as Const } from '../common/CommonConstants'
import { CameraDataModel } from '../model/CameraDataModel'
import { PlayerSettingsModel } from '../model/PlayerSettingsModel'
import { RecorderSettingsModel } from '../model/RecorderSettingsModel'
import { buildMediaInfoSections, MediaInfoSection } from '../model/MediaInfoModel'
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel'
import { findSubtitleText, parseSrt, SubtitleCue } from '../model/SubtitleModel'
import { MediaInfoPanel as MediaInfoPanelComponent } from '../components/MediaInfoPanel'
import { PlaybackProgressPanel as PlaybackProgressPanelComponent } from '../components/PlaybackProgressPanel'
import { encoderProfileCameraCheck, setFirstCameraProfile } from '../common/utils/CameraCheck'
import { requestRecordPermissions } from '../common/utils/PermissionUtil'
import {
  getPickerSelectedIndex, isMediaFileEmpty, isPickerIndexValid
} from '../common/utils/MediaUtils'
import picker from '@ohos.file.picker'

const TAG: string = 'Sample_Player';
const DATETIME: DateTimeUtil = new DateTimeUtil();
const SEEK_PREVIEW_INTERVAL_MS: number = 100;
const SEEK_PREVIEW_WIDTH: number = 320;
const SEEK_PREVIEW_HEIGHT: number = 180;

@Entry
@Component
export struct Player {
  @State buttonEnabled: boolean = true;
  @State isShow: boolean = false;
  @State isSmartFluencySupported: boolean = false;
  @State thermalWarningActive: boolean = false;
  @State isStopping: boolean = false;
  @State playbackViewModel: PlaybackViewModel = new PlaybackViewModel();
  @State isPlaybackProgressVisible: boolean = false;
  @State isMediaInfoVisible: boolean = false;
  @State isPlayerSettingsVisible: boolean = false;
  @State isRecorderSettingsVisible: boolean = false;
  @State draftPlayerDecoderType: number = 0;
  @State draftPlayerRunMode: number = 0;
  @State draftPlayerSyncMode: number = 0;
  @State draftPlayerDump: boolean = false;
  @State draftPlayerRetainLastFrame: boolean = true;
  @State draftPlayerLowLatency: boolean = false;
  @State draftPlayerOutputInDecodingOrder: boolean = false;
  @State draftPlayerConvertHdrVividToBt709: boolean = false;
  @State draftPlayerAudioVolume: number = 100;
  @State draftPlayerAudioLowLatency: boolean = false;
  @State draftPlayerAudioTrackIndex: number = -1;
  @State subtitleText: string = '';
  @State audioMuted: boolean = false;
  @State draftRecorderCodec: number = 1;
  @State draftRecorderOutputFormat: number = 0;
  @State draftRecorderResolution: number = 1;
  @State draftRecorderFrameRate: number = 0;
  @State draftRecorderSyncMode: number = 0;
  @State draftRecorderBitrate: number = 1;
  @State draftRecorderBitrateMode: number = 0;
  @State draftRecorderIFrameInterval: number = 0;
  @State draftRecorderAudioSampleRate: number = 1;
  @State draftRecorderAudioChannelCount: number = 1;
  @State draftRecorderAudioBitrate: number = 0;
  @State draftRecorderAudioLatency: number = 0;
  @State draftRecorderStabilization: number = 1;
  @State mediaInfoSections: MediaInfoSection[] = [];
  private transformType: number = 0;
  private playerSettings: PlayerSettingsModel = new PlayerSettingsModel();
  private recorderSettings: RecorderSettingsModel = new RecorderSettingsModel();
  private cameraData: CameraDataModel = new CameraDataModel();
  private selectFilePath: string | null = null;
  private seekPreviewTimer: number = 0;
  private seekPreviewRequestId: number = 0;
  private seekPreviewGeneration: number = 0;
  private seekPreviewFetchRunning: boolean = false;
  private subtitleCues: SubtitleCue[] = [];
  private volumeBeforeMute: number = 100;
  private pendingAudioTrackRestart: boolean = false;
  private seekPreviewLastFetchTimeMs: number = 0;
  private display = display.getDefaultDisplaySync();
  private sourcePath: string[] =
    [globalThis.context.resourceManager.getStringSync($r('app.string.select_from_filemanager').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.select_from_album').id)];

  aboutToAppear() {
    this.playbackViewModel.onPlaybackPositionChanged = (positionUs: number): void => this.updateSubtitle(positionUs);
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
    this.playbackViewModel.isHdrVividConfirmed = false;
    this.subtitleCues = [];
    this.subtitleText = '';
    this.pendingAudioTrackRestart = false;
  }

  startPlaybackInfoUpdates(): void {
    this.playbackViewModel.startUpdates();
    this.isPlaybackProgressVisible = true;
  }

  stopPlaybackInfoUpdates(): void {
    this.playbackViewModel.stopUpdates();
  }

  updatePlaybackInfo(): void {
    this.playbackViewModel.update();
    this.updateSubtitle(this.playbackViewModel.positionUs);
  }

  private updateSubtitle(positionUs: number): void {
    this.subtitleText = findSubtitleText(this.subtitleCues, positionUs);
  }

  async selectSubtitleFile(): Promise<void> {
    try {
      const options = new picker.DocumentSelectOptions();
      options.fileSuffixFilters = ['SRT|.srt'];
      const result = await new picker.DocumentViewPicker().select(options);
      if (result.length === 0) {
        return;
      }
      const content = await fileIo.readText(result[0], { encoding: 'UTF-8' });
      this.subtitleCues = parseSrt(content);
      this.updateSubtitle(this.playbackViewModel.positionUs);
      this.getUIContext().getPromptAction().showToast({
        message: this.subtitleCues.length > 0 ? $r('app.string.playback_subtitle_loaded') :
          $r('app.string.playback_subtitle_empty'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    } catch (error) {
      Logger.error(TAG, 'Load SRT subtitle failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.playback_subtitle_failed'), duration: Const.DURATION, bottom: Const.BOTTOM
      });
    }
  }

  private selectAudioTrack(): void {
    let tracks: MediaTrackInfo[] = [];
    try {
      tracks = player.getMediaInfo().tracks.filter(
        (track: MediaTrackInfo) => track.type === 0
      );
    } catch (error) {
      Logger.error(TAG, 'Get audio tracks failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.playback_audio_track_failed'), duration: Const.DURATION, bottom: Const.BOTTOM
      });
      return;
    }
    if (tracks.length <= 1) {
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.playback_no_audio_track') });
      return;
    }
    const labels = tracks.map((track: MediaTrackInfo, index: number) =>
      '音轨 ' + (index + 1) + ' (ID ' + track.index + ')');
    TextPickerDialog.show({
      range: labels,
      canLoop: false,
      selected: Math.max(0,
        tracks.findIndex((track: MediaTrackInfo) => track.index === this.playerSettings.audioTrackIndex)),
      onAccept: (value: TextPickerResult) => {
        const selected = getPickerSelectedIndex(value.index);
        if (selected >= 0 && selected < tracks.length) {
          this.playerSettings.audioTrackIndex = tracks[selected].index;
          if (!this.buttonEnabled && !this.isStopping) {
            this.pendingAudioTrackRestart = true;
            this.stopPlayback();
          }
          this.getUIContext().getPromptAction().showToast({ message: $r('app.string.playback_audio_track') });
        }
      }
    });
  }

  private toggleMute(): void {
    if (this.audioMuted) {
      player.setVolume(this.volumeBeforeMute / 100);
      this.audioMuted = false;
      return;
    }
    this.volumeBeforeMute = this.playerSettings.audioVolume;
    player.setVolume(0);
    this.audioMuted = true;
  }

  resetPlaybackProgress(): void {
    this.seekPreviewGeneration++;
    this.cancelSeekPreviewRequest();
    this.releaseSeekPreviewFrame();
    this.playbackViewModel.reset();
    this.isPlaybackProgressVisible = false;
    this.seekPreviewLastFetchTimeMs = 0;
  }

  releaseSeekPreviewFrame(): void {
    if (this.playbackViewModel.seekPreviewFrame === undefined) {
      return;
    }
    const frame = this.playbackViewModel.seekPreviewFrame;
    this.playbackViewModel.seekPreviewFrame = undefined;
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
    if (!this.playbackViewModel.hasVideo || this.selectFilePath === null) {
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
      this.fetchSeekPreview(this.playbackViewModel.seekPreviewUs, this.seekPreviewRequestId,
        this.seekPreviewGeneration);
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
      if (!this.playbackViewModel.isSeeking || generation !== this.seekPreviewGeneration) {
        frame.release((error) => {
          if (error !== undefined) {
            Logger.error(TAG, 'Release stale seek preview frame failed: ' + JSON.stringify(error));
          }
        });
        return;
      }
      this.releaseSeekPreviewFrame();
      this.playbackViewModel.seekPreviewFrame = frame;
    } catch (error) {
      if (this.playbackViewModel.isSeeking && generation === this.seekPreviewGeneration) {
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
      if (this.playbackViewModel.isSeeking && (generation !== this.seekPreviewGeneration ||
        requestId !== this.seekPreviewRequestId)) {
        this.scheduleSeekPreview();
      }
    }
  }

  handlePlaybackProgressChange(value: number, mode: SliderChangeMode): void {
    const targetUs = this.playbackViewModel.setSeekPosition(value);
    if (mode === SliderChangeMode.Begin || mode === SliderChangeMode.Moving) {
      this.playbackViewModel.isSeeking = true;
      this.scheduleSeekPreview();
      return;
    }
    if (mode !== SliderChangeMode.End && mode !== SliderChangeMode.Click) {
      return;
    }

    this.playbackViewModel.isSeeking = true;
    this.cancelSeekPreviewRequest();
    let seekSucceeded = false;
    try {
      if (this.playbackViewModel.state === player.PlayerState.PLAYING ||
        this.playbackViewModel.state === player.PlayerState.PAUSED) {
        seekSucceeded = player.seekTo(targetUs);
      }
    } catch (error) {
      Logger.error(TAG, 'Seek playback exception: ' + JSON.stringify(error));
    }
    this.playbackViewModel.isSeeking = false;
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

  private seekBySeconds(offsetSeconds: number): void {
    const info = player.getPlaybackInfo();
    if ((info.state !== player.PlayerState.PLAYING && info.state !== player.PlayerState.PAUSED) ||
      info.durationUs <= 0) {
      return;
    }
    const targetUs = Math.max(0, Math.min(info.durationUs, info.positionUs + offsetSeconds * 1000000));
    if (!player.seekTo(targetUs)) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.seek_failed'), duration: Const.DURATION, bottom: Const.BOTTOM
      });
      return;
    }
    this.playbackViewModel.update();
  }

  private togglePlaybackPause(): void {
    const paused = this.playbackViewModel.state === player.PlayerState.PAUSED;
    const success = paused ? player.resume() : player.pause();
    if (!success) {
      Logger.error(TAG, (paused ? 'Resume' : 'Pause') + ' playback failed');
      return;
    }
    this.playbackViewModel.update();
  }

  private replaySelectedFile(): void {
    if (this.selectFilePath === null) {
      this.showNoMediaSelectedPrompt();
      return;
    }
    this.play();
  }

  updateMediaInfo(): void {
    this.mediaInfoSections = buildMediaInfoSections(player.getMediaInfo());
  }

  showMediaInfo(): void {
    this.updateMediaInfo();
    this.isMediaInfoVisible = this.mediaInfoSections.length > 0;
  }

  private showNoMediaSelectedPrompt(): void {
    try {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_not_selected'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    } catch (error) {
      Logger.error(TAG, 'Show no-media-selected prompt failed: ' + JSON.stringify(error));
    }
  }

  async selectDocFile(): Promise<void> {
    try {
      const documentSelectOptions = new picker.DocumentSelectOptions();
      const documentViewPicker = new picker.DocumentViewPicker();
      const documentSelectResult = await documentViewPicker.select(documentSelectOptions);
      if (documentSelectResult.length === 0) {
        Logger.info(TAG, 'No document selected');
        this.showNoMediaSelectedPrompt();
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
        this.showNoMediaSelectedPrompt();
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
        this.audioMuted = false;
        this.volumeBeforeMute = this.playerSettings.audioVolume;
        this.playbackViewModel.isHdrVividConfirmed = false;
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
          this.playbackViewModel.isSmartFluencyAvailable = false;
          this.playbackViewModel.isHdrVividConfirmed = false;
          this.stopPlaybackInfoUpdates();
          this.resetPlaybackProgress();
          this.isMediaInfoVisible = false;
          this.mediaInfoSections = [];
          closeInputFile();
          const restartWithSelectedAudioTrack = this.pendingAudioTrackRestart;
          this.pendingAudioTrackRestart = false;
          // stop() is an expected completion when changing the selected audio track.
          // Do not report it as a corrupt file; the callback below restarts playback.
          if (!result.success && result.reason !== 'stopped' && !failurePromptShown) {
            failurePromptShown = true;
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.media_file_invalid'),
              duration: Const.DURATION,
              bottom: Const.BOTTOM
            });
          }
          if (restartWithSelectedAudioTrack && result.reason === 'stopped') {
            setTimeout(() => this.play(), 0);
          }
        });
        closeInCallback = true;
        if (!started) {
          this.playbackViewModel.isSmartFluencyAvailable = false;
          this.playbackViewModel.isHdrVividConfirmed = false;
          this.resetPlaybackProgress();
          failurePromptShown = true;
          Logger.error(TAG, 'Player initialization or startup failed');
          this.getUIContext().getPromptAction().showToast({
            message: $r('app.string.media_file_invalid'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
        } else {
          this.playbackViewModel.isSmartFluencyAvailable = player.isSmartFluencyAvailable();
          this.updateMediaInfo();
          this.startPlaybackInfoUpdates();
          Logger.info(TAG, 'Smart fluency available: ' + this.playbackViewModel.isSmartFluencyAvailable);
        }
      } finally {
        if (!closeInCallback) {
          closeInputFile();
        }
      }
    } catch (error) {
      this.buttonEnabled = true;
      this.isStopping = false;
      this.playbackViewModel.isSmartFluencyAvailable = false;
      this.playbackViewModel.isHdrVividConfirmed = false;
      this.resetPlaybackProgress();
      Logger.error(TAG, 'Open or inspect player input file failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_open_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
  }

  async prepareRecording(): Promise<void> {
    const context = this.getUIContext().getHostContext();
    if (context === undefined || !await requestRecordPermissions(context)) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.record_permission_required'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
      return;
    }

    this.isShow = true;
  }

  async checkIsProfileSupport(): Promise<void> {
    let cameraManager: camera.CameraManager = camera.getCameraManager(getContext(this));
    if (!cameraManager) {
      Logger.error(TAG, 'camera.getCameraManager error!');
    }

    let encoderProfile = await encoderProfileCameraCheck(cameraManager, this.cameraData);
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
        let encoderProfile = await setFirstCameraProfile(cameraManager);
        if (!encoderProfile) {
          Logger.error(TAG, 'No fallback video profile is available');
          return;
        }
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
    this.draftPlayerRetainLastFrame = this.playerSettings.retainLastFrame;
    this.draftPlayerLowLatency = this.playerSettings.enableLowLatency;
    this.draftPlayerOutputInDecodingOrder = this.playerSettings.outputInDecodingOrder;
    this.draftPlayerConvertHdrVividToBt709 = this.playerSettings.convertHdrVividToBt709;
    this.draftPlayerAudioVolume = Math.round(this.playerSettings.audioVolume);
    this.draftPlayerAudioLowLatency = this.playerSettings.enableAudioLowLatency;
    this.draftPlayerAudioTrackIndex = this.playerSettings.audioTrackIndex;
  }

  private prepareRecorderSettings(): void {
    this.draftRecorderOutputFormat = this.cameraData.outputFormat === Const.FORMAT_FLV ? 1 : 0;
    this.draftRecorderCodec = this.cameraData.isHDRVivid === Const.TRUE ? 0 :
      this.cameraData.videoCodecMime === Const.MIME_VIDEO_AVC ? 1 : 2;
    this.draftRecorderResolution = this.cameraData.cameraWidth >= Const.VIDEO_WIDTH_4K ? 0 :
      this.cameraData.cameraWidth >= Const.VIDEO_WIDTH_1080P ? 1 : 2;
    this.draftRecorderFrameRate = this.cameraData.frameRate >= Const.FRAMERATE_VIDEO_60FPS ? 1 : 0;
    this.draftRecorderSyncMode = this.cameraData.isSync;
    this.draftRecorderBitrate = this.cameraData.bitRate <= Const.BITRATE_VIDEO_10M ? 0 :
      this.cameraData.bitRate >= Const.BITRATE_VIDEO_30M ? 2 : 1;
    this.draftRecorderBitrateMode = this.cameraData.bitrateMode === Const.VIDEO_BITRATE_MODE_VBR ? 1 : 0;
    this.draftRecorderIFrameInterval = this.cameraData.iFrameInterval <= Const.I_FRAME_INTERVAL_100_MS ? 0 :
      this.cameraData.iFrameInterval <= Const.I_FRAME_INTERVAL_1_S ? 1 : 2;
    this.draftRecorderAudioSampleRate = this.cameraData.audioSampleRate <= Const.AUDIO_SAMPLE_RATE_44100 ? 0 : 1;
    this.draftRecorderAudioChannelCount = this.cameraData.audioChannelCount === Const.AUDIO_CHANNEL_COUNT_MONO ? 0 : 1;
    this.draftRecorderAudioBitrate = this.cameraData.audioBitRate <= Const.AUDIO_BITRATE_32K ? 0 :
      this.cameraData.audioBitRate >= Const.AUDIO_BITRATE_128K ? 2 : 1;
    this.draftRecorderAudioLatency =
      this.cameraData.audioCaptureLatencyMode === Const.AUDIO_CAPTURE_LATENCY_LOW ?
      1 : 0;
    this.draftRecorderStabilization =
      this.cameraData.videoStabilizationMode === Const.VIDEO_STABILIZATION_DISABLED ?
      0 : 1;
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

  private getRecorderBitrateLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_bitrate_10m')),
      this.getSettingText($r('app.string.setting_bitrate_20m')),
      this.getSettingText($r('app.string.setting_bitrate_30m'))
    ];
  }

  private getRecorderBitrateModeLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_bitrate_mode_cbr')),
      this.getSettingText($r('app.string.setting_bitrate_mode_vbr'))
    ];
  }

  private getRecorderIFrameIntervalLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_i_frame_interval_100ms')),
      this.getSettingText($r('app.string.setting_i_frame_interval_1s')),
      this.getSettingText($r('app.string.setting_i_frame_interval_2s'))
    ];
  }

  private getRecorderAudioSampleRateLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_audio_sample_rate_44100')),
      this.getSettingText($r('app.string.setting_audio_sample_rate_48000'))
    ];
  }

  private getRecorderAudioChannelCountLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_audio_channel_mono')),
      this.getSettingText($r('app.string.setting_audio_channel_stereo'))
    ];
  }

  private getRecorderAudioBitrateLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_audio_bitrate_32k')),
      this.getSettingText($r('app.string.setting_audio_bitrate_64k')),
      this.getSettingText($r('app.string.setting_audio_bitrate_128k'))
    ];
  }

  private getRecorderAudioLatencyLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_audio_latency_normal')),
      this.getSettingText($r('app.string.setting_audio_latency_low'))
    ];
  }

  private getRecorderStabilizationLabels(): string[] {
    return [
      this.getSettingText($r('app.string.setting_stabilization_disabled')),
      this.getSettingText($r('app.string.setting_stabilization_auto'))
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
      this.draftPlayerDump ? Const.VIDEO_DUMP_MODE[1] : Const.VIDEO_DUMP_MODE[0],
      this.draftPlayerRetainLastFrame ? Const.VIDEO_LAST_FRAME_MODE[0] : Const.VIDEO_LAST_FRAME_MODE[1],
      this.draftPlayerLowLatency ? Const.VIDEO_FEATURE_MODE[1] : Const.VIDEO_FEATURE_MODE[0],
      this.draftPlayerOutputInDecodingOrder ? Const.VIDEO_FEATURE_MODE[1] : Const.VIDEO_FEATURE_MODE[0],
      this.draftPlayerConvertHdrVividToBt709 ? Const.VIDEO_FEATURE_MODE[1] : Const.VIDEO_FEATURE_MODE[0],
      this.draftPlayerAudioLowLatency ? Const.AUDIO_RENDERER_LATENCY_MODE[1] : Const.AUDIO_RENDERER_LATENCY_MODE[0]
    ];
    if (!this.playerSettings.applyPickerValues(values, this.draftPlayerAudioVolume)) {
      Logger.error(TAG, 'Invalid player settings: ' + JSON.stringify(values));
      return;
    }
    this.isPlayerSettingsVisible = false;
    player.setVolume(this.playerSettings.audioVolume / 100);
    this.audioMuted = false;
    this.volumeBeforeMute = this.playerSettings.audioVolume;
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
      Const.OUTPUT_FORMAT[this.draftRecorderOutputFormat],
      Const.VIDEO_MIMETYPE[this.draftRecorderCodec],
      Const.VIDEO_RESOLUTION[this.draftRecorderResolution],
      Const.VIDEO_FRAMERATE[this.draftRecorderFrameRate],
      Const.VIDEO_DECODER_SYNC_MODE[this.draftRecorderSyncMode],
      Const.VIDEO_BITRATE[this.draftRecorderBitrate],
      Const.VIDEO_BITRATE_MODE[this.draftRecorderBitrateMode],
      Const.VIDEO_I_FRAME_INTERVAL[this.draftRecorderIFrameInterval],
      Const.AUDIO_SAMPLE_RATE[this.draftRecorderAudioSampleRate],
      Const.AUDIO_CHANNEL_COUNT[this.draftRecorderAudioChannelCount],
      Const.AUDIO_BITRATE[this.draftRecorderAudioBitrate],
      Const.AUDIO_CAPTURE_LATENCY_MODE[this.draftRecorderAudioLatency],
      Const.VIDEO_STABILIZATION_MODE[this.draftRecorderStabilization]
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
  SettingGroupHeader(title: Resource) {
    Row() {
      Text(title)
        .fontSize('13fp')
        .fontColor('#5F6368')
        .fontWeight(FontWeight.Medium)
    }
      .width('100%')
      .height('36vp')
      .padding({ left: '4vp', right: '4vp', top: '10vp', bottom: '4vp' })
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
          Divider().color('#E5E7EB')
          Column() {
            Row() {
              Text($r('app.string.setting_audio_volume'))
                .fontSize('16fp').fontColor('#202124').layoutWeight(1)
              Text(this.draftPlayerAudioVolume.toFixed(0) + '%')
                .fontSize('14fp').fontColor('#5F6368')
            }.width('100%')
            Slider({ value: this.draftPlayerAudioVolume, min: 0, max: 100, step: 1 })
              .width('100%').blockColor('#0A59F7').selectedColor('#5DA9FF')
              .onChange((value: number) => this.draftPlayerAudioVolume = value)
          }
            .width('100%').padding({ top: '8vp', bottom: '8vp' })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_audio_latency'))
              .fontSize('16fp').fontColor('#202124').layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerAudioLowLatency })
              .onChange((isOn: boolean) => this.draftPlayerAudioLowLatency = isOn)
          }
            .width('100%').height('56vp').padding({ left: '4vp', right: '4vp' })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_retain_last_frame'))
              .fontSize('16fp')
              .fontColor('#202124')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerRetainLastFrame })
              .enabled(this.draftPlayerRunMode === 0)
              .onChange((isOn: boolean) => this.draftPlayerRetainLastFrame = isOn)
          }
            .width('100%')
            .height('56vp')
            .padding({ left: '4vp', right: '4vp' })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_low_latency'))
              .fontSize('16fp')
              .fontColor('#202124')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerLowLatency })
              .onChange((isOn: boolean) => this.draftPlayerLowLatency = isOn)
          }
            .width('100%')
            .height('56vp')
            .padding({ left: '4vp', right: '4vp' })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_decoding_order_output'))
              .fontSize('16fp')
              .fontColor('#202124')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerOutputInDecodingOrder })
              .onChange((isOn: boolean) => this.draftPlayerOutputInDecodingOrder = isOn)
          }
            .width('100%')
            .height('56vp')
            .padding({ left: '4vp', right: '4vp' })
          Divider().color('#E5E7EB')
          Row() {
            Text($r('app.string.setting_hdr_vivid_to_bt709'))
              .fontSize('16fp')
              .fontColor('#202124')
              .layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerConvertHdrVividToBt709 })
              .onChange((isOn: boolean) => this.draftPlayerConvertHdrVividToBt709 = isOn)
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
          this.draftPlayerRetainLastFrame = true;
          this.draftPlayerLowLatency = false;
          this.draftPlayerOutputInDecodingOrder = false;
          this.draftPlayerConvertHdrVividToBt709 = false;
          this.draftPlayerAudioVolume = 100;
          this.draftPlayerAudioLowLatency = false;
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
          this.SettingGroupHeader($r('app.string.setting_group_output'))
          this.SettingOptionRow($r('app.string.setting_output_format'),
            Const.OUTPUT_FORMAT[this.draftRecorderOutputFormat], () => {
              this.showSettingPicker(Const.OUTPUT_FORMAT, this.draftRecorderOutputFormat,
                (index: number) => this.draftRecorderOutputFormat = index);
            })
          Divider().color('#E5E7EB')
          this.SettingGroupHeader($r('app.string.setting_group_video'))
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
          this.SettingOptionRow($r('app.string.setting_video_bitrate'),
            this.getRecorderBitrateLabels()[this.draftRecorderBitrate], () => {
              this.showSettingPicker(this.getRecorderBitrateLabels(), this.draftRecorderBitrate,
                (index: number) => this.draftRecorderBitrate = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_bitrate_mode'),
            this.getRecorderBitrateModeLabels()[this.draftRecorderBitrateMode], () => {
              this.showSettingPicker(this.getRecorderBitrateModeLabels(), this.draftRecorderBitrateMode,
                (index: number) => this.draftRecorderBitrateMode = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_i_frame_interval'),
            this.getRecorderIFrameIntervalLabels()[this.draftRecorderIFrameInterval], () => {
              this.showSettingPicker(this.getRecorderIFrameIntervalLabels(), this.draftRecorderIFrameInterval,
                (index: number) => this.draftRecorderIFrameInterval = index);
            })
          Divider().color('#E5E7EB')
          this.SettingGroupHeader($r('app.string.setting_group_audio'))
          this.SettingOptionRow($r('app.string.setting_audio_sample_rate'),
            this.getRecorderAudioSampleRateLabels()[this.draftRecorderAudioSampleRate], () => {
              this.showSettingPicker(this.getRecorderAudioSampleRateLabels(), this.draftRecorderAudioSampleRate,
                (index: number) => this.draftRecorderAudioSampleRate = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_audio_channel_count'),
            this.getRecorderAudioChannelCountLabels()[this.draftRecorderAudioChannelCount], () => {
              this.showSettingPicker(this.getRecorderAudioChannelCountLabels(), this.draftRecorderAudioChannelCount,
                (index: number) => this.draftRecorderAudioChannelCount = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_audio_bitrate'),
            this.getRecorderAudioBitrateLabels()[this.draftRecorderAudioBitrate], () => {
              this.showSettingPicker(this.getRecorderAudioBitrateLabels(), this.draftRecorderAudioBitrate,
                (index: number) => this.draftRecorderAudioBitrate = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_audio_capture_latency'),
            this.getRecorderAudioLatencyLabels()[this.draftRecorderAudioLatency], () => {
              this.showSettingPicker(this.getRecorderAudioLatencyLabels(), this.draftRecorderAudioLatency,
                (index: number) => this.draftRecorderAudioLatency = index);
            })
          Divider().color('#E5E7EB')
          this.SettingGroupHeader($r('app.string.setting_group_control'))
          this.SettingOptionRow($r('app.string.setting_sync_mode'),
            this.getSyncModeLabels()[this.draftRecorderSyncMode], () => {
              this.showSettingPicker(this.getSyncModeLabels(), this.draftRecorderSyncMode,
                (index: number) => this.draftRecorderSyncMode = index);
            })
          Divider().color('#E5E7EB')
          this.SettingOptionRow($r('app.string.setting_video_stabilization'),
            this.getRecorderStabilizationLabels()[this.draftRecorderStabilization], () => {
              this.showSettingPicker(this.getRecorderStabilizationLabels(), this.draftRecorderStabilization,
                (index: number) => this.draftRecorderStabilization = index);
            })
        }
          .width('100%')
      }
        .layoutWeight(1)
        .scrollBar(BarState.Auto)
      this.SettingSheetFooter(
        () => this.isRecorderSettingsVisible = false,
        () => {
          this.draftRecorderOutputFormat = 0;
          this.draftRecorderCodec = 1;
          this.draftRecorderResolution = 1;
          this.draftRecorderFrameRate = 0;
          this.draftRecorderSyncMode = 0;
          this.draftRecorderBitrate = 1;
          this.draftRecorderBitrateMode = 0;
          this.draftRecorderIFrameInterval = 0;
          this.draftRecorderAudioSampleRate = 1;
          this.draftRecorderAudioChannelCount = 1;
          this.draftRecorderAudioBitrate = 0;
          this.draftRecorderAudioLatency = 0;
          this.draftRecorderStabilization = 1;
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
        height: '85%',
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
        height: '85%',
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
                this.cameraData.outputFormat, this.cameraData.bitrateMode, this.cameraData.iFrameInterval,
                this.cameraData.audioSampleRate, this.cameraData.audioChannelCount,
                this.cameraData.audioBitRate, this.cameraData.audioCaptureLatencyMode).then((data) => {
                if (data.code === 0 && data.surfaceId !== null) {
                  this.cameraData.surfaceId = data.surfaceId;
                  this.getUIContext().getRouter().pushUrl({
                    url: 'recorder/pages/Recorder',
                    params: this.cameraData
                  });
                } else {
                  Logger.error(TAG, 'Recorder initialization failed, code: ' + data.code);
                  try {
                    fileIo.close(file);
                  } catch (error) {
                    Logger.error(TAG, 'Close unsupported recorder output failed: ' + JSON.stringify(error));
                  }
                  this.getUIContext().getPromptAction().showToast({
                    message: $r('app.string.recorder_configuration_unsupported'),
                    duration: Const.DURATION,
                    bottom: Const.BOTTOM
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
  MediaInfoPanel() {
    MediaInfoPanelComponent({ sections: this.mediaInfoSections })
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
                  const message = this.playbackViewModel.isSmartFluencyAvailable ?
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

      if (this.playbackViewModel.isHdrVividConfirmed) {
        Text('HDR Vivid')
          .fontSize('13fp')
          .fontColor('#E8FFFFFF')
          .backgroundColor('#4D101820')
          .padding({ left: '10vp', right: '10vp', top: '5vp', bottom: '5vp' })
          .borderRadius('4vp')
          .margin({ top: '48vp', right: '16vp' })
          .hitTestBehavior(HitTestMode.None)
      }
      if (this.subtitleText.length > 0) {
        Text(this.subtitleText)
          .fontSize('18fp')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .backgroundColor('#99000000')
          .padding({ left: '12vp', right: '12vp', top: '4vp', bottom: '4vp' })
          .margin({ left: '24vp', right: '24vp', bottom: '72vp' })
          .align(Alignment.Bottom)
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
  PlaybackProgressPanel() {
    PlaybackProgressPanelComponent({
      model: this.playbackViewModel,
      seekEnabled: (this.playbackViewModel.state === player.PlayerState.PLAYING ||
        this.playbackViewModel.state === player.PlayerState.PAUSED) &&
        !this.isStopping && this.playbackViewModel.durationUs > 0,
      onShowMediaInfo: () => this.showMediaInfo(),
      onProgressChange: (value: number, mode: SliderChangeMode) =>
        this.handlePlaybackProgressChange(value, mode)
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
        if (this.isPlaybackProgressVisible) {
          this.PlaybackProgressPanel()
        }
        if (!this.buttonEnabled && !this.isStopping) {
          Column({ space: '6vp' }) {
            Row({ space: '8vp' }) {
              Button($r('app.string.playback_rewind_15s'))
                .layoutWeight(1)
                .fontSize('13fp')
                .onClick(() => this.seekBySeconds(-15))
              Button(this.playbackViewModel.state === player.PlayerState.PAUSED ?
                $r('app.string.playback_resume') : $r('app.string.playback_pause'))
                .layoutWeight(1)
                .fontSize('13fp')
                .onClick(() => this.togglePlaybackPause())
              Button($r('app.string.playback_forward_15s'))
                .layoutWeight(1)
                .fontSize('13fp')
                .onClick(() => this.seekBySeconds(15))
            }
            .width('100%')
            .height('40vp')

            Row({ space: '8vp' }) {
              Button(this.audioMuted ? $r('app.string.playback_unmute') : $r('app.string.playback_mute'))
                .layoutWeight(1)
                .fontSize('13fp')
                .onClick(() => this.toggleMute())
              Button($r('app.string.playback_audio_track'))
                .layoutWeight(1)
                .fontSize('13fp')
                .onClick(() => this.selectAudioTrack())
              Button($r('app.string.playback_subtitle'))
                .layoutWeight(1)
                .fontSize('13fp')
                .onClick(() => this.selectSubtitleFile())
            }
            .width('100%')
            .height('40vp')
          }
          .width('100%')
          .height('86vp')
          .margin({ bottom: '4vp' })
        }
        if (this.buttonEnabled && this.selectFilePath !== null) {
          Button($r('app.string.playback_replay'))
            .width('32%')
            .height('40vp')
            .margin({ bottom: '4vp' })
            .onClick(() => this.replaySelectedFile())
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
                      const message = this.playbackViewModel.isSmartFluencyAvailable ?
                        $r('app.string.smart_fluency_x2') : 'X2';
                      this.getUIContext().getPromptAction().showToast({ message: message });
                      break;
                    }
                    case Const.PLAYBACK_SPEED[2]: {
                      this.setPlaybackSpeed(3);
                      const message = this.playbackViewModel.isSmartFluencyAvailable ?
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
          Button($r('app.string.record'))
            .onClick(async () => {
              await this.prepareRecording();
            })
            .bindSheet($$this.isShow, this.Authorized, {
              height: 210,
              title: {
                title: $r('app.string.saveButtonTitle')
              }
            })
            .size({
              width: '77%',
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
