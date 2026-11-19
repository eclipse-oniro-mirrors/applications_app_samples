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
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import {
  MediaState,
  ScreenOrientation,
  SystemBarMode,
  SPEED_OPTIONS,
  TimeFormatter,
  VideoPlayerModel,
  FullscreenModel,
  WindowConfigModel,
  FlowItemModel,
  FlowDataSource,
  PlaybackSpeedController,
  SeekController,
  AspectRatioUtil,
  VideoSessionManager,
  BufferStateModel,
  PlayerErrorModel,
  VIDEO_ASPECT_RATIO
} from '../Shared/MediaModels';
import { createFlowItem, createFlowItems, delayMs, nearlyEqual } from '../Shared/TestUtils';

const CASE_LOG_TAG: string = 'MediaFullScreen_ConfigurationManagerValidation';

export default function configurationManagerValidationTest() {
  describe('ConfigurationManagerValidation_Test', () => {
    beforeAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite start ConfigurationManagerValidation');
    });
    it('window_config_case_0__player_transition_case_1', 0, () => {
      {
      const config: WindowConfigModel = new WindowConfigModel();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
      }
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
      }
    });

    it('fullscreen_case_2__window_config_case_3', 0, () => {
      {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      expect(model.selectVideo('video2')).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('video1');
      }
      {
      const config: WindowConfigModel = new WindowConfigModel();
      config.enterImmersive();
      config.exitImmersive();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
      }
    });

    it('data_source_case_4__speed_case_5', 0, () => {
      {
      const source: FlowDataSource = new FlowDataSource();
      const items: FlowItemModel[] = createFlowItems(5);
      expect(source.pushDataArray(items)).assertEqual(5);
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(-1) === undefined).assertTrue();
      expect(source.addData(0, createFlowItem(100))).assertTrue();
      expect(source.totalCount()).assertEqual(6);
      expect(source.removeData(0)).assertTrue();
      expect(source.totalCount()).assertEqual(5);
      source.notifyReload();
      source.notifyChange();
      expect(source.getReloadNotifications()).assertEqual(1);
      expect(source.getChangeNotifications()).assertEqual(1);
      }
      {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
      }
    });

    it('seek_case_6__aspect_case_7', 0, () => {
      {
      const duration: number = 7000;
      const percent: number = 6;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(420);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
      }
      {
      const height: number = 8;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
      }
    });

    it('session_case_8__buffer_case_9', 0, () => {
      {
      const manager: VideoSessionManager = new VideoSessionManager();
      expect(manager.isIdle()).assertTrue();
      expect(manager.create()).assertTrue();
      expect(manager.getActive()).assertEqual(1);
      expect(manager.create()).assertFalse();
      expect(manager.release()).assertTrue();
      expect(manager.isIdle()).assertTrue();
      expect(manager.release()).assertFalse();
      expect(manager.getCreated()).assertEqual(1);
      expect(manager.getReleased()).assertEqual(1);
      }
      {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(90);
      expect(buffer.getLastPercent()).assertEqual(90);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
      }
    });

    it('error_case_10', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(2, 'codec failure');
      expect(error.getCode()).assertEqual(2);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 2 - codec failure');
      expect(error.getCount()).assertEqual(1);
    });

    it('async_case_11', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_12__time_format_case_13', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(3000);
      player.play();
      player.seek(SeekController.percentToTime(12, 3000));
      expect(player.getPosition()).assertEqual(360);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
      }
      {
      const inputMs: number = 59029300;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('16:23:49');
      expect(formatted.length >= 5).assertTrue();
      }
    });

    it('fillnum_case_14__window_config_case_15', 0, () => {
      {
      const value: number = 14;
      expect(TimeFormatter.fillNum(value)).assertEqual('14');
      }
      {
      const config: WindowConfigModel = new WindowConfigModel();
      config.enterImmersive();
      config.exitImmersive();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
      }
    });

    it('player_transition_case_16__fullscreen_case_17', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(6000);
      player.play();
      expect(player.seek(-100)).assertTrue();
      expect(player.getPosition()).assertEqual(0);
      }
      {
      const model: FullscreenModel = new FullscreenModel();
      expect(model.selectVideo('video1')).assertTrue();
      expect(model.getSelectedVideo()).assertEqual('video1');
      expect(model.getMaskShow()).assertTrue();
      }
    });

    it('window_config_case_18__data_source_case_19', 0, () => {
      {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      config.restorePortrait();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
      }
      {
      const source: FlowDataSource = new FlowDataSource();
      const items: FlowItemModel[] = createFlowItems(5);
      expect(source.pushDataArray(items)).assertEqual(5);
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(-1) === undefined).assertTrue();
      expect(source.addData(0, createFlowItem(100))).assertTrue();
      expect(source.totalCount()).assertEqual(6);
      expect(source.removeData(0)).assertTrue();
      expect(source.totalCount()).assertEqual(5);
      source.notifyReload();
      source.notifyChange();
      expect(source.getReloadNotifications()).assertEqual(1);
      expect(source.getChangeNotifications()).assertEqual(1);
      }
    });

    it('speed_case_20__seek_case_21', 0, () => {
      {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
      }
      {
      const duration: number = 2000;
      const percent: number = 21;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(420);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
      }
    });

    it('aspect_case_22__session_case_23', 0, () => {
      {
      const height: number = 23;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
      }
      {
      const manager: VideoSessionManager = new VideoSessionManager();
      expect(manager.isIdle()).assertTrue();
      expect(manager.create()).assertTrue();
      expect(manager.getActive()).assertEqual(1);
      expect(manager.create()).assertFalse();
      expect(manager.release()).assertTrue();
      expect(manager.isIdle()).assertTrue();
      expect(manager.release()).assertFalse();
      expect(manager.getCreated()).assertEqual(1);
      expect(manager.getReleased()).assertEqual(1);
      }
    });

    it('buffer_case_24__error_case_25', 0, () => {
      {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(20);
      expect(buffer.getLastPercent()).assertEqual(20);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
      }
      {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(8, 'codec failure');
      expect(error.getCode()).assertEqual(8);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 8 - codec failure');
      expect(error.getCount()).assertEqual(1);
      }
    });

    it('async_case_26', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_27__time_format_case_28', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(8000);
      player.play();
      player.seek(SeekController.percentToTime(27, 8000));
      expect(player.getPosition()).assertEqual(2160);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
      }
      {
      const inputMs: number = 76084800;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('21:08:04');
      expect(formatted.length >= 5).assertTrue();
      }
    });

    it('fillnum_case_29__window_config_case_30', 0, () => {
      {
      const value: number = 29;
      expect(TimeFormatter.fillNum(value)).assertEqual('29');
      }
      {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      config.restorePortrait();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
      }
    });

    it('player_transition_case_31__fullscreen_case_32', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
      }
      {
      const model: FullscreenModel = new FullscreenModel();
      expect(model.getIsLandscape()).assertFalse();
      expect(model.getIsFullScreen()).assertFalse();
      expect(model.getMaskShow()).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('');
      }
    });

    it('window_config_case_33__data_source_case_34', 0, () => {
      {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      expect(config.getLayoutFullScreen()).assertTrue();
      expect(config.getBars()).assertEqual(SystemBarMode.NONE);
      }
      {
      const source: FlowDataSource = new FlowDataSource();
      const items: FlowItemModel[] = createFlowItems(5);
      expect(source.pushDataArray(items)).assertEqual(5);
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(-1) === undefined).assertTrue();
      expect(source.addData(0, createFlowItem(100))).assertTrue();
      expect(source.totalCount()).assertEqual(6);
      expect(source.removeData(0)).assertTrue();
      expect(source.totalCount()).assertEqual(5);
      source.notifyReload();
      source.notifyChange();
      expect(source.getReloadNotifications()).assertEqual(1);
      expect(source.getChangeNotifications()).assertEqual(1);
      }
    });

    it('speed_case_35__seek_case_36', 0, () => {
      {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
      }
      {
      const duration: number = 7000;
      const percent: number = 36;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(2520);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
      }
    });

    it('aspect_case_37__session_case_38', 0, () => {
      {
      const height: number = 38;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
      }
      {
      const manager: VideoSessionManager = new VideoSessionManager();
      expect(manager.isIdle()).assertTrue();
      expect(manager.create()).assertTrue();
      expect(manager.getActive()).assertEqual(1);
      expect(manager.create()).assertFalse();
      expect(manager.release()).assertTrue();
      expect(manager.isIdle()).assertTrue();
      expect(manager.release()).assertFalse();
      expect(manager.getCreated()).assertEqual(1);
      expect(manager.getReleased()).assertEqual(1);
      }
    });

    it('buffer_case_39__error_case_40', 0, () => {
      {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(60);
      expect(buffer.getLastPercent()).assertEqual(60);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
      }
      {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(5, 'codec failure');
      expect(error.getCode()).assertEqual(5);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 5 - codec failure');
      expect(error.getCount()).assertEqual(1);
      }
    });

    it('async_case_41', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_42__time_format_case_43', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(3000);
      player.play();
      player.seek(SeekController.percentToTime(42, 3000));
      expect(player.getPosition()).assertEqual(1260);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
      }
      {
      const inputMs: number = 6799300;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('01:53:19');
      expect(formatted.length >= 5).assertTrue();
      }
    });

    it('fillnum_case_44__window_config_case_45', 0, () => {
      {
      const value: number = 44;
      expect(TimeFormatter.fillNum(value)).assertEqual('44');
      }
      {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      expect(config.getLayoutFullScreen()).assertTrue();
      expect(config.getBars()).assertEqual(SystemBarMode.NONE);
      }
    });

    it('player_transition_case_46__fullscreen_case_47', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(6000);
      player.play();
      expect(player.seek(-100)).assertTrue();
      expect(player.getPosition()).assertEqual(0);
      }
      {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      expect(model.onBackPress()).assertTrue();
      expect(model.getSelectedVideo()).assertEqual('');
      expect(model.getOrientation()).assertEqual(ScreenOrientation.PORTRAIT);
      expect(model.onBackPress()).assertFalse();
      }
    });

    it('window_config_case_48__data_source_case_49', 0, () => {
      {
      const config: WindowConfigModel = new WindowConfigModel();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
      }
      {
      const source: FlowDataSource = new FlowDataSource();
      const items: FlowItemModel[] = createFlowItems(5);
      expect(source.pushDataArray(items)).assertEqual(5);
      expect(source.totalCount()).assertEqual(5);
      expect(source.getData(0) !== undefined).assertTrue();
      expect(source.getData(-1) === undefined).assertTrue();
      expect(source.addData(0, createFlowItem(100))).assertTrue();
      expect(source.totalCount()).assertEqual(6);
      expect(source.removeData(0)).assertTrue();
      expect(source.totalCount()).assertEqual(5);
      source.notifyReload();
      source.notifyChange();
      expect(source.getReloadNotifications()).assertEqual(1);
      expect(source.getChangeNotifications()).assertEqual(1);
      }
    });

    it('speed_case_50__seek_case_51', 0, () => {
      {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
      }
      {
      const duration: number = 2000;
      const percent: number = 51;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(1020);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
      }
    });

    afterAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite end ConfigurationManagerValidation');
    });
  });
}
