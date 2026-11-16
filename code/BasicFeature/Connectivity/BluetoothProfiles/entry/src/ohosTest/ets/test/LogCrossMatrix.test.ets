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
 * 页面日志的过滤交叉矩阵。
 *
 * 日志面板同时提供来源下拉、级别下拉、关键字输入与条数上限四个控件，
 * 因此过滤条件必须逐格组合：来源与级别两两交叉、关键字与级别交叉、条数与容量邻值。
 * 固定八条日志既保证期望值可推算，也保证每次运行的输入完全一致。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  LogItem,
  LogLevel,
  appendLog,
  countByTag,
  queryLogs
} from '../../../main/ets/model/LogStore';
import { LOG_STORE_CAPACITY } from '../../../main/ets/common/AppConstants';

/** 固定的八条页面日志，覆盖三个来源与四个级别 */
function logsOf(): LogItem[] {
  return [
    new LogItem('ProfileSession', 'getConnectedDevices', '返回 2 个设备', LogLevel.INFO),
    new LogItem('ProfileSession', 'getConnectionState', 'A1:B2:C3:D4:E5:F6 已连接', LogLevel.DEBUG),
    new LogItem('ProfileFeature', 'hfp.createHfpAgProfile', '调用成功，返回 0 台设备', LogLevel.WARN),
    new LogItem('ProfileFeature', 'hfp.createHfpAgProfile', '调用失败 801', LogLevel.ERROR),
    new LogItem('HomePage', 'aboutToAppear', '页面出现', LogLevel.INFO),
    new LogItem('HfpDemoPage', 'onPageShow', '演示页显示', LogLevel.DEBUG),
    new LogItem('ProfileSession', 'release', '已释放 Profile 实例', LogLevel.WARN),
    new LogItem('HfpDemoPage', 'handleRefresh', '刷新设备列表失败 201', LogLevel.ERROR)
  ];
}

/** 关键字命中的判定：详情或标签任一包含即命中，与 queryLogs 保持一致 */
function matchesKeyword(item: LogItem, keyword: string): boolean {
  const normalized: string = keyword.trim().toLowerCase();
  return item.detail.toLowerCase().indexOf(normalized) >= 0 ||
    item.tag.toLowerCase().indexOf(normalized) >= 0;
}

