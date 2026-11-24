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

export default function registerPerformanceStabilitySurface01(): void {
  describe('PerformanceStabilitySurface01', (): void => {
    it('PerformanceStabilitySurface01_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 528, 4096);
      const expectedWidth = 512;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 768, 1024);
      const expectedWidth = 576;
      const expectedHeight = 1024;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1780, 960);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 640, 96);
      const expectedWidth = 640;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 960, 136);
      const expectedWidth = 960;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 80, 580);
      const expectedWidth = 80;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 960, 120);
      const expectedWidth = 960;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 3020, 1080);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 3840, 2260);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1081, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1696, 720);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5376, 2304);
      const expectedWidth = 5376;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2880, 5220);
      const expectedWidth = 2880;
      const expectedHeight = 5120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 57, 457);
      const expectedWidth = 57;
      const expectedHeight = 456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 120, 976);
      const expectedWidth = 120;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4321, 7680);
      const expectedWidth = 4320;
      const expectedHeight = 7680;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 57, 73);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 4, 503);
      const expectedWidth = 4;
      const expectedHeight = 3;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 542, 18);
      const expectedWidth = 42;
      const expectedHeight = 18;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 607.0257611241218;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5120, 2896);
      const expectedWidth = 5120;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 21, 9);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2064, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1280, 976);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 1200, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 57, 157);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8208, 4608);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 16, 10);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 640, 580);
      const expectedWidth = 640;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 240, 256);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 1, 8);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1024, 768);
      const expectedWidth = 1024;
      const expectedHeight = 576;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 7660, 3240);
      const expectedWidth = 7560;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1940, 1080);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 151.875;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5376, 2404);
      const expectedWidth = 5376;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 17, 8);
      const expectedWidth = 1;
      const expectedHeight = 8;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 512, 528);
      const expectedWidth = 512;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1920, 1456);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_040', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4608, 8692);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_041', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_042', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 810;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_043', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1060, 720);
      const expectedWidth = 960;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_044', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10180, 4320);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_045', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2560, 820);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_046', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_047', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2880, 360);
      const expectedWidth = 2880;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_048', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2520, 1180);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_049', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2660, 320);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_050', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1536, 2048);
      const expectedWidth = 1536;
      const expectedHeight = 1256.7272727272727;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_051', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 240, 240);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_052', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 514, 912);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_053', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 4196, 512);
      const expectedWidth = 4096;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_054', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2160, 3856);
      const expectedWidth = 2160;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_055', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 360, 860);
      const expectedWidth = 360;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_056', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 9, 1);
      const expectedWidth = 8;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_057', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5476, 2304);
      const expectedWidth = 5376;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_058', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8180, 4320);
      const expectedWidth = 7680;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_059', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1280, 1220);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_060', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 256, 257);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_061', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 736, 1280);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_062', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5041, 2160);
      const expectedWidth = 5040;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_063', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1296, 960);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_064', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 912, 1013);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_065', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 2560, 1080);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_066', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 4096, 513);
      const expectedWidth = 4096;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_067', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 1936, 240);
      const expectedWidth = 1920;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_068', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2048, 272);
      const expectedWidth = 2048;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_069', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 502, 2);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_070', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 320, 820);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_071', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 118, 32);
      const expectedWidth = 18;
      const expectedHeight = 32;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_072', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1024, 768);
      const expectedWidth = 1024;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_073', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 800, 360);
      const expectedWidth = 202.5;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_074', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 1200, 1920);
      const expectedWidth = 1200;
      const expectedHeight = 674.4730679156909;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_075', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 768, 1024);
      const expectedWidth = 576;
      const expectedHeight = 1024;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_076', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 420, 240);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_077', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 496, 360);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_078', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 57, 58);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_079', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 480, 860);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_080', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 481, 480);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_081', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 3940, 2160);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_082', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 1920, 1200);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_083', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 3841, 2160);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_084', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 320, 240);
      const expectedWidth = 320;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_085', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 720, 1281);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_086', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5760, 3740);
      const expectedWidth = 5760;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_087', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 1920, 1080);
      const expectedWidth = 455.625;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_088', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 7220, 2880);
      const expectedWidth = 6720;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_089', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 512, 4096);
      const expectedWidth = 512;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_090', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_091', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PerformanceStabilitySurface01_092', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 202.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
