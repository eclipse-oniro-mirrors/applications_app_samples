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

export default function registerLifecycleStateSurface01(): void {
  describe('LifecycleStateSurface01', (): void => {
    it('LifecycleStateSurface01_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2560, 321);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2180, 720);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 240, 241);
      const expectedWidth = 240;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1440, 1096);
      const expectedWidth = 1440;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 4, 19);
      const expectedWidth = 4;
      const expectedHeight = 3;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 3840, 2160);
      const expectedWidth = 1215;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1280, 1060);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 512, 4596);
      const expectedWidth = 512;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 17, 2);
      const expectedWidth = 16;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 2560, 1440);
      const expectedWidth = 2560;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 7560, 3240);
      const expectedWidth = 7560;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 2420, 1080);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 4096, 2320);
      const expectedWidth = 4096;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 589.0909090909091;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 1012, 512);
      const expectedWidth = 512;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 1024, 768);
      const expectedWidth = 324;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2520, 1096);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 480, 460);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2148, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 256, 356);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2576, 320);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 7560, 3256);
      const expectedWidth = 7560;
      const expectedHeight = 3240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2160, 4340);
      const expectedWidth = 2160;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 976, 720);
      const expectedWidth = 960;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 480, 360);
      const expectedWidth = 480;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 3840, 2160);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 4708, 8192);
      const expectedWidth = 4608;
      const expectedHeight = 8192;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2048, 1537);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 21, 10);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 1920, 340);
      const expectedWidth = 1920;
      const expectedHeight = 240;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 2048, 1536);
      const expectedWidth = 1536;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 502, 16);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 912, 513);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 121, 9);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 580, 3840);
      const expectedWidth = 480;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2880, 5620);
      const expectedWidth = 2880;
      const expectedHeight = 5120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5140, 2160);
      const expectedWidth = 5040;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 556, 57);
      const expectedWidth = 456;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 512, 4112);
      const expectedWidth = 512;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_040', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 5376, 2804);
      const expectedWidth = 5376;
      const expectedHeight = 2304;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_041', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 1180, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_042', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 1012, 4096);
      const expectedWidth = 512;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('LifecycleStateSurface01_043', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 928, 513);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