export default function bluetoothProfileLogCrossTest() {
  describe('BluetoothProfileLogCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0001
     * @tc.name logCross0001
     * @tc.desc Verify queryLogs for all sources at level DEBUG returns 8 rows.
     */
    it('logCross0001', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0002
     * @tc.name logCross0002
     * @tc.desc Verify queryLogs for all sources at level INFO returns 6 rows.
     */
    it('logCross0002', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.INFO);
      expect(result.length).assertEqual(6);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.INFO)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0003
     * @tc.name logCross0003
     * @tc.desc Verify queryLogs for all sources at level WARN returns 4 rows.
     */
    it('logCross0003', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.WARN);
      expect(result.length).assertEqual(4);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.WARN)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0004
     * @tc.name logCross0004
     * @tc.desc Verify queryLogs for all sources at level ERROR returns 2 rows.
     */
    it('logCross0004', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.ERROR);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.ERROR)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0005
     * @tc.name logCross0005
     * @tc.desc Verify queryLogs for ProfileSession at level DEBUG returns 3 rows.
     */
    it('logCross0005', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileSession', LogLevel.DEBUG);
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0006
     * @tc.name logCross0006
     * @tc.desc Verify queryLogs for ProfileSession at level INFO returns 2 rows.
     */
    it('logCross0006', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileSession', LogLevel.INFO);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.INFO)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0007
     * @tc.name logCross0007
     * @tc.desc Verify queryLogs for ProfileSession at level WARN returns 1 rows.
     */
    it('logCross0007', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileSession', LogLevel.WARN);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.WARN)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0008
     * @tc.name logCross0008
     * @tc.desc Verify queryLogs for ProfileSession at level ERROR returns 0 rows.
     */
    it('logCross0008', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileSession', LogLevel.ERROR);
      expect(result.length).assertEqual(0);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.ERROR)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0009
     * @tc.name logCross0009
     * @tc.desc Verify queryLogs for ProfileFeature at level DEBUG returns 2 rows.
     */
    it('logCross0009', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileFeature', LogLevel.DEBUG);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0010
     * @tc.name logCross0010
     * @tc.desc Verify queryLogs for ProfileFeature at level INFO returns 2 rows.
     */
    it('logCross0010', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileFeature', LogLevel.INFO);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.INFO)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0011
     * @tc.name logCross0011
     * @tc.desc Verify queryLogs for ProfileFeature at level WARN returns 2 rows.
     */
    it('logCross0011', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileFeature', LogLevel.WARN);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.WARN)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0012
     * @tc.name logCross0012
     * @tc.desc Verify queryLogs for ProfileFeature at level ERROR returns 1 rows.
     */
    it('logCross0012', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'ProfileFeature', LogLevel.ERROR);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.ERROR)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0013
     * @tc.name logCross0013
     * @tc.desc Verify queryLogs for HomePage at level DEBUG returns 1 rows.
     */
    it('logCross0013', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HomePage', LogLevel.DEBUG);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0014
     * @tc.name logCross0014
     * @tc.desc Verify queryLogs for HomePage at level INFO returns 1 rows.
     */
    it('logCross0014', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HomePage', LogLevel.INFO);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.INFO)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0015
     * @tc.name logCross0015
     * @tc.desc Verify queryLogs for HomePage at level WARN returns 0 rows.
     */
    it('logCross0015', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HomePage', LogLevel.WARN);
      expect(result.length).assertEqual(0);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.WARN)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0016
     * @tc.name logCross0016
     * @tc.desc Verify queryLogs for HomePage at level ERROR returns 0 rows.
     */
    it('logCross0016', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HomePage', LogLevel.ERROR);
      expect(result.length).assertEqual(0);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.ERROR)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0017
     * @tc.name logCross0017
     * @tc.desc Verify queryLogs for HfpDemoPage at level DEBUG returns 2 rows.
     */
    it('logCross0017', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HfpDemoPage', LogLevel.DEBUG);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0018
     * @tc.name logCross0018
     * @tc.desc Verify queryLogs for HfpDemoPage at level INFO returns 1 rows.
     */
    it('logCross0018', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HfpDemoPage', LogLevel.INFO);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.INFO)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0019
     * @tc.name logCross0019
     * @tc.desc Verify queryLogs for HfpDemoPage at level WARN returns 1 rows.
     */
    it('logCross0019', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HfpDemoPage', LogLevel.WARN);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.WARN)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0020
     * @tc.name logCross0020
     * @tc.desc Verify queryLogs for HfpDemoPage at level ERROR returns 1 rows.
     */
    it('logCross0020', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), 'HfpDemoPage', LogLevel.ERROR);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.ERROR)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0021
     * @tc.name logCross0021
     * @tc.desc Verify queryLogs keyword 'empty' keeps 8 of the eight rows.
     */
    it('logCross0021', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '');
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, ''))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0022
     * @tc.name logCross0022
     * @tc.desc Verify queryLogs keyword '' keeps 8 of the eight rows.
     */
    it('logCross0022', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, ' ');
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, ' '))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0023
     * @tc.name logCross0023
     * @tc.desc Verify queryLogs keyword '' keeps 8 of the eight rows.
     */
    it('logCross0023', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '  ');
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '  '))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0024
     * @tc.name logCross0024
     * @tc.desc Verify queryLogs keyword '成功' keeps 1 of the eight rows.
     */
    it('logCross0024', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '成功');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '成功'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0025
     * @tc.name logCross0025
     * @tc.desc Verify queryLogs keyword '失败' keeps 2 of the eight rows.
     */
    it('logCross0025', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '失败');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '失败'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0026
     * @tc.name logCross0026
     * @tc.desc Verify queryLogs keyword '返回' keeps 2 of the eight rows.
     */
    it('logCross0026', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '返回');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '返回'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0027
     * @tc.name logCross0027
     * @tc.desc Verify queryLogs keyword '设备' keeps 3 of the eight rows.
     */
    it('logCross0027', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '设备');
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '设备'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0028
     * @tc.name logCross0028
     * @tc.desc Verify queryLogs keyword '已连接' keeps 1 of the eight rows.
     */
    it('logCross0028', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '已连接');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '已连接'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0029
     * @tc.name logCross0029
     * @tc.desc Verify queryLogs keyword '已释放' keeps 1 of the eight rows.
     */
    it('logCross0029', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '已释放');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '已释放'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0030
     * @tc.name logCross0030
     * @tc.desc Verify queryLogs keyword '页面' keeps 1 of the eight rows.
     */
    it('logCross0030', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '页面');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '页面'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0031
     * @tc.name logCross0031
     * @tc.desc Verify queryLogs keyword '演示页' keeps 1 of the eight rows.
     */
    it('logCross0031', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '演示页');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '演示页'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0032
     * @tc.name logCross0032
     * @tc.desc Verify queryLogs keyword '刷新' keeps 1 of the eight rows.
     */
    it('logCross0032', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '刷新');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '刷新'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0033
     * @tc.name logCross0033
     * @tc.desc Verify queryLogs keyword '801' keeps 1 of the eight rows.
     */
    it('logCross0033', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '801');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '801'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0034
     * @tc.name logCross0034
     * @tc.desc Verify queryLogs keyword '201' keeps 1 of the eight rows.
     */
    it('logCross0034', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '201');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '201'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0035
     * @tc.name logCross0035
     * @tc.desc Verify queryLogs keyword '2' keeps 3 of the eight rows.
     */
    it('logCross0035', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '2');
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '2'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0036
     * @tc.name logCross0036
     * @tc.desc Verify queryLogs keyword '0' keeps 3 of the eight rows.
     */
    it('logCross0036', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '0');
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '0'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0037
     * @tc.name logCross0037
     * @tc.desc Verify queryLogs keyword 'get' keeps 2 of the eight rows.
     */
    it('logCross0037', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'get');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'get'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0038
     * @tc.name logCross0038
     * @tc.desc Verify queryLogs keyword 'GET' keeps 2 of the eight rows.
     */
    it('logCross0038', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'GET');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'GET'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0039
     * @tc.name logCross0039
     * @tc.desc Verify queryLogs keyword 'state' keeps 1 of the eight rows.
     */
    it('logCross0039', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'state');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'state'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0040
     * @tc.name logCross0040
     * @tc.desc Verify queryLogs keyword 'release' keeps 1 of the eight rows.
     */
    it('logCross0040', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'release');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'release'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0041
     * @tc.name logCross0041
     * @tc.desc Verify queryLogs keyword 'refresh' keeps 1 of the eight rows.
     */
    it('logCross0041', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'refresh');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'refresh'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0042
     * @tc.name logCross0042
     * @tc.desc Verify queryLogs keyword 'onPageShow' keeps 1 of the eight rows.
     */
    it('logCross0042', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'onPageShow');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'onPageShow'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0043
     * @tc.name logCross0043
     * @tc.desc Verify queryLogs keyword 'aboutToAppear' keeps 1 of the eight rows.
     */
    it('logCross0043', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'aboutToAppear');
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'aboutToAppear'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0044
     * @tc.name logCross0044
     * @tc.desc Verify queryLogs keyword 'hfp' keeps 2 of the eight rows.
     */
    it('logCross0044', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'hfp');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'hfp'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0045
     * @tc.name logCross0045
     * @tc.desc Verify queryLogs keyword 'HFP' keeps 2 of the eight rows.
     */
    it('logCross0045', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'HFP');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'HFP'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0046
     * @tc.name logCross0046
     * @tc.desc Verify queryLogs keyword 'createHfpAgProfile' keeps 2 of the eight rows.
     */
    it('logCross0046', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'createHfpAgProfile');
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'createHfpAgProfile'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0047
     * @tc.name logCross0047
     * @tc.desc Verify queryLogs keyword 'profile' keeps 3 of the eight rows.
     */
    it('logCross0047', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'profile');
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'profile'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0048
     * @tc.name logCross0048
     * @tc.desc Verify queryLogs keyword 'Profile' keeps 3 of the eight rows.
     */
    it('logCross0048', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'Profile');
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'Profile'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0049
     * @tc.name logCross0049
     * @tc.desc Verify queryLogs keyword 'none' keeps 0 of the eight rows.
     */
    it('logCross0049', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, 'none');
      expect(result.length).assertEqual(0);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, 'none'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0050
     * @tc.name logCross0050
     * @tc.desc Verify queryLogs keyword '日志' keeps 0 of the eight rows.
     */
    it('logCross0050', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '日志');
      expect(result.length).assertEqual(0);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => matchesKeyword(item, '日志'))).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0051
     * @tc.name logCross0051
     * @tc.desc Verify queryLogs limit 0 returns 8 rows without reordering.
     */
    it('logCross0051', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 0);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0052
     * @tc.name logCross0052
     * @tc.desc Verify queryLogs limit 1 returns 1 rows without reordering.
     */
    it('logCross0052', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 1);
      expect(result.length).assertEqual(1);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0053
     * @tc.name logCross0053
     * @tc.desc Verify queryLogs limit 2 returns 2 rows without reordering.
     */
    it('logCross0053', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 2);
      expect(result.length).assertEqual(2);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0054
     * @tc.name logCross0054
     * @tc.desc Verify queryLogs limit 3 returns 3 rows without reordering.
     */
    it('logCross0054', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 3);
      expect(result.length).assertEqual(3);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0055
     * @tc.name logCross0055
     * @tc.desc Verify queryLogs limit 4 returns 4 rows without reordering.
     */
    it('logCross0055', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 4);
      expect(result.length).assertEqual(4);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0056
     * @tc.name logCross0056
     * @tc.desc Verify queryLogs limit 5 returns 5 rows without reordering.
     */
    it('logCross0056', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 5);
      expect(result.length).assertEqual(5);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0057
     * @tc.name logCross0057
     * @tc.desc Verify queryLogs limit 6 returns 6 rows without reordering.
     */
    it('logCross0057', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 6);
      expect(result.length).assertEqual(6);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0058
     * @tc.name logCross0058
     * @tc.desc Verify queryLogs limit 7 returns 7 rows without reordering.
     */
    it('logCross0058', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 7);
      expect(result.length).assertEqual(7);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0059
     * @tc.name logCross0059
     * @tc.desc Verify queryLogs limit 8 returns 8 rows without reordering.
     */
    it('logCross0059', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 8);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0060
     * @tc.name logCross0060
     * @tc.desc Verify queryLogs limit 9 returns 8 rows without reordering.
     */
    it('logCross0060', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 9);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0061
     * @tc.name logCross0061
     * @tc.desc Verify queryLogs limit 20 returns 8 rows without reordering.
     */
    it('logCross0061', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 20);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0062
     * @tc.name logCross0062
     * @tc.desc Verify queryLogs limit -1 returns 8 rows without reordering.
     */
    it('logCross0062', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', -1);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0063
     * @tc.name logCross0063
     * @tc.desc Verify queryLogs limit -5 returns 8 rows without reordering.
     */
    it('logCross0063', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', -5);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0064
     * @tc.name logCross0064
     * @tc.desc Verify queryLogs limit 100 returns 8 rows without reordering.
     */
    it('logCross0064', 0, () => {
      const result: LogItem[] = queryLogs(logsOf(), '', LogLevel.DEBUG, '', 100);
      expect(result.length).assertEqual(8);
      expect(result.length <= 8).assertTrue();
      expect(result.every((item: LogItem) => item.level >= LogLevel.DEBUG)).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0065
     * @tc.name logCross0065
     * @tc.desc Verify appendLog with capacity 0 keeps 9 rows and puts the new one first.
     */
    it('logCross0065', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 0);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0066
     * @tc.name logCross0066
     * @tc.desc Verify appendLog with capacity 1 keeps 1 rows and puts the new one first.
     */
    it('logCross0066', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 1);
      expect(next.length).assertEqual(1);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0067
     * @tc.name logCross0067
     * @tc.desc Verify appendLog with capacity 2 keeps 2 rows and puts the new one first.
     */
    it('logCross0067', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 2);
      expect(next.length).assertEqual(2);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0068
     * @tc.name logCross0068
     * @tc.desc Verify appendLog with capacity 3 keeps 3 rows and puts the new one first.
     */
    it('logCross0068', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 3);
      expect(next.length).assertEqual(3);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0069
     * @tc.name logCross0069
     * @tc.desc Verify appendLog with capacity 5 keeps 5 rows and puts the new one first.
     */
    it('logCross0069', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 5);
      expect(next.length).assertEqual(5);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0070
     * @tc.name logCross0070
     * @tc.desc Verify appendLog with capacity 8 keeps 8 rows and puts the new one first.
     */
    it('logCross0070', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 8);
      expect(next.length).assertEqual(8);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0071
     * @tc.name logCross0071
     * @tc.desc Verify appendLog with capacity 9 keeps 9 rows and puts the new one first.
     */
    it('logCross0071', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 9);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0072
     * @tc.name logCross0072
     * @tc.desc Verify appendLog with capacity 10 keeps 9 rows and puts the new one first.
     */
    it('logCross0072', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 10);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0073
     * @tc.name logCross0073
     * @tc.desc Verify appendLog with capacity 20 keeps 9 rows and puts the new one first.
     */
    it('logCross0073', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 20);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0074
     * @tc.name logCross0074
     * @tc.desc Verify appendLog with capacity 199 keeps 9 rows and puts the new one first.
     */
    it('logCross0074', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 199);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0075
     * @tc.name logCross0075
     * @tc.desc Verify appendLog with capacity 200 keeps 9 rows and puts the new one first.
     */
    it('logCross0075', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 200);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0076
     * @tc.name logCross0076
     * @tc.desc Verify appendLog with capacity 201 keeps 9 rows and puts the new one first.
     */
    it('logCross0076', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, 201);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0077
     * @tc.name logCross0077
     * @tc.desc Verify appendLog with capacity -1 keeps 9 rows and puts the new one first.
     */
    it('logCross0077', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, -1);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0078
     * @tc.name logCross0078
     * @tc.desc Verify appendLog with capacity -100 keeps 9 rows and puts the new one first.
     */
    it('logCross0078', 0, () => {
      const fresh: LogItem = new LogItem('Cross', 'crossTag', 'matrix row', LogLevel.WARN);
      const next: LogItem[] = appendLog(logsOf(), fresh, -100);
      expect(next.length).assertEqual(9);
      expect(next[0].tag).assertEqual('crossTag');
      expect(countByTag(next, 'crossTag')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0079
     * @tc.name logCross0079
     * @tc.desc Verify countByTag reports 1 rows for the tag 'getConnectedDevices'.
     */
    it('logCross0079', 0, () => {
      expect(countByTag(logsOf(), 'getConnectedDevices')).assertEqual(1);
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'getConnectedDevices') <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0080
     * @tc.name logCross0080
     * @tc.desc Verify countByTag reports 1 rows for the tag 'release'.
     */
    it('logCross0080', 0, () => {
      expect(countByTag(logsOf(), 'release')).assertEqual(1);
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'release') <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0081
     * @tc.name logCross0081
     * @tc.desc Verify countByTag reports 1 rows for the tag 'onPageShow'.
     */
    it('logCross0081', 0, () => {
      expect(countByTag(logsOf(), 'onPageShow')).assertEqual(1);
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'onPageShow') <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0082
     * @tc.name logCross0082
     * @tc.desc Verify countByTag reports 1 rows for the tag 'aboutToAppear'.
     */
    it('logCross0082', 0, () => {
      expect(countByTag(logsOf(), 'aboutToAppear')).assertEqual(1);
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'aboutToAppear') <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0083
     * @tc.name logCross0083
     * @tc.desc Verify countByTag reports 0 rows for the tag 'none'.
     */
    it('logCross0083', 0, () => {
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'none') <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_LOG_CROSS_0084
     * @tc.name logCross0084
     * @tc.desc Verify countByTag reports 2 rows for the tag 'hfp.createHfpAgProfile'.
     */
    it('logCross0084', 0, () => {
      expect(countByTag(logsOf(), 'hfp.createHfpAgProfile')).assertEqual(2);
      expect(countByTag(logsOf(), 'none')).assertEqual(0);
      expect(countByTag(logsOf(), 'hfp.createHfpAgProfile') <= 8).assertTrue();
    });
  });
}
