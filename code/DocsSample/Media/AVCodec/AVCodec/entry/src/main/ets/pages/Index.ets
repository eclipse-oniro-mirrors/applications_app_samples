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

import { LocalizedText } from '../common/LocalizedText';
import { MediaSettingsLabels } from '../model/MediaSettingsLabels';
import { fileIo, picker } from '@kit.CoreFileKit'
import { PiPWindow, window } from '@kit.ArkUI'
import { camera } from '@kit.CameraKit'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import { deviceInfo, thermal } from '@kit.BasicServicesKit'
import player, { DeviceCodecCapability, MediaInfo, MediaTrackInfo } from 'libplayer.so'
import recorder from 'librecorder.so'
import Logger from '../common/utils/Logger'
import DateTimeUtil from '../common/utils/DateTimeUtil'
import { CommonConstants as Const } from '../common/CommonConstants'
import { CameraDataModel } from '../model/CameraDataModel'
import { PlayerSettingsModel } from '../model/PlayerSettingsModel'
import { PlayerSettingsDraft, RecorderSettingsDraft } from '../model/SettingsDraftModels'
import { RecorderPreprocessModel } from '../model/RecorderPreprocessModel'
import { buildMediaInfoSections, MediaInfoSection } from '../model/MediaInfoModel'
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel'
import { PlaybackHistoryEntry, PlaybackHistoryModel, getPlaybackTitle } from '../model/PlaybackHistoryModel'
import { findSubtitleText, parseSubtitle, SubtitleCue } from '../model/SubtitleModel'
import { PlaybackMode } from '../model/PlaybackModeModel'
import { PlaybackRecoveryModel, PlaybackRecoverySnapshot, PlaybackRecoveryReason } from '../model/PlaybackRecoveryModel'
import { SubtitleStyleModel } from '../model/SubtitleStyleModel'
import { PlaybackQueueController } from '../controller/PlaybackQueueController'
import { RecorderLaunchController } from '../controller/RecorderLaunchController'
import { SeekPreviewController } from '../controller/SeekPreviewController'
import { SeekRequestController, SeekRequestResult } from '../controller/SeekRequestController'
import { PlayerPictureInPictureController } from '../controller/PlayerPictureInPictureController'
import { PlaybackSessionCallbacks, PlaybackSessionController, PlaybackSessionMedia } from
  '../controller/PlaybackSessionController'
import { SubtitleSettingsPanel } from '../components/SubtitleSettingsPanel'
import { MediaInfoPanel as MediaInfoPanelComponent } from '../components/MediaInfoPanel'
import { PlaybackProgressPanel as PlaybackProgressPanelComponent } from '../components/PlaybackProgressPanel'
import { RecorderPage } from './RecorderPage'
import { MainBottomNavigation } from '../components/MainBottomNavigation'
import { PlayerSurface } from '../components/player/PlayerSurface'
import { PlayerGestureLayer } from '../components/player/PlayerGestureLayer'
import { PlayerStatusOverlay } from '../components/player/PlayerStatusOverlay'
import { PlayerControlBar as PlayerControlBarComponent } from '../components/player/PlayerControlBar'
import { PlayerQueueSheet } from '../components/player/PlayerQueueSheet'
import { MainTabsPage } from './MainTabsPage'
import { PlaybackDiagnosticsOverlay } from '../components/player/PlaybackDiagnosticsOverlay'
import { PlaybackMoreActionsPanel, PlaybackMoreAction } from '../components/player/PlaybackMoreActionsPanel'
import { PlayerSettingsPanel, PlayerSettingsOption } from '../components/player/PlayerSettingsPanel'
import { RecorderSettingsPanel, RecorderSettingsOption } from '../components/recorder/RecorderSettingsPanel'
import { RecorderSaveAuthorizationPanel } from '../components/recorder/RecorderSaveAuthorizationPanel'
import { PlayerPage as PlayerPageShell } from './PlayerPage'
import { LibraryPage } from './LibraryPage'
import { DeviceDiagnosticsPage } from './DeviceDiagnosticsPage'
import { TranscodePage } from './TranscodePage'
import { TranscodeModel } from '../model/TranscodeModel'
import { encoderProfileCameraCheck, setFirstCameraProfile } from '../common/utils/CameraCheck'
import { requestRecordPermissions } from '../common/utils/PermissionUtil'
import {
  getPickerSelectedIndex, isMediaFileEmpty, isPickerIndexValid
} from '../common/utils/MediaUtils'
import { common } from '@kit.AbilityKit'
import { ConfigurationStore, ConfigurationSnapshot } from '../model/ConfigurationStore'
import { UserConfiguration } from '../model/UserConfiguration'
import { ConfigurationFeedback } from '../model/ConfigurationFeedback'
import { MediaFileActivity } from '../model/MediaFileActivity'
import { MediaTaskCoordinator, MediaTaskLease } from '../model/MediaTaskCoordinator';
import { MediaReports } from '../model/MediaSessionReport';
import { MediaSessionStore } from '../model/MediaSessionStore';

