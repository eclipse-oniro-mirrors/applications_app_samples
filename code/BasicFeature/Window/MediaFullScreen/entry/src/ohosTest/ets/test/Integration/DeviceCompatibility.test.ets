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

const CASE_LOG_TAG: string = 'MediaFullScreen_DeviceCompatibility';

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
    beforeAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite start DeviceCompatibility');
    });

    it('combo_case_0', 0, () => {
      const player: VideoPlayerModel = new VideoPlayerModel();
      const fullscreen: FullscreenModel = new FullscreenModel();
      const source: FlowDataSource = new FlowDataSource();
      player.prepare(1000);
      player.play();
      player.seek(SeekController.percentToTime(0, 1000));
      expect(player.getPosition()).assertEqual(0);
      fullscreen.selectVideo('combo_video');
      expect(fullscreen.getMaskShow()).assertTrue();
      expect(fullscreen.onPrepared()).assertTrue();
      expect(fullscreen.getIsLandscape()).assertTrue();
      expect(source.pushDataArray(createFlowItems(1))).assertEqual(1);
      expect(source.totalCount()).assertEqual(1);
      expect(player.getState()).assertEqual(MediaState.PLAYING);
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

    afterAll(() => {
      hilog.info(0x0000, CASE_LOG_TAG, 'suite end DeviceCompatibility');
    });
  });
}
