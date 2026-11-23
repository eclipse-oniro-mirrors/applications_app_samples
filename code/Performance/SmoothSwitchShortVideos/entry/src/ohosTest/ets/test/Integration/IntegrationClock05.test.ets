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
import { secondToTime } from '../../../../main/ets/common/utils/CommonUtils';

export default function registerIntegrationClock05(): void {
  describe('IntegrationClock05', (): void => {
    it('IntegrationClock05_001', 0, (): void => {
      const actual = secondToTime(Number.NaN);
      const expected = "00:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_002', 0, (): void => {
      const actual = secondToTime(Number.POSITIVE_INFINITY);
      const expected = "00:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_003', 0, (): void => {
      const actual = secondToTime(-1);
      const expected = "00:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_004', 0, (): void => {
      const actual = secondToTime(86401.99);
      const expected = "24:00:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_005', 0, (): void => {
      const actual = secondToTime(82860.99);
      const expected = "23:01:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_006', 0, (): void => {
      const actual = secondToTime(356401.99);
      const expected = "99:00:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_007', 0, (): void => {
      const actual = secondToTime(358200.99);
      const expected = "99:30:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_008', 0, (): void => {
      const actual = secondToTime(356950);
      const expected = "99:09:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_009', 0, (): void => {
      const actual = secondToTime(83400.99);
      const expected = "23:10:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_010', 0, (): void => {
      const actual = secondToTime(32410);
      const expected = "09:00:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_011', 0, (): void => {
      const actual = secondToTime(361858);
      const expected = "100:30:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_012', 0, (): void => {
      const actual = secondToTime(4201.99);
      const expected = "01:10:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_013', 0, (): void => {
      const actual = secondToTime(360009);
      const expected = "100:00:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_014', 0, (): void => {
      const actual = secondToTime(86281);
      const expected = "23:58:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_015', 0, (): void => {
      const actual = secondToTime(36010);
      const expected = "10:00:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_016', 0, (): void => {
      const actual = secondToTime(89949);
      const expected = "24:59:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_017', 0, (): void => {
      const actual = secondToTime(88259);
      const expected = "24:30:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_018', 0, (): void => {
      const actual = secondToTime(32459);
      const expected = "09:00:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_019', 0, (): void => {
      const actual = secondToTime(358259.99);
      const expected = "99:30:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_020', 0, (): void => {
      const actual = secondToTime(36658);
      const expected = "10:10:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_021', 0, (): void => {
      const actual = secondToTime(83458.99);
      const expected = "23:10:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_022', 0, (): void => {
      const actual = secondToTime(35880);
      const expected = "09:58:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_023', 0, (): void => {
      const actual = secondToTime(33001.99);
      const expected = "09:10:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_024', 0, (): void => {
      const actual = secondToTime(33059.99);
      const expected = "09:10:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_025', 0, (): void => {
      const actual = secondToTime(36119);
      const expected = "10:01:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_026', 0, (): void => {
      const actual = secondToTime(83409.99);
      const expected = "23:10:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_027', 0, (): void => {
      const actual = secondToTime(33001);
      const expected = "09:10:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_028', 0, (): void => {
      const actual = secondToTime(356999.99);
      const expected = "99:09:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_029', 0, (): void => {
      const actual = secondToTime(363539.99);
      const expected = "100:58:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_030', 0, (): void => {
      const actual = secondToTime(87058.99);
      const expected = "24:10:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_031', 0, (): void => {
      const actual = secondToTime(359950);
      const expected = "99:59:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_032', 0, (): void => {
      const actual = secondToTime(34201.99);
      const expected = "09:30:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_033', 0, (): void => {
      const actual = secondToTime(363490);
      const expected = "100:58:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_034', 0, (): void => {
      const actual = secondToTime(356410);
      const expected = "99:00:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_035', 0, (): void => {
      const actual = secondToTime(360000);
      const expected = "100:00:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_036', 0, (): void => {
      const actual = secondToTime(601.99);
      const expected = "10:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_037', 0, (): void => {
      const actual = secondToTime(88200);
      const expected = "24:30:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_038', 0, (): void => {
      const actual = secondToTime(4199.99);
      const expected = "01:09:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_039', 0, (): void => {
      const actual = secondToTime(360000.99);
      const expected = "100:00:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_040', 0, (): void => {
      const actual = secondToTime(82859);
      const expected = "23:00:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_041', 0, (): void => {
      const actual = secondToTime(3599);
      const expected = "59:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_042', 0, (): void => {
      const actual = secondToTime(86460);
      const expected = "24:01:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_043', 0, (): void => {
      const actual = secondToTime(36540);
      const expected = "10:09:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_044', 0, (): void => {
      const actual = secondToTime(363549);
      const expected = "100:59:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_045', 0, (): void => {
      const actual = secondToTime(363550.99);
      const expected = "100:59:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_046', 0, (): void => {
      const actual = secondToTime(4210.99);
      const expected = "01:10:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_047', 0, (): void => {
      const actual = secondToTime(86399);
      const expected = "23:59:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_048', 0, (): void => {
      const actual = secondToTime(610.99);
      const expected = "10:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_049', 0, (): void => {
      const actual = secondToTime(32401);
      const expected = "09:00:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_050', 0, (): void => {
      const actual = secondToTime(119);
      const expected = "01:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_051', 0, (): void => {
      const actual = secondToTime(36601);
      const expected = "10:10:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_052', 0, (): void => {
      const actual = secondToTime(33000.99);
      const expected = "09:10:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_053', 0, (): void => {
      const actual = secondToTime(357010);
      const expected = "99:10:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_054', 0, (): void => {
      const actual = secondToTime(118.99);
      const expected = "01:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_055', 0, (): void => {
      const actual = secondToTime(4150);
      const expected = "01:09:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_056', 0, (): void => {
      const actual = secondToTime(34210.99);
      const expected = "09:30:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_057', 0, (): void => {
      const actual = secondToTime(356409);
      const expected = "99:00:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_058', 0, (): void => {
      const actual = secondToTime(87001);
      const expected = "24:10:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_059', 0, (): void => {
      const actual = secondToTime(4209.99);
      const expected = "01:10:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_060', 0, (): void => {
      const actual = secondToTime(359880);
      const expected = "99:58:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_061', 0, (): void => {
      const actual = secondToTime(87010);
      const expected = "24:10:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_062', 0, (): void => {
      const actual = secondToTime(86469);
      const expected = "24:01:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_063', 0, (): void => {
      const actual = secondToTime(32401.99);
      const expected = "09:00:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_064', 0, (): void => {
      const actual = secondToTime(3670);
      const expected = "01:01:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_065', 0, (): void => {
      const actual = secondToTime(86461);
      const expected = "24:01:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_066', 0, (): void => {
      const actual = secondToTime(361810.99);
      const expected = "100:30:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_067', 0, (): void => {
      const actual = secondToTime(3609.99);
      const expected = "01:00:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_068', 0, (): void => {
      const actual = secondToTime(36009);
      const expected = "10:00:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_069', 0, (): void => {
      const actual = secondToTime(82919);
      const expected = "23:01:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_070', 0, (): void => {
      const actual = secondToTime(36069.99);
      const expected = "10:01:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_071', 0, (): void => {
      const actual = secondToTime(35880.99);
      const expected = "09:58:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_072', 0, (): void => {
      const actual = secondToTime(84659);
      const expected = "23:30:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_073', 0, (): void => {
      const actual = secondToTime(84609.99);
      const expected = "23:30:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_074', 0, (): void => {
      const actual = secondToTime(37858);
      const expected = "10:30:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_075', 0, (): void => {
      const actual = secondToTime(363599);
      const expected = "100:59:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_076', 0, (): void => {
      const actual = secondToTime(356941);
      const expected = "99:09:01";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_077', 0, (): void => {
      const actual = secondToTime(1858);
      const expected = "30:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_078', 0, (): void => {
      const actual = secondToTime(360119);
      const expected = "100:01:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_079', 0, (): void => {
      const actual = secondToTime(360550);
      const expected = "100:09:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_080', 0, (): void => {
      const actual = secondToTime(84659.99);
      const expected = "23:30:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_081', 0, (): void => {
      const actual = secondToTime(89880);
      const expected = "24:58:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_082', 0, (): void => {
      const actual = secondToTime(10);
      const expected = "00:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_083', 0, (): void => {
      const actual = secondToTime(36059);
      const expected = "10:00:59";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_084', 0, (): void => {
      const actual = secondToTime(89998);
      const expected = "24:59:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_085', 0, (): void => {
      const actual = secondToTime(83349);
      const expected = "23:09:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_086', 0, (): void => {
      const actual = secondToTime(60);
      const expected = "01:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_087', 0, (): void => {
      const actual = secondToTime(86470.99);
      const expected = "24:01:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_088', 0, (): void => {
      const actual = secondToTime(86950);
      const expected = "24:09:10";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_089', 0, (): void => {
      const actual = secondToTime(361809);
      const expected = "100:30:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_090', 0, (): void => {
      const actual = secondToTime(3660.99);
      const expected = "01:01:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_091', 0, (): void => {
      const actual = secondToTime(363538);
      const expected = "100:58:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_092', 0, (): void => {
      const actual = secondToTime(363480);
      const expected = "100:58:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_093', 0, (): void => {
      const actual = secondToTime(36009.99);
      const expected = "10:00:09";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_094', 0, (): void => {
      const actual = secondToTime(3658);
      const expected = "01:00:58";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_095', 0, (): void => {
      const actual = secondToTime(36600);
      const expected = "10:10:00";
      expect(actual).assertEqual(expected);
    });

    it('IntegrationClock05_096', 0, (): void => {
      const actual = secondToTime(4140);
      const expected = "01:09:00";
      expect(actual).assertEqual(expected);
    });

  });
}
