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
 * Hand written showcase suite for the DataChangeListener bookkeeping of
 * MyDataSource.
 * Frozen rules under test:
 *   - registerDataChangeListener keeps one entry per listener instance;
 *   - unregisterDataChangeListener is a no-op for an unknown instance;
 *   - every notify* fans out to all registered listeners exactly once and
 *     forwards the raw arguments (index / from / to).
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { runListenerNotify, runListenerRegister } from '../util/DataSourceProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realListener01Test() {
  describe('RealListener01', () => {

    /**
     * @tc.name   testLsnReal0001
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0001
     * @tc.desc   Anchor: a single registration receives exactly one add notification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0001 begin');
      const actual: string = runListenerRegister('once');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
      expect(actual).assertEqual('1|0');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[1]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0001 end');
    })

    /**
     * @tc.name   testLsnReal0002
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0002
     * @tc.desc   registering the same listener twice still notifies once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0002 begin');
      const actual: string = runListenerRegister('twice');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
      expect(actual).assertEqual('1|0');
      expect(actual).assertEqual(runListenerRegister('once'));
      expect(actual === '2|0').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0002 end');
    })

    /**
     * @tc.name   testLsnReal0003
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0003
     * @tc.desc   three registrations of one listener are collapsed into one entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0003 begin');
      const actual: string = runListenerRegister('three');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
      expect(actual).assertEqual('1|0');
      expect(actual).assertEqual(runListenerRegister('twice'));
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0003 end');
    })

    /**
     * @tc.name   testLsnReal0004
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0004
     * @tc.desc   two distinct listeners both receive the notification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0004 begin');
      const actual: string = runListenerRegister('two');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1');
      expect(actual).assertEqual('1|1');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[1]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0004 end');
    })

    /**
     * @tc.name   testLsnReal0005
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0005
     * @tc.desc   Anchor: an unregistered listener receives nothing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0005 begin');
      const actual: string = runListenerRegister('unreg');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0');
      expect(actual).assertEqual('0|0');
      expect(actual === '1|0').assertFalse();
      expect(actual.split('|')[0]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0005 end');
    })

    /**
     * @tc.name   testLsnReal0006
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0006
     * @tc.desc   unregistering an unknown listener keeps the known one active
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0006 begin');
      const actual: string = runListenerRegister('unreg-unknown');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
      expect(actual).assertEqual('1|0');
      expect(actual).assertEqual(runListenerRegister('once'));
      expect(actual === '0|0').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0006 end');
    })

    /**
     * @tc.name   testLsnReal0007
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0007
     * @tc.desc   a second unregister of the same listener stays harmless
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0007 begin');
      const actual: string = runListenerRegister('unreg-twice');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0');
      expect(actual).assertEqual('0|0');
      expect(actual).assertEqual(runListenerRegister('unreg'));
      expect(actual.split('|').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0007 end');
    })

    /**
     * @tc.name   testLsnReal0008
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0008
     * @tc.desc   unregister followed by register restores the subscription
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0008 begin');
      const actual: string = runListenerRegister('re-reg');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
      expect(actual).assertEqual('1|0');
      expect(actual).assertEqual(runListenerRegister('once'));
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0008 end');
    })

    /**
     * @tc.name   testLsnReal0009
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0009
     * @tc.desc   Anchor: notifyDataReloaded reaches a single listener once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0009 begin');
      const actual: string = runListenerNotify('reload', 0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
      expect(actual).assertEqual('1|0|0|-1|-1|-1');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.endsWith('-1|-1|-1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0009 end');
    })

    /**
     * @tc.name   testLsnReal0010
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0010
     * @tc.desc   reload fan-out covers two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0010 begin');
      const actual: string = runListenerNotify('reload', 0, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|-1|-1');
      expect(actual).assertEqual('1|1|0|-1|-1|-1');
      expect(actual.split('|')[0]).assertEqual('1');
      expect(actual.split('|')[1]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0010 end');
    })

    /**
     * @tc.name   testLsnReal0011
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0011
     * @tc.desc   reload fan-out covers three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0011 begin');
      const actual: string = runListenerNotify('reload', 0, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|-1|-1');
      expect(actual).assertEqual('1|1|1|-1|-1|-1');
      expect(actual.split('|')[2]).assertEqual('1');
      expect(actual === '1|1|0|-1|-1|-1').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0011 end');
    })

    /**
     * @tc.name   testLsnReal0012
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0012
     * @tc.desc   notifyDataAdd forwards index 0 to the first listener
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0012 begin');
      const actual: string = runListenerNotify('add', 0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|0|-1|-1');
      expect(actual).assertEqual('1|0|0|0|-1|-1');
      expect(actual.split('|')[3]).assertEqual('0');
      expect(actual.endsWith('-1|-1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0012 end');
    })

    /**
     * @tc.name   testLsnReal0013
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0013
     * @tc.desc   notifyDataAdd forwards index 5 to two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0013 begin');
      const actual: string = runListenerNotify('add', 5, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|5|-1|-1');
      expect(actual).assertEqual('1|1|0|5|-1|-1');
      expect(actual.split('|')[1]).assertEqual('1');
      expect(actual.split('|')[3]).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0013 end');
    })

    /**
     * @tc.name   testLsnReal0014
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0014
     * @tc.desc   Anchor: notifyDataAdd forwards a negative index unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0014 begin');
      const actual: string = runListenerNotify('add', -1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
      expect(actual).assertEqual('1|0|0|-1|-1|-1');
      expect(actual.split('|')[3]).assertEqual('-1');
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0014 end');
    })

    /**
     * @tc.name   testLsnReal0015
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0015
     * @tc.desc   notifyDataAdd forwards index 100 to three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0015 begin');
      const actual: string = runListenerNotify('add', 100, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|100|-1|-1');
      expect(actual).assertEqual('1|1|1|100|-1|-1');
      expect(actual.split('|')[2]).assertEqual('1');
      expect(actual.split('|')[3]).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0015 end');
    })

    /**
     * @tc.name   testLsnReal0016
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0016
     * @tc.desc   notifyDataChange forwards index 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0016 begin');
      const actual: string = runListenerNotify('change', 2, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|2|-1|-1');
      expect(actual).assertEqual('1|0|0|2|-1|-1');
      expect(actual.split('|')[3]).assertEqual('2');
      expect(actual.startsWith('1|')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0016 end');
    })

    /**
     * @tc.name   testLsnReal0017
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0017
     * @tc.desc   notifyDataChange forwards a negative index to two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0017 begin');
      const actual: string = runListenerNotify('change', -5, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-5|-1|-1');
      expect(actual).assertEqual('1|1|0|-5|-1|-1');
      expect(actual.split('|')[3]).assertEqual('-5');
      expect(actual.split('|')[1]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0017 end');
    })

    /**
     * @tc.name   testLsnReal0018
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0018
     * @tc.desc   notifyDataChange fans out to three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0018 begin');
      const actual: string = runListenerNotify('change', 0, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|0|-1|-1');
      expect(actual).assertEqual('1|1|1|0|-1|-1');
      expect(actual.split('|')[2]).assertEqual('1');
      expect(actual.split('|')[3]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0018 end');
    })

    /**
     * @tc.name   testLsnReal0019
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0019
     * @tc.desc   notifyDataDelete forwards index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0019 begin');
      const actual: string = runListenerNotify('delete', 1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|1|-1|-1');
      expect(actual).assertEqual('1|0|0|1|-1|-1');
      expect(actual.split('|')[3]).assertEqual('1');
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0019 end');
    })

    /**
     * @tc.name   testLsnReal0020
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0020
     * @tc.desc   notifyDataDelete fans out to three listeners at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0020 begin');
      const actual: string = runListenerNotify('delete', 0, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|0|-1|-1');
      expect(actual).assertEqual('1|1|1|0|-1|-1');
      expect(actual.split('|')[2]).assertEqual('1');
      expect(actual === '1|1|0|0|-1|-1').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0020 end');
    })

    /**
     * @tc.name   testLsnReal0021
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0021
     * @tc.desc   notifyDataDelete forwards index 7 to two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0021 begin');
      const actual: string = runListenerNotify('delete', 7, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|7|-1|-1');
      expect(actual).assertEqual('1|1|0|7|-1|-1');
      expect(actual.split('|')[3]).assertEqual('7');
      expect(actual.split('|')[1]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0021 end');
    })

    /**
     * @tc.name   testLsnReal0022
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0022
     * @tc.desc   Anchor: notifyDataMove reports from 0 to 1 and leaves index untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLsnReal0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0022 begin');
      const actual: string = runListenerNotify('move', 0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|0|1');
      expect(actual).assertEqual('1|0|0|-1|0|1');
      expect(actual.split('|')[4]).assertEqual('0');
      expect(actual.split('|')[5]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0022 end');
    })

    /**
     * @tc.name   testLsnReal0023
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0023
     * @tc.desc   notifyDataMove with from 3 forwards 3 and 4 to two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0023 begin');
      const actual: string = runListenerNotify('move', 3, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|3|4');
      expect(actual).assertEqual('1|1|0|-1|3|4');
      expect(actual.split('|')[4]).assertEqual('3');
      expect(actual.split('|')[5]).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0023 end');
    })

    /**
     * @tc.name   testLsnReal0024
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0024
     * @tc.desc   notifyDataMove with from -1 forwards -1 and 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0024 begin');
      const actual: string = runListenerNotify('move', -1, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|0');
      expect(actual).assertEqual('1|0|0|-1|-1|0');
      expect(actual.split('|')[4]).assertEqual('-1');
      expect(actual.split('|')[5]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0024 end');
    })

    /**
     * @tc.name   testLsnReal0025
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0025
     * @tc.desc   notifyDataMove with from 100 fans out to three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLsnReal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0025 begin');
      const actual: string = runListenerNotify('move', 100, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|100|101');
      expect(actual).assertEqual('1|1|1|-1|100|101');
      expect(actual.split('|')[5]).assertEqual('101');
      expect(actual.split('|')[2]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0025 end');
    })

    /**
     * @tc.name   testLsnReal0026
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0026
     * @tc.desc   Anchor: an unknown notify kind changes nothing on a single listener
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0026 begin');
      const actual: string = runListenerNotify('unknown', 0, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0|0|-1|-1|-1');
      expect(actual).assertEqual('0|0|0|-1|-1|-1');
      expect(actual.split('|')[0]).assertEqual('0');
      expect(actual === '1|0|0|-1|-1|-1').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0026 end');
    })

    /**
     * @tc.name   testLsnReal0027
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0027
     * @tc.desc   an unknown notify kind keeps both listeners silent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0027 begin');
      const actual: string = runListenerNotify('unknown', 2, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0|0|-1|-1|-1');
      expect(actual).assertEqual('0|0|0|-1|-1|-1');
      expect(actual).assertEqual(runListenerNotify('unknown', 0, 1));
      expect(actual.split('|').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0027 end');
    })

    /**
     * @tc.name   testLsnReal0028
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0028
     * @tc.desc   notifyDataAdd forwards MAX_SAFE_INTEGER without clamping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLsnReal0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0028 begin');
      const actual: string = runListenerNotify('add', Number.MAX_SAFE_INTEGER, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|9007199254740991|-1|-1');
      expect(actual).assertEqual('1|0|0|9007199254740991|-1|-1');
      expect(actual.split('|')[3]).assertEqual('9007199254740991');
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0028 end');
    })

    /**
     * @tc.name   testLsnReal0029
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0029
     * @tc.desc   notifyDataDelete forwards -100 unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0029 begin');
      const actual: string = runListenerNotify('delete', -100, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-100|-1|-1');
      expect(actual).assertEqual('1|0|0|-100|-1|-1');
      expect(actual.split('|')[3]).assertEqual('-100');
      expect(actual.split('|')[1]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0029 end');
    })

    /**
     * @tc.name   testLsnReal0030
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0030
     * @tc.desc   notifyDataMove fans out to three listeners for from 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0030 begin');
      const actual: string = runListenerNotify('move', 0, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|0|1');
      expect(actual).assertEqual('1|1|1|-1|0|1');
      expect(actual.split('|')[5]).assertEqual('1');
      expect(actual.split('|')[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0030 end');
    })

    /**
     * @tc.name   testLsnReal0031
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0031
     * @tc.desc   an add at index 9 reaches three listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0031 begin');
      const actual: string = runListenerNotify('add', 9, 3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|9|-1|-1');
      expect(actual).assertEqual('1|1|1|9|-1|-1');
      expect(actual.split('|')[3]).assertEqual('9');
      expect(actual.split('|')[2]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0031 end');
    })

    /**
     * @tc.name   testLsnReal0032
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0032
     * @tc.desc   a change at index 9 reaches the first listener only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0032 begin');
      const actual: string = runListenerNotify('change', 9, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|9|-1|-1');
      expect(actual).assertEqual('1|0|0|9|-1|-1');
      expect(actual.split('|')[3]).assertEqual('9');
      expect(actual.split('|')[1]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0032 end');
    })

    /**
     * @tc.name   testLsnReal0033
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0033
     * @tc.desc   a delete at index 9 reaches two listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0033 begin');
      const actual: string = runListenerNotify('delete', 9, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|9|-1|-1');
      expect(actual).assertEqual('1|1|0|9|-1|-1');
      expect(actual.split('|')[3]).assertEqual('9');
      expect(actual.split('|')[1]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0033 end');
    })

    /**
     * @tc.name   testLsnReal0034
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0034
     * @tc.desc   a move from 9 reports 9 and 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLsnReal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0034 begin');
      const actual: string = runListenerNotify('move', 9, 1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|9|10');
      expect(actual).assertEqual('1|0|0|-1|9|10');
      expect(actual.split('|')[4]).assertEqual('9');
      expect(actual.split('|')[5]).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0034 end');
    })

    /**
     * @tc.name   testLsnReal0035
     * @tc.number SUB_MUSICALBUM_LSN_REAL_0035
     * @tc.desc   a move from -9 reports -9 and -8 to both listeners
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testLsnReal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0035 begin');
      const actual: string = runListenerNotify('move', -9, 2);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|-9|-8');
      expect(actual).assertEqual('1|1|0|-1|-9|-8');
      expect(actual.split('|')[4]).assertEqual('-9');
      expect(actual.split('|')[5]).assertEqual('-8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0035 end');
    })
  })
}
