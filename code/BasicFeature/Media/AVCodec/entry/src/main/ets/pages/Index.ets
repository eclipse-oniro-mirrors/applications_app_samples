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
import { window } from '@kit.ArkUI'
import PiPWindow from '@ohos.PiPWindow'
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
import { formatMediaTime } from '../model/PlaybackInfoModel'
import { PlaybackHistoryEntry, PlaybackHistoryModel, getPlaybackTitle } from '../model/PlaybackHistoryModel'
import { findSubtitleText, parseSrt, SubtitleCue } from '../model/SubtitleModel'
import { MediaInfoPanel as MediaInfoPanelComponent } from '../components/MediaInfoPanel'
import { PlaybackProgressPanel as PlaybackProgressPanelComponent } from '../components/PlaybackProgressPanel'
import { encoderProfileCameraCheck, setFirstCameraProfile } from '../common/utils/CameraCheck'
import { requestRecordPermissions } from '../common/utils/PermissionUtil'
import {
  getPickerSelectedIndex, isMediaFileEmpty, isPickerIndexValid
} from '../common/utils/MediaUtils'
import picker from '@ohos.file.picker'
import common from '@ohos.app.ability.common'

const TAG: string = 'Sample_Player';
const DATETIME: DateTimeUtil = new DateTimeUtil();
const SEEK_PREVIEW_INTERVAL_MS: number = 100;
const SEEK_PREVIEW_WIDTH: number = 320;
const SEEK_PREVIEW_HEIGHT: number = 180;
const PLAYBACK_CONTROLS_HIDE_DELAY_MS: number = 5000;
const VISIBLE_SYSTEM_BARS: ('status' | 'navigation')[] = ['navigation', 'status'];
const BLACK_SYSTEM_BAR_PROPERTIES: window.SystemBarProperties = {
  statusBarColor: '#000000',
  navigationBarColor: '#000000',
  statusBarContentColor: '#FFFFFF',
  navigationBarContentColor: '#FFFFFF'
};

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
  @State isQueueVisible: boolean = false;
  @State isPlaybackToolsVisible: boolean = false;
  @State isDiagnosticsVisible: boolean = false;
  @State isFullscreen: boolean = false;
  @State isPlaybackControlsVisible: boolean = true;
  @State displayScaleMode: number = 0;
  @State recentEntries: PlaybackHistoryEntry[] = [];
  @State queueEntries: string[] = [];
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
  @State draftPlayerAutoHideControls: boolean = true;
  @State abLoopStartUs: number = -1;
  @State abLoopEndUs: number = -1;
  @State isAbLoopEnabled: boolean = false;
  @State isPipActive: boolean = false;
  @State isBackgroundPlaybackEnabled: boolean = false;
  @State subtitleText: string = '';
  @State subtitleDelayIndex: number = 1;
  @State subtitleStyleIndex: number = 1;
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
  private playbackHistory: PlaybackHistoryModel = new PlaybackHistoryModel();
  private queuePaths: string[] = [];
  private queueIndex: number = -1;
  private lastHistoryPositionUs: number = -1;
  private resumeSeekTimer: number = 0;
  private seekPreviewLastFetchTimeMs: number = 0;
  private playbackControlsTimer: number = 0;
  private hasShownAutoHideControlsHint: boolean = false;
  private abLoopTimer: number = 0;
  private abLoopSeekPending: boolean = false;
  private pipController: PiPWindow.PiPController | undefined;
  private readonly xComponentController: XComponentController = new XComponentController();
  private sourcePath: string[] =
    [globalThis.context.resourceManager.getStringSync($r('app.string.select_from_filemanager').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.select_from_album').id)];

  aboutToAppear() {
    this.loadPlaybackHistory();
    this.playbackViewModel.onPlaybackPositionChanged = (positionUs: number): void => {
      this.updateSubtitle(positionUs);
      this.checkAbLoop(positionUs);
      if (this.playbackViewModel.state === player.PlayerState.PLAYING ||
        this.playbackViewModel.state === player.PlayerState.PAUSED) {
        this.persistPlaybackProgress(positionUs, this.playbackViewModel.durationUs);
      }
    };
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
    this.clearPlaybackControlsTimer();
    if (this.resumeSeekTimer !== 0) {
      clearTimeout(this.resumeSeekTimer);
      this.resumeSeekTimer = 0;
    }
    if (this.playbackViewModel.state === player.PlayerState.PLAYING ||
      this.playbackViewModel.state === player.PlayerState.PAUSED) {
      this.persistPlaybackProgress(this.playbackViewModel.positionUs, this.playbackViewModel.durationUs, true);
    }
    this.stopPlaybackInfoUpdates();
    this.resetPlaybackProgress();
    this.playbackViewModel.isHdrVividConfirmed = false;
    this.subtitleCues = [];
    this.subtitleText = '';
    this.resetAbLoop();
  }

  startPlaybackInfoUpdates(): void {
    this.playbackViewModel.startUpdates();
    this.isPlaybackProgressVisible = true;
  }

  private async loadPlaybackHistory(): Promise<void> {
    try {
      await this.playbackHistory.load(this.getUIContext().getHostContext() as common.UIAbilityContext);
      this.recentEntries = this.playbackHistory.getEntries();
    } catch (error) {
      Logger.error(TAG, 'Load playback history failed: ' + JSON.stringify(error));
    }
  }

  private async persistPlaybackProgress(positionUs: number, durationUs: number, force: boolean = false): Promise<void> {
    if (this.selectFilePath === null || durationUs <= 0 || positionUs < 0) {
      return;
    }
    if (!force && this.lastHistoryPositionUs >= 0 && Math.abs(positionUs - this.lastHistoryPositionUs) < 2000000) {
      return;
    }
    this.lastHistoryPositionUs = positionUs;
    await this.playbackHistory.update(this.selectFilePath, getPlaybackTitle(this.selectFilePath),
      positionUs, durationUs);
    this.recentEntries = this.playbackHistory.getEntries();
  }

  private enqueueSelectedPath(path: string): void {
    if (path.length === 0) {
      return;
    }
    if (this.queuePaths.indexOf(path) < 0) {
      this.queuePaths.push(path);
    }
    this.queueEntries = this.queuePaths.slice();
  }

  private async selectQueueFiles(): Promise<void> {
    try {
      const options = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 20;
      const result = await new picker.DocumentViewPicker().select(options);
      if (result.length === 0) {
        this.showNoMediaSelectedPrompt();
        return;
      }
      for (const uri of result) {
        this.enqueueSelectedPath(uri);
      }
      if (this.buttonEnabled) {
        this.queueIndex = this.queueIndex < 0 ? 0 : this.queueIndex;
        this.selectFilePath = this.queuePaths[this.queueIndex];
        this.play(0);
      }
    } catch (error) {
      Logger.error(TAG, 'Select queue files failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_select_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
  }

  private playRecentEntry(entry: PlaybackHistoryEntry): void {
    this.selectFilePath = entry.uri;
    this.queuePaths = [entry.uri];
    this.queueIndex = 0;
    this.queueEntries = this.queuePaths.slice();
    this.play();
    this.isQueueVisible = false;
  }

  private toggleFullscreen(): void {
    const hostContext = this.getUIContext().getHostContext();
    if (hostContext === undefined) {
      return;
    }
    this.isPlaybackToolsVisible = false;
    const targetFullscreen: boolean = !this.isFullscreen;
    this.isFullscreen = targetFullscreen;
    if (targetFullscreen) {
      this.showPlaybackControls();
    } else {
      this.clearPlaybackControlsTimer();
      this.isPlaybackControlsVisible = true;
    }
    window.getLastWindow(hostContext).then((mainWindow: window.Window) => {
      const orientation = targetFullscreen ? window.Orientation.AUTO_ROTATION_LANDSCAPE :
        window.Orientation.UNSPECIFIED;
      mainWindow.setPreferredOrientation(orientation).then(() => {
        return mainWindow.setWindowLayoutFullScreen(targetFullscreen);
      }).then(() => {
        return mainWindow.setWindowSystemBarProperties(BLACK_SYSTEM_BAR_PROPERTIES);
      }).then(() => {
        return mainWindow.setWindowSystemBarEnable(targetFullscreen ? [] : VISIBLE_SYSTEM_BARS);
      }).catch((error: Error) => {
        Logger.error(TAG, 'Update playback window mode failed: ' + JSON.stringify(error));
      });
    }).catch((error: Error) => {
      Logger.error(TAG, 'Get main window failed: ' + JSON.stringify(error));
    });
  }

  private clearPlaybackControlsTimer(): void {
    if (this.playbackControlsTimer !== 0) {
      clearTimeout(this.playbackControlsTimer);
      this.playbackControlsTimer = 0;
    }
  }

  private showPlaybackControls(): void {
    this.isPlaybackControlsVisible = true;
    this.clearPlaybackControlsTimer();
    if (!this.playerSettings.autoHideControls) {
      return;
    }
    this.playbackControlsTimer = setTimeout(() => {
      this.playbackControlsTimer = 0;
      if (this.isPlaybackToolsVisible || this.isQueueVisible || this.isMediaInfoVisible) {
        // Keep the host controls mounted while a sheet is open; otherwise
        // the sheet anchor would be destroyed and the sheet could close.
        this.showPlaybackControls();
      } else if (this.playerSettings.autoHideControls && (this.isFullscreen || !this.buttonEnabled)) {
        this.isPlaybackControlsVisible = false;
        if (!this.hasShownAutoHideControlsHint) {
          this.hasShownAutoHideControlsHint = true;
          this.getUIContext().getPromptAction().showToast({
            message: $r('app.string.playback_controls_auto_hide_tip'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
        }
      }
    }, PLAYBACK_CONTROLS_HIDE_DELAY_MS);
  }

  private handlePlaybackControlInteraction(): void {
    if (!this.buttonEnabled && !this.isStopping) {
      this.showPlaybackControls();
    }
  }

  private closePlaybackTools(): void {
    this.isPlaybackToolsVisible = false;
    this.handlePlaybackControlInteraction();
  }

  private selectDisplayScaleMode(): void {
    TextPickerDialog.show({
      range: [
        this.getSettingText($r('app.string.playback_display_scale_fit')),
        this.getSettingText($r('app.string.playback_display_scale_fill'))
      ],
      selected: this.displayScaleMode,
      canLoop: false,
      onAccept: (value: TextPickerResult) => {
        const index = getPickerSelectedIndex(value.index);
        if (index >= 0 && index <= 1) {
          this.displayScaleMode = index;
        }
      }
    });
  }

  stopPlaybackInfoUpdates(): void {
    this.playbackViewModel.stopUpdates();
  }

  updatePlaybackInfo(): void {
    this.playbackViewModel.update();
    this.updateSubtitle(this.playbackViewModel.positionUs);
    this.checkAbLoop(this.playbackViewModel.positionUs);
    if (this.playbackViewModel.state === player.PlayerState.PLAYING ||
      this.playbackViewModel.state === player.PlayerState.PAUSED) {
      this.persistPlaybackProgress(this.playbackViewModel.positionUs, this.playbackViewModel.durationUs);
    }
  }

  private updateSubtitle(positionUs: number): void {
    const delayUs: number[] = [500000, 0, -500000];
    this.subtitleText = findSubtitleText(this.subtitleCues,
      Math.max(0, positionUs + delayUs[this.subtitleDelayIndex]));
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

  private selectSubtitleDelay(): void {
    const labels: string[] = [
      this.getSettingText($r('app.string.playback_subtitle_early')),
      this.getSettingText($r('app.string.playback_subtitle_sync')),
      this.getSettingText($r('app.string.playback_subtitle_late'))
    ];
    TextPickerDialog.show({
      range: labels,
      selected: this.subtitleDelayIndex,
      canLoop: false,
      onAccept: (value: TextPickerResult) => {
        const selected = getPickerSelectedIndex(value.index);
        if (selected >= 0 && selected < labels.length) {
          this.subtitleDelayIndex = selected;
          this.updateSubtitle(this.playbackViewModel.positionUs);
        }
      }
    });
  }

  private selectSubtitleStyle(): void {
    const labels: string[] = [
      this.getSettingText($r('app.string.playback_subtitle_style_small')),
      this.getSettingText($r('app.string.playback_subtitle_style_medium')),
      this.getSettingText($r('app.string.playback_subtitle_style_large'))
    ];
    TextPickerDialog.show({
      range: labels,
      selected: this.subtitleStyleIndex,
      canLoop: false,
      onAccept: (value: TextPickerResult) => {
        const selected = getPickerSelectedIndex(value.index);
        if (selected >= 0 && selected < labels.length) {
          this.subtitleStyleIndex = selected;
        }
      }
    });
  }

  private getSubtitleFontSize(): string {
    const sizes: string[] = ['16fp', '18fp', '22fp'];
    return this.subtitleStyleIndex >= 0 && this.subtitleStyleIndex < sizes.length ?
      sizes[this.subtitleStyleIndex] : sizes[1];
  }

  private formatAudioTrackLabel(track: MediaTrackInfo, position: number): string {
    const details: string[] = [];
    if (track.codecMime.length > 0) {
      details.push(track.codecMime);
    }
    if (track.audioSampleRate > 0) {
      details.push((track.audioSampleRate / 1000).toFixed(1) + ' kHz');
    }
    if (track.audioChannelCount > 0) {
      details.push(track.audioChannelCount + this.getSettingText($r('app.string.playback_audio_channel_unit')));
    }
    if (track.bitrate > 0) {
      details.push((track.bitrate / 1000).toFixed(0) + ' kbps');
    }
    const label = this.getSettingText($r('app.string.playback_audio_track')) + ' ' + (position + 1) +
      ' (ID ' + track.index + ')';
    return details.length > 0 ? label + ' | ' + details.join(' | ') : label;
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
    const labels = tracks.map((track: MediaTrackInfo, index: number) => this.formatAudioTrackLabel(track, index));
    TextPickerDialog.show({
      range: labels,
      canLoop: false,
      selected: Math.max(0,
        tracks.findIndex((track: MediaTrackInfo) => track.index === this.playerSettings.audioTrackIndex)),
      onAccept: (value: TextPickerResult) => {
        const selected = getPickerSelectedIndex(value.index);
        if (selected >= 0 && selected < tracks.length) {
          const switched = player.selectAudioTrack(tracks[selected].index);
          if (!switched) {
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.playback_audio_track_unsupported'), duration: Const.DURATION,
              bottom: Const.BOTTOM
            });
            return;
          }
          this.playerSettings.audioTrackIndex = tracks[selected].index;
          this.updateMediaInfo();
          this.getUIContext().getPromptAction().showToast({
            message: labels[selected] + this.getSettingText($r('app.string.playback_audio_track_switched')),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
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
    let fetchedFrame: PixelMap | undefined = undefined;
    try {
      try {
        const mediaInfo = player.getMediaInfo();
        const rotation = mediaInfo.video.rotation % 360;
        const normalizedRotation = rotation < 0 ? rotation + 360 : rotation;
        const hasVideoGeometry: boolean = mediaInfo.video.width > 0 && mediaInfo.video.height > 0;
        const isRotatedPortrait: boolean = (normalizedRotation === 90 || normalizedRotation === 270) &&
          (!hasVideoGeometry || mediaInfo.video.width >= mediaInfo.video.height);
        const isNativePortrait: boolean = normalizedRotation === 0 &&
          mediaInfo.video.height > mediaInfo.video.width;
        let previewRotation: number = 0;
        if (isRotatedPortrait) {
          previewRotation = normalizedRotation;
        } else if (isNativePortrait) {
          // Use the portrait layout even when the container omits rotation.
          previewRotation = 90;
        } else if (normalizedRotation === 180) {
          previewRotation = 180;
        }
        this.playbackViewModel.seekPreviewRotation = previewRotation;
      } catch (error) {
        // Rotation is optional for preview rendering; keep the default 0°.
        Logger.info(TAG, 'Seek preview rotation unavailable: ' + JSON.stringify(error));
        this.playbackViewModel.seekPreviewRotation = 0;
      }
      previewFile = fileIo.openSync(this.selectFilePath, fileIo.OpenMode.READ_ONLY);
      const previewFileState = fileIo.statSync(previewFile.fd);
      imageGenerator = await media.createAVImageGenerator();
      imageGenerator.fdSrc = {
        fd: previewFile.fd,
        offset: Const.DEFAULT_VALUE,
        length: previewFileState.size
      };
      const isPortraitPreview = this.playbackViewModel.seekPreviewRotation === 90 ||
        this.playbackViewModel.seekPreviewRotation === 270;
      const frame: PixelMap = await imageGenerator.fetchFrameByTime(targetUs,
        media.AVImageQueryOptions.AV_IMAGE_QUERY_CLOSEST_SYNC, {
          // Request the thumbnail in its display orientation. The generator
          // applies container rotation, but the requested dimensions still
          // need to be exchanged for portrait video.
          width: isPortraitPreview ? SEEK_PREVIEW_HEIGHT : SEEK_PREVIEW_WIDTH,
          height: isPortraitPreview ? SEEK_PREVIEW_WIDTH : SEEK_PREVIEW_HEIGHT
        });
      fetchedFrame = frame;
      // AVImageGenerator returns a frame with the container orientation
      // applied. Do not rotate the PixelMap again: a second rotation would
      // turn a rotation=90 portrait frame sideways.
      if (!this.playbackViewModel.isSeeking || generation !== this.seekPreviewGeneration) {
        frame.release((error) => {
          if (error !== undefined) {
            Logger.error(TAG, 'Release stale seek preview frame failed: ' + JSON.stringify(error));
          }
        });
        fetchedFrame = undefined;
        return;
      }
      this.releaseSeekPreviewFrame();
      this.playbackViewModel.seekPreviewFrame = frame;
      fetchedFrame = undefined;
    } catch (error) {
      if (this.playbackViewModel.isSeeking && generation === this.seekPreviewGeneration) {
        Logger.error(TAG, 'Fetch seek preview failed: ' + JSON.stringify(error));
      }
      if (fetchedFrame !== undefined) {
        fetchedFrame.release((releaseError) => {
          if (releaseError !== undefined) {
            Logger.error(TAG, 'Release failed seek preview frame failed: ' + JSON.stringify(releaseError));
          }
        });
        fetchedFrame = undefined;
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

  private currentPlaybackPositionUs(): number {
    const info = player.getPlaybackInfo();
    return Math.max(0, Math.min(info.durationUs, info.positionUs));
  }

  private setAbLoopStart(): void {
    if (this.buttonEnabled || this.playbackViewModel.durationUs <= 0) {
      return;
    }
    const positionUs = this.currentPlaybackPositionUs();
    this.abLoopStartUs = positionUs;
    this.isAbLoopEnabled = false;
    this.abLoopEndUs = -1;
    this.showControlToast($r('app.string.playback_ab_start_set'));
  }

  private setAbLoopEnd(): void {
    if (this.buttonEnabled || this.playbackViewModel.durationUs <= 0 || this.abLoopStartUs < 0) {
      this.showControlToast($r('app.string.playback_ab_start_required'));
      return;
    }
    const positionUs = this.currentPlaybackPositionUs();
    if (positionUs <= this.abLoopStartUs) {
      this.showControlToast($r('app.string.playback_ab_end_invalid'));
      return;
    }
    this.abLoopEndUs = positionUs;
    this.isAbLoopEnabled = true;
    this.abLoopSeekPending = false;
    this.startAbLoopMonitor();
    this.showControlToast($r('app.string.playback_ab_enabled'));
  }

  private resetAbLoop(): void {
    this.abLoopStartUs = -1;
    this.abLoopEndUs = -1;
    this.isAbLoopEnabled = false;
    this.abLoopSeekPending = false;
    this.stopAbLoopMonitor();
  }

  private startAbLoopMonitor(): void {
    this.stopAbLoopMonitor();
    // Keep A-B checking independent from the UI refresh cadence.  Audio
    // playback can advance between view-model updates, and a 250 ms poll can
    // otherwise miss the B boundary when the stream has a large timestamp
    // step or is being seeked.
    this.abLoopTimer = setInterval(() => {
      if (this.isAbLoopEnabled) {
        this.checkAbLoop(this.currentPlaybackPositionUs());
      }
    }, 50);
  }

  private stopAbLoopMonitor(): void {
    if (this.abLoopTimer !== 0) {
      clearInterval(this.abLoopTimer);
      this.abLoopTimer = 0;
    }
  }

  private checkAbLoop(positionUs: number): void {
    if (!this.isAbLoopEnabled || this.abLoopStartUs < 0 || this.abLoopEndUs <= this.abLoopStartUs) {
      return;
    }
    // Use the native state as the source of truth.  The view model is
    // refreshed periodically and can briefly lag behind the decoder after a
    // seek, which used to suppress the loop exactly at the B point.
    const info = player.getPlaybackInfo();
    if (info.state !== player.PlayerState.PLAYING) {
      return;
    }
    // Prefer the native clock over a possibly stale callback argument.
    positionUs = Math.max(0, Math.min(info.durationUs, info.positionUs));
    const toleranceUs = 150000;
    if (this.abLoopSeekPending) {
      // Seek completion can report a frame slightly after A (especially when
      // the demuxer seeks to a sync frame).  Treat any position back inside
      // the configured interval as completion; requiring an exact A-point
      // timestamp could leave the pending flag latched forever and disable
      // subsequent loops.
      if (positionUs + toleranceUs < this.abLoopEndUs) {
        this.abLoopSeekPending = false;
      }
      return;
    }
    if (positionUs + toleranceUs < this.abLoopEndUs) {
      return;
    }
    this.abLoopSeekPending = true;
    Logger.info(TAG, 'A-B loop reached B, seek to A: ' + this.abLoopStartUs);
    if (!player.seekTo(this.abLoopStartUs)) {
      this.abLoopSeekPending = false;
      Logger.error(TAG, 'A-B loop seek failed');
    }
  }

  private stepFrame(direction: number): void {
    if (this.buttonEnabled || this.isStopping || this.playbackViewModel.durationUs <= 0) {
      return;
    }
    const mediaInfo = player.getMediaInfo();
    const frameRate = mediaInfo.video.frameRate > 0 ? mediaInfo.video.frameRate : 30;
    const frameDurationUs = Math.max(1, Math.round(1000000 / frameRate));
    const positionUs = this.currentPlaybackPositionUs();
    const targetUs = Math.max(0, Math.min(this.playbackViewModel.durationUs,
      positionUs + direction * frameDurationUs));
    if (this.playbackViewModel.state === player.PlayerState.PLAYING && !player.pause()) {
      this.showControlToast($r('app.string.playback_frame_step_failed'));
      return;
    }
    if (!player.seekTo(targetUs)) {
      this.showControlToast($r('app.string.playback_frame_step_failed'));
      return;
    }
    this.playbackViewModel.update();
  }

  private showControlToast(message: Resource): void {
    try {
      this.getUIContext().getPromptAction().showToast({
        message: message,
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    } catch (error) {
      Logger.error(TAG, 'Show playback control prompt failed: ' + JSON.stringify(error));
    }
  }

  private async togglePictureInPicture(): Promise<void> {
    if (this.buttonEnabled || this.playbackViewModel.durationUs <= 0) {
      return;
    }
    if (!PiPWindow.isPiPEnabled()) {
      this.showControlToast($r('app.string.playback_pip_unsupported'));
      return;
    }
    try {
      if (this.pipController === undefined) {
        const hostContext = this.getUIContext().getHostContext();
        if (hostContext === undefined) {
          return;
        }
        const mediaInfo = player.getMediaInfo();
        const width = mediaInfo.video.width > 0 ? mediaInfo.video.width : 16;
        const height = mediaInfo.video.height > 0 ? mediaInfo.video.height : 9;
        this.pipController = await PiPWindow.create({
          context: hostContext,
          componentController: this.xComponentController,
          templateType: PiPWindow.PiPTemplateType.VIDEO_PLAY,
          contentWidth: width,
          contentHeight: height
        });
        this.pipController.on('stateChange', (state: PiPWindow.PiPState) => {
          this.isPipActive = state === PiPWindow.PiPState.STARTED;
          if (state === PiPWindow.PiPState.STOPPED) {
            this.isPipActive = false;
          }
        });
        this.pipController.on('controlPanelActionEvent', (event: PiPWindow.PiPActionEventType) => {
          if (event === 'playbackStateChanged') {
            if (player.getState() === player.PlayerState.PLAYING) {
              player.pause();
            } else if (player.getState() === player.PlayerState.PAUSED) {
              player.resume();
            }
          } else if (event === 'fastForward') {
            this.seekBySeconds(15);
          } else if (event === 'fastBackward') {
            this.seekBySeconds(-15);
          }
        });
      }
      await this.pipController.startPiP();
      this.isPipActive = true;
      this.pipController.setAutoStartEnabled(this.isBackgroundPlaybackEnabled);
    } catch (error) {
      this.isPipActive = false;
      Logger.error(TAG, 'Start picture-in-picture failed: ' + JSON.stringify(error));
      this.showControlToast($r('app.string.playback_pip_failed'));
    }
  }

  private async stopPictureInPicture(): Promise<void> {
    if (this.pipController === undefined) {
      return;
    }
    try {
      if (await this.pipController.isPiPActive()) {
        await this.pipController.stopPiP();
      }
    } catch (error) {
      Logger.error(TAG, 'Stop picture-in-picture failed: ' + JSON.stringify(error));
    }
    this.isPipActive = false;
  }

  private async toggleBackgroundPlayback(): Promise<void> {
    this.isBackgroundPlaybackEnabled = !this.isBackgroundPlaybackEnabled;
    if (this.isBackgroundPlaybackEnabled && this.pipController === undefined) {
      await this.togglePictureInPicture();
      if (!this.isPipActive) {
        this.isBackgroundPlaybackEnabled = false;
        return;
      }
    }
    if (this.pipController !== undefined) {
      this.pipController.setAutoStartEnabled(this.isBackgroundPlaybackEnabled);
    }
    this.showControlToast(this.isBackgroundPlaybackEnabled ?
      $r('app.string.playback_background_enabled') : $r('app.string.playback_background_disabled'));
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
    this.play(0);
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
      const selectedPath = documentSelectResult[0];
      this.selectFilePath = selectedPath;
      this.queuePaths = [selectedPath];
      this.queueIndex = 0;
      this.queueEntries = this.queuePaths.slice();
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
      const selectedPath = photoSelectResult.photoUris[0];
      this.selectFilePath = selectedPath;
      this.queuePaths = [selectedPath];
      this.queueIndex = 0;
      this.queueEntries = this.queuePaths.slice();
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

  play(startPositionUs: number = -1): void {
    if (this.selectFilePath === null) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.alert'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
      return;
    }

    // A new playback task invalidates any delayed resume seek from the
    // previous task, including when the new file has no saved position.
    if (this.resumeSeekTimer !== 0) {
      clearTimeout(this.resumeSeekTimer);
      this.resumeSeekTimer = 0;
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
        this.resetAbLoop();
        this.showPlaybackControls();
        this.audioMuted = false;
        this.volumeBeforeMute = this.playerSettings.audioVolume;
        this.lastHistoryPositionUs = -1;
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
          const completedPath = this.selectFilePath;
          const completedPositionUs = this.playbackViewModel.positionUs;
          const completedDurationUs = this.playbackViewModel.durationUs;
          if (completedPath !== null && completedDurationUs > 0) {
            if (result.reason === 'completed') {
              this.playbackHistory.markCompleted(completedPath);
            } else {
              this.persistPlaybackProgress(completedPositionUs, completedDurationUs, true);
            }
          }
          this.buttonEnabled = true;
          this.isStopping = false;
          this.playbackViewModel.isSmartFluencyAvailable = false;
          this.playbackViewModel.isHdrVividConfirmed = false;
          this.stopPlaybackInfoUpdates();
          this.resetPlaybackProgress();
          this.resetAbLoop();
          this.stopPictureInPicture();
          this.isMediaInfoVisible = false;
          this.mediaInfoSections = [];
          closeInputFile();
          // stop() is an expected completion when changing the selected audio track.
          // Do not report an expected user stop as a corrupt file.
          if (!result.success && result.reason !== 'stopped' && !failurePromptShown) {
            failurePromptShown = true;
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.media_file_invalid'),
              duration: Const.DURATION,
              bottom: Const.BOTTOM
            });
          }
          if (result.reason === 'completed' && this.queueIndex >= 0 &&
            this.queueIndex + 1 < this.queuePaths.length) {
            this.queueIndex += 1;
            this.selectFilePath = this.queuePaths[this.queueIndex];
            this.queueEntries = this.queuePaths.slice();
            setTimeout(() => this.play(0), 0);
          }
        });
        // The callback owns the descriptor only after a successful start. If
        // startup is rejected, the finally block closes it immediately.
        closeInCallback = started;
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
          const mediaDurationUs = player.getMediaInfo().durationUs;
          const resumePositionUs = startPositionUs >= 0 ? startPositionUs :
            this.playbackHistory.getResumePosition(this.selectFilePath ?? '', mediaDurationUs);
          if (resumePositionUs > 0) {
            if (this.resumeSeekTimer !== 0) {
              clearTimeout(this.resumeSeekTimer);
            }
            this.resumeSeekTimer = setTimeout(() => {
              this.resumeSeekTimer = 0;
              if (!this.isStopping && player.seekTo(resumePositionUs)) {
                this.getUIContext().getPromptAction().showToast({
                  message: $r('app.string.playback_resume_position'), duration: Const.DURATION, bottom: Const.BOTTOM
                });
              }
            }, 300);
          }
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
    this.draftPlayerAutoHideControls = this.playerSettings.autoHideControls;
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
    this.playerSettings.autoHideControls = this.draftPlayerAutoHideControls;
    if (this.playerSettings.autoHideControls) {
      this.showPlaybackControls();
    } else {
      this.clearPlaybackControlsTimer();
      this.isPlaybackControlsVisible = true;
    }
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
            Text($r('app.string.setting_auto_hide_controls'))
              .fontSize('16fp').fontColor('#202124').layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: this.draftPlayerAutoHideControls })
              .onChange((isOn: boolean) => this.draftPlayerAutoHideControls = isOn)
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
          this.draftPlayerAutoHideControls = true;
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
      .fontSize('12fp')
      .size({
        width: '18.5%',
        height: '34vp'
      })
      .margin({ bottom: $r('app.float.button_margin_bottom') })
      .onClick(() => {
        this.handlePlaybackControlInteraction();
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
      .fontSize('12fp')
      .backgroundColor('#E67E22')
      .fontColor(Color.White)
      .size({
        width: '18.5%',
        height: '34vp'
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
  QueuePanel() {
    Scroll() {
      Column({ space: '8vp' }) {
        Row({ space: '8vp' }) {
          Button($r('app.string.playback_queue_add'))
            .layoutWeight(1)
            .onClick(() => this.selectQueueFiles())
          Button($r('app.string.playback_queue_clear'))
            .layoutWeight(1)
            .enabled(this.queuePaths.length > 0)
            .onClick(() => {
              this.queuePaths = [];
              this.queueIndex = -1;
              this.queueEntries = [];
            })
        }
        if (this.queueEntries.length > 0) {
          Text($r('app.string.playback_queue_current'))
            .fontSize('14fp')
            .fontColor('#99101820')
          ForEach(this.queueEntries, (path: string, index: number) => {
            Row() {
              Text((index + 1).toString() + '. ' + getPlaybackTitle(path))
                .layoutWeight(1)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(index === this.queueIndex ? $r('app.string.playback_queue_playing') : '')
                .fontColor('#0A59F7')
            }
            .width('100%')
            .padding({ left: '8vp', right: '8vp', top: '6vp', bottom: '6vp' })
            .backgroundColor('#0F000000')
            .borderRadius('4vp')
          }, (path: string) => path)
        }
        Text($r('app.string.playback_recent'))
          .fontSize('14fp')
          .fontColor('#99101820')
        if (this.recentEntries.length === 0) {
          Text($r('app.string.playback_recent_empty')).fontColor('#66000000')
        } else {
          ForEach(this.recentEntries, (entry: PlaybackHistoryEntry) => {
            Row() {
              Column() {
                Text(entry.title).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(entry.positionUs > 0 ?
                  this.getSettingText($r('app.string.playback_recent_position')) +
                    this.formatHistoryPosition(entry.positionUs) :
                  $r('app.string.playback_recent_completed'))
                  .fontSize('12fp').fontColor('#66000000')
              }.layoutWeight(1)
              Button($r('app.string.playback_recent_play'))
                .enabled(this.buttonEnabled)
                .onClick(() => this.playRecentEntry(entry))
            }
            .width('100%')
            .padding({ left: '8vp', right: '8vp', top: '6vp', bottom: '6vp' })
          }, (entry: PlaybackHistoryEntry) => entry.uri)
        }
      }
      .width('100%')
      .padding('16vp')
    }
    .scrollBar(BarState.Auto)
  }

  @Builder
  PlaybackToolsPanel() {
    Column({ space: '12vp' }) {
      Row({ space: '8vp' }) {
        Button($r('app.string.playback_queue'))
          .layoutWeight(1)
          .onClick(() => {
            this.closePlaybackTools();
            setTimeout(() => {
              this.isQueueVisible = true;
            }, 300);
          })
        Button(this.isDiagnosticsVisible ? $r('app.string.playback_diagnostics_close') :
          $r('app.string.playback_diagnostics'))
          .layoutWeight(1)
          .onClick(() => {
            this.isDiagnosticsVisible = !this.isDiagnosticsVisible;
            this.closePlaybackTools();
          })
      }
      Row({ space: '8vp' }) {
        Button($r('app.string.playback_display_scale'))
          .layoutWeight(1)
          .onClick(() => {
            this.closePlaybackTools();
            this.selectDisplayScaleMode();
          })
        Button(this.audioMuted ? $r('app.string.playback_unmute') : $r('app.string.playback_mute'))
          .layoutWeight(1)
          .onClick(() => {
            this.toggleMute();
            this.closePlaybackTools();
          })
      }
      Row({ space: '8vp' }) {
        Button($r('app.string.playback_audio_track'))
          .layoutWeight(1)
          .onClick(() => {
            this.closePlaybackTools();
            this.selectAudioTrack();
          })
        Button($r('app.string.playback_subtitle'))
          .layoutWeight(1)
          .onClick(() => {
            this.closePlaybackTools();
            this.selectSubtitleFile();
          })
      }
      Row({ space: '8vp' }) {
        Button($r('app.string.playback_subtitle_sync'))
          .layoutWeight(1)
          .onClick(() => {
            this.closePlaybackTools();
            this.selectSubtitleDelay();
          })
        Button($r('app.string.playback_subtitle_style'))
          .layoutWeight(1)
          .onClick(() => {
            this.closePlaybackTools();
            this.selectSubtitleStyle();
          })
      }
      Row({ space: '8vp' }) {
        Button(this.abLoopStartUs >= 0 ? $r('app.string.playback_ab_set_start_done') :
          $r('app.string.playback_ab_set_start'))
          .layoutWeight(1)
          .enabled(!this.buttonEnabled && !this.isStopping)
          .onClick(() => {
            this.setAbLoopStart();
            this.closePlaybackTools();
          })
        Button(this.isAbLoopEnabled ? $r('app.string.playback_ab_set_end_done') :
          $r('app.string.playback_ab_set_end'))
          .layoutWeight(1)
          .enabled(!this.buttonEnabled && !this.isStopping && this.abLoopStartUs >= 0)
          .onClick(() => {
            this.setAbLoopEnd();
            this.closePlaybackTools();
          })
        Button($r('app.string.playback_ab_clear'))
          .layoutWeight(1)
          .enabled(this.abLoopStartUs >= 0 || this.abLoopEndUs >= 0)
          .onClick(() => {
            this.resetAbLoop();
            this.closePlaybackTools();
          })
      }
      Row({ space: '8vp' }) {
        Button(this.isBackgroundPlaybackEnabled ? $r('app.string.playback_background_on') :
          $r('app.string.playback_background_off'))
          .layoutWeight(1)
          .enabled(!this.buttonEnabled && !this.isStopping)
          .onClick(async () => {
            await this.toggleBackgroundPlayback();
            this.closePlaybackTools();
          })
        Blank().layoutWeight(1)
        Blank().layoutWeight(1)
      }
      Row({ space: '8vp' }) {
        Button(this.isPipActive ? $r('app.string.playback_pip_exit') : $r('app.string.playback_pip_enter'))
          .layoutWeight(1)
          .enabled(!this.buttonEnabled && !this.isStopping)
          .onClick(async () => {
            if (this.isPipActive) {
              await this.stopPictureInPicture();
            } else {
              await this.togglePictureInPicture();
            }
            this.closePlaybackTools();
          })
        if (this.isAbLoopEnabled) {
          Text(this.formatHistoryPosition(this.abLoopStartUs) + ' - ' +
            this.formatHistoryPosition(this.abLoopEndUs))
            .layoutWeight(1)
            .fontSize('12fp')
            .fontColor('#5F6368')
            .textAlign(TextAlign.Center)
        } else {
          Blank().layoutWeight(1)
        }
        Blank().layoutWeight(1)
      }
    }
    .width('100%')
    .padding({ left: '16vp', right: '16vp', top: '8vp', bottom: '8vp' })
  }

  private formatHistoryPosition(positionUs: number): string {
    const totalSeconds = Math.floor(Math.max(0, positionUs) / 1000000);
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;
    return (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
  }

  @Builder
  DiagnosticsPanel() {
    if (this.isDiagnosticsVisible) {
      Column({ space: '2vp' }) {
        Text($r('app.string.playback_diagnostics')).fontSize('13fp').fontColor('#E8FFFFFF')
        Text(this.getSettingText($r('app.string.playback_diagnostics_state')) + this.playbackViewModel.infoText)
          .fontSize('12fp').fontColor('#E8FFFFFF')
        Text(this.getSettingText($r('app.string.playback_diagnostics_position')) +
          formatMediaTime(this.playbackViewModel.positionUs) + ' / ' +
          formatMediaTime(this.playbackViewModel.durationUs) +
          this.getSettingText($r('app.string.playback_diagnostics_speed')) +
          this.playbackViewModel.speed.toFixed(1))
          .fontSize('12fp').fontColor('#E8FFFFFF')
        Text(this.getSettingText($r('app.string.playback_diagnostics_output')) +
          this.playbackViewModel.videoOutputFrames +
          this.getSettingText($r('app.string.playback_diagnostics_rendered')) +
          this.playbackViewModel.videoRenderedFrames +
          this.getSettingText($r('app.string.playback_diagnostics_dropped')) +
          this.playbackViewModel.videoDroppedFrames)
          .fontSize('12fp').fontColor('#E8FFFFFF')
        Text(this.getSettingText($r('app.string.playback_diagnostics_output_fps')) +
          this.playbackViewModel.videoOutputFps.toFixed(1) + ' fps' +
          this.getSettingText($r('app.string.playback_diagnostics_drop_rate')) +
          this.playbackViewModel.videoDropRatePercent.toFixed(1) + '%')
          .fontSize('12fp').fontColor('#E8FFFFFF')
        Text(this.getSettingText($r('app.string.playback_diagnostics_audio_buffers')) +
          this.playbackViewModel.audioOutputBuffers)
          .fontSize('12fp').fontColor('#E8FFFFFF')
        if (this.playbackViewModel.isBufferMode) {
          Text(this.getSettingText($r('app.string.playback_diagnostics_buffer_present')) +
            this.playbackViewModel.bufferPresentFrames +
            this.getSettingText($r('app.string.playback_diagnostics_buffer_average')) +
            this.playbackViewModel.bufferPresentAverageUs.toFixed(1) + ' us' +
            this.getSettingText($r('app.string.playback_diagnostics_buffer_failures')) +
            this.playbackViewModel.bufferPresentFailures)
            .fontSize('12fp').fontColor('#E8FFFFFF')
        }
        Text(this.getSettingText($r('app.string.playback_diagnostics_smart_fluency')) +
          (this.playbackViewModel.isSmartFluencyAvailable ?
            this.getSettingText($r('app.string.playback_diagnostics_available')) :
            this.getSettingText($r('app.string.playback_diagnostics_unavailable'))) +
          this.getSettingText($r('app.string.playback_diagnostics_hdr_vivid')) +
          (this.playbackViewModel.isHdrVividConfirmed ?
            this.getSettingText($r('app.string.playback_diagnostics_confirmed')) :
            this.getSettingText($r('app.string.playback_diagnostics_unconfirmed'))))
          .fontSize('12fp').fontColor('#E8FFFFFF')
        Text(this.getSettingText($r('app.string.playback_diagnostics_software_fallback')) +
          (this.playbackViewModel.isSoftwareDecoderFallbackUsed ?
            this.getSettingText($r('app.string.playback_diagnostics_used')) :
            this.getSettingText($r('app.string.playback_diagnostics_not_used'))))
          .fontSize('12fp').fontColor('#E8FFFFFF')
      }
      .padding({ left: '8vp', right: '8vp', top: '6vp', bottom: '6vp' })
      .backgroundColor('#99101820')
      .borderRadius('4vp')
      .margin({ top: '48vp', left: '16vp' })
      .align(Alignment.TopStart)
      .hitTestBehavior(HitTestMode.None)
    }
  }

  @Builder
  Window() {
    Stack({ alignContent: Alignment.TopEnd }) {
      XComponent({
        id: 'player',
        type: XComponentType.SURFACE,
        libraryname: 'player',
        controller: this.xComponentController
      })
        .height(Const.FULL_SIZE)
        .width(Const.FULL_SIZE)
        // XComponent does not expose objectFit. Keep scaling in the native
        // renderer and retain the selected display mode in the UI state.
        .gesture(
          GestureGroup(GestureMode.Exclusive,
            TapGesture({ count: 1, fingers: 1 })
              .onAction(() => this.showPlaybackControls()),
            LongPressGesture({ repeat: true })// 长按动作存在会连续触发
              .onAction(() => {
                this.showPlaybackControls();
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
      this.DiagnosticsPanel()
      if (this.subtitleText.length > 0) {
        Text(this.subtitleText)
          .fontSize(this.getSubtitleFontSize())
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
    .height('auto')
    .layoutWeight(1)
    .backgroundColor(Color.Black)
  }

  @Builder
  PlaybackProgressPanel() {
    PlaybackProgressPanelComponent({
      model: this.playbackViewModel,
      previewRotation: this.playbackViewModel.seekPreviewRotation,
      seekEnabled: (this.playbackViewModel.state === player.PlayerState.PLAYING ||
        this.playbackViewModel.state === player.PlayerState.PAUSED) &&
        !this.isStopping && this.playbackViewModel.durationUs > 0,
      onShowMediaInfo: () => {
        this.handlePlaybackControlInteraction();
        this.showMediaInfo();
      },
      onProgressChange: (value: number, mode: SliderChangeMode) => {
        this.handlePlaybackControlInteraction();
        this.handlePlaybackProgressChange(value, mode);
      }
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
    Column() {
      this.Window()

      // Keep entry controls available before playback starts. During playback,
      // the visibility state is shared by normal and fullscreen modes so the
      // auto-hide preference applies consistently in both layouts.
      if (this.buttonEnabled || this.isPlaybackControlsVisible ||
        !this.playerSettings.autoHideControls) {
      Column() {
        if (this.isPlaybackProgressVisible) {
          this.PlaybackProgressPanel()
        }
        if (!this.buttonEnabled && !this.isStopping) {
          // Keep the video area large: secondary actions are available
          // from the More sheet, and fullscreen controls auto-hide after idle.
          Column({ space: '6vp' }) {
            Row({ space: '4vp' }) {
              Button($r('app.string.playback_rewind_15s'))
                .layoutWeight(1)
                .fontSize('9fp')
                .height('30vp')
                .padding({ left: '0vp', right: '0vp' })
                .backgroundColor('#1976D2')
                .fontColor(Color.White)
                .onClick(() => {
                  this.handlePlaybackControlInteraction();
                  this.seekBySeconds(-15);
                })
              Button($r('app.string.playback_previous_frame'))
                .layoutWeight(1)
                .fontSize('9fp')
                .height('30vp')
                .padding({ left: '0vp', right: '0vp' })
                .backgroundColor('#1976D2')
                .fontColor(Color.White)
                .onClick(() => {
                  this.handlePlaybackControlInteraction();
                  this.stepFrame(-1);
                })
              Button(this.playbackViewModel.state === player.PlayerState.PAUSED ?
                $r('app.string.playback_resume') : $r('app.string.playback_pause'))
                .layoutWeight(1)
                .fontSize('9fp')
                .height('30vp')
                .padding({ left: '0vp', right: '0vp' })
                .backgroundColor('#1976D2')
                .fontColor(Color.White)
                .onClick(() => {
                  this.handlePlaybackControlInteraction();
                  this.togglePlaybackPause();
                })
              Button($r('app.string.playback_next_frame'))
                .layoutWeight(1)
                .fontSize('9fp')
                .height('30vp')
                .padding({ left: '0vp', right: '0vp' })
                .backgroundColor('#1976D2')
                .fontColor(Color.White)
                .onClick(() => {
                  this.handlePlaybackControlInteraction();
                  this.stepFrame(1);
                })
              Button($r('app.string.playback_forward_15s'))
                .layoutWeight(1)
                .fontSize('9fp')
                .height('30vp')
                .padding({ left: '0vp', right: '0vp' })
                .backgroundColor('#1976D2')
                .fontColor(Color.White)
                .onClick(() => {
                  this.handlePlaybackControlInteraction();
                  this.seekBySeconds(15);
                })
            }
            .width('100%')
            .height('30vp')
          }
          .width('100%')
          .height('30vp')
          .margin({ bottom: '4vp' })
        }
        if (this.buttonEnabled && this.selectFilePath !== null && !this.isFullscreen) {
          Button($r('app.string.playback_replay'))
            .fontSize('12fp')
            .width('32%')
            .height('34vp')
            .margin({ bottom: '4vp' })
            .onClick(() => {
              this.handlePlaybackControlInteraction();
              this.replaySelectedFile();
            })
        }
        if (!this.isFullscreen && (this.buttonEnabled || (!this.buttonEnabled && !this.isStopping))) {
          Row({ space: '8vp' }) {
            Button($r('app.string.playback_more'))
              .layoutWeight(1)
              .fontSize('12fp')
              .backgroundColor('#3F51B5')
              .fontColor(Color.White)
              .onClick(() => {
                this.handlePlaybackControlInteraction();
                this.isPlaybackToolsVisible = true;
              })
              .bindSheet($$this.isPlaybackToolsVisible, this.PlaybackToolsPanel(), {
                height: this.isFullscreen ? '70%' : '55%',
                title: { title: $r('app.string.playback_more_title') }
              })
            Button($r('app.string.playback_fullscreen'))
              .layoutWeight(1)
              .fontSize('12fp')
              .onClick(() => {
                this.handlePlaybackControlInteraction();
                this.toggleFullscreen();
              })
          }
          .width('100%')
          .height('32vp')
          .margin({ bottom: '4vp' })
        }
        Row({ space: '4vp' }) {
          if (this.isFullscreen) {
            Button($r('app.string.playback_more'))
              .width('16%')
              .height('34vp')
              .fontSize('10fp')
              .backgroundColor('#3F51B5')
              .fontColor(Color.White)
              .onClick(() => {
                this.handlePlaybackControlInteraction();
                this.isPlaybackToolsVisible = true;
              })
              .bindSheet($$this.isPlaybackToolsVisible, this.PlaybackToolsPanel(), {
                height: '70%',
                title: { title: $r('app.string.playback_more_title') }
              })
            if (this.selectFilePath !== null) {
              Button($r('app.string.playback_replay'))
                .width('16%')
                .height('34vp')
                .fontSize('10fp')
                .onClick(() => {
                  this.handlePlaybackControlInteraction();
                  this.replaySelectedFile();
                })
            } else {
              Blank().width('16%').height('34vp')
            }
            Button('Flip')
              .width('16%')
              .height('34vp')
              .fontSize('10fp')
              .onClick(() => {
                this.handlePlaybackControlInteraction();
                this.getUIContext().showTextPickerDialog({
                  range: Const.getTransformTypes(),
                  canLoop: false,
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
          if (this.buttonEnabled && !this.isFullscreen) {
            this.PlayerSettingButton()
          } else if (!this.isFullscreen) {
            Button('Flip')
              .fontSize('12fp')
              .size({
                width: '18.5%',
                height: '34vp'
              })
              .margin({ bottom: $r('app.float.button_margin_bottom') })
              .enabled(!this.isStopping)
              .onClick(() => {
                this.handlePlaybackControlInteraction();
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


          if (!this.isFullscreen) {
            Blank(5)
          }
          Button(this.buttonEnabled ? $r('app.string.play') :
            this.isStopping ? $r('app.string.stopping') : $r('app.string.stop_playback'))
            .fontSize('12fp')
            .onClick(() => {
              this.handlePlaybackControlInteraction();
              if (this.buttonEnabled) {
                this.selectFile()
              } else {
                this.stopPlayback()
              }
            })
            .size({
              width: this.isFullscreen ? '16%' : '60%',
              height: '34vp'
            })
            .enabled(this.buttonEnabled || !this.isStopping)
            .margin({ bottom: $r('app.float.button_margin_bottom') })
          if (!this.isFullscreen) {
            Blank(5)
            Button($r('app.string.adjust_playback_speed'))
              .enabled(!this.buttonEnabled && !this.isStopping)
              .fontSize('12fp')
              .size({
                width: '18.5%',
                height: '34vp'
              })
              .margin({ bottom: $r('app.float.button_margin_bottom') })
              .onClick(() => {
              this.handlePlaybackControlInteraction();
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
          } else {
            Button($r('app.string.adjust_playback_speed'))
              .enabled(!this.buttonEnabled && !this.isStopping)
              .fontSize('10fp')
              .width('16%')
              .height('34vp')
              .onClick(() => {
                this.handlePlaybackControlInteraction();
                TextPickerDialog.show({
                  range: Const.PLAYBACK_SPEED,
                  canLoop: false,
                  onAccept: (value: TextPickerResult) => {
                    switch (value.value) {
                      case Const.PLAYBACK_SPEED[0]:
                        this.setPlaybackSpeed(1);
                        break;
                      case Const.PLAYBACK_SPEED[1]:
                        this.setPlaybackSpeed(2);
                        break;
                      case Const.PLAYBACK_SPEED[2]:
                        this.setPlaybackSpeed(3);
                        break;
                      default:
                        break;
                    }
                  }
                })
              })
            Button($r('app.string.playback_exit_fullscreen'))
              .fontSize('12fp')
              .size({
                width: '16%',
                height: '34vp'
              })
              .margin({ bottom: $r('app.float.button_margin_bottom') })
              .onClick(() => {
                this.handlePlaybackControlInteraction();
                this.toggleFullscreen();
              })
          }
        }

        if (this.buttonEnabled && !this.isFullscreen) {
          Row() {
          this.RecorderSettingButton()
          Blank(5)
          Button($r('app.string.record'))
            .fontSize('12fp')
            .backgroundColor('#E67E22')
            .fontColor(Color.White)
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
              height: '34vp'
            })
            .enabled(this.buttonEnabled)
          }
        }
      }
      .padding({ left: '16vp', right: '16vp', top: '8vp', bottom: '16vp' })
      .width($r('app.string.full_width'))
      .height('auto')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.End)
      .bindSheet($$this.isQueueVisible, this.QueuePanel(), {
        height: '75%',
        title: { title: $r('app.string.playback_queue_sheet_title') }
      })
      }
    }
    .width($r('app.string.full_width'))
    .height($r('app.string.full_height'))
    // Keep the black page background under the system navigation area so the
    // startup layout cannot expose a white strip below the controls.
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    .backgroundColor(Color.Black)
  }
}
