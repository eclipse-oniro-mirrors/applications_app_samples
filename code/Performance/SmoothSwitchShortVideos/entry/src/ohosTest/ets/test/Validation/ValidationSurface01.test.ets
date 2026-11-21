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

export default function registerValidationSurface01(): void {
  describe('ValidationSurface01', (): void => {
    it('ValidationSurface01_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 320, 420);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1280, 960);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 960, 736);
      const expectedWidth = 960;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1197, 613);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 432;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1280, 720);
      const expectedWidth = 880;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5377, 2304);
      const expectedWidth = 5376;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 220, 960);
      const expectedWidth = 120;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 800, 360);
      const expectedWidth = 640;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 864;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5760, 3256);
      const expectedWidth = 5760;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 1280, 720);
      const expectedWidth = 405;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1680, 820);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 120, 136);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 820, 240);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 1, 17);
      const expectedWidth = 1;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 361, 2880);
      const expectedWidth = 360;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 257, 2048);
      const expectedWidth = 256;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 116, 9);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 240, 740);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1440, 1081);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2048, 257);
      const expectedWidth = 2048;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 800, 360);
      const expectedWidth = 800;
      const expectedHeight = 337.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 81, 640);
      const expectedWidth = 80;
      const expectedHeight = 640;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 496, 3840);
      const expectedWidth = 480;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 480, 3841);
      const expectedWidth = 480;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 43, 18);
      const expectedWidth = 42;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 576;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1200, 1920);
      const expectedWidth = 1200;
      const expectedHeight = 506.25;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1440, 1580);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 4097, 512);
      const expectedWidth = 4096;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1297, 513);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 120, 1460);
      const expectedWidth = 120;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3840, 481);
      const expectedWidth = 3840;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1920, 1200);
      const expectedWidth = 1200;
      const expectedHeight = 1200;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1197, 1013);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 37, 9);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 628.3636363636364;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 356, 256);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_040', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1024, 768);
      const expectedWidth = 768;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_041', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 32, 118);
      const expectedWidth = 32;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_042', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10752, 4708);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_043', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1080, 1936);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_044', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 1152;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_045', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 640;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_046', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2160, 3840);
      const expectedWidth = 2160;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_047', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 4096, 612);
      const expectedWidth = 4096;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_048', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2880, 860);
      const expectedWidth = 2880;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_049', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 809.367681498829;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_050', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4609, 8192);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_051', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 820, 320);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_052', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1921, 1080);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_053', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 6736, 2880);
      const expectedWidth = 6720;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_054', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 48, 18);
      const expectedWidth = 32;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_055', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 3856, 2160);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_056', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 256, 240);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_057', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2548, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_058', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 2560, 1440);
      const expectedWidth = 1760;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_059', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 108, 1);
      const expectedWidth = 8;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_060', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 303.75;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_061', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 580, 80);
      const expectedWidth = 80;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_062', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 32, 2);
      const expectedWidth = 16;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_063', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1024, 768);
      const expectedWidth = 1024;
      const expectedHeight = 432;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_064', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10080, 4321);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_065', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1524, 768);
      const expectedWidth = 1024;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_066', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 136, 960);
      const expectedWidth = 120;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_067', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 532, 18);
      const expectedWidth = 32;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_068', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 513, 928);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_069', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 116, 2);
      const expectedWidth = 16;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_070', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 513, 1412);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_071', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 404.6838407494145;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_072', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1920, 1081);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_073', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1440, 1080);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_074', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 607.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_075', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 2, 32);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_076', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 800, 360);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_077', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 912, 613);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_078', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 320, 241);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_079', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5860, 3240);
      const expectedWidth = 5760;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_080', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 240, 1921);
      const expectedWidth = 240;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_081', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1280, 736);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_082', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 320, 321);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_083', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 8, 106);
      const expectedWidth = 8;
      const expectedHeight = 6;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_084', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 740, 1920);
      const expectedWidth = 240;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_085', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 19, 32);
      const expectedWidth = 18;
      const expectedHeight = 32;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_086', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 420, 2560);
      const expectedWidth = 320;
      const expectedHeight = 2560;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_087', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 512, 1012);
      const expectedWidth = 512;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_088', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2049, 256);
      const expectedWidth = 2048;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_089', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 2, 8);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_090', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 810;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_091', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 529, 912);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_092', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 256, 2049);
      const expectedWidth = 256;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_093', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 2, 2);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_094', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 980, 360);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_095', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 376, 360);
      const expectedWidth = 360;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_096', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 336, 240);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_097', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 2, 102);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_098', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2561, 320);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_099', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3240, 5776);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_100', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1280, 720);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_101', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5120, 2880);
      const expectedWidth = 5120;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_102', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 2048, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_103', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 768, 1024);
      const expectedWidth = 432;
      const expectedHeight = 1024;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_104', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 202.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_105', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 32, 18);
      const expectedWidth = 32;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_106', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 740, 240);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_107', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 3940, 480);
      const expectedWidth = 3840;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_108', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2420, 240);
      const expectedWidth = 1920;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_109', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 17, 9);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_110', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 1, 108);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_111', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1380, 720);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_112', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 228, 671);
      const expectedWidth = 228;
      const expectedHeight = 171;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_113', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 180, 640);
      const expectedWidth = 80;
      const expectedHeight = 640;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_114', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 16, 502);
      const expectedWidth = 16;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_115', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 720, 1280);
      const expectedWidth = 540;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_116', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1013, 912);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_117', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 768, 1024);
      const expectedWidth = 768;
      const expectedHeight = 431.6627634660422;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_118', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 481, 360);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_119', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 2048, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1152;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_120', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 3840, 2160);
      const expectedWidth = 2880;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_121', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 810;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_122', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 256, 272);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_123', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 1536, 2048);
      const expectedWidth = 1152;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_124', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3740, 5760);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_125', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 648;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_126', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1920, 1080);
      const expectedWidth = 1320;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_127', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_128', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4320, 8180);
      const expectedWidth = 4320;
      const expectedHeight = 7680;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_129', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1681, 720);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_130', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 24, 6);
      const expectedWidth = 8;
      const expectedHeight = 6;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_131', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1080, 2420);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_132', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 9, 516);
      const expectedWidth = 9;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_133', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2048, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_134', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10080, 4336);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_135', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10753, 4608);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_136', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 2, 116);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_137', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 270;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_138', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3241, 5760);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_139', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1080, 2020);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_140', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 864;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_141', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 1280, 720);
      const expectedWidth = 405;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_142', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 480, 361);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('ValidationSurface01_143', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5136, 2880);
      const expectedWidth = 5120;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
