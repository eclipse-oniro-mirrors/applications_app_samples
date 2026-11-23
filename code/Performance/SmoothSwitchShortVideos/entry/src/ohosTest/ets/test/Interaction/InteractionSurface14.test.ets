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

export default function registerInteractionSurface14(): void {
  describe('InteractionSurface14', (): void => {
    it('InteractionSurface14_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 1280, 720);
      const expectedWidth = 960;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 576;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3380, 360);
      const expectedWidth = 2880;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2064, 256);
      const expectedWidth = 2048;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 800, 360);
      const expectedWidth = 151.875;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 2048, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 864;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1936, 1080);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 912, 514);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 810;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 557, 456);
      const expectedWidth = 57;
      const expectedHeight = 456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 513, 512);
      const expectedWidth = 512;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1920, 1200);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5040, 2260);
      const expectedWidth = 5040;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 480, 980);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 640, 81);
      const expectedWidth = 640;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 57, 57);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 1920, 240);
      const expectedWidth = 1920;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8192, 5108);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 1200, 1920);
      const expectedWidth = 1200;
      const expectedHeight = 900;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 2560, 1080);
      const expectedWidth = 2560;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 580, 480);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 7560, 3340);
      const expectedWidth = 7560;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3841, 480);
      const expectedWidth = 3840;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 2048, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1152;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 513, 1012);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 1024, 768);
      const expectedWidth = 1024;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 5108, 8192);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 8, 7);
      const expectedWidth = 8;
      const expectedHeight = 6;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 1280, 720);
      const expectedWidth = 960;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 360, 376);
      const expectedWidth = 360;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 656, 80);
      const expectedWidth = 640;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 480, 580);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1024, 1268);
      const expectedWidth = 1024;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1441, 1080);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1024, 769);
      const expectedWidth = 1024;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 521, 9);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 800, 360);
      const expectedWidth = 640;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1024, 768);
      const expectedWidth = 938.6666666666666;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_040', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 480, 3940);
      const expectedWidth = 480;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_041', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 320, 740);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_042', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 1080, 2340);
      const expectedWidth = 987.1875;
      const expectedHeight = 2340;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_043', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 2, 516);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_044', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 324;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_045', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 57, 956);
      const expectedWidth = 57;
      const expectedHeight = 456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_046', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 3, 16);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_047', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 21, 109);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_048', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 2560, 1440);
      const expectedWidth = 1440;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_049', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 1920, 1200);
      const expectedWidth = 1600;
      const expectedHeight = 1200;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_050', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8193, 4608);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_051', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 320, 256);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_052', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 33, 18);
      const expectedWidth = 32;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_053', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 360, 460);
      const expectedWidth = 360;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_054', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2520, 1081);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_055', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 1, 9);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_056', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 516, 2);
      const expectedWidth = 16;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_057', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 4112, 2304);
      const expectedWidth = 4096;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_058', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 4096, 2305);
      const expectedWidth = 4096;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_059', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 356, 2048);
      const expectedWidth = 256;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_060', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 6720, 2980);
      const expectedWidth = 6720;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_061', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 42, 518);
      const expectedWidth = 42;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_062', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 607.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_063', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 1, 501);
      const expectedWidth = 1;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_064', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 1152;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_065', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 456, 57);
      const expectedWidth = 456;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_066', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 432;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_067', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4624, 8192);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_068', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2160, 3841);
      const expectedWidth = 2160;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_069', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 42, 18);
      const expectedWidth = 42;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_070', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 120, 220);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_071', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3840, 480);
      const expectedWidth = 3840;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface14_072', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 80, 641);
      const expectedWidth = 80;
      const expectedHeight = 640;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
