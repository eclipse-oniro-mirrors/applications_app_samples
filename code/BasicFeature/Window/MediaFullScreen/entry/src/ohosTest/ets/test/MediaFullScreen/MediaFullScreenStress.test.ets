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

const CASE_LOG_TAG: string = 'MediaFullScreen_MediaFullScreenStress';

export default function mediaFullScreenStressTest() {
  describe('MediaFullScreenStress_Test', () => {
    beforeAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite start MediaFullScreenStress');
    });
    it('player_transition_case_0__player_transition_case_1', 0, () => {
      {
      const player: VideoPlayerModel = new VideoPlayerModel();
      expect(player.getState()).assertEqual(MediaState.IDLE);
      expect(player.initialize()).assertTrue();
      expect(player.getState()).assertEqual(MediaState.INITIALIZED);
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

    afterAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite end MediaFullScreenStress');
    });
  });
}
