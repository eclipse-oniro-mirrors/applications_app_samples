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

export default function registerIntegrationSurface03(): void {
  describe('IntegrationSurface03', (): void => {
    it('IntegrationSurface03_001', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(0, 1080, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_002', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(-1, 1080, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_003', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(Number.NaN, 1080, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_004', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(Number.POSITIVE_INFINITY, 1080, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_005', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, 0, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_006', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, -1, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_007', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, Number.NaN, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

    it('IntegrationSurface03_008', 0, (): void => {
      const fitted = PlaybackPolicy.fitSurface(1920, Number.POSITIVE_INFINITY, 1280, 720);
      const expectedWidth = 0;
      const expectedHeight = 0;
      expect(Math.abs(fitted.width - expectedWidth) < 0.001).assertTrue();
      expect(Math.abs(fitted.height - expectedHeight) < 0.001).assertTrue();
    });

  });
}
