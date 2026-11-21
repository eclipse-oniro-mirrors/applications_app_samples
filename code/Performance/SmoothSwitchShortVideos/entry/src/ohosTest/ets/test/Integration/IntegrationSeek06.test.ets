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

export default function registerIntegrationSeek06(): void {
  describe('IntegrationSeek06', (): void => {
    it('IntegrationSeek06_001', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(Number.NaN, 10000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_002', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(Number.POSITIVE_INFINITY, 10000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_003', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(-1, 10000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_004', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(0, 10000, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_005', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, Number.NaN, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_006', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, Number.POSITIVE_INFINITY, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_007', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, -1, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_008', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 0, 10);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_009', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 10000, Number.NaN);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_010', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 10000, Number.POSITIVE_INFINITY);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_011', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 10000, -1);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_012', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(5, 10000, 0);
      const expected = 0;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

    it('IntegrationSeek06_013', 0, (): void => {
      const actual = PlaybackPolicy.seekPosition(11.25, 1000, 10);
      const expected = 1000;
      expect(Math.abs(actual - expected) < 0.001).assertTrue();
    });

  });
}
