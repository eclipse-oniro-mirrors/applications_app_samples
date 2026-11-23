/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { PlaybackPolicy } from '../../../../main/ets/model/PlaybackPolicy';

export default function registerInteractionSurface05(): void {
  describe('InteractionSurface05', (): void => {
    it('InteractionSurface05_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 18, 32);
      const expectedWidth = 18;
      const expectedHeight = 32;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 4, 103);
      const expectedWidth = 4;
      const expectedHeight = 3;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 480, 481);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 509, 16);
      const expectedWidth = 9;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 1280, 720);
      const expectedWidth = 1280;
      const expectedHeight = 719.4379391100703;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 16, 9);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 80, 1140);
      const expectedWidth = 80;
      const expectedHeight = 640;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8192, 4609);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 7560, 3740);
      const expectedWidth = 7560;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 460, 2880);
      const expectedWidth = 360;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10096, 4320);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1936, 1440);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5120, 3380);
      const expectedWidth = 5120;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 7680, 4820);
      const expectedWidth = 7680;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 504, 3);
      const expectedWidth = 4;
      const expectedHeight = 3;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 607.0257611241218;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 4196, 2304);
      const expectedWidth = 4096;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 360, 2881);
      const expectedWidth = 360;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 328, 171);
      const expectedWidth = 228;
      const expectedHeight = 171;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2536, 1080);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 883.6363636363636;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 121, 120);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1200, 1920);
      const expectedWidth = 1200;
      const expectedHeight = 675;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 16, 18);
      const expectedWidth = 16;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 102, 2);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2521, 1080);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 607.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 240, 2420);
      const expectedWidth = 240;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 720, 1296);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface05_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 8, 22);
      const expectedWidth = 8;
      const expectedHeight = 6;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
