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

export default function registerInteractionSurface03(): void {
  describe('InteractionSurface03', (): void => {
    it('InteractionSurface03_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 0, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, -1, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, Number.NaN, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, Number.POSITIVE_INFINITY, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1280, 0);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1280, -1);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1280, Number.NaN);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1280, Number.POSITIVE_INFINITY);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 18, 532);
      const expectedWidth = 18;
      const expectedHeight = 32;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 2200, 2480);
      const expectedWidth = 2200;
      const expectedHeight = 1237.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 2048, 1536);
      const expectedWidth = 864;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10080, 4420);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4608, 8208);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3060, 320);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1197, 514);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 294.54545454545456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 25, 16);
      const expectedWidth = 9;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1200, 1920);
      const expectedWidth = 1200;
      const expectedHeight = 1200;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 1, 24);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 540;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 3840, 2160);
      const expectedWidth = 2880;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 3840, 2660);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 2560, 1080);
      const expectedWidth = 455.625;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 32, 19);
      const expectedWidth = 32;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1920, 1200);
      const expectedWidth = 1466.6666666666667;
      const expectedHeight = 1200;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 4096, 2404);
      const expectedWidth = 4096;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 480, 3856);
      const expectedWidth = 480;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3240, 5860);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10752, 4624);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1920, 1080);
      const expectedWidth = 1080;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 501, 8);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface03_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2304, 4196);
      const expectedWidth = 2304;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