const TAG: string = 'Sample_Player';
const DATETIME: DateTimeUtil = new DateTimeUtil();
const PLAYBACK_CONTROLS_HIDE_DELAY_MS: number = 5000;
const PICKER_LAYOUT_SETTLE_DELAY_MS: number = 100;
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
  @State configurationReady: boolean = false;
  @State configurationNotice: string = '';
  @State configurationRevision: number = 0;
  @State recorderCapabilityHint: string = LocalizedText.get($r('app.string.configuration_recorder_requirements'));
  private configurationTouched: boolean = false;
  @State activeMainTab: number = 0;
  @State transcodeModel: TranscodeModel = new TranscodeModel();
  @State buttonEnabled: boolean = true;
  @State isShow: boolean = false;
  @State isSmartFluencySupported: boolean = false;
  @State isAdvancedRecorderSupported: boolean = false;
  @State thermalWarningActive: boolean = false;
  @State isStopping: boolean = false;
  @State playbackViewModel: PlaybackViewModel = new PlaybackViewModel();
  @State isPlaybackProgressVisible: boolean = false;
  @State isMediaInfoVisible: boolean = false;
  @State isPlayerSettingsVisible: boolean = false;
  @State isAdvancedPlayerSettingsExpanded: boolean = false;
  @State isRecorderSettingsVisible: boolean = false;
  @State isQueueVisible: boolean = false;
  @State isPlaybackToolsVisible: boolean = false;
  @State isDiagnosticsVisible: boolean = false;
  @State isFullscreen: boolean = false;
  @State isPlaybackControlsVisible: boolean = true;
  @State displayScaleMode: number = 0;
  @State playbackFailureText: string = '';
  @State selectedDecoderName: string = '';
  @State selectedEncoderName: string = '';
  @State videoSourceWidth: number = 0;
  @State videoSourceHeight: number = 0;
  @State videoSourceRotation: number = 0;
  @State recentEntries: PlaybackHistoryEntry[] = [];
  @State queueEntries: string[] = [];
  @State abLoopStartUs: number = -1;
  @State abLoopEndUs: number = -1;
  @State isAbLoopEnabled: boolean = false;
  @State isPipActive: boolean = false;
  @State isBackgroundPlaybackEnabled: boolean = false;
  @State subtitleText: string = '';
  @State subtitleFileName: string = '';
  @State subtitleDelayIndex: number = 1;
  @State subtitleStyle: SubtitleStyleModel = new SubtitleStyleModel();
  @State isSubtitleSettingsVisible: boolean = false;
  @State playbackMode: PlaybackMode = PlaybackMode.SEQUENTIAL;
  @State autoRecoveryEnabled: boolean = true;
  private seekRequests: SeekRequestController = new SeekRequestController(
    (targetUs: number): Promise<boolean> => player.seekToAsync(targetUs));
  private playbackSessionController: PlaybackSessionController = new PlaybackSessionController();
  private recovery: PlaybackRecoveryModel = new PlaybackRecoveryModel();
  private playbackSession: number = 0;
  private playbackLease: MediaTaskLease | undefined = undefined;
  private seekRequestId: number = 0;
  private sliderDragging: boolean = false;
  private pageActive: boolean = true;
  private requestedSpeed: number = 1;
  private seekPreview: SeekPreviewController = new SeekPreviewController(this.playbackViewModel,
    (): string | null => this.selectFilePath, (): MediaInfo | undefined => this.currentMediaInfo);
  private currentMediaInfo: MediaInfo | undefined = undefined;
  @State audioMuted: boolean = false;
  @State mediaInfoSections: MediaInfoSection[] = [];
  @State recordingHistoryRevision: number = 0;
  @State private transformType: number = 0;
  private playerSettings: PlayerSettingsModel = new PlayerSettingsModel();
  @State playerDraft: PlayerSettingsDraft = new PlayerSettingsDraft();
  @State @Watch('onRecorderDraftChanged') recorderDraft: RecorderSettingsDraft = new RecorderSettingsDraft();
  @State cameraData: CameraDataModel = new CameraDataModel();
  private selectFilePath: string | null = null;
  private subtitleCues: SubtitleCue[] = [];
  private volumeBeforeMute: number = 100;
  private playbackHistory: PlaybackHistoryModel = new PlaybackHistoryModel();
  @State playbackQueue: PlaybackQueueController = new PlaybackQueueController();
  private recorderLaunch: RecorderLaunchController = new RecorderLaunchController();
  private lastHistoryPositionUs: number = -1;
  private resumeSeekTimer: number = 0;
  private playbackControlsTimer: number = 0;
  private playbackWindowWidth: number = 0;
  private abLoopTimer: number = 0;
  private abLoopSeekPending: boolean = false;
  private pictureInPictureController: PlayerPictureInPictureController | undefined = undefined;
  private readonly xComponentController: XComponentController = new XComponentController();
  private sourcePath: string[] =
    [globalThis.context.resourceManager.getStringSync($r('app.string.select_from_filemanager').id),
      globalThis.context.resourceManager.getStringSync($r('app.string.select_from_album').id)];

  aboutToAppear(): void {
    this.pageActive = true;
    this.transcodeModel.activate();
    void this.loadConfiguration();
    this.ensurePictureInPictureController();
    this.prepareVulkanShaders();
    player.setBackgroundPlaybackEnabled(this.isBackgroundPlaybackEnabled);
    player.setAppBackground(false);
    this.loadPlaybackHistory();
    this.recordingHistoryRevision++;
    this.playbackViewModel.onPlaybackPositionChanged = (positionUs: number): void => {
      this.updatePictureInPicturePlaybackState();
      this.updateSubtitle(positionUs);
      this.checkAbLoop(positionUs);
      if (this.playbackViewModel.state === player.PlayerState.PLAYING ||
        this.playbackViewModel.state === player.PlayerState.PAUSED) {
        this.persistPlaybackProgress(positionUs, this.playbackViewModel.durationUs);
        this.recovery.observe(positionUs, this.requestedSpeed,
          this.playbackViewModel.state === player.PlayerState.PAUSED,
          this.playbackViewModel.videoOutputFrames > 0 || this.playbackViewModel.audioOutputBuffers > 0);
      }
    };
    // API 26+ 设备支持智能流畅倍速解码
    const apiVersion = deviceInfo.sdkApiVersion;
    this.isSmartFluencySupported = apiVersion >= 26;
    this.isAdvancedRecorderSupported = apiVersion >= 26;
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

  private async loadConfiguration(): Promise<void> {
    if (this.configurationReady) {
      return;
    }
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return;
    }
    try {
      await ConfigurationStore.open(context);
      const saved = await ConfigurationStore.load();
      if (this.pageActive && !this.configurationTouched && this.buttonEnabled &&
        player.getState() === player.PlayerState.IDLE && !recorder.getDiagnostics().active &&
        !this.isPlayerSettingsVisible && !this.isRecorderSettingsVisible) {
        UserConfiguration.restore(saved, this.playerSettings, this.cameraData);
        this.configurationRevision++;
      }
      this.configurationReady = true;
    } catch (_error) {
      this.configurationReady = true;
      this.configurationNotice = LocalizedText.get($r('app.string.configuration_load_default'));
    }
  }

  private async persistConfiguration(custom: boolean = false): Promise<void> {
    this.configurationTouched = true;
    const context = this.getUIContext().getHostContext();
    if (context === undefined) {
      return;
    }
    const snapshot = UserConfiguration.capture(this.playerSettings, this.cameraData);
    try {
      await ConfigurationStore.open(context);
      await ConfigurationStore.save(snapshot, custom);
      this.configurationNotice = custom ? LocalizedText.get($r('app.string.configuration_custom_saved')) : LocalizedText.get($r('app.string.configuration_saved'));
    } catch (_error) {
      this.configurationNotice = LocalizedText.get($r('app.string.configuration_save_failed'));
    }
  }

  private async selectConfiguration(index: number): Promise<void> {
    if (!this.buttonEnabled || recorder.getDiagnostics().active) {
      this.configurationNotice = LocalizedText.get($r('app.string.configuration_wait_idle'));
      return;
    }
    this.configurationTouched = true;
    try {
      const snapshot: ConfigurationSnapshot = index < 0 ? await ConfigurationStore.load(true) :
        UserConfiguration.preset(index);
      if (!this.buttonEnabled || recorder.getDiagnostics().active) {
        return;
      }
      if (snapshot.player.length === 0) {
        this.configurationNotice = LocalizedText.get($r('app.string.configuration_custom_missing'));
        return;
      }
      UserConfiguration.restore(snapshot, this.playerSettings, this.cameraData);
      this.configurationRevision++;
      this.playerSettings.videoCodecName = '';
      this.cameraData.videoCodecName = '';
      this.selectedDecoderName = '';
      this.selectedEncoderName = '';
      this.preparePlayerSettings();
      this.prepareRecorderSettings();
      await this.persistConfiguration();
    } catch (_error) {
      this.configurationNotice = LocalizedText.get($r('app.string.configuration_load_failed'));
    }
  }

  /**
   * 将 Vulkan 管线需要的 SPIR-V 文件写入应用沙箱。
   * Native 层没有 ResourceManager，不能直接读取 rawfile；这里在页面初始化时把资源复制到
   * files/rawfile，VulkanVideoSink 再从同一目录加载。每次启动都覆盖文件，避免升级后沿用旧 shader。
   */
  private prepareVulkanShaders(): void {
    const hostContext: common.Context | undefined = this.getUIContext().getHostContext();
    if (hostContext === undefined) {
      Logger.error(TAG, 'Prepare Vulkan shaders failed: host context is unavailable');
      return;
    }
    const shaderDirectory: string = `${hostContext.filesDir}/rawfile`;
    try {
      if (!fileIo.accessSync(shaderDirectory)) {
        fileIo.mkdirSync(shaderDirectory, true);
      }
      this.copyVulkanShader(hostContext, 'shaders/vert.spv', `${shaderDirectory}/vert.spv`);
      this.copyVulkanShader(hostContext, 'shaders/frag.spv', `${shaderDirectory}/frag.spv`);
    } catch (error) {
      Logger.error(TAG, 'Prepare Vulkan shader directory failed: ' + JSON.stringify(error));
    }
  }

  private copyVulkanShader(context: common.Context, resourcePath: string, targetPath: string): void {
    let shaderFile: fileIo.File | undefined = undefined;
    try {
      const shaderData: Uint8Array = context.resourceManager.getRawFileContentSync(resourcePath);
      shaderFile = fileIo.openSync(targetPath,
        fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
      fileIo.writeSync(shaderFile.fd, shaderData.buffer);
    } catch (error) {
      Logger.error(TAG, 'Copy Vulkan shader failed: ' + resourcePath + ', ' + JSON.stringify(error));
    } finally {
      if (shaderFile !== undefined) {
        fileIo.closeSync(shaderFile);
      }
    }
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
    // 进入系统 PiP 时页面也会触发消失回调；播放器仍由小窗承载，不能按离页流程停止。
    if (this.isPictureInPictureHoldingPlayback()) {
      this.persistPlaybackProgress(this.playbackViewModel.positionUs, this.playbackViewModel.durationUs, true);
      return;
    }
    this.pageActive = false;
    this.transcodeModel.dispose();
    this.recovery.cancel();
    this.seekRequests.cancel();
    void this.playbackSessionController.stop();
    this.stopPlayback();
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
    this.subtitleFileName = '';
    this.resetAbLoop();
  }

  onPageShow(): void {
    this.recordingHistoryRevision++;
    const recordingUri: string = AppStorage.get<string>('recordingResultPlayback') ?? '';
    if (recordingUri.length > 0) {
      AppStorage.delete('recordingResultPlayback');
      this.playRecording(recordingUri);
    }
  }

  startPlaybackInfoUpdates(): void {
    this.playbackViewModel.startUpdates();
    this.isPlaybackProgressVisible = true;
  }

  private async loadPlaybackHistory(): Promise<void> {
    try {
      // 进入页面后异步恢复最近播放列表和断点；读取失败仅影响历史展示，
      // 不能阻断当前文件选择和播放。
      await this.playbackHistory.load(this.getUIContext().getHostContext() as common.UIAbilityContext);
      this.recentEntries = this.playbackHistory.getEntries();
    } catch (error) {
      Logger.error(TAG, 'Load playback history failed: ' + JSON.stringify(error));
    }
  }

  private playRecording(uri: string): void {
    this.activeMainTab = 0;
    this.selectFilePath = uri;
    this.playbackQueue.paths = [uri];
    this.playbackQueue.index = 0;
    this.queueEntries = this.playbackQueue.paths.slice();
    this.startSelectedFilePlayback(uri);
  }

  private async persistPlaybackProgress(positionUs: number, durationUs: number, force: boolean = false): Promise<void> {
    if (this.selectFilePath === null || durationUs <= 0 || positionUs < 0) {
      return;
    }
    if (!force && this.lastHistoryPositionUs >= 0 && Math.abs(positionUs - this.lastHistoryPositionUs) < 2000000) {
      return;
    }
    // 常规进度按 2 秒粒度落盘；停止和后台等收尾场景通过 force 写入最后位置，
    // 避免高频持久化影响播放期间的界面响应。
    this.lastHistoryPositionUs = positionUs;
    await this.playbackHistory.update(this.selectFilePath, getPlaybackTitle(this.selectFilePath),
      positionUs, durationUs);
    this.recentEntries = this.playbackHistory.getEntries();
  }

  private enqueueSelectedPath(path: string): void {
    if (path.length === 0) {
      return;
    }
    this.playbackQueue.append(path);
    this.queueEntries = this.playbackQueue.paths.slice();
  }

  private playQueueEntry(index: number): void {
    if (index < 0 || index >= this.playbackQueue.paths.length) {
      return;
    }
    const path: string = this.playbackQueue.paths[index];
    if (path.length === 0) {
      return;
    }
    this.activeMainTab = 0;
    this.isQueueVisible = false;
    if (index === this.playbackQueue.index && !this.buttonEnabled) {
      return;
    }
    if (this.buttonEnabled) {
      this.playbackQueue.index = index;
      this.selectFilePath = path;
      this.queueEntries = this.playbackQueue.paths.slice();
      this.play(0);
      return;
    }
    if (this.isStopping) {
      return;
    }
    this.playbackQueue.pendingIndex = index;
    void this.stopPlayback();
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
        this.playbackQueue.index = this.playbackQueue.index < 0 ? 0 : this.playbackQueue.index;
        this.selectFilePath = this.playbackQueue.paths[this.playbackQueue.index];
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
    this.activeMainTab = 0;
    this.selectFilePath = entry.uri;
    this.playbackQueue.paths = [entry.uri];
    this.playbackQueue.index = 0;
    this.queueEntries = this.playbackQueue.paths.slice();
    this.play();
    this.isQueueVisible = false;
  }

  private createPlaybackSessionCallbacks(): PlaybackSessionCallbacks {
    return {
      onPlay: (): void => this.handleSessionPlay(),
      onPause: (): void => this.handleSessionPause(),
      onStop: (): void => this.handleSessionStop(),
      onNext: (): void => this.handleSessionNext(),
      onPrevious: (): void => this.handleSessionPrevious(),
      onSeek: (positionMs: number): void => this.handleSessionSeek(positionMs),
      onFastForward: (offsetSeconds: number): void => {
        this.seekBySeconds(offsetSeconds);
      },
      onRewind: (offsetSeconds: number): void => {
        this.seekBySeconds(-offsetSeconds);
      },
      onSetSpeed: (speed: number): void => this.setPlaybackSpeed(speed)
    };
  }

  private startPlaybackSession(): void {
    const hostContext = this.getUIContext().getHostContext();
    if (hostContext === undefined || this.selectFilePath === null) {
      return;
    }
    const mediaInfo = this.currentMediaInfo ?? player.getMediaInfo();
    const queueTitles: string[] = this.playbackQueue.paths.map((path: string): string => getPlaybackTitle(path));
    const media: PlaybackSessionMedia = {
      assetId: 'queue-' + Math.max(0, this.playbackQueue.index).toString(),
      title: getPlaybackTitle(this.selectFilePath),
      queueTitle: this.getSettingText($r('app.string.playback_queue_sheet_title')),
      durationMs: Math.max(0, Math.round(mediaInfo.durationUs / 1000)),
      hasVideo: mediaInfo.video.width > 0 && mediaInfo.video.height > 0,
      queueTitles,
      queueIndex: Math.max(0, this.playbackQueue.index)
    };
    void this.playbackSessionController.start(hostContext as common.UIAbilityContext, media,
      this.createPlaybackSessionCallbacks());
  }

  private handleSessionPlay(): void {
    if (!this.buttonEnabled && this.playbackViewModel.state === player.PlayerState.PAUSED) {
      this.togglePlaybackPause();
    }
  }

  private handleSessionPause(): void {
    if (!this.buttonEnabled && this.playbackViewModel.state === player.PlayerState.PLAYING) {
      this.togglePlaybackPause();
    }
  }

  private handleSessionStop(): void {
    if (!this.buttonEnabled) {
      void this.stopPlayback();
    }
  }

  private handleSessionSeek(positionMs: number): void {
    if (this.buttonEnabled || this.isStopping) {
      return;
    }
    const requestedUs = Math.max(0, Math.round(positionMs * 1000));
    const durationUs = this.playbackViewModel.durationUs;
    const targetUs = durationUs > 0 ? Math.min(durationUs, requestedUs) : requestedUs;
    this.requestSeek(targetUs);
  }

  private handleSessionNext(): void {
    this.requestQueueSwitch(1);
  }

  private handleSessionPrevious(): void {
    this.requestQueueSwitch(-1);
  }

  private requestQueueSwitch(direction: number): void {
    if (this.buttonEnabled || this.isStopping || this.playbackQueue.paths.length < 2) {
      return;
    }
    const targetIndex = this.getAdjacentQueueIndex(direction);
    if (targetIndex < 0 || targetIndex === this.playbackQueue.index) {
      return;
    }
    this.playbackQueue.pendingIndex = targetIndex;
    void this.stopPlayback();
  }

  private getAdjacentQueueIndex(direction: number): number {
    return this.playbackQueue.adjacent(direction, this.playbackMode);
  }

  private async continuePendingQueuePlayback(): Promise<void> {
    const targetIndex = this.playbackQueue.pendingIndex;
    this.playbackQueue.pendingIndex = -1;
    if (targetIndex < 0 || targetIndex >= this.playbackQueue.paths.length || !this.pageActive) {
      return;
    }
    await this.playbackSessionController.stop();
    this.playbackQueue.index = targetIndex;
    this.queueEntries = this.playbackQueue.paths.slice();
    await this.continuePlayback(this.playbackSession, this.playbackQueue.paths[targetIndex], 0);
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

  private showPlaybackControls(startAutoHideTimer: boolean = true): void {
    this.isPlaybackControlsVisible = true;
    this.clearPlaybackControlsTimer();
    if (!startAutoHideTimer || !this.playerSettings.autoHideControls) {
      return;
    }
    this.playbackControlsTimer = setTimeout(() => {
      this.playbackControlsTimer = 0;
      if (this.isPlaybackToolsVisible || this.isQueueVisible || this.isMediaInfoVisible) {
        // 面板打开时保留承载控件，避免锚点销毁导致面板关闭。
        this.showPlaybackControls();
      } else if (this.playerSettings.autoHideControls && (this.isFullscreen || !this.buttonEnabled)) {
        this.isPlaybackControlsVisible = false;
        this.getUIContext().getPromptAction().showToast({
          message: $r('app.string.playback_controls_auto_hide_tip'),
          duration: Const.DURATION,
          bottom: Const.BOTTOM
        });
      }
    }, PLAYBACK_CONTROLS_HIDE_DELAY_MS);
  }

  private handlePlaybackControlInteraction(): void {
    if (!this.buttonEnabled && !this.isStopping) {
      this.showPlaybackControls();
    }
  }

  private revealPlaybackControlsIfHidden(): boolean {
    const controlsWereHidden: boolean = !this.isPlaybackControlsVisible;
    this.handlePlaybackControlInteraction();
    return controlsWereHidden;
  }

  private handlePlaybackWindowTap(): void {
    if (this.revealPlaybackControlsIfHidden()) {
      return;
    }
    const playbackState = this.playbackViewModel.state;
    const canTogglePlayback = !this.buttonEnabled && !this.isStopping && !this.sliderDragging &&
      (playbackState === player.PlayerState.PLAYING || playbackState === player.PlayerState.PAUSED);
    if (canTogglePlayback) {
      this.togglePlaybackPause(true);
    }
  }

  private updatePlaybackWindowWidth(area: Area): void {
    if (typeof area.width === 'number' && area.width > 0) {
      this.playbackWindowWidth = area.width;
    }
  }

  private handlePlaybackWindowDoubleTap(event: GestureEvent): void {
    if (this.revealPlaybackControlsIfHidden()) {
      return;
    }
    const playbackState = this.playbackViewModel.state;
    const canSeek = !this.buttonEnabled && !this.isStopping && !this.sliderDragging &&
      this.playbackViewModel.hasVideo && this.playbackWindowWidth > 0 &&
      (playbackState === player.PlayerState.PLAYING || playbackState === player.PlayerState.PAUSED ||
        this.seekRequests.isBusy());
    if (!canSeek) {
      return;
    }
    const finger = event.fingerList[0];
    if (finger === undefined) {
      return;
    }
    const offsetSeconds = finger.localX < this.playbackWindowWidth / 2 ? -15 : 15;
    if (this.seekBySeconds(offsetSeconds)) {
      this.showControlToast(offsetSeconds < 0 ? $r('app.string.playback_rewind_15s') :
        $r('app.string.playback_forward_15s'));
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
    this.updatePictureInPicturePlaybackState();
    this.playbackSessionController.updateState(this.playbackViewModel.state,
      this.playbackViewModel.speed, this.playbackViewModel.positionUs,
      this.playbackViewModel.durationUs);
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
      options.fileSuffixFilters = ['SRT|.srt', 'WebVTT|.vtt'];
      const result = await new picker.DocumentViewPicker().select(options);
      if (result.length === 0) {
        return;
      }
      const content = await fileIo.readText(result[0], { encoding: 'UTF-8' });
      const subtitleNameParts: string[] = result[0].split('/');
      const subtitleName: string = subtitleNameParts[subtitleNameParts.length - 1];
      const cues: SubtitleCue[] = parseSubtitle(content, subtitleName);
      if (cues.length === 0) {
        this.getUIContext().getPromptAction().showToast({
          message: $r('app.string.playback_subtitle_empty'), duration: Const.DURATION, bottom: Const.BOTTOM
        });
        return;
      }
      this.subtitleCues = cues;
      this.subtitleFileName = subtitleName;
      this.updateSubtitle(this.playbackViewModel.positionUs);
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.playback_subtitle_loaded'),
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

  private clearSubtitle(): void {
    this.subtitleCues = [];
    this.subtitleText = '';
    this.subtitleFileName = '';
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
    setTimeout(() => {
      if (this.pageActive) {
        this.isSubtitleSettingsVisible = true;
      }
    }, 300);
  }

  private rejectWhileSeeking(): boolean {
    if (!this.seekRequests.isBusy()) {
      return false;
    }
    this.showControlToast($r('app.string.playback_seek_busy'));
    return true;
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
    if (this.rejectWhileSeeking()) {
      return;
    }
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
        if (selected >= 0 && selected < tracks.length && !this.rejectWhileSeeking()) {
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
    if (this.rejectWhileSeeking()) {
      return;
    }
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
    this.seekPreview.reset();
    this.currentMediaInfo = undefined;
    this.mediaInfoSections = [];
    this.playbackViewModel.reset();
    this.isPlaybackProgressVisible = false;
  }

  handlePlaybackProgressChange(value: number, mode: SliderChangeMode): void {
    const targetUs = this.playbackViewModel.setSeekPosition(value);
    if (mode === SliderChangeMode.Begin || mode === SliderChangeMode.Moving) {
      this.sliderDragging = true;
      this.playbackViewModel.isSeeking = true;
      this.seekPreview.scheduleSeekPreview();
      return;
    }
    if (mode !== SliderChangeMode.End && mode !== SliderChangeMode.Click) {
      return;
    }

    this.sliderDragging = false;
    this.seekPreview.cancelSeekPreviewRequest();
    this.seekPreview.releaseSeekPreviewFrame();
    this.requestSeek(targetUs);
  }

  private async requestSeek(targetUs: number): Promise<SeekRequestResult> {
    if (this.buttonEnabled || this.isStopping || !this.pageActive) {
      return 'cancelled';
    }
    const requestId = ++this.seekRequestId;
    const session = this.playbackSession;
    this.playbackViewModel.setSeekPosition(targetUs);
    this.playbackViewModel.isSeeking = true;
    const pending = this.seekRequests.request(targetUs);
    this.updateSeekStatistics();
    const result = await pending;
    if (session !== this.playbackSession || requestId !== this.seekRequestId || !this.pageActive) {
      return result;
    }
    this.updateSeekStatistics();
    if (!this.seekRequests.isBusy() && !this.sliderDragging) {
      this.playbackViewModel.isSeeking = false;
      if (!this.isStopping) {
        player.setPlaybackSpeed(this.requestedSpeed);
        if (this.thermalWarningActive) {
          player.onThermalWarningReceived(0.3);
        } else {
          player.onThermalLevelRecovered();
        }
        this.updatePlaybackInfo();
      }
    }
    if (result === 'failed' && !this.isStopping) {
      this.showControlToast($r('app.string.seek_failed'));
    }
    return result;
  }

  private updateSeekStatistics(): void {
    this.playbackViewModel.seekSubmitted = this.seekRequests.submitted;
    this.playbackViewModel.seekMerged = this.seekRequests.merged;
    this.playbackViewModel.seekCompleted = this.seekRequests.completed;
  }

  private seekBySeconds(offsetSeconds: number): boolean {
    const info = player.getPlaybackInfo();
    if ((info.state !== player.PlayerState.PLAYING && info.state !== player.PlayerState.PAUSED &&
      !this.seekRequests.isBusy()) ||
      info.durationUs <= 0) {
      return false;
    }
    const positionUs = this.seekRequests.isBusy() ? this.playbackViewModel.seekPreviewUs : info.positionUs;
    const targetUs = Math.max(0, Math.min(info.durationUs, positionUs + offsetSeconds * 1000000));
    this.requestSeek(targetUs);
    return true;
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
    // 每 50 ms 检查 A-B 点，避免界面刷新间隔越过 B 点。
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
    if (this.seekRequests.isBusy() || this.playbackViewModel.isSeeking || this.isStopping) {
      return;
    }
    if (!this.isAbLoopEnabled || this.abLoopStartUs < 0 || this.abLoopEndUs <= this.abLoopStartUs) {
      return;
    }
    // A-B 循环以 Native 状态和时钟为准，避免 ViewModel 刷新延迟漏掉 B 点。
    const info = player.getPlaybackInfo();
    if (info.state !== player.PlayerState.PLAYING) {
      return;
    }
    // 回调位置可能过期，使用 Native 时钟。
    positionUs = Math.max(0, Math.min(info.durationUs, info.positionUs));
    const toleranceUs = 150000;
    if (this.abLoopSeekPending) {
      // 跳转可能落在同步帧后，回到 A-B 区间即清除待跳转标记。
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
    this.requestSeek(this.abLoopStartUs).then((result: SeekRequestResult) => {
      if (result === 'failed') {
        this.resetAbLoop();
      } else {
        this.abLoopSeekPending = false;
      }
    });
  }

  private stepFrame(direction: number): void {
    if (this.rejectWhileSeeking()) {
      return;
    }
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
    this.requestSeek(targetUs);
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

  private ensurePictureInPictureController(): PlayerPictureInPictureController {
    if (this.pictureInPictureController === undefined) {
      this.pictureInPictureController = new PlayerPictureInPictureController({
        onActiveChanged: (active: boolean): void => {
          this.isPipActive = active;
        },
        onPlaybackChanged: (): void => {
          this.playbackViewModel.update();
        },
        onSeekBySeconds: (seconds: number): void => {
          this.seekBySeconds(seconds);
        },
        isBackgroundPlaybackEnabled: (): boolean => this.isBackgroundPlaybackEnabled
      });
    }
    return this.pictureInPictureController;
  }

  private isPictureInPictureHoldingPlayback(): boolean {
    return this.pictureInPictureController !== undefined &&
      this.pictureInPictureController.shouldKeepPlaybackOnPageDisappear;
  }

  private async togglePictureInPicture(): Promise<void> {
    if (this.rejectWhileSeeking()) {
      return;
    }
    if (this.buttonEnabled || this.playbackViewModel.durationUs <= 0) {
      return;
    }
    if (!PiPWindow.isPiPEnabled()) {
      this.showControlToast($r('app.string.playback_pip_unsupported'));
      return;
    }
    const hostContext = this.getUIContext().getHostContext();
    if (hostContext === undefined) {
      return;
    }
    const started: boolean = await this.ensurePictureInPictureController().start(hostContext,
      this.xComponentController);
    if (!started) {
      this.showControlToast($r('app.string.playback_pip_failed'));
    }
  }

  private updatePictureInPicturePlaybackState(): void {
    if (this.pictureInPictureController !== undefined) {
      this.pictureInPictureController.syncPlaybackState();
    }
  }

  private async stopPictureInPicture(): Promise<void> {
    if (this.pictureInPictureController !== undefined) {
      await this.pictureInPictureController.stop();
    }
  }

  private async toggleBackgroundPlayback(): Promise<void> {
    this.isBackgroundPlaybackEnabled = !this.isBackgroundPlaybackEnabled;
    player.setBackgroundPlaybackEnabled(this.isBackgroundPlaybackEnabled);
    if (this.isBackgroundPlaybackEnabled &&
      (this.pictureInPictureController === undefined || !this.pictureInPictureController.isCreated)) {
      await this.togglePictureInPicture();
      if (!this.isPipActive) {
        this.isBackgroundPlaybackEnabled = false;
        player.setBackgroundPlaybackEnabled(false);
        return;
      }
    }
    if (this.pictureInPictureController !== undefined) {
      this.pictureInPictureController.setAutoStartEnabled(this.isBackgroundPlaybackEnabled);
    }
    this.showControlToast(this.isBackgroundPlaybackEnabled ?
      $r('app.string.playback_background_enabled') : $r('app.string.playback_background_disabled'));
  }

  private togglePlaybackPause(showPrompt: boolean = false): void {
    if (this.rejectWhileSeeking()) {
      return;
    }
    const paused = this.playbackViewModel.state === player.PlayerState.PAUSED;
    const success = paused ? player.resume() : player.pause();
    if (!success) {
      Logger.error(TAG, (paused ? 'Resume' : 'Pause') + ' playback failed');
      return;
    }
    this.playbackViewModel.update();
    this.playbackSessionController.updateState(this.playbackViewModel.state,
      this.playbackViewModel.speed, this.playbackViewModel.positionUs,
      this.playbackViewModel.durationUs);
    if (showPrompt) {
      this.showControlToast(paused ? $r('app.string.playback_gesture_play') :
        $r('app.string.playback_pause'));
    }
  }

  private replaySelectedFile(): void {
    if (this.selectFilePath === null) {
      this.showNoMediaSelectedPrompt();
      return;
    }
    this.play(0);
  }

  updateMediaInfo(): void {
    if (!this.seekRequests.isBusy()) {
      this.currentMediaInfo = player.getMediaInfo();
      this.videoSourceWidth = this.currentMediaInfo.video.width;
      this.videoSourceHeight = this.currentMediaInfo.video.height;
      this.videoSourceRotation = this.currentMediaInfo.video.rotation;
    }
    const context = this.getUIContext().getHostContext();
    if (this.currentMediaInfo !== undefined && context !== undefined) {
      try {
        this.mediaInfoSections = buildMediaInfoSections(this.currentMediaInfo, context.resourceManager,
          this.selectFilePath === null ? '' : getPlaybackTitle(this.selectFilePath));
      } catch (error) {
        Logger.error(TAG, 'Build media info sections failed: ' + JSON.stringify(error));
      }
    }
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

  private startSelectedFilePlayback(selectedPath: string): void {
    // 等待 XComponent 布局稳定后再创建 Native 输出目标。
    setTimeout((): void => {
      if (this.selectFilePath === selectedPath) {
        this.play();
      }
    }, PICKER_LAYOUT_SETTLE_DELAY_MS);
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
      this.playbackQueue.paths = [selectedPath];
      this.playbackQueue.index = 0;
      this.queueEntries = this.playbackQueue.paths.slice();
      Logger.info(TAG, 'Document selected, start playback, URI: ' + this.selectFilePath);
      this.startSelectedFilePlayback(selectedPath);
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
      this.playbackQueue.paths = [selectedPath];
      this.playbackQueue.index = 0;
      this.queueEntries = this.playbackQueue.paths.slice();
      Logger.info(TAG, 'Album file selected, start playback, URI: ' + this.selectFilePath);
      this.startSelectedFilePlayback(selectedPath);
    } catch (error) {
      Logger.error(TAG, 'Album selection failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_select_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    }
  }

  setPlaybackSpeed(speed: number): void {
    this.requestedSpeed = speed;
    if (!this.seekRequests.isBusy()) {
      player.setPlaybackSpeed(speed);
    }
    this.updatePlaybackInfo();
  }

  setTransform(transformHint: number): void {
    if (this.rejectWhileSeeking()) {
      return;
    }
    player.setTransform(transformHint);
    this.transformType = transformHint;
  }

  async stopPlayback(): Promise<void> {
    if (this.isStopping) {
      return;
    }
    this.isStopping = true;
    if (this.playbackLease !== undefined) { MediaTaskCoordinator.cancelling(this.playbackLease); }
    this.sliderDragging = false;
    this.recovery.cancel();
    this.seekRequests.cancel();
    this.playbackSessionController.updateState(player.PlayerState.STOPPING,
      this.requestedSpeed, this.playbackViewModel.positionUs, this.playbackViewModel.durationUs);
    if (this.resumeSeekTimer !== 0) {
      clearTimeout(this.resumeSeekTimer);
      this.resumeSeekTimer = 0;
    }
    await this.seekRequests.waitForIdle();
    if (player.stop()) {
      Logger.info(TAG, 'Player stop requested');
    } else {
      this.isStopping = false;
      Logger.error(TAG, 'Player stop request rejected, state: ' + player.getState());
      this.updatePlaybackInfo();
    }
  }

  private capturePlaybackFailure(): void {
    const failure = player.getPlaybackInfo().failure;
    this.playbackFailureText = failure.stage.length > 0 ?
      failure.stage + ' · ' + failure.code + '\n' + failure.message +
      '\n' + failure.mime + ' · ' + (failure.codecName || LocalizedText.get($r('app.string.configuration_auto_select'))) : LocalizedText.get($r('app.string.playback_failed_hint'));
  }

  play(startPositionUs: number = -1, recoverySnapshot?: PlaybackRecoverySnapshot): void {
    if (MediaFileActivity.isTranscoding()) {
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.transcode_resource_busy') });
      return;
    }
    if (!this.buttonEnabled || this.seekRequests.isBusy() || !this.pageActive || this.isStopping) {
      return;
    }
    if (this.selectFilePath === null) {
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.alert'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
      return;
    }

    this.playbackFailureText = '';
    const playbackPath = this.selectFilePath;
    if (recoverySnapshot === undefined) {
      this.recovery.reset();
      this.playbackViewModel.clearRecoveryDiagnostics();
      this.requestedSpeed = 1;
    }
    this.seekRequests.resetStatistics();
    // 启动新任务前清除上个任务的断点跳转计时器。
    if (this.resumeSeekTimer !== 0) {
      clearTimeout(this.resumeSeekTimer);
      this.resumeSeekTimer = 0;
    }

    if (!MediaFileActivity.beginLaunch()) {
      this.getUIContext().getPromptAction().showToast({ message: LocalizedText.get($r('app.string.playback_cleanup_busy')) });
      return;
    }
    const lease: MediaTaskLease | undefined = MediaTaskCoordinator.acquire('playback');
    if (lease === undefined) { MediaFileActivity.endLaunch(); return; }
    const session: number = ++this.playbackSession;
    this.playbackLease = lease;
    const reportContext = this.getUIContext().getHostContext();
    if (reportContext !== undefined) {
      void MediaSessionStore.begin(reportContext, { id: lease.id, operation: 'playback', startedAt: lease.startedAt })
        .catch((error: Error): void => Logger.warn(TAG, 'Session journal: ' + error.message));
    }
    let nativeOwnsLease: boolean = false;
    this.configurationTouched = true;
    try {
      const inputFile = fileIo.openSync(playbackPath, fileIo.OpenMode.READ_ONLY);
      let inputFileClosed = false;
      const closeInputFile = (): void => {
        if (inputFileClosed) {
          return;
        }
        try {
          fileIo.closeSync(inputFile);
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
        this.showPlaybackControls(false);
        if (recoverySnapshot === undefined) {
          this.audioMuted = false;
        }
        this.volumeBeforeMute = this.playerSettings.audioVolume;
        this.lastHistoryPositionUs = -1;
        this.playbackViewModel.isHdrVividConfirmed = false;
        this.resetPlaybackProgress();
        this.transformType = 0;
        let failurePromptShown = false;
        const started: boolean = player.play(this.playerSettings.createPlayOptions({
          inputFileFd: inputFile.fd,
          inputFileOffset: Const.DEFAULT_VALUE,
          inputFileSize: inputFileState.size,
          isSmartFluencySupported: this.isSmartFluencySupported
        }), (result) => {
          Logger.info(TAG, 'Player JS callback, success: ' + result.success + ', reason: ' + result.reason);
          closeInputFile();
          try {
            if (reportContext !== undefined && MediaTaskCoordinator.owns(lease)) {
              void MediaSessionStore.finish(reportContext, lease.id,
                MediaReports.playback(lease.id, player.getCompletedPlaybackInfo(), result.reason))
                .catch((error: Error): void => Logger.warn(TAG, 'Session report: ' + error.message));
            }
          } catch (error) { Logger.warn(TAG, 'Session snapshot: ' + JSON.stringify(error)); }
          finally { MediaTaskCoordinator.release(lease); }
          if (session !== this.playbackSession) {
            return;
          }
          this.playbackLease = undefined;
          if (result.reason === 'error') { this.capturePlaybackFailure(); }
          const retry = result.reason === 'error' && this.autoRecoveryEnabled &&
            !this.isStopping && this.pageActive ? this.recovery.takeRetry() : undefined;
          if (result.reason === 'error' && retry !== undefined) {
            this.playbackViewModel.markRecoveryPending(PlaybackRecoveryReason.RUNTIME_ERROR);
          }
          const completedPath = playbackPath;
          const completedPositionUs = this.playbackViewModel.positionUs;
          const completedDurationUs = this.playbackViewModel.durationUs;
          if (completedPath !== null && completedDurationUs > 0) {
            if (result.reason === 'completed') {
              this.playbackHistory.markCompleted(completedPath);
            } else {
              this.persistPlaybackProgress(completedPositionUs, completedDurationUs, true);
            }
          }
          this.playbackSessionController.updateState(player.PlayerState.STOPPING,
            this.requestedSpeed, completedPositionUs, completedDurationUs);
          const requestedQueueIndex = this.playbackQueue.pendingIndex;
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
          this.seekRequests.cancel();
          this.seekRequestId++;
          if (!this.pageActive) {
            void this.playbackSessionController.stop();
            return;
          }
          if (retry !== undefined) {
            this.showControlToast($r('app.string.playback_recovering'));
            this.continuePlayback(session, playbackPath, retry.positionUs, retry);
            return;
          }
          if (result.reason === 'error' && this.playbackViewModel.recoveryAttemptCount > 0) {
            this.playbackViewModel.markRecoveryFailed();
          }
          if (requestedQueueIndex >= 0) {
            void this.continuePendingQueuePlayback();
            return;
          }
          // 切换音轨触发的 stop() 不视为播放失败。
          if (!result.success && result.reason !== 'stopped' && !failurePromptShown) {
            failurePromptShown = true;
            this.getUIContext().getPromptAction().showToast({
              message: $r('app.string.media_file_invalid'),
              duration: Const.DURATION,
              bottom: Const.BOTTOM
            });
          }
          const nextIndex = result.reason === 'completed' ?
            this.playbackQueue.next(this.playbackMode) : -1;
          if (nextIndex >= 0) {
            this.playbackQueue.index = nextIndex;
            this.queueEntries = this.playbackQueue.paths.slice();
            this.continuePlayback(session, this.playbackQueue.paths[nextIndex], 0);
          } else {
            void this.playbackSessionController.stop();
          }
        });
        // A failed initialization may still be draining Native resources asynchronously.
        nativeOwnsLease = started || player.getState() !== player.PlayerState.IDLE;
        closeInCallback = nativeOwnsLease;
        if (started) { MediaTaskCoordinator.running(lease); }
        else if (nativeOwnsLease) { MediaTaskCoordinator.cancelling(lease); }
        if (!started) {
          this.buttonEnabled = !nativeOwnsLease;
          this.playbackViewModel.isSmartFluencyAvailable = false;
          this.playbackViewModel.isHdrVividConfirmed = false;
          if (recoverySnapshot !== undefined) {
            this.playbackViewModel.markRecoveryFailed();
          }
          this.resetPlaybackProgress();
          failurePromptShown = true;
          this.capturePlaybackFailure();
          Logger.error(TAG, 'Player initialization or startup failed');
          this.getUIContext().getPromptAction().showToast({
            message: $r('app.string.media_file_invalid'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
        } else {
          if (recoverySnapshot !== undefined) {
            this.playbackViewModel.markRecoverySucceeded();
          }
          this.playbackViewModel.isSmartFluencyAvailable = player.isSmartFluencyAvailable();
          this.updateMediaInfo();
          this.startPlaybackInfoUpdates();
          // 起播成功后才开始自动隐藏计时。
          this.showPlaybackControls();
          this.startPlaybackSession();
          const mediaDurationUs = this.currentMediaInfo?.durationUs ?? 0;
          const resumePositionUs = startPositionUs >= 0 ? startPositionUs :
            this.playbackHistory.getResumePosition(this.selectFilePath ?? '', mediaDurationUs);
          if (recoverySnapshot !== undefined) {
            this.requestedSpeed = recoverySnapshot.speed;
            player.setVolume(this.audioMuted ? 0 : this.playerSettings.audioVolume / 100);
            player.setPlaybackSpeed(recoverySnapshot.speed);
            if (recoverySnapshot.paused) {
              player.pause();
            }
          }
          if (resumePositionUs > 0 || recoverySnapshot !== undefined) {
            if (this.resumeSeekTimer !== 0) {
              clearTimeout(this.resumeSeekTimer);
            }
            this.resumeSeekTimer = setTimeout(async () => {
              this.resumeSeekTimer = 0;
              if (!this.isStopping && session === this.playbackSession &&
                await this.requestSeek(Math.max(0, resumePositionUs)) === 'completed') {
                this.getUIContext().getPromptAction().showToast({
                  message: recoverySnapshot === undefined ? $r('app.string.playback_resume_position') :
                    $r('app.string.playback_recovered'), duration: Const.DURATION, bottom: Const.BOTTOM
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
      if (recoverySnapshot !== undefined) {
        this.playbackViewModel.markRecoveryFailed();
      }
      this.resetPlaybackProgress();
      Logger.error(TAG, 'Open or inspect player input file failed: ' + JSON.stringify(error));
      this.getUIContext().getPromptAction().showToast({
        message: $r('app.string.media_file_open_failed'),
        duration: Const.DURATION,
        bottom: Const.BOTTOM
      });
    } finally {
      if (!nativeOwnsLease) {
        try {
          if (reportContext !== undefined) {
            const report = MediaReports.base(lease.id, 'playback', 'failed');
            report.error = MediaReports.error('playback.prepare', -1, 'Playback preparation did not complete');
            void MediaSessionStore.finish(reportContext, lease.id, report)
              .catch((error: Error): void => Logger.warn(TAG, 'Session report: ' + error.message));
          }
        } catch (error) { Logger.warn(TAG, 'Session snapshot: ' + JSON.stringify(error)); }
        finally { MediaTaskCoordinator.release(lease); }
        if (this.playbackLease?.id === lease.id) { this.playbackLease = undefined; }
      }
      MediaFileActivity.endLaunch();
    }
  }

  private async continuePlayback(session: number, path: string, positionUs: number,
    snapshot?: PlaybackRecoverySnapshot): Promise<void> {
    await this.seekRequests.waitForIdle();
    if (session !== this.playbackSession || !this.pageActive || this.isStopping) {
      return;
    }
    this.selectFilePath = path;
    this.play(positionUs, snapshot);
  }

  async prepareRecording(): Promise<void> {
    if (MediaFileActivity.isTranscoding()) {
      this.getUIContext().getPromptAction().showToast({ message: $r('app.string.transcode_resource_busy') });
      return;
    }
    this.configurationTouched = true;
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
    this.playerDraft.load(this.playerSettings);
  }

  private prepareRecorderSettings(): void {
    this.recorderDraft.load(this.cameraData, this.isAdvancedRecorderSupported);
    this.onRecorderDraftChanged();
  }

  private onRecorderDraftChanged(): void {
    const data = this.recorderDraft.toCamera(this.cameraData.videoCodecName);
    const reason: string = ConfigurationFeedback.recordingConstraint(data, deviceInfo.sdkApiVersion);
    this.recorderCapabilityHint = reason || LocalizedText.get($r('app.string.configuration_updated_hint'));
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

  private isHdrVividToBt709Supported(runMode: number): boolean {
    return runMode === Const.VIDEO_DECODER_RUN_MODE_DIRECT_OUTPUT;
  }

  private selectPlayerRenderMode(index: number): void {
    this.playerDraft.runMode = index;
    if (index !== Const.VIDEO_DECODER_RUN_MODE_BUFFER) {
      this.playerDraft.dump = false;
    }
    if (!this.isHdrVividToBt709Supported(index)) {
      this.playerDraft.convertHdrVividToBt709 = false;
    }
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
    if (!this.playerDraft.apply(this.playerSettings)) {
      Logger.error(TAG, 'Invalid player settings');
      return;
    }
    this.isPlayerSettingsVisible = false;
    player.setVolume(this.playerSettings.audioVolume / 100);
    this.audioMuted = false;
    this.volumeBeforeMute = this.playerSettings.audioVolume;
    this.playerSettings.autoHideControls = this.playerDraft.autoHideControls;
    void this.persistConfiguration();
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

  private checkRecorderDraftCapabilities(): void {
    const draft = this.recorderDraft.toCamera(this.cameraData.videoCodecName);
    this.recorderCapabilityHint = ConfigurationFeedback.recording(draft, deviceInfo.sdkApiVersion);
  }

  private applyRecorderSettings(): void {
    if (!this.isAdvancedRecorderSupported) {
      this.recorderDraft.preprocMode = 0;
      this.recorderDraft.dropFrameRate = 0;
      this.recorderDraft.dualOutput = 0;
    }
    if (!this.recorderDraft.apply(this.cameraData)) {
      Logger.error(TAG, 'Invalid recorder settings');
      return;
    }
    // 相机查询会让出执行权；先标记用户已应用，防止启动时的异步读取覆盖刚改的设置。
    this.configurationTouched = true;
    this.isRecorderSettingsVisible = false;
    void this.checkIsProfileSupport().then((): void => { void this.persistConfiguration(); })
      .catch((_error: Error): void => {
        this.configurationNotice = LocalizedText.get($r('app.string.configuration_camera_query_failed'));
      });
  }

  private choosePlayerOption(option: PlayerSettingsOption): void {
    if (option === PlayerSettingsOption.DECODER_TYPE) {
      this.showSettingPicker(MediaSettingsLabels.getDecoderTypeLabels(), this.playerDraft.decoderType,
        (index: number): void => { this.playerDraft.decoderType = index; });
    } else if (option === PlayerSettingsOption.RUN_MODE) {
      this.showSettingPicker(MediaSettingsLabels.getRenderModeLabels(), this.playerDraft.runMode,
        (index: number): void => this.selectPlayerRenderMode(index));
    } else if (option === PlayerSettingsOption.SYNC_MODE) {
      this.showSettingPicker(MediaSettingsLabels.getSyncModeLabels(), this.playerDraft.syncMode,
        (index: number): void => { this.playerDraft.syncMode = index; });
    }
  }

  private resetPlayerSettingsDraft(): void {
    this.isAdvancedPlayerSettingsExpanded = false;
    this.playerDraft = new PlayerSettingsDraft();
  }

  private resetRecorderSettingsDraft(): void {
    this.recorderDraft = new RecorderSettingsDraft();
  }

  private chooseRecorderOption(option: RecorderSettingsOption): void {
    if (option === RecorderSettingsOption.CROP_PERCENT) {
      const percentages: number[] = [50, 75, 90, 100];
      this.showSettingPicker(['50%', '75%', '90%', '100%'], percentages.indexOf(this.recorderDraft.cropPercent),
        (index: number): void => { this.recorderDraft.cropPercent = percentages[index]; });
      return;
    }
    if (option === RecorderSettingsOption.DOWNSAMPLING_TARGET || option === RecorderSettingsOption.SECONDARY_TARGET) {
      const heights: number[] = [360, 480, 720, 1080];
      const selected: number = option === RecorderSettingsOption.DOWNSAMPLING_TARGET ?
        this.recorderDraft.downsamplingHeight : this.recorderDraft.secondaryHeight;
      this.showSettingPicker(['360P', '480P', '720P', '1080P'], heights.indexOf(selected),
        (index: number): void => {
          if (option === RecorderSettingsOption.DOWNSAMPLING_TARGET) {
            this.recorderDraft.downsamplingHeight = heights[index];
          } else {
            this.recorderDraft.secondaryHeight = heights[index];
          }
        });
      return;
    }
    if (option === RecorderSettingsOption.OUTPUT_FORMAT) {
      this.showSettingPicker(Const.OUTPUT_FORMAT, this.recorderDraft.outputFormat,
        (index: number): void => { this.recorderDraft.outputFormat = index; });
    } else if (option === RecorderSettingsOption.VIDEO_CODEC) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderCodecLabels(), this.recorderDraft.codec,
        (index: number): void => { this.recorderDraft.codec = index; });
    } else if (option === RecorderSettingsOption.VIDEO_RESOLUTION) {
      this.showSettingPicker(MediaSettingsLabels.getResolutionLabels(), this.recorderDraft.resolution,
        (index: number): void => { this.recorderDraft.resolution = index; });
    } else if (option === RecorderSettingsOption.VIDEO_FRAME_RATE) {
      this.showSettingPicker(MediaSettingsLabels.getFrameRateLabels(), this.recorderDraft.frameRate, (index: number): void => {
        this.recorderDraft.frameRate = index;
        if (index === 0) {
          this.recorderDraft.dropFrameRate = 0;
        }
      });
    } else if (option === RecorderSettingsOption.SYNC_MODE) {
      this.showSettingPicker(MediaSettingsLabels.getSyncModeLabels(), this.recorderDraft.syncMode,
        (index: number): void => { this.recorderDraft.syncMode = index; });
    } else if (option === RecorderSettingsOption.VIDEO_BITRATE) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderBitrateLabels(), this.recorderDraft.bitrate,
        (index: number): void => { this.recorderDraft.bitrate = index; });
    } else if (option === RecorderSettingsOption.BITRATE_MODE) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderBitrateModeLabels(), this.recorderDraft.bitrateMode,
        (index: number): void => { this.recorderDraft.bitrateMode = index; });
    } else if (option === RecorderSettingsOption.I_FRAME_INTERVAL) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderIFrameIntervalLabels(), this.recorderDraft.iFrameInterval,
        (index: number): void => { this.recorderDraft.iFrameInterval = index; });
    } else if (option === RecorderSettingsOption.AUDIO_SAMPLE_RATE) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderAudioSampleRateLabels(), this.recorderDraft.audioSampleRate,
        (index: number): void => { this.recorderDraft.audioSampleRate = index; });
    } else if (option === RecorderSettingsOption.AUDIO_CHANNEL_COUNT) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderAudioChannelCountLabels(), this.recorderDraft.audioChannelCount,
        (index: number): void => { this.recorderDraft.audioChannelCount = index; });
    } else if (option === RecorderSettingsOption.AUDIO_BITRATE) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderAudioBitrateLabels(), this.recorderDraft.audioBitrate,
        (index: number): void => { this.recorderDraft.audioBitrate = index; });
    } else if (option === RecorderSettingsOption.AUDIO_CAPTURE_LATENCY) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderAudioLatencyLabels(), this.recorderDraft.audioLatency,
        (index: number): void => { this.recorderDraft.audioLatency = index; });
    } else if (option === RecorderSettingsOption.VIDEO_STABILIZATION) {
      this.showSettingPicker(MediaSettingsLabels.getRecorderStabilizationLabels(), this.recorderDraft.stabilization,
        (index: number): void => { this.recorderDraft.stabilization = index; });
    } else if (option === RecorderSettingsOption.VIDEO_PREPROCESSING) {
      this.showSettingPicker(Const.VIDEO_PREPROC_MODE, this.recorderDraft.preprocMode,
        (index: number): void => { this.recorderDraft.preprocMode = index; });
    } else if (option === RecorderSettingsOption.DROP_FRAME_RATE) {
      this.showSettingPicker(Const.VIDEO_DROP_FRAME_RATE, this.recorderDraft.dropFrameRate,
        (index: number): void => { this.recorderDraft.dropFrameRate = index; });
    } else if (option === RecorderSettingsOption.DUAL_OUTPUT) {
      this.showSettingPicker(Const.DUAL_OUTPUT_MODE, this.recorderDraft.dualOutput,
        (index: number): void => { this.recorderDraft.dualOutput = index; });
    }
  }

  @Builder
  PlayerSettingsSheet() {
    PlayerSettingsPanel({
      capabilityHint: ConfigurationFeedback.playback(this.playerDraft.runMode, deviceInfo.sdkApiVersion),
      decoderTypeText: MediaSettingsLabels.getDecoderTypeLabels()[this.playerDraft.decoderType],
      runModeText: MediaSettingsLabels.getRenderModeLabels()[this.playerDraft.runMode],
      syncModeText: MediaSettingsLabels.getSyncModeLabels()[this.playerDraft.syncMode],
      dumpEnabled: this.playerDraft.dump,
      dumpAvailable: this.playerDraft.runMode === Const.VIDEO_DECODER_RUN_MODE_BUFFER,
      volumePercent: this.playerDraft.audioVolume,
      advancedExpanded: this.isAdvancedPlayerSettingsExpanded,
      audioLowLatencyEnabled: this.playerDraft.audioLowLatency,
      autoHideControlsEnabled: this.playerDraft.autoHideControls,
      retainLastFrameEnabled: this.playerDraft.retainLastFrame,
      retainLastFrameAvailable: this.playerDraft.runMode === 0,
      lowLatencyEnabled: this.playerDraft.lowLatency,
      decodingOrderOutputEnabled: this.playerDraft.outputInDecodingOrder,
      hdrVividConversionEnabled: this.playerDraft.convertHdrVividToBt709,
      hdrVividConversionAvailable: this.isHdrVividToBt709Supported(this.playerDraft.runMode),
      onChooseOption: (option: PlayerSettingsOption): void => this.choosePlayerOption(option),
      onDumpChanged: (enabled: boolean): void => {
        this.playerDraft.dump = enabled && this.playerDraft.runMode === Const.VIDEO_DECODER_RUN_MODE_BUFFER;
      },
      onVolumeChanged: (volume: number): void => { this.playerDraft.audioVolume = volume; },
      onAdvancedExpandedChanged: (expanded: boolean): void => {
        this.isAdvancedPlayerSettingsExpanded = expanded;
      },
      onAudioLowLatencyChanged: (enabled: boolean): void => { this.playerDraft.audioLowLatency = enabled; },
      onAutoHideControlsChanged: (enabled: boolean): void => { this.playerDraft.autoHideControls = enabled; },
      onRetainLastFrameChanged: (enabled: boolean): void => { this.playerDraft.retainLastFrame = enabled; },
      onLowLatencyChanged: (enabled: boolean): void => { this.playerDraft.lowLatency = enabled; },
      onDecodingOrderOutputChanged: (enabled: boolean): void => {
        this.playerDraft.outputInDecodingOrder = enabled;
      },
      onHdrVividConversionChanged: (enabled: boolean): void => {
        this.playerDraft.convertHdrVividToBt709 = enabled;
      },
      onCancel: (): void => { this.isPlayerSettingsVisible = false; },
      onRestoreDefaults: (): void => this.resetPlayerSettingsDraft(),
      onApply: (): void => this.applyPlayerSettings()
    })
  }

  @Builder
  RecorderSettingsSheet() {
    RecorderSettingsPanel({
      capabilityHint: this.recorderCapabilityHint,
      onCheckCapabilities: (): void => this.checkRecorderDraftCapabilities(),
      videoDumpEnabled: this.recorderDraft.videoDump,
      stopOnLowSpace: this.recorderDraft.stopOnLowSpace,
      onStorageProtectionChanged: (enabled: boolean): void => { this.recorderDraft.stopOnLowSpace = enabled; },
      advancedOptionsSupported: this.isAdvancedRecorderSupported,
      dropFrameRateEnabled: this.isAdvancedRecorderSupported && this.recorderDraft.frameRate > 0,
      outputFormatText: Const.OUTPUT_FORMAT[this.recorderDraft.outputFormat],
      videoCodecText: MediaSettingsLabels.getRecorderCodecLabels()[this.recorderDraft.codec],
      videoResolutionText: MediaSettingsLabels.getResolutionLabels()[this.recorderDraft.resolution],
      videoFrameRateText: MediaSettingsLabels.getFrameRateLabels()[this.recorderDraft.frameRate],
      syncModeText: MediaSettingsLabels.getSyncModeLabels()[this.recorderDraft.syncMode],
      videoBitrateText: MediaSettingsLabels.getRecorderBitrateLabels()[this.recorderDraft.bitrate],
      bitrateModeText: MediaSettingsLabels.getRecorderBitrateModeLabels()[this.recorderDraft.bitrateMode],
      iFrameIntervalText: MediaSettingsLabels.getRecorderIFrameIntervalLabels()[this.recorderDraft.iFrameInterval],
      audioSampleRateText: MediaSettingsLabels.getRecorderAudioSampleRateLabels()[this.recorderDraft.audioSampleRate],
      audioChannelCountText: MediaSettingsLabels.getRecorderAudioChannelCountLabels()[this.recorderDraft.audioChannelCount],
      audioBitrateText: MediaSettingsLabels.getRecorderAudioBitrateLabels()[this.recorderDraft.audioBitrate],
      audioCaptureLatencyText: MediaSettingsLabels.getRecorderAudioLatencyLabels()[this.recorderDraft.audioLatency],
      videoStabilizationText: MediaSettingsLabels.getRecorderStabilizationLabels()[this.recorderDraft.stabilization],
      videoPreprocessingText: this.recorderDraft.preprocMode === Const.VIDEO_PREPROC_CROP ?
        LocalizedText.get($r('app.string.preprocess_center_crop_prefix')) + this.recorderDraft.cropPercent + '%）' :
        (this.recorderDraft.preprocMode === Const.VIDEO_PREPROC_DOWNSAMPLING ?
          LocalizedText.get($r('app.string.preprocess_downsample_to_prefix')) + this.recorderDraft.downsamplingHeight + 'P' : Const.VIDEO_PREPROC_MODE[0]),
      preprocessMode: this.recorderDraft.preprocMode,
      sourceWidth: this.recorderDraft.resolution === 0 ? Const.VIDEO_WIDTH_4K :
        (this.recorderDraft.resolution === 1 ? Const.VIDEO_WIDTH_1080P : Const.VIDEO_WIDTH_720P),
      sourceHeight: this.recorderDraft.resolution === 0 ? Const.VIDEO_HEIGHT_4K :
        (this.recorderDraft.resolution === 1 ? Const.VIDEO_HEIGHT_1080P : Const.VIDEO_HEIGHT_720P),
      sourceFrameRate: this.recorderDraft.frameRate === 0 ? 30 : 60,
      cropPercent: this.recorderDraft.cropPercent,
      targetHeight: this.recorderDraft.downsamplingHeight,
      secondaryHeight: this.recorderDraft.secondaryHeight,
      secondaryEnabled: this.recorderDraft.dualOutput === 1,
      dropToFrameRate: this.recorderDraft.dropFrameRate === 1 ? 30 : 0,
      dropFrameRateText: Const.VIDEO_DROP_FRAME_RATE[this.recorderDraft.dropFrameRate],
      dualOutputText: Const.DUAL_OUTPUT_MODE[this.recorderDraft.dualOutput],
      onVideoDumpChanged: (enabled: boolean): void => { this.recorderDraft.videoDump = enabled; },
      onChooseOption: (option: RecorderSettingsOption): void => this.chooseRecorderOption(option),
      onCancel: (): void => { this.isRecorderSettingsVisible = false; },
      onRestoreDefaults: (): void => this.resetRecorderSettingsDraft(),
      onApply: (): void => this.applyRecorderSettings()
    })
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
    RecorderSaveAuthorizationPanel({
      onCancel: (): void => { this.isShow = false; },
      onSave: async (): Promise<void> => { await this.saveRecorderOutput(); }
    })
  }

  private async saveRecorderOutput(): Promise<void> {
    await this.checkIsProfileSupport();
    await this.recorderLaunch.launch(this.getUIContext(), this.cameraData);
  }

  @Builder
  MediaInfoPanel() {
    MediaInfoPanelComponent({ sections: this.mediaInfoSections })
  }

  @Builder
  MediaLibraryPage() {
    LibraryPage({
      recentEntries: this.recentEntries,
      queueEntries: this.queueEntries,
      queueIndex: this.playbackQueue.index,
      buttonEnabled: this.buttonEnabled,
      recentPositionPrefix: this.getSettingText($r('app.string.playback_recent_position')),
      recentCompletedText: this.getSettingText($r('app.string.playback_recent_completed')),
      onOpenFiles: (): void => {
        this.activeMainTab = 0;
        void this.selectFile();
      },
      onAddQueue: (): void => {
        void this.selectQueueFiles();
      },
      onClearQueue: (): void => {
        this.playbackQueue.paths = [];
        this.playbackQueue.index = -1;
        this.queueEntries = [];
      },
      onPlayQueueEntry: (index: number): void => this.playQueueEntry(index),
      onPlayRecentEntry: (entry: PlaybackHistoryEntry): void => this.playRecentEntry(entry)
    })
  }

  @Builder
  RecorderHomePage() {
    Stack() {
      RecorderPage({
        cameraWidth: this.cameraData.cameraWidth,
        cameraHeight: this.cameraData.cameraHeight,
        frameRate: this.cameraData.frameRate,
        buttonEnabled: this.buttonEnabled,
        refreshToken: this.recordingHistoryRevision,
        onOpenSettings: (): void => {
          this.prepareRecorderSettings();
          this.isRecorderSettingsVisible = true;
        },
        onStartRecording: (): void => {
          void this.prepareRecording();
      },
      onPlayRecording: (uri: string): void => this.playRecording(uri)
      })
      Column()
        .width(1)
        .height(1)
        .bindSheet($$this.isRecorderSettingsVisible, this.RecorderSettingsSheet(), {
          height: '85%',
          title: {
            title: $r('app.string.recorder_settings_title'),
            subtitle: $r('app.string.recorder_settings_subtitle')
          }
        })
      Column()
        .width(1)
        .height(1)
        .bindSheet($$this.isShow, this.Authorized, {
          height: 210,
          title: { title: $r('app.string.saveButtonTitle') }
        })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  TranscodeHomePage() {
    TranscodePage({ model: this.transcodeModel, onPlayResult: (uri: string): void => this.playRecording(uri) })
  }

  @Builder
  DeviceDiagnosticsHomePage() {
    DeviceDiagnosticsPage({
      configurationReady: this.configurationReady,
      configurationNotice: this.configurationNotice,
      configurationRevision: this.configurationRevision,
      onPreset: (index: number): void => { void this.selectConfiguration(index); },
      onSaveConfiguration: (): void => { void this.persistConfiguration(true); },
      onLoadConfiguration: (): void => { void this.selectConfiguration(-1); },
      onDumpPolicyChanged: (): void => { void this.persistConfiguration(); },
      model: this.playbackViewModel,
      cameraData: this.cameraData,
      selectedDecoder: this.selectedDecoderName,
      selectedEncoder: this.selectedEncoderName,
      onChooseCodec: (item: DeviceCodecCapability): void => {
        if (item.codecType === 1) {
          this.selectedDecoderName = item.codecName;
          this.playerSettings.videoCodecName = item.codecName;
        } else if (item.codecType === 0) {
          if (this.cameraData.preprocMode !== 0 || this.cameraData.enableDualOutput ||
            this.cameraData.dropToFrameRate > 0) {
            this.getUIContext().getPromptAction().showToast({ message: LocalizedText.get($r('app.string.configuration_special_codec_name')) });
            return;
          }
          this.selectedEncoderName = item.codecName;
          this.cameraData.videoCodecName = item.codecName;
        }
      },
      onClearCodecs: (): void => {
        this.selectedDecoderName = '';
        this.selectedEncoderName = '';
        this.playerSettings.videoCodecName = '';
        this.cameraData.videoCodecName = '';
      }
    })
  }

  @Builder
  BottomNavigation() {
    MainBottomNavigation({
      activeIndex: this.activeMainTab,
      onTabSelected: (index: number): void => {
        this.activeMainTab = index;
      }
    })
  }

  @Builder
  QueuePanel() {
    PlayerQueueSheet({
      queueEntries: this.queueEntries,
      queueIndex: this.playbackQueue.index,
      recentEntries: this.recentEntries,
      playbackMode: this.playbackMode,
      autoRecoveryEnabled: this.autoRecoveryEnabled,
      buttonEnabled: this.buttonEnabled,
      recentPositionPrefix: this.getSettingText($r('app.string.playback_recent_position')),
      recentCompletedText: this.getSettingText($r('app.string.playback_recent_completed')),
      onModeChanged: (index: number): void => { this.playbackMode = index; },
      onRecoveryChanged: (enabled: boolean): void => { this.autoRecoveryEnabled = enabled; },
      onAddQueue: (): void => { void this.selectQueueFiles(); },
      onClearQueue: (): void => {
        this.playbackQueue.paths = [];
        this.playbackQueue.index = -1;
        this.queueEntries = [];
      },
      onPlayQueueEntry: (index: number): void => this.playQueueEntry(index),
      onPlayRecentEntry: (entry: PlaybackHistoryEntry): void => this.playRecentEntry(entry)
    })
  }

  @Builder
  PlaybackToolsPanel() {
    PlaybackMoreActionsPanel({
      buttonEnabled: this.buttonEnabled,
      isStopping: this.isStopping,
      hasVideo: this.playbackViewModel.hasVideo,
      hasAudio: this.playbackViewModel.hasAudio,
      audioMuted: this.audioMuted,
      isPlayerSettingsVisible: this.isPlayerSettingsVisible,
      abLoopStartUs: this.abLoopStartUs,
      abLoopEndUs: this.abLoopEndUs,
      isAbLoopEnabled: this.isAbLoopEnabled,
      isBackgroundPlaybackEnabled: this.isBackgroundPlaybackEnabled,
      isPipActive: this.isPipActive,
      subtitleFileName: this.subtitleFileName,
      onClearSubtitle: (): void => this.clearSubtitle(),
      onAction: (action: PlaybackMoreAction): Promise<void> => this.handlePlaybackMoreAction(action)
    })
  }

  private async handlePlaybackMoreAction(action: PlaybackMoreAction): Promise<void> {
    if (action === PlaybackMoreAction.OPEN_QUEUE) {
      this.closePlaybackTools()
      setTimeout(() => this.isQueueVisible = true, 300)
    } else if (action === PlaybackMoreAction.CHANGE_SPEED) {
      this.closePlaybackTools()
      this.showPlaybackSpeedPicker()
    } else if (action === PlaybackMoreAction.DISPLAY_SCALE) {
      this.closePlaybackTools()
      this.selectDisplayScaleMode()
    } else if (action === PlaybackMoreAction.TOGGLE_MUTE) {
      this.toggleMute()
      this.closePlaybackTools()
    } else if (action === PlaybackMoreAction.CHOOSE_TRANSFORM) {
      this.getUIContext().showTextPickerDialog({
        range: Const.getTransformTypes(),
        canLoop: false,
        onAccept: (value: TextPickerResult): void => {
          const transformIndex: number = getPickerSelectedIndex(value.index)
          if (isPickerIndexValid(transformIndex, Const.TRANSFORM_TYPE_COUNT)) {
            this.setTransform(transformIndex)
          }
        }
      })
    } else if (action === PlaybackMoreAction.SELECT_AUDIO_TRACK) {
      this.closePlaybackTools()
      this.selectAudioTrack()
    } else if (action === PlaybackMoreAction.SELECT_SUBTITLE_FILE) {
      this.closePlaybackTools()
      this.selectSubtitleFile()
    } else if (action === PlaybackMoreAction.SELECT_SUBTITLE_DELAY) {
      this.closePlaybackTools()
      this.selectSubtitleDelay()
    } else if (action === PlaybackMoreAction.SELECT_SUBTITLE_STYLE) {
      this.closePlaybackTools()
      this.selectSubtitleStyle()
    } else if (action === PlaybackMoreAction.OPEN_PLAYER_SETTINGS) {
      this.closePlaybackTools()
      setTimeout(() => {
        this.preparePlayerSettings()
        this.isPlayerSettingsVisible = true
      }, 300)
    } else if (action === PlaybackMoreAction.SET_AB_LOOP_START) {
      this.setAbLoopStart()
      this.closePlaybackTools()
    } else if (action === PlaybackMoreAction.SET_AB_LOOP_END) {
      this.setAbLoopEnd()
      this.closePlaybackTools()
    } else if (action === PlaybackMoreAction.CLEAR_AB_LOOP) {
      this.resetAbLoop()
      this.closePlaybackTools()
    } else if (action === PlaybackMoreAction.TOGGLE_BACKGROUND_PLAYBACK) {
      await this.toggleBackgroundPlayback()
      this.closePlaybackTools()
    } else if (action === PlaybackMoreAction.EXIT_PIP) {
      await this.stopPictureInPicture()
      this.closePlaybackTools()
    } else if (action === PlaybackMoreAction.ENTER_PIP) {
      await this.togglePictureInPicture()
      this.closePlaybackTools()
    }
  }

  private formatHistoryPosition(positionUs: number): string {
    const totalSeconds: number = Math.floor(Math.max(0, positionUs) / 1000000)
    const minutes: number = Math.floor(totalSeconds / 60)
    const seconds: number = totalSeconds % 60
    return (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds
  }


  private showPlaybackSpeedPicker(): void {
    TextPickerDialog.show({
      range: Const.PLAYBACK_SPEED,
      canLoop: false,
      onAccept: (value: TextPickerResult): void => {
        switch (value.value) {
          case Const.PLAYBACK_SPEED[0]:
            this.setPlaybackSpeed(1);
            this.getUIContext().getPromptAction().showToast({ message: 'X1' });
            break;
          case Const.PLAYBACK_SPEED[1]: {
            this.setPlaybackSpeed(2);
            const message: Resource | string = this.playbackViewModel.isSmartFluencyAvailable ?
              $r('app.string.smart_fluency_x2') : 'X2';
            this.getUIContext().getPromptAction().showToast({ message: message });
            break;
          }
          case Const.PLAYBACK_SPEED[2]: {
            this.setPlaybackSpeed(3);
            const message: Resource | string = this.playbackViewModel.isSmartFluencyAvailable ?
              $r('app.string.smart_fluency_x3') : 'X3';
            this.getUIContext().getPromptAction().showToast({ message: message });
            break;
          }
          default:
            break;
        }
      }
    });
  }

  @Builder
  SubtitleSettings() {
    SubtitleSettingsPanel({ style: this.subtitleStyle })
  }

  @Builder
  Window() {
    Stack({ alignContent: Alignment.TopEnd }) {
      PlayerSurface({
        controller: this.xComponentController,
        sourceWidth: this.videoSourceWidth,
        sourceHeight: this.videoSourceHeight,
        sourceRotation: this.videoSourceRotation,
        transformType: this.transformType,
        displayMode: this.displayScaleMode,
        onAreaChanged: (_oldArea: Area, newArea: Area): void => this.updatePlaybackWindowWidth(newArea)
      })
      PlayerStatusOverlay({
        audioOnly: this.selectFilePath !== null && !this.playbackViewModel.hasVideo &&
          this.playbackViewModel.hasAudio,
        audioOnlyText: this.getSettingText($r('app.string.playback_audio_only')),
        hdrVisible: this.playbackViewModel.hasVideo && this.playbackViewModel.isHdrVividConfirmed,
        subtitleText: this.subtitleText,
        subtitleVisible: this.subtitleStyle.visible,
        subtitleFontSize: this.subtitleStyle.fontSize(),
        subtitleFontColor: this.subtitleStyle.fontColor(),
        subtitleBackgroundColor: this.subtitleStyle.backgroundColor(),
        subtitleAtBottom: this.subtitleStyle.positionIndex === 0
      })
      if (this.playbackFailureText.length > 0) {
        Text(this.playbackFailureText).fontSize(12).fontColor('#FDA29B')
          .width('100%').padding(12).backgroundColor('#CC101828')
      }
      PlaybackDiagnosticsOverlay({
        model: this.playbackViewModel,
        diagnosticsVisible: this.isDiagnosticsVisible,
        textForResource: (resource: Resource): string => this.getSettingText(resource)
      })
    }
    .width(Const.FULL_SIZE)
    .height('auto')
    .layoutWeight(1)
    .backgroundColor(Color.Black)
  }

  @Builder
  PlaybackGestureLayer() {
    PlayerGestureLayer({
        onDoubleTap: (event: GestureEvent): void => this.handlePlaybackWindowDoubleTap(event),
        onTap: (): void => this.handlePlaybackWindowTap(),
        onLongPress: (): void => {
          this.showPlaybackControls();
          if (!this.buttonEnabled && !this.isStopping && this.playbackViewModel.hasVideo) {
            this.setPlaybackSpeed(2);
            const message = this.playbackViewModel.isSmartFluencyAvailable ?
              $r('app.string.smart_fluency_x2') : $r('app.string.playback_speed_x2');
            this.getUIContext().getPromptAction().showToast({ message: message });
          }
        },
        onLongPressEnd: (): void => {
          if (!this.buttonEnabled && !this.isStopping && this.playbackViewModel.hasVideo) {
            this.setPlaybackSpeed(1);
            this.getUIContext().getPromptAction().showToast({ message: $r('app.string.playback_speed_x1') });
          }
        }
    })
  }

  @Builder
  PlaybackProgressPanel() {
    PlaybackProgressPanelComponent({
      model: this.playbackViewModel,
      previewRotation: this.playbackViewModel.seekPreviewRotation,
      diagnosticsVisible: this.isDiagnosticsVisible,
      seekEnabled: (this.playbackViewModel.state === player.PlayerState.PLAYING ||
        this.playbackViewModel.state === player.PlayerState.PAUSED || this.seekRequests.isBusy()) &&
        !this.isStopping && this.playbackViewModel.durationUs > 0,
      onShowMediaInfo: () => {
        this.handlePlaybackControlInteraction();
        this.showMediaInfo();
      },
      onToggleDiagnostics: () => {
        this.handlePlaybackControlInteraction();
        this.isDiagnosticsVisible = !this.isDiagnosticsVisible;
        this.closePlaybackTools();
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

  @Builder
  PlaybackControlBar() {
    PlayerControlBarComponent({
      buttonEnabled: this.buttonEnabled,
      stopping: this.isStopping,
      hasVideo: this.playbackViewModel.hasVideo,
      paused: this.playbackViewModel.state === player.PlayerState.PAUSED,
      fullscreen: this.isFullscreen,
      hasSelectedFile: this.selectFilePath !== null,
      progressVisible: this.isPlaybackProgressVisible,
      controlsVisible: this.isPlaybackControlsVisible,
      autoHideControls: this.playerSettings.autoHideControls,
      moreVisible: $isPlaybackToolsVisible,
      settingsVisible: $isPlayerSettingsVisible,
      progressContent: (): void => this.PlaybackProgressPanel(),
      moreContent: (): void => this.PlaybackToolsPanel(),
      settingsContent: (): void => this.PlayerSettingsSheet(),
      onControlInteraction: (): void => this.handlePlaybackControlInteraction(),
      onSeekBackward: (): void => {
        this.seekBySeconds(-15);
      },
      onStepFrame: (direction: number): void => {
        this.stepFrame(direction);
      },
      onTogglePause: (): void => this.togglePlaybackPause(),
      onSeekForward: (): void => {
        this.seekBySeconds(15);
      },
      onPlayOrStop: (): void => {
        if (this.buttonEnabled) {
          void this.selectFile();
        } else {
          void this.stopPlayback();
        }
      },
      onToggleMore: (): void => {
        this.isPlaybackToolsVisible = true;
      },
      onToggleFullscreen: (): void => this.toggleFullscreen(),
      onReplay: (): void => {
        this.replaySelectedFile();
      }
    })
  }

  // 页面插槽使用具名 Builder 方法，确保 ArkUI 按 Builder 上下文创建自定义组件。
  @Builder
  PlayerPageContent() {
    PlayerPageShell({
      surfaceContent: (): void => this.Window(),
      gestureContent: (): void => this.PlaybackGestureLayer(),
      controlsContent: (): void => this.PlaybackControlBar()
    })
  }

  @Builder
  MainNavigationContent() {
    if (!this.isFullscreen) {
      this.BottomNavigation()
    }
  }

  build() {
    Column() {
      MainTabsPage({
        activeIndex: this.activeMainTab,
        playerContent: (): void => this.PlayerPageContent(),
        libraryContent: (): void => this.MediaLibraryPage(),
        recorderContent: (): void => this.RecorderHomePage(),
        transcodeContent: (): void => this.TranscodeHomePage(),
        deviceContent: (): void => this.DeviceDiagnosticsHomePage(),
        navigationContent: (): void => this.MainNavigationContent()
      })
    }
    .width($r('app.string.full_width'))
    .height($r('app.string.full_height'))
    // 黑色背景延伸到导航区域，防止退出全屏时出现白边。
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
    .backgroundColor(Color.Black)
    .bindSheet($$this.isSubtitleSettingsVisible, this.SubtitleSettings(), {
      height: '85%',
      title: { title: $r('app.string.playback_subtitle_style') }
    })
    .bindSheet($$this.isQueueVisible, this.QueuePanel(), {
      height: '75%',
      title: { title: $r('app.string.playback_queue_sheet_title') }
    })
  }
}
