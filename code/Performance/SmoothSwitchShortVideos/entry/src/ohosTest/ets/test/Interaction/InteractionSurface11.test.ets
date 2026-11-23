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

export default function registerInteractionSurface11(): void {
  describe('InteractionSurface11', (): void => {
    it('InteractionSurface11_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1012, 513);
      const expectedWidth = 912;
      const expectedHeight = 513;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 472, 57);
      const expectedWidth = 456;
      const expectedHeight = 57;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 1080, 1920, 1080);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(352, 288, 800, 360);
      const expectedWidth = 440;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 11252, 4608);
      const expectedWidth = 10752;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 320, 2660);
      const expectedWidth = 320;
      const expectedHeight = 2560;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 720, 1380);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 800, 360);
      const expectedWidth = 640.5;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_009', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(512, 64, 2880, 460);
      const expectedWidth = 2880;
      const expectedHeight = 360;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_010', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 2404, 4096);
      const expectedWidth = 2304;
      const expectedHeight = 4096;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_011', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 1680, 1220);
      const expectedWidth = 1680;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_012', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 228, 271);
      const expectedWidth = 228;
      const expectedHeight = 171;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_013', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 1920, 1580);
      const expectedWidth = 1920;
      const expectedHeight = 1080;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_014', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 256, 256);
      const expectedWidth = 256;
      const expectedHeight = 256;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_015', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1280, 720, 1280, 720);
      const expectedWidth = 1280;
      const expectedHeight = 720;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_016', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(256, 192, 1920, 1540);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_017', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1080, 2560, 2048, 1536);
      const expectedWidth = 648;
      const expectedHeight = 1536;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_018', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(576, 1024, 721, 1280);
      const expectedWidth = 720;
      const expectedHeight = 1280;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_019', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 6720, 2880);
      const expectedWidth = 6720;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_020', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(854, 480, 360, 800);
      const expectedWidth = 360;
      const expectedHeight = 202.34192037470726;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_021', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 620, 120);
      const expectedWidth = 120;
      const expectedHeight = 120;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_022', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 256, 2048);
      const expectedWidth = 256;
      const expectedHeight = 2048;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_023', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 8692, 4608);
      const expectedWidth = 8192;
      const expectedHeight = 4608;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_024', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1024, 576, 5620, 2880);
      const expectedWidth = 5120;
      const expectedHeight = 2880;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_025', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(2560, 1080, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 455.625;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_026', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 2, 17);
      const expectedWidth = 2;
      const expectedHeight = 16;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_027', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 512, 340, 1920);
      const expectedWidth = 240;
      const expectedHeight = 1920;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_028', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1440, 1080, 2560, 1440);
      const expectedWidth = 1920;
      const expectedHeight = 1440;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_029', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(64, 64, 18, 2);
      const expectedWidth = 2;
      const expectedHeight = 2;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_030', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1344, 576, 22, 9);
      const expectedWidth = 21;
      const expectedHeight = 9;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('InteractionSurface11_031', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(3840, 2160, 1080, 1920);
      const expectedWidth = 1080;
      const expectedHeight = 607.5;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
