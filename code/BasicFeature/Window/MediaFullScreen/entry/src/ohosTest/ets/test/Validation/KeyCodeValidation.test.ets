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

const CASE_LOG_TAG: string = 'MediaFullScreen_KeyCodeValidation';

export default function keyCodeValidationTest() {
  describe('KeyCodeValidation_Test', () => {
    beforeAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite start KeyCodeValidation');
    });

    it('seek_case_0', 0, () => {
      const duration: number = 1000;
      const percent: number = 0;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(0);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_1', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
    });

    it('fullscreen_case_2', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      expect(model.selectVideo('video2')).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('video1');
    });

    it('window_config_case_3', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.enterImmersive();
      config.exitImmersive();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_4', 0, () => {
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
    });

    it('speed_case_5', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_6', 0, () => {
      const duration: number = 7000;
      const percent: number = 6;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(420);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_7', 0, () => {
      const height: number = 8;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_8', 0, () => {
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
    });

    it('buffer_case_9', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(90);
      expect(buffer.getLastPercent()).assertEqual(90);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
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

    it('combo_case_12', 0, () => {
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
    });

    it('time_format_case_13', 0, () => {
      const inputMs: number = 59029300;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('16:23:49');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_14', 0, () => {
      const value: number = 14;
      expect(TimeFormatter.fillNum(value)).assertEqual('14');
    });

    it('seek_case_15', 0, () => {
      const duration: number = 6000;
      const percent: number = 15;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(900);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_16', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(6000);
      player.play();
      expect(player.seek(-100)).assertTrue();
      expect(player.getPosition()).assertEqual(0);
    });

    it('fullscreen_case_17', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      expect(model.selectVideo('video1')).assertTrue();
      expect(model.getSelectedVideo()).assertEqual('video1');
      expect(model.getMaskShow()).assertTrue();
    });

    it('window_config_case_18', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      config.restorePortrait();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_19', 0, () => {
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
    });

    it('speed_case_20', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_21', 0, () => {
      const duration: number = 2000;
      const percent: number = 21;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(420);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_22', 0, () => {
      const height: number = 23;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_23', 0, () => {
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
    });

    it('buffer_case_24', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(20);
      expect(buffer.getLastPercent()).assertEqual(20);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_25', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(8, 'codec failure');
      expect(error.getCode()).assertEqual(8);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 8 - codec failure');
      expect(error.getCount()).assertEqual(1);
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

    it('combo_case_27', 0, () => {
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
    });

    it('time_format_case_28', 0, () => {
      const inputMs: number = 76084800;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('21:08:04');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_29', 0, () => {
      const value: number = 29;
      expect(TimeFormatter.fillNum(value)).assertEqual('29');
    });

    it('seek_case_30', 0, () => {
      const duration: number = 1000;
      const percent: number = 30;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(300);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_31', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
    });

    it('fullscreen_case_32', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      expect(model.getIsLandscape()).assertFalse();
      expect(model.getIsFullScreen()).assertFalse();
      expect(model.getMaskShow()).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('');
    });

    it('window_config_case_33', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      expect(config.getLayoutFullScreen()).assertTrue();
      expect(config.getBars()).assertEqual(SystemBarMode.NONE);
    });

    it('data_source_case_34', 0, () => {
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
    });

    it('speed_case_35', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_36', 0, () => {
      const duration: number = 7000;
      const percent: number = 36;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(2520);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_37', 0, () => {
      const height: number = 38;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_38', 0, () => {
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
    });

    it('buffer_case_39', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(60);
      expect(buffer.getLastPercent()).assertEqual(60);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_40', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(5, 'codec failure');
      expect(error.getCode()).assertEqual(5);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 5 - codec failure');
      expect(error.getCount()).assertEqual(1);
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

    it('combo_case_42', 0, () => {
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
    });

    it('time_format_case_43', 0, () => {
      const inputMs: number = 6799300;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('01:53:19');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_44', 0, () => {
      const value: number = 44;
      expect(TimeFormatter.fillNum(value)).assertEqual('44');
    });

    it('seek_case_45', 0, () => {
      const duration: number = 6000;
      const percent: number = 45;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(2700);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_46', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(6000);
      player.play();
      expect(player.seek(-100)).assertTrue();
      expect(player.getPosition()).assertEqual(0);
    });

    it('fullscreen_case_47', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      expect(model.onBackPress()).assertTrue();
      expect(model.getSelectedVideo()).assertEqual('');
      expect(model.getOrientation()).assertEqual(ScreenOrientation.PORTRAIT);
      expect(model.onBackPress()).assertFalse();
    });

    it('window_config_case_48', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_49', 0, () => {
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
    });

    it('speed_case_50', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_51', 0, () => {
      const duration: number = 2000;
      const percent: number = 51;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(1020);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_52', 0, () => {
      const height: number = 3;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_53', 0, () => {
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
    });

    it('buffer_case_54', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(100);
      expect(buffer.getLastPercent()).assertEqual(100);
      expect(buffer.isBuffering()).assertFalse();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_55', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(2, 'codec failure');
      expect(error.getCode()).assertEqual(2);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 2 - codec failure');
      expect(error.getCount()).assertEqual(1);
    });

    it('async_case_56', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_57', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(8000);
      player.play();
      player.seek(SeekController.percentToTime(57, 8000));
      expect(player.getPosition()).assertEqual(4560);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('time_format_case_58', 0, () => {
      const inputMs: number = 23914800;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('06:38:34');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_59', 0, () => {
      const value: number = 59;
      expect(TimeFormatter.fillNum(value)).assertEqual('59');
    });

    it('seek_case_60', 0, () => {
      const duration: number = 1000;
      const percent: number = 60;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(600);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_61', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
    });

    it('fullscreen_case_62', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      model.onPrepared();
      expect(model.toggleOrientation()).assertTrue();
      expect(model.getIsLandscape()).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('');
      expect(model.getOrientation()).assertEqual(ScreenOrientation.UNSPECIFIED);
    });

    it('window_config_case_63', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.enterImmersive();
      config.exitImmersive();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_64', 0, () => {
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
    });

    it('speed_case_65', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_66', 0, () => {
      const duration: number = 7000;
      const percent: number = 66;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(4620);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_67', 0, () => {
      const height: number = 18;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_68', 0, () => {
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
    });

    it('buffer_case_69', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(30);
      expect(buffer.getLastPercent()).assertEqual(30);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_70', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(8, 'codec failure');
      expect(error.getCode()).assertEqual(8);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 8 - codec failure');
      expect(error.getCount()).assertEqual(1);
    });

    it('async_case_71', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_72', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(3000);
      player.play();
      player.seek(SeekController.percentToTime(72, 3000));
      expect(player.getPosition()).assertEqual(2160);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('time_format_case_73', 0, () => {
      const inputMs: number = 41029300;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('11:23:49');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_74', 0, () => {
      const value: number = 74;
      expect(TimeFormatter.fillNum(value)).assertEqual('74');
    });

    it('seek_case_75', 0, () => {
      const duration: number = 6000;
      const percent: number = 75;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(4500);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_76', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(6000);
      player.play();
      expect(player.seek(-100)).assertTrue();
      expect(player.getPosition()).assertEqual(0);
    });

    it('fullscreen_case_77', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      expect(model.onPrepared()).assertTrue();
      expect(model.getIsFullScreen()).assertTrue();
      expect(model.getIsLandscape()).assertTrue();
      expect(model.getOrientation()).assertEqual(ScreenOrientation.AUTO_LANDSCAPE);
    });

    it('window_config_case_78', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      config.restorePortrait();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_79', 0, () => {
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
    });

    it('speed_case_80', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_81', 0, () => {
      const duration: number = 2000;
      const percent: number = 81;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(1620);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_82', 0, () => {
      const height: number = 33;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_83', 0, () => {
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
    });

    it('buffer_case_84', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(70);
      expect(buffer.getLastPercent()).assertEqual(70);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_85', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(5, 'codec failure');
      expect(error.getCode()).assertEqual(5);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 5 - codec failure');
      expect(error.getCount()).assertEqual(1);
    });

    it('async_case_86', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_87', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(8000);
      player.play();
      player.seek(SeekController.percentToTime(87, 8000));
      expect(player.getPosition()).assertEqual(6960);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('time_format_case_88', 0, () => {
      const inputMs: number = 58084800;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('16:08:04');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_89', 0, () => {
      const value: number = 89;
      expect(TimeFormatter.fillNum(value)).assertEqual('89');
    });

    it('seek_case_90', 0, () => {
      const duration: number = 1000;
      const percent: number = 90;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(900);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_91', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
    });

    it('fullscreen_case_92', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      expect(model.onPrepared()).assertFalse();
      expect(model.getIsFullScreen()).assertFalse();
    });

    it('window_config_case_93', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.applyLandscape();
      expect(config.getLayoutFullScreen()).assertTrue();
      expect(config.getBars()).assertEqual(SystemBarMode.NONE);
    });

    it('data_source_case_94', 0, () => {
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
    });

    it('speed_case_95', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_96', 0, () => {
      const duration: number = 7000;
      const percent: number = 96;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(6720);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_97', 0, () => {
      const height: number = 48;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_98', 0, () => {
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
    });

    it('buffer_case_99', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(0);
      expect(buffer.getLastPercent()).assertEqual(0);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_100', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(2, 'codec failure');
      expect(error.getCode()).assertEqual(2);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 2 - codec failure');
      expect(error.getCount()).assertEqual(1);
    });

    it('async_case_101', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_102', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(3000);
      player.play();
      player.seek(SeekController.percentToTime(1, 3000));
      expect(player.getPosition()).assertEqual(30);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('time_format_case_103', 0, () => {
      const inputMs: number = 78799300;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('21:53:19');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_104', 0, () => {
      const value: number = 4;
      expect(TimeFormatter.fillNum(value)).assertEqual('04');
    });

    it('seek_case_105', 0, () => {
      const duration: number = 6000;
      const percent: number = 4;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(240);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_106', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(6000);
      player.play();
      expect(player.seek(-100)).assertTrue();
      expect(player.getPosition()).assertEqual(0);
    });

    it('fullscreen_case_107', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      expect(model.selectVideo('')).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('');
    });

    it('window_config_case_108', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_109', 0, () => {
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
    });

    it('speed_case_110', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_111', 0, () => {
      const duration: number = 2000;
      const percent: number = 10;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(200);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_112', 0, () => {
      const height: number = 13;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    it('session_case_113', 0, () => {
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
    });

    it('buffer_case_114', 0, () => {
      const buffer: BufferStateModel = new BufferStateModel();
      buffer.onBufferingStart();
      expect(buffer.isBuffering()).assertTrue();
      buffer.onBufferingUpdate(40);
      expect(buffer.getLastPercent()).assertEqual(40);
      expect(buffer.isBuffering()).assertTrue();
      expect(buffer.getUpdates() > 0).assertTrue();
    });

    it('error_case_115', 0, () => {
      const error: PlayerErrorModel = new PlayerErrorModel();
      error.setError(8, 'codec failure');
      expect(error.getCode()).assertEqual(8);
      expect(error.isFatal()).assertTrue();
      expect(error.getMessage()).assertEqual('codec failure');
      expect(error.describe()).assertEqual('Error 8 - codec failure');
      expect(error.getCount()).assertEqual(1);
    });

    it('async_case_116', 0, async () => {
      const before: number = Date.now();
      await delayMs(1);
      const after: number = Date.now();
      expect(after >= before).assertTrue();
      const player: VideoPlayerModel = new VideoPlayerModel();
      player.prepare(1000);
      expect(player.play()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('combo_case_117', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(8000);
      player.play();
      player.seek(SeekController.percentToTime(16, 8000));
      expect(player.getPosition()).assertEqual(1280);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(3))).assertEqual(3);
      expect(source.totalCount()).assertEqual(3);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
    });

    it('time_format_case_118', 0, () => {
      const inputMs: number = 5914800;
      const formatted: string = TimeFormatter.format(inputMs);
      expect(formatted).assertEqual('01:38:34');
      expect(formatted.length >= 5).assertTrue();
    });

    it('fillnum_case_119', 0, () => {
      const value: number = 19;
      expect(TimeFormatter.fillNum(value)).assertEqual('19');
    });

    it('seek_case_120', 0, () => {
      const duration: number = 1000;
      const percent: number = 19;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(190);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('player_transition_case_121', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.prepare(1000)).assertTrue();
      expect(player.getState()).assertEqual(MediaState.PREPARED);
      expect(player.getDuration()).assertEqual(1000);
    });

    it('fullscreen_case_122', 0, () => {
      const model: FullscreenModel = new FullscreenModel();
      model.selectVideo('video1');
      expect(model.selectVideo('video2')).assertFalse();
      expect(model.getSelectedVideo()).assertEqual('video1');
    });

    it('window_config_case_123', 0, () => {
      const config: WindowConfigModel = new WindowConfigModel();
      config.enterImmersive();
      config.exitImmersive();
      expect(config.getLayoutFullScreen()).assertFalse();
      expect(config.getBars()).assertEqual(SystemBarMode.BOTH);
    });

    it('data_source_case_124', 0, () => {
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
    });

    it('speed_case_125', 0, () => {
      const controller: PlaybackSpeedController = new PlaybackSpeedController();
      expect(controller.setIndex(0)).assertTrue();
      expect(controller.getIndex()).assertEqual(0);
      expect(controller.getText()).assertEqual(SPEED_OPTIONS[0].text);
      expect(controller.getMultiplier()).assertEqual(SPEED_OPTIONS[0].multiplier);
      expect(controller.setIndex(5)).assertFalse();
      expect(controller.setIndex(-1)).assertFalse();
    });

    it('seek_case_126', 0, () => {
      const duration: number = 7000;
      const percent: number = 25;
      const target: number = SeekController.percentToTime(percent, duration);
      expect(target).assertEqual(1750);
      expect(target >= 0).assertTrue();
      expect(target <= duration).assertTrue();
      expect(SeekController.timeToPercent(target, duration) >= 0).assertTrue();
      expect(SeekController.timeToPercent(target, duration) <= 100).assertTrue();
    });

    it('aspect_case_127', 0, () => {
      const height: number = 28;
      const width: number = AspectRatioUtil.widthForHeight(height);
      expect(nearlyEqual(width, height * VIDEO_ASPECT_RATIO, 0.000001)).assertTrue();
      expect(nearlyEqual(AspectRatioUtil.heightForWidth(width), height, 0.000001)).assertTrue();
      expect(AspectRatioUtil.isLandscapeRatio(VIDEO_ASPECT_RATIO)).assertTrue();
      expect(AspectRatioUtil.isPortraitRatio(0.5)).assertTrue();
      expect(AspectRatioUtil.isSquareRatio(1)).assertTrue();
    });

    afterAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite end KeyCodeValidation');
    });
  });
}
