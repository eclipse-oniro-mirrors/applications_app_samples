/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

/**
 * 边界值矩阵。
 *
 * 每个函数只挑「刚好跨越阈值」的取值：两位数的进位点、毫秒的换单位点、
 * 截断的可用宽度、地址段数的上下邻、检索关键字的空与超长、日志截取的 limit 邻值。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { pad2, formatDuration, truncateMiddle } from '../../../main/ets/utils/FormatUtil';
import { isValidDeviceId, normalizeDeviceId, splitAddress } from '../../../main/ets/model/DeviceAddress';
import { PROFILE_METAS, filterProfiles } from '../../../main/ets/model/ProfileCatalog';
import { LogItem, LogLevel, queryLogs } from '../../../main/ets/model/LogStore';

/** 构造八个日志项，供 limit 边界用例使用 */
function buildEightLogs(): LogItem[] {
  const logs: LogItem[] = [];
  for (let index = 0; index < 8; index++) {
    logs.push(new LogItem('Boundary', `tag${index}`, `detail ${index}`, LogLevel.INFO));
  }
  return logs;
}

export default function bluetoothProfileQualityBoundaryTest() {
  describe('BluetoothProfileQualityBoundaryTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0001
     * @tc.name qualityBoundary0001
     * @tc.desc Verify pad2 across the two digit boundary at 0 returns "00".
     */
    it('qualityBoundary0001', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(0).length).assertEqual(2);
      expect(pad2(0).length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0002
     * @tc.name qualityBoundary0002
     * @tc.desc Verify pad2 across the two digit boundary at 9 returns "09".
     */
    it('qualityBoundary0002', 0, () => {
      expect(pad2(9)).assertEqual('09');
      expect(pad2(9).length).assertEqual(2);
      expect(pad2(9).length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0003
     * @tc.name qualityBoundary0003
     * @tc.desc Verify pad2 across the two digit boundary at 10 returns "10".
     */
    it('qualityBoundary0003', 0, () => {
      expect(pad2(10)).assertEqual('10');
      expect(pad2(10).length).assertEqual(2);
      expect(pad2(10).length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0004
     * @tc.name qualityBoundary0004
     * @tc.desc Verify pad2 across the two digit boundary at 98 returns "98".
     */
    it('qualityBoundary0004', 0, () => {
      expect(pad2(98)).assertEqual('98');
      expect(pad2(98).length).assertEqual(2);
      expect(pad2(98).length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0005
     * @tc.name qualityBoundary0005
     * @tc.desc Verify pad2 across the two digit boundary at 99 returns "99".
     */
    it('qualityBoundary0005', 0, () => {
      expect(pad2(99)).assertEqual('99');
      expect(pad2(99).length).assertEqual(2);
      expect(pad2(99).length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0006
     * @tc.name qualityBoundary0006
     * @tc.desc Verify pad2 across the two digit boundary at 100 returns "100".
     */
    it('qualityBoundary0006', 0, () => {
      expect(pad2(100)).assertEqual('100');
      expect(pad2(100).length).assertEqual(3);
      expect(pad2(100).length >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0007
     * @tc.name qualityBoundary0007
     * @tc.desc Verify formatDuration at -1 ms switches unit exactly once and returns "0 ms".
     */
    it('qualityBoundary0007', 0, () => {
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(-1).length).assertEqual(4);
      expect(formatDuration(-1).indexOf('ms') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0008
     * @tc.name qualityBoundary0008
     * @tc.desc Verify formatDuration at 0 ms switches unit exactly once and returns "0 ms".
     */
    it('qualityBoundary0008', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(0).length).assertEqual(4);
      expect(formatDuration(0).indexOf('ms') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0009
     * @tc.name qualityBoundary0009
     * @tc.desc Verify formatDuration at 999 ms switches unit exactly once and returns "999 ms".
     */
    it('qualityBoundary0009', 0, () => {
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(999).length).assertEqual(6);
      expect(formatDuration(999).indexOf('ms') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0010
     * @tc.name qualityBoundary0010
     * @tc.desc Verify formatDuration at 1000 ms switches unit exactly once and returns "1.0 s".
     */
    it('qualityBoundary0010', 0, () => {
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(1000).length).assertEqual(5);
      expect(formatDuration(1000).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0011
     * @tc.name qualityBoundary0011
     * @tc.desc Verify formatDuration at 1999 ms switches unit exactly once and returns "2.0 s".
     */
    it('qualityBoundary0011', 0, () => {
      expect(formatDuration(1999)).assertEqual('2.0 s');
      expect(formatDuration(1999).length).assertEqual(5);
      expect(formatDuration(1999).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0012
     * @tc.name qualityBoundary0012
     * @tc.desc Verify formatDuration at 59999 ms switches unit exactly once and returns "60.0 s".
     */
    it('qualityBoundary0012', 0, () => {
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(59999).length).assertEqual(6);
      expect(formatDuration(59999).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0013
     * @tc.name qualityBoundary0013
     * @tc.desc Verify formatDuration at 60000 ms switches unit exactly once and returns "1 min 0 s".
     */
    it('qualityBoundary0013', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(60000).length).assertEqual(9);
      expect(formatDuration(60000).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0014
     * @tc.name qualityBoundary0014
     * @tc.desc Verify formatDuration at 60001 ms switches unit exactly once and returns "1 min 0 s".
     */
    it('qualityBoundary0014', 0, () => {
      expect(formatDuration(60001)).assertEqual('1 min 0 s');
      expect(formatDuration(60001).length).assertEqual(9);
      expect(formatDuration(60001).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0015
     * @tc.name qualityBoundary0015
     * @tc.desc Verify formatDuration at 119000 ms switches unit exactly once and returns "1 min 59 s".
     */
    it('qualityBoundary0015', 0, () => {
      expect(formatDuration(119000)).assertEqual('1 min 59 s');
      expect(formatDuration(119000).length).assertEqual(10);
      expect(formatDuration(119000).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0016
     * @tc.name qualityBoundary0016
     * @tc.desc Verify formatDuration at 3600000 ms switches unit exactly once and returns "60 min 0 s".
     */
    it('qualityBoundary0016', 0, () => {
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(3600000).length).assertEqual(10);
      expect(formatDuration(3600000).indexOf('ms') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0017
     * @tc.name qualityBoundary0017
     * @tc.desc Verify truncateMiddle at max below the truncation floor keeps "ABCDEFGHIJ".
     */
    it('qualityBoundary0017', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 3)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 3).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 3).indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0018
     * @tc.name qualityBoundary0018
     * @tc.desc Verify truncateMiddle at smallest truncating width keeps "AB…J".
     */
    it('qualityBoundary0018', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 4)).assertEqual('AB…J');
      expect(truncateMiddle('ABCDEFGHIJ', 4).length).assertEqual(4);
      expect(truncateMiddle('ABCDEFGHIJ', 4).indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0019
     * @tc.name qualityBoundary0019
     * @tc.desc Verify truncateMiddle at width five keeps "AB…IJ".
     */
    it('qualityBoundary0019', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 5)).assertEqual('AB…IJ');
      expect(truncateMiddle('ABCDEFGHIJ', 5).length).assertEqual(5);
      expect(truncateMiddle('ABCDEFGHIJ', 5).indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0020
     * @tc.name qualityBoundary0020
     * @tc.desc Verify truncateMiddle at width six keeps "ABC…IJ".
     */
    it('qualityBoundary0020', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 6)).assertEqual('ABC…IJ');
      expect(truncateMiddle('ABCDEFGHIJ', 6).length).assertEqual(6);
      expect(truncateMiddle('ABCDEFGHIJ', 6).indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0021
     * @tc.name qualityBoundary0021
     * @tc.desc Verify truncateMiddle at width one below length keeps "ABCD…GHIJ".
     */
    it('qualityBoundary0021', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 9)).assertEqual('ABCD…GHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 9).length).assertEqual(9);
      expect(truncateMiddle('ABCDEFGHIJ', 9).indexOf('…') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0022
     * @tc.name qualityBoundary0022
     * @tc.desc Verify truncateMiddle at width equal to length keeps "ABCDEFGHIJ".
     */
    it('qualityBoundary0022', 0, () => {
      expect(truncateMiddle('ABCDEFGHIJ', 10)).assertEqual('ABCDEFGHIJ');
      expect(truncateMiddle('ABCDEFGHIJ', 10).length).assertEqual(10);
      expect(truncateMiddle('ABCDEFGHIJ', 10).indexOf('…') >= 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0023
     * @tc.name qualityBoundary0023
     * @tc.desc Verify the full length address boundary keeps 6 segments and validity true.
     */
    it('qualityBoundary0023', 0, () => {
      expect(splitAddress('A1:B2:C3:D4:E5:F6').length).assertEqual(6);
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual(true);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6')).assertEqual('A1:B2:C3:D4:E5:F6');
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0024
     * @tc.name qualityBoundary0024
     * @tc.desc Verify the one short address boundary keeps 5 segments and validity false.
     */
    it('qualityBoundary0024', 0, () => {
      expect(splitAddress('A1:B2:C3:D4:E5').length).assertEqual(5);
      expect(isValidDeviceId('A1:B2:C3:D4:E5')).assertEqual(false);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5')).assertEqual('A1:B2:C3:D4:E5');
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0025
     * @tc.name qualityBoundary0025
     * @tc.desc Verify the one extra address boundary keeps 7 segments and validity false.
     */
    it('qualityBoundary0025', 0, () => {
      expect(splitAddress('A1:B2:C3:D4:E5:F6:07').length).assertEqual(7);
      expect(isValidDeviceId('A1:B2:C3:D4:E5:F6:07')).assertEqual(false);
      expect(normalizeDeviceId('A1:B2:C3:D4:E5:F6:07')).assertEqual('A1:B2:C3:D4:E5:F6:07');
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0026
     * @tc.name qualityBoundary0026
     * @tc.desc Verify the all zero address boundary keeps 6 segments and validity true.
     */
    it('qualityBoundary0026', 0, () => {
      expect(splitAddress('00:00:00:00:00:00').length).assertEqual(6);
      expect(isValidDeviceId('00:00:00:00:00:00')).assertEqual(true);
      expect(normalizeDeviceId('00:00:00:00:00:00')).assertEqual('00:00:00:00:00:00');
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0027
     * @tc.name qualityBoundary0027
     * @tc.desc Verify the all ones address boundary keeps 6 segments and validity true.
     */
    it('qualityBoundary0027', 0, () => {
      expect(splitAddress('FF:FF:FF:FF:FF:FF').length).assertEqual(6);
      expect(isValidDeviceId('FF:FF:FF:FF:FF:FF')).assertEqual(true);
      expect(normalizeDeviceId('FF:FF:FF:FF:FF:FF')).assertEqual('FF:FF:FF:FF:FF:FF');
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0028
     * @tc.name qualityBoundary0028
     * @tc.desc Verify filterProfiles at the empty keyword boundary returns 1 entry.
     */
    it('qualityBoundary0028', 0, () => {
      const keyword: string = '';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length <= PROFILE_METAS.length).assertTrue();
      expect(filterProfiles(keyword).length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0029
     * @tc.name qualityBoundary0029
     * @tc.desc Verify filterProfiles at the single blank boundary returns 1 entry.
     */
    it('qualityBoundary0029', 0, () => {
      const keyword: string = ' ';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length <= PROFILE_METAS.length).assertTrue();
      expect(filterProfiles(keyword).length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0030
     * @tc.name qualityBoundary0030
     * @tc.desc Verify filterProfiles at the single letter boundary returns 1 entry.
     */
    it('qualityBoundary0030', 0, () => {
      const keyword: string = 'h';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length <= PROFILE_METAS.length).assertTrue();
      expect(filterProfiles(keyword).length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0031
     * @tc.name qualityBoundary0031
     * @tc.desc Verify filterProfiles at the one extra letter boundary returns 0 entry.
     */
    it('qualityBoundary0031', 0, () => {
      const keyword: string = 'hfpp';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length <= PROFILE_METAS.length).assertTrue();
      expect(filterProfiles(keyword).length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0032
     * @tc.name qualityBoundary0032
     * @tc.desc Verify filterProfiles at the padded upper case boundary returns 1 entry.
     */
    it('qualityBoundary0032', 0, () => {
      const keyword: string = '  HFP  ';
      expect(filterProfiles(keyword).length).assertEqual(1);
      expect(filterProfiles(keyword).length <= PROFILE_METAS.length).assertTrue();
      expect(filterProfiles(keyword).length === 0).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0033
     * @tc.name qualityBoundary0033
     * @tc.desc Verify filterProfiles at the very long keyword boundary returns 0 entry.
     */
    it('qualityBoundary0033', 0, () => {
      const keyword: string = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
      expect(filterProfiles(keyword).length).assertEqual(0);
      expect(filterProfiles(keyword).length <= PROFILE_METAS.length).assertTrue();
      expect(filterProfiles(keyword).length === 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0034
     * @tc.name qualityBoundary0034
     * @tc.desc Verify queryLogs at the limit zero returns all keeps 8 rows.
     */
    it('qualityBoundary0034', 0, () => {
      const logs: LogItem[] = buildEightLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length).assertEqual(8);
      expect(logs.length).assertEqual(8);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 0).length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0035
     * @tc.name qualityBoundary0035
     * @tc.desc Verify queryLogs at the limit one keeps 1 rows.
     */
    it('qualityBoundary0035', 0, () => {
      const logs: LogItem[] = buildEightLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length).assertEqual(1);
      expect(logs.length).assertEqual(8);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 1).length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0036
     * @tc.name qualityBoundary0036
     * @tc.desc Verify queryLogs at the limit below total keeps 7 rows.
     */
    it('qualityBoundary0036', 0, () => {
      const logs: LogItem[] = buildEightLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 7).length).assertEqual(7);
      expect(logs.length).assertEqual(8);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 7).length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0037
     * @tc.name qualityBoundary0037
     * @tc.desc Verify queryLogs at the limit equal to total keeps 8 rows.
     */
    it('qualityBoundary0037', 0, () => {
      const logs: LogItem[] = buildEightLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 8).length).assertEqual(8);
      expect(logs.length).assertEqual(8);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 8).length <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_BOUNDARY_0038
     * @tc.name qualityBoundary0038
     * @tc.desc Verify queryLogs at the limit above total keeps 8 rows.
     */
    it('qualityBoundary0038', 0, () => {
      const logs: LogItem[] = buildEightLogs();
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 9).length).assertEqual(8);
      expect(logs.length).assertEqual(8);
      expect(queryLogs(logs, '', LogLevel.DEBUG, '', 9).length <= 8).assertTrue();
    });
  });
}
