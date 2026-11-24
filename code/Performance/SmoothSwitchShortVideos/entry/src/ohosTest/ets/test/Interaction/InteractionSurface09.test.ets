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

export default function registerInteractionSurface09(): void {
  describe('InteractionSurface09', (): void => {
    it('InteractionSurface09_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 2560, 1440);
      const expectedWidth = 2560;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 607.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 641, 80);
      const expectedWidth = 640;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1920, 1096);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 10, 16);
      const expectedWidth = 9;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 220, 120);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 101, 1);
      const expectedWidth = 1;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 1920, 1200);
      const expectedWidth = 675;
      const expectedHeight = 1200;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 2, 502);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 2200, 2480);
      const expectedWidth = 1046.25;
      const expectedHeight = 2480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2320, 4096);
      const expectedWidth = 2304;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 8060, 3240);
      const expectedWidth = 7560;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 136, 120);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 57, 456);
      const expectedWidth = 57;
      const expectedHeight = 456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 607.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 360, 360);
      const expectedWidth = 360;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 320, 2561);
      const expectedWidth = 320;
      const expectedHeight = 2560;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3840, 580);
      const expectedWidth = 3840;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1580, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 2200, 2480);
      const expectedWidth = 2200;
      const expectedHeight = 1237.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 42, 118);
      const expectedWidth = 42;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 4340, 2160);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10580, 4320);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 810;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4320, 7780);
      const expectedWidth = 4320;
      const expectedHeight = 7680;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 864;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 320, 320);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 2048, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1197, 513);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2048, 1636);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5040, 2660);
      const expectedWidth = 5040;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5376, 2305);
      const expectedWidth = 5376;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 457, 57);
      const expectedWidth = 456;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 228, 172);
      const expectedWidth = 228;
      const expectedHeight = 171;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 9, 116);
      const expectedWidth = 9;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5540, 2160);
      const expectedWidth = 5040;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1280, 720);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 3840, 2160);
      const expectedWidth = 2640;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_040', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 1460, 120);
      const expectedWidth = 960;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_041', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 272, 256);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_042', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 432;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_043', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5760, 3241);
      const expectedWidth = 5760;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_044', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3256, 5760);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_045', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 580, 360);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_046', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 2560, 1440);
      const expectedWidth = 2560;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_047', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8192, 4708);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_048', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 8, 1);
      const expectedWidth = 8;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_049', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1920, 1200);
      const expectedWidth = 1920;
      const expectedHeight = 810;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_050', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 157, 456);
      const expectedWidth = 57;
      const expectedHeight = 456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_051', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3240, 6260);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_052', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2020, 1440);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_053', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_054', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 180, 80);
      const expectedWidth = 80;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_055', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2520, 1580);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_056', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 2560, 1080);
      const expectedWidth = 607.5;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_057', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4320, 7680);
      const expectedWidth = 4320;
      const expectedHeight = 7680;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_058', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 612, 4096);
      const expectedWidth = 512;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_059', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 960, 220);
      const expectedWidth = 960;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_060', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2304, 4596);
      const expectedWidth = 2304;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_061', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10852, 4608);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_062', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 455.625;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_063', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1680, 721);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_064', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 120, 961);
      const expectedWidth = 120;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_065', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 7680, 4336);
      const expectedWidth = 7680;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_066', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 2200, 2480);
      const expectedWidth = 1395;
      const expectedHeight = 2480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_067', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1380, 960);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_068', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 6721, 2880);
      const expectedWidth = 6720;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_069', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 800, 360);
      const expectedWidth = 202.5;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_070', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 2, 16);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_071', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 2, 18);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_072', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 3840, 2160);
      const expectedWidth = 3840;
      const expectedHeight = 2158.313817330211;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_073', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2048, 756);
      const expectedWidth = 2048;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface09_074', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 17, 1);
      const expectedWidth = 1;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
