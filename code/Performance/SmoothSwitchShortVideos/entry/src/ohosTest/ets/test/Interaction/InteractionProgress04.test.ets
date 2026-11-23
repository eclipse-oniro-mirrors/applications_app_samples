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

export default function registerInteractionProgress04(): void {
  describe('InteractionProgress04', (): void => {
    it('InteractionProgress04_001', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(11873.8125, 9999, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_002', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3249.75, 12999, 255);
      const expected = 63;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_003', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-187.5, 1000, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_004', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(63751.0625, 60001, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_005', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-674999.8125, 3599999, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_006', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(48600000, 86400000, 59);
      const expected = 33;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_007', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1000, 1000, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_008', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(26250.875, 30001, 500);
      const expected = 437;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_009', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(52500.875, 60001, 500);
      const expected = 437;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_010', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(19062.5, 61000, 61);
      const expected = 19;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_011', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9999, 9999, 5);
      const expected = 5;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_012', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4999.5, 9999, 500);
      const expected = 250;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_013', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(71250, 60000, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_014', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(3750.125, 30001, 5);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_015', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2474999.3125, 3599999, 255);
      const expected = 175;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_016', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1251.25, 1001, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_017', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(674999.8125, 3599999, 2);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_018', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(774.5625, 1377, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_019', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(68625, 61000, 59);
      const expected = 59;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_020', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1800000, 3600000, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_021', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4275001.1875, 3600001, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_022', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(6499.5, 12999, 255);
      const expected = 127;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_023', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1125, 6000, 3600);
      const expected = 675;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_024', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8936.8125, 12999, 5);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_025', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(62.5, 1000, 127);
      const expected = 7;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_026', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-11437.5, 61000, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_027', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(56249.0625, 59999, 127);
      const expected = 119;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_028', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4275001.1875, 3600001, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_029', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-22500, 120000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_030', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8750, 10000, 61);
      const expected = 53;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_031', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1874.8125, 9999, 59);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_032', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(20625.6875, 30001, 2);
      const expected = 1;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_033', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4499998.75, 3599999, 10);
      const expected = 10;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_034', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(33749.4375, 59999, 59);
      const expected = 33;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_035', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(5000, 10000, 60);
      const expected = 30;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_036', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(4500000, 3600000, 2);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_037', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(2250000.625, 3600001, 255);
      const expected = 159;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_038', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.5, 1377, 60);
      const expected = 30;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_039', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-675000, 3600000, 86400);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_040', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.5, 1377, 5);
      const expected = 2;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_041', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(9999, 9999, 86400);
      const expected = 86400;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_042', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(624.9375, 9999, 500);
      const expected = 31;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_043', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 59999, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_044', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(1575000.4375, 3600001, 10);
      const expected = 4;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_045', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(688.1875, 1001, 5);
      const expected = 3;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_046', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-3750, 60000, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_047', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(437.5, 1000, 86400);
      const expected = 37800;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_048', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(37501.25, 30001, 500);
      const expected = 500;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_049', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-10800000, 86400000, 60);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_050', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(8124.375, 12999, 500);
      const expected = 312;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_051', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(0, 61000, 127);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_052', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(675000.1875, 3600001, 59);
      const expected = 11;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_053', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(45000, 120000, 1);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_054', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(-11249.8125, 59999, 127);
      const expected = 0;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_055', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(10623.9375, 9999, 60);
      const expected = 60;
      expect(actual).assertEqual(expected);
    });

    it('InteractionProgress04_056', 0, (): void => {
      const actual = PlaybackPolicy.sliderPosition(27000000, 86400000, 59);
      const expected = 18;
      expect(actual).assertEqual(expected);
    });

  });
}
