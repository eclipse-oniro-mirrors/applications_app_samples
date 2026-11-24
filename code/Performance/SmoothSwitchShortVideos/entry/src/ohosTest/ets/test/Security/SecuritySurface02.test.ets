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

export default function registerSecuritySurface02(): void {
  describe('SecuritySurface02', (): void => {
    it('SecuritySurface02_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 240, 340);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1198, 513);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 620, 960);
      const expectedWidth = 120;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2896, 360);
      const expectedWidth = 2880;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1124, 768);
      const expectedWidth = 1024;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 2048, 1536);
      const expectedWidth = 864;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 7681, 4320);
      const expectedWidth = 7680;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 57, 557);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 32, 9);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 612, 512);
      const expectedWidth = 512;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 1920, 1200);
      const expectedWidth = 506.25;
      const expectedHeight = 1200;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1080, 1921);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 256, 756);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10752, 4609);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 976, 120);
      const expectedWidth = 960;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 913, 513);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 4, 3);
      const expectedWidth = 4;
      const expectedHeight = 3;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 256, 2064);
      const expectedWidth = 256;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1280, 1460);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 1536, 2048);
      const expectedWidth = 1152;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 405;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1921, 1440);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 456, 157);
      const expectedWidth = 456;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 1200, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2560, 420);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 2560, 1440);
      const expectedWidth = 810;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 102, 16);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10081, 4320);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 73, 57);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 320, 2576);
      const expectedWidth = 320;
      const expectedHeight = 2560;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 8, 6);
      const expectedWidth = 8;
      const expectedHeight = 6;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4608, 8192);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5761, 3240);
      const expectedWidth = 5760;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 120, 120);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 2200, 2480);
      const expectedWidth = 2200;
      const expectedHeight = 1650;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 2560, 1080);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('SecuritySurface02_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 1, 2);
      const expectedWidth = 1;
      const expectedHeight = 1;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
