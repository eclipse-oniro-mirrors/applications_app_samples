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

export default function registerPowerDialogSurface08(): void {
  describe('PowerDialogSurface08', (): void => {
    it('PowerDialogSurface08_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1280, 720);
      const expectedWidth = 720;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1080, 2340);
      const expectedWidth = 1080;
      const expectedHeight = 883.6363636363636;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1920, 1441);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1080, 1440, 2560);
      const expectedWidth = 1440;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 256, 2148);
      const expectedWidth = 256;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 3240, 5760);
      const expectedWidth = 3240;
      const expectedHeight = 5760;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 16, 509);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 3840, 2176);
      const expectedWidth = 3840;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(640, 480, 720, 1280);
      const expectedWidth = 720;
      const expectedHeight = 540;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 73, 456);
      const expectedWidth = 57;
      const expectedHeight = 456;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 2049, 1536);
      const expectedWidth = 2048;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 480, 480);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 2560, 1440);
      const expectedWidth = 2560;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1680, 720);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 321, 320);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2304, 4112);
      const expectedWidth = 2304;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 1920, 1920, 1080);
      const expectedWidth = 607.5;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 96, 640);
      const expectedWidth = 80;
      const expectedHeight = 640;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 16, 109);
      const expectedWidth = 16;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2305, 4096);
      const expectedWidth = 2304;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 860, 2880);
      const expectedWidth = 360;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 518, 32);
      const expectedWidth = 18;
      const expectedHeight = 32;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 1200, 1920);
      const expectedWidth = 1200;
      const expectedHeight = 981.8181818181819;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 240, 2020);
      const expectedWidth = 240;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1197, 529);
      const expectedWidth = 1197;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10080, 4820);
      const expectedWidth = 10080;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 10752, 5108);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 336, 320);
      const expectedWidth = 320;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 1024, 768);
      const expectedWidth = 432;
      const expectedHeight = 768;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 58, 57);
      const expectedWidth = 57;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 360, 2980);
      const expectedWidth = 360;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_032', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 96, 80);
      const expectedWidth = 80;
      const expectedHeight = 80;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_033', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1280, 820);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_034', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1280, 721);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_035', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1920, 1200);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_036', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2560, 320);
      const expectedWidth = 2560;
      const expectedHeight = 320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_037', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 480, 496);
      const expectedWidth = 480;
      const expectedHeight = 480;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_038', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(720, 1280, 3840, 2160);
      const expectedWidth = 1215;
      const expectedHeight = 2160;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_039', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8192, 4608);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_040', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 6720, 2896);
      const expectedWidth = 6720;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_041', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 960, 720);
      const expectedWidth = 960;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_042', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 2520, 1080);
      const expectedWidth = 2520;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_043', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2260, 3840);
      const expectedWidth = 2160;
      const expectedHeight = 3840;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_044', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 109, 16);
      const expectedWidth = 9;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_045', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 512, 513);
      const expectedWidth = 512;
      const expectedHeight = 512;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_046', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 613, 912);
      const expectedWidth = 513;
      const expectedHeight = 912;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_047', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2881, 5120);
      const expectedWidth = 2880;
      const expectedHeight = 5120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_048', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 7780, 4320);
      const expectedWidth = 7680;
      const expectedHeight = 4320;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_049', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 2560, 1080);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_050', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1281, 960);
      const expectedWidth = 1280;
      const expectedHeight = 960;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_051', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 9, 6);
      const expectedWidth = 8;
      const expectedHeight = 6;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_052', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2048, 256);
      const expectedWidth = 2048;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('PowerDialogSurface08_053', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 361, 360);
      const expectedWidth = 360;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
