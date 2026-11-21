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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
import { FakeClock } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function clockTest() {
  describe('ClockVolume01Test', () => {

    /**
     * @tc.name   testClock0001
     * @tc.number SUB_CCER_CLOCK_01_0001
     * @tc.desc   注入时钟 0 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0001 begin');
      const clock: FakeClock = new FakeClock(0);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(0);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 0).receivedTime;
      const result: string = manager.add('Data_01', 0).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0001 end');
    })

    /**
     * @tc.name   testClock0002
     * @tc.number SUB_CCER_CLOCK_01_0002
     * @tc.desc   注入时钟 1 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0002 begin');
      const clock: FakeClock = new FakeClock(1);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(1);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 1).receivedTime;
      const result: string = manager.add('Data_02', 1001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0002 end');
    })

    /**
     * @tc.name   testClock0003
     * @tc.number SUB_CCER_CLOCK_01_0003
     * @tc.desc   注入时钟 999 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0003 begin');
      const clock: FakeClock = new FakeClock(999);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(999);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 999).receivedTime;
      const result: string = manager.add('Data_03', 1002).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0003 end');
    })

    /**
     * @tc.name   testClock0004
     * @tc.number SUB_CCER_CLOCK_01_0004
     * @tc.desc   注入时钟 1000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0004 begin');
      const clock: FakeClock = new FakeClock(1000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(1000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 1000).receivedTime;
      const result: string = manager.add('Data_04', 2001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0004 end');
    })

    /**
     * @tc.name   testClock0005
     * @tc.number SUB_CCER_CLOCK_01_0005
     * @tc.desc   注入时钟 59999 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0005 begin');
      const clock: FakeClock = new FakeClock(59999);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(59999);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 59999).receivedTime;
      const result: string = manager.add('Data_05', -1).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0005 end');
    })

    /**
     * @tc.name   testClock0006
     * @tc.number SUB_CCER_CLOCK_01_0006
     * @tc.desc   注入时钟 86399000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0006 begin');
      const clock: FakeClock = new FakeClock(86399000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(86399000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 86399000).receivedTime;
      const result: string = manager.add('Data_06', 7).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0006 end');
    })

    /**
     * @tc.name   testClock0007
     * @tc.number SUB_CCER_CLOCK_01_0007
     * @tc.desc   注入时钟 1700000000000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0007 begin');
      const clock: FakeClock = new FakeClock(1700000000000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(1700000000000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 1700000000000).receivedTime;
      const result: string = manager.add('Data_07', 0).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0007 end');
    })

    /**
     * @tc.name   testClock0008
     * @tc.number SUB_CCER_CLOCK_01_0008
     * @tc.desc   注入时钟 1735689599999 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0008 begin');
      const clock: FakeClock = new FakeClock(1735689599999);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(1735689599999);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 1735689599999).receivedTime;
      const result: string = manager.add('Data_08', 1001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0008 end');
    })

    /**
     * @tc.name   testClock0009
     * @tc.number SUB_CCER_CLOCK_01_0009
     * @tc.desc   注入时钟 -1 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0009 begin');
      const clock: FakeClock = new FakeClock(-1);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(-1);
      const explicitTime: string = manager.add('Data_Explicit', 1001, -1).receivedTime;
      const result: string = manager.add('Data_09', 1002).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0009 end');
    })

    /**
     * @tc.name   testClock0010
     * @tc.number SUB_CCER_CLOCK_01_0010
     * @tc.desc   注入时钟 -1000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0010 begin');
      const clock: FakeClock = new FakeClock(-1000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(-1000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, -1000).receivedTime;
      const result: string = manager.add('Data_10', 2001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0010 end');
    })

    /**
     * @tc.name   testClock0011
     * @tc.number SUB_CCER_CLOCK_01_0011
     * @tc.desc   注入时钟 2147483647 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0011 begin');
      const clock: FakeClock = new FakeClock(2147483647);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(2147483647);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 2147483647).receivedTime;
      const result: string = manager.add('Data_11', -1).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0011 end');
    })

    /**
     * @tc.name   testClock0012
     * @tc.number SUB_CCER_CLOCK_01_0012
     * @tc.desc   注入时钟 9007199254740991 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0012 begin');
      const clock: FakeClock = new FakeClock(9007199254740991);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(9007199254740991);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 9007199254740991).receivedTime;
      const result: string = manager.add('Data_12', 7).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0012 end');
    })

    /**
     * @tc.name   testClock0013
     * @tc.number SUB_CCER_CLOCK_01_0013
     * @tc.desc   注入时钟 123456789 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0013 begin');
      const clock: FakeClock = new FakeClock(123456789);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(123456789);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 123456789).receivedTime;
      const result: string = manager.add('Data_13', 0).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0013 end');
    })

    /**
     * @tc.name   testClock0014
     * @tc.number SUB_CCER_CLOCK_01_0014
     * @tc.desc   注入时钟 42 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0014 begin');
      const clock: FakeClock = new FakeClock(42);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(42);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 42).receivedTime;
      const result: string = manager.add('Data_14', 1001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0014 end');
    })

    /**
     * @tc.name   testClock0015
     * @tc.number SUB_CCER_CLOCK_01_0015
     * @tc.desc   注入时钟 3600000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0015 begin');
      const clock: FakeClock = new FakeClock(3600000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(3600000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 3600000).receivedTime;
      const result: string = manager.add('Data_15', 1002).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0015 end');
    })

    /**
     * @tc.name   testClock0016
     * @tc.number SUB_CCER_CLOCK_01_0016
     * @tc.desc   注入时钟 7200000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0016 begin');
      const clock: FakeClock = new FakeClock(7200000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(7200000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 7200000).receivedTime;
      const result: string = manager.add('Data_16', 2001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0016 end');
    })

    /**
     * @tc.name   testClock0017
     * @tc.number SUB_CCER_CLOCK_01_0017
     * @tc.desc   注入时钟 10800000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0017 begin');
      const clock: FakeClock = new FakeClock(10800000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(10800000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 10800000).receivedTime;
      const result: string = manager.add('Data_17', -1).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0017 end');
    })

    /**
     * @tc.name   testClock0018
     * @tc.number SUB_CCER_CLOCK_01_0018
     * @tc.desc   注入时钟 43200000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0018 begin');
      const clock: FakeClock = new FakeClock(43200000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(43200000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 43200000).receivedTime;
      const result: string = manager.add('Data_18', 7).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0018 end');
    })

    /**
     * @tc.name   testClock0019
     * @tc.number SUB_CCER_CLOCK_01_0019
     * @tc.desc   注入时钟 86400000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0019 begin');
      const clock: FakeClock = new FakeClock(86400000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(86400000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 86400000).receivedTime;
      const result: string = manager.add('Data_19', 0).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0019 end');
    })

    /**
     * @tc.name   testClock0020
     * @tc.number SUB_CCER_CLOCK_01_0020
     * @tc.desc   注入时钟 604800000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0020 begin');
      const clock: FakeClock = new FakeClock(604800000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(604800000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 604800000).receivedTime;
      const result: string = manager.add('Data_20', 1001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0020 end');
    })

    /**
     * @tc.name   testClock0021
     * @tc.number SUB_CCER_CLOCK_01_0021
     * @tc.desc   注入时钟 31536000000 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0021 begin');
      const clock: FakeClock = new FakeClock(31536000000);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(31536000000);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 31536000000).receivedTime;
      const result: string = manager.add('Data_21', 1002).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0021 end');
    })

    /**
     * @tc.name   testClock0022
     * @tc.number SUB_CCER_CLOCK_01_0022
     * @tc.desc   注入时钟 500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0022 begin');
      const clock: FakeClock = new FakeClock(500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 500).receivedTime;
      const result: string = manager.add('Data_22', 2001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0022 end');
    })

    /**
     * @tc.name   testClock0023
     * @tc.number SUB_CCER_CLOCK_01_0023
     * @tc.desc   注入时钟 1500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0023 begin');
      const clock: FakeClock = new FakeClock(1500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(1500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 1500).receivedTime;
      const result: string = manager.add('Data_23', -1).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0023 end');
    })

    /**
     * @tc.name   testClock0024
     * @tc.number SUB_CCER_CLOCK_01_0024
     * @tc.desc   注入时钟 2500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0024 begin');
      const clock: FakeClock = new FakeClock(2500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(2500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 2500).receivedTime;
      const result: string = manager.add('Data_24', 7).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0024 end');
    })

    /**
     * @tc.name   testClock0025
     * @tc.number SUB_CCER_CLOCK_01_0025
     * @tc.desc   注入时钟 3500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0025 begin');
      const clock: FakeClock = new FakeClock(3500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(3500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 3500).receivedTime;
      const result: string = manager.add('Data_25', 0).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0025 end');
    })

    /**
     * @tc.name   testClock0026
     * @tc.number SUB_CCER_CLOCK_01_0026
     * @tc.desc   注入时钟 4500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0026 begin');
      const clock: FakeClock = new FakeClock(4500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(4500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 4500).receivedTime;
      const result: string = manager.add('Data_26', 1001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0026 end');
    })

    /**
     * @tc.name   testClock0027
     * @tc.number SUB_CCER_CLOCK_01_0027
     * @tc.desc   注入时钟 5500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0027 begin');
      const clock: FakeClock = new FakeClock(5500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(5500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 5500).receivedTime;
      const result: string = manager.add('Data_27', 1002).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0027 end');
    })

    /**
     * @tc.name   testClock0028
     * @tc.number SUB_CCER_CLOCK_01_0028
     * @tc.desc   注入时钟 6500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0028 begin');
      const clock: FakeClock = new FakeClock(6500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(6500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 6500).receivedTime;
      const result: string = manager.add('Data_28', 2001).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0028 end');
    })

    /**
     * @tc.name   testClock0029
     * @tc.number SUB_CCER_CLOCK_01_0029
     * @tc.desc   注入时钟 7500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0029 begin');
      const clock: FakeClock = new FakeClock(7500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(7500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 7500).receivedTime;
      const result: string = manager.add('Data_29', -1).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0029 end');
    })

    /**
     * @tc.name   testClock0030
     * @tc.number SUB_CCER_CLOCK_01_0030
     * @tc.desc   注入时钟 9500 时默认时间戳与显式时间戳一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0030 begin');
      const clock: FakeClock = new FakeClock(9500);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(9500);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 9500).receivedTime;
      const result: string = manager.add('Data_30', 7).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(clock.getCalls()), String(1));
      expect(clock.getCalls()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0030 end');
    })

    /**
     * @tc.name   testClock0031
     * @tc.number SUB_CCER_CLOCK_01_0031
     * @tc.desc   显式时间戳优先于注入时钟
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClock0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0031 begin');
      const clock: FakeClock = new FakeClock(88888888);
      const manager: EventRecordManager = new EventRecordManager(4, clock);
      const expectedTime: string = EventRecordManager.formatTime(88888888);
      const explicitTime: string = manager.add('Data_Explicit', 1001, 88888888).receivedTime;
      const result: string = manager.add('Data_Boundary', 1002).receivedTime;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(expectedTime));
      expect(result).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(explicitTime),
        String(expectedTime));
      expect(explicitTime).assertEqual(expectedTime);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(8));
      expect(result.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClock0031 end');
    })

  })
}
