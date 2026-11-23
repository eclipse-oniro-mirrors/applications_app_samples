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

export default function registerIntegrationProgress08(): void {
  describe('IntegrationProgress08', (): void => {
    it('IntegrationProgress08_001', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(Number.NaN, 10000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_002', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(Number.POSITIVE_INFINITY, 10000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_003', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-1, 10000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_004', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 10000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_005', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, Number.NaN, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_006', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, Number.POSITIVE_INFINITY, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_007', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, -1, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_008', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, 0, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_009', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, 10000, Number.NaN);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_010', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, 10000, Number.POSITIVE_INFINITY);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_011', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, 10000, -1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_012', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5, 10000, 0);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_013', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1125, 1000, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_014', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(67500, 120000, 86400);
      const expected = 48600;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_015', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-22500, 120000, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_016', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37500, 60000, 61);
      const expected = 38;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_017', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-125, 1000, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_018', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 60001, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_019', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(375, 6000, 127);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_020', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-449999.875, 3599999, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_021', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2025000.5625, 3600001, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_022', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9374.0625, 9999, 3600);
      const expected = 3375;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_023', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 1001, 61);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_024', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9374.0625, 9999, 60);
      const expected = 56;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_025', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(15250, 61000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_026', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4724998.6875, 3599999, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_027', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(946.6875, 1377, 5);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_028', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-450000, 3600000, 10);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_029', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 86400000, 59);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_030', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1000, 1000, 127);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_031', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 12999, 127);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_032', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(946.6875, 1377, 255);
      const expected = 175;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_033', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(13125.4375, 30001, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_034', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-7500, 120000, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_035', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1377, 1377, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_036', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3150000, 3600000, 5);
      const expected = 4;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_037', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(500.5, 1001, 59);
      const expected = 29;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_038', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(18750.3125, 60001, 500);
      const expected = 156;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_039', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5625, 6000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_040', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4374.5625, 9999, 127);
      const expected = 55;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_041', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-11249.8125, 59999, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_042', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(71251.1875, 60001, 255);
      const expected = 255;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_043', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(33750.5625, 60001, 127);
      const expected = 71;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_044', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000.75, 60001, 60);
      const expected = 45;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_045', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(899999.75, 3599999, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_046', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(674999.8125, 3599999, 500);
      const expected = 93;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_047', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(562.5, 1000, 10);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_048', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(61000, 61000, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_049', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(12500, 10000, 61);
      const expected = 61;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_050', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 6000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('IntegrationProgress08_051', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(18750, 60000, 500);
      const expected = 156;
      expect(actual).assertEqual(expected);
    });

  });
}
