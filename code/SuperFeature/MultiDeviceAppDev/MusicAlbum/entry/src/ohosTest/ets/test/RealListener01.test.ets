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
import { describe, it, expect } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { runListenerNotify, runListenerRegister } from '../util/DataSourceProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

export default function realListener01Test(): void {
  describe('RealListener01Test', () => {

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0100
     * @tc.name: testLsnReal0001
     * @tc.desc: Verify a single registration receives exactly one add notification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0001', 0, async (done: Function) => {
      await runCase('testLsnReal0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0001 begin');
        const actual: string = runListenerRegister('once');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0'));
        expect(actual).assertEqual('1|0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('0'));
        expect(actual.split('|')[1]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0200
     * @tc.name: testLsnReal0002
     * @tc.desc: Verify registering the same listener twice still notifies once
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0002', 0, async (done: Function) => {
      await runCase('testLsnReal0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0002 begin');
        const actual: string = runListenerRegister('twice');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0'));
        expect(actual).assertEqual('1|0');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerRegister('once')));
        expect(actual).assertEqual(runListenerRegister('once'));
        logAssertion(DOMAIN, TAG, String(actual === '2|0'), 'false');
        expect(actual === '2|0').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0300
     * @tc.name: testLsnReal0003
     * @tc.desc: Verify three registrations of one listener are collapsed into one entry
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0003', 0, async (done: Function) => {
      await runCase('testLsnReal0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0003 begin');
        const actual: string = runListenerRegister('three');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0'));
        expect(actual).assertEqual('1|0');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerRegister('twice')));
        expect(actual).assertEqual(runListenerRegister('twice'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0400
     * @tc.name: testLsnReal0004
     * @tc.desc: Verify two distinct listeners both receive the notification
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0004', 0, async (done: Function) => {
      await runCase('testLsnReal0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0004 begin');
        const actual: string = runListenerRegister('two');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1'));
        expect(actual).assertEqual('1|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0500
     * @tc.name: testLsnReal0005
     * @tc.desc: Verify an unregistered listener receives nothing
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0005', 0, async (done: Function) => {
      await runCase('testLsnReal0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0005 begin');
        const actual: string = runListenerRegister('unreg');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0');
        logAssertion(DOMAIN, TAG, String(actual), String('0|0'));
        expect(actual).assertEqual('0|0');
        logAssertion(DOMAIN, TAG, String(actual === '1|0'), 'false');
        expect(actual === '1|0').assertFalse();
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('0'));
        expect(actual.split('|')[0]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0600
     * @tc.name: testLsnReal0006
     * @tc.desc: Verify unregistering an unknown listener keeps the known one active
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0006', 0, async (done: Function) => {
      await runCase('testLsnReal0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0006 begin');
        const actual: string = runListenerRegister('unreg-unknown');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0'));
        expect(actual).assertEqual('1|0');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerRegister('once')));
        expect(actual).assertEqual(runListenerRegister('once'));
        logAssertion(DOMAIN, TAG, String(actual === '0|0'), 'false');
        expect(actual === '0|0').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0700
     * @tc.name: testLsnReal0007
     * @tc.desc: Verify a second unregister of the same listener stays harmless
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0007', 0, async (done: Function) => {
      await runCase('testLsnReal0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0007 begin');
        const actual: string = runListenerRegister('unreg-twice');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0');
        logAssertion(DOMAIN, TAG, String(actual), String('0|0'));
        expect(actual).assertEqual('0|0');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerRegister('unreg')));
        expect(actual).assertEqual(runListenerRegister('unreg'));
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(2));
        expect(actual.split('|').length).assertEqual(2);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0800
     * @tc.name: testLsnReal0008
     * @tc.desc: Verify unregister followed by register restores the subscription
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0008', 0, async (done: Function) => {
      await runCase('testLsnReal0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0008 begin');
        const actual: string = runListenerRegister('re-reg');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0'));
        expect(actual).assertEqual('1|0');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerRegister('once')));
        expect(actual).assertEqual(runListenerRegister('once'));
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_0900
     * @tc.name: testLsnReal0009
     * @tc.desc: Verify notifyDataReloaded reaches a single listener once
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0009', 0, async (done: Function) => {
      await runCase('testLsnReal0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0009 begin');
        const actual: string = runListenerNotify('reload', 0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|-1|-1'));
        expect(actual).assertEqual('1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('-1|-1|-1')), 'true');
        expect(actual.endsWith('-1|-1|-1')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1000
     * @tc.name: testLsnReal0010
     * @tc.desc: Verify reload fan-out covers two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0010', 0, async (done: Function) => {
      await runCase('testLsnReal0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0010 begin');
        const actual: string = runListenerNotify('reload', 0, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|-1|-1|-1'));
        expect(actual).assertEqual('1|1|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1100
     * @tc.name: testLsnReal0011
     * @tc.desc: Verify reload fan-out covers three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0011', 0, async (done: Function) => {
      await runCase('testLsnReal0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0011 begin');
        const actual: string = runListenerNotify('reload', 0, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|-1|-1|-1'));
        expect(actual).assertEqual('1|1|1|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual === '1|1|0|-1|-1|-1'), 'false');
        expect(actual === '1|1|0|-1|-1|-1').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1200
     * @tc.name: testLsnReal0012
     * @tc.desc: Verify notifyDataAdd forwards index 0 to the first listener
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0012', 0, async (done: Function) => {
      await runCase('testLsnReal0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0012 begin');
        const actual: string = runListenerNotify('add', 0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|0|-1|-1'));
        expect(actual).assertEqual('1|0|0|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('0'));
        expect(actual.split('|')[3]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual.endsWith('-1|-1')), 'true');
        expect(actual.endsWith('-1|-1')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1300
     * @tc.name: testLsnReal0013
     * @tc.desc: Verify notifyDataAdd forwards index 5 to two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0013', 0, async (done: Function) => {
      await runCase('testLsnReal0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0013 begin');
        const actual: string = runListenerNotify('add', 5, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|5|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|5|-1|-1'));
        expect(actual).assertEqual('1|1|0|5|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('5'));
        expect(actual.split('|')[3]).assertEqual('5');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1400
     * @tc.name: testLsnReal0014
     * @tc.desc: Verify notifyDataAdd forwards a negative index unchanged
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0014', 0, async (done: Function) => {
      await runCase('testLsnReal0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0014 begin');
        const actual: string = runListenerNotify('add', -1, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|-1|-1'));
        expect(actual).assertEqual('1|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('-1'));
        expect(actual.split('|')[3]).assertEqual('-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1500
     * @tc.name: testLsnReal0015
     * @tc.desc: Verify notifyDataAdd forwards index 100 to three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0015', 0, async (done: Function) => {
      await runCase('testLsnReal0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0015 begin');
        const actual: string = runListenerNotify('add', 100, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|100|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|100|-1|-1'));
        expect(actual).assertEqual('1|1|1|100|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('100'));
        expect(actual.split('|')[3]).assertEqual('100');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1600
     * @tc.name: testLsnReal0016
     * @tc.desc: Verify notifyDataChange forwards index 2
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0016', 0, async (done: Function) => {
      await runCase('testLsnReal0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0016 begin');
        const actual: string = runListenerNotify('change', 2, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|2|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|2|-1|-1'));
        expect(actual).assertEqual('1|0|0|2|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('2'));
        expect(actual.split('|')[3]).assertEqual('2');
        logAssertion(DOMAIN, TAG, String(actual.startsWith('1|')), 'true');
        expect(actual.startsWith('1|')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1700
     * @tc.name: testLsnReal0017
     * @tc.desc: Verify notifyDataChange forwards a negative index to two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0017', 0, async (done: Function) => {
      await runCase('testLsnReal0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0017 begin');
        const actual: string = runListenerNotify('change', -5, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-5|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|-5|-1|-1'));
        expect(actual).assertEqual('1|1|0|-5|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('-5'));
        expect(actual.split('|')[3]).assertEqual('-5');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1800
     * @tc.name: testLsnReal0018
     * @tc.desc: Verify notifyDataChange fans out to three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0018', 0, async (done: Function) => {
      await runCase('testLsnReal0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0018 begin');
        const actual: string = runListenerNotify('change', 0, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|0|-1|-1'));
        expect(actual).assertEqual('1|1|1|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('0'));
        expect(actual.split('|')[3]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_1900
     * @tc.name: testLsnReal0019
     * @tc.desc: Verify notifyDataDelete forwards index 1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0019', 0, async (done: Function) => {
      await runCase('testLsnReal0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0019 begin');
        const actual: string = runListenerNotify('delete', 1, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|1|-1|-1'));
        expect(actual).assertEqual('1|0|0|1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('1'));
        expect(actual.split('|')[3]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2000
     * @tc.name: testLsnReal0020
     * @tc.desc: Verify notifyDataDelete fans out to three listeners at index 0
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0020', 0, async (done: Function) => {
      await runCase('testLsnReal0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0020 begin');
        const actual: string = runListenerNotify('delete', 0, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|0|-1|-1'));
        expect(actual).assertEqual('1|1|1|0|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual === '1|1|0|0|-1|-1'), 'false');
        expect(actual === '1|1|0|0|-1|-1').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2100
     * @tc.name: testLsnReal0021
     * @tc.desc: Verify notifyDataDelete forwards index 7 to two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0021', 0, async (done: Function) => {
      await runCase('testLsnReal0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0021 begin');
        const actual: string = runListenerNotify('delete', 7, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|7|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|7|-1|-1'));
        expect(actual).assertEqual('1|1|0|7|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('7'));
        expect(actual.split('|')[3]).assertEqual('7');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2200
     * @tc.name: testLsnReal0022
     * @tc.desc: Verify notifyDataMove reports from 0 to 1 and leaves index untouched
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testLsnReal0022', 0, async (done: Function) => {
      await runCase('testLsnReal0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0022 begin');
        const actual: string = runListenerNotify('move', 0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|0|1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|0|1'));
        expect(actual).assertEqual('1|0|0|-1|0|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('0'));
        expect(actual.split('|')[4]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('1'));
        expect(actual.split('|')[5]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2300
     * @tc.name: testLsnReal0023
     * @tc.desc: Verify notifyDataMove with from 3 forwards 3 and 4 to two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0023', 0, async (done: Function) => {
      await runCase('testLsnReal0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0023 begin');
        const actual: string = runListenerNotify('move', 3, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|3|4');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|-1|3|4'));
        expect(actual).assertEqual('1|1|0|-1|3|4');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('3'));
        expect(actual.split('|')[4]).assertEqual('3');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('4'));
        expect(actual.split('|')[5]).assertEqual('4');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2400
     * @tc.name: testLsnReal0024
     * @tc.desc: Verify notifyDataMove with from -1 forwards -1 and 0
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0024', 0, async (done: Function) => {
      await runCase('testLsnReal0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0024 begin');
        const actual: string = runListenerNotify('move', -1, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|-1|0');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|-1|0'));
        expect(actual).assertEqual('1|0|0|-1|-1|0');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('-1'));
        expect(actual.split('|')[4]).assertEqual('-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('0'));
        expect(actual.split('|')[5]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2500
     * @tc.name: testLsnReal0025
     * @tc.desc: Verify notifyDataMove with from 100 fans out to three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0025', 0, async (done: Function) => {
      await runCase('testLsnReal0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0025 begin');
        const actual: string = runListenerNotify('move', 100, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|100|101');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|-1|100|101'));
        expect(actual).assertEqual('1|1|1|-1|100|101');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('101'));
        expect(actual.split('|')[5]).assertEqual('101');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2600
     * @tc.name: testLsnReal0026
     * @tc.desc: Verify an unknown notify kind changes nothing on a single listener
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0026', 0, async (done: Function) => {
      await runCase('testLsnReal0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0026 begin');
        const actual: string = runListenerNotify('unknown', 0, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('0|0|0|-1|-1|-1'));
        expect(actual).assertEqual('0|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('0'));
        expect(actual.split('|')[0]).assertEqual('0');
        logAssertion(DOMAIN, TAG, String(actual === '1|0|0|-1|-1|-1'), 'false');
        expect(actual === '1|0|0|-1|-1|-1').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2700
     * @tc.name: testLsnReal0027
     * @tc.desc: Verify an unknown notify kind keeps both listeners silent
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0027', 0, async (done: Function) => {
      await runCase('testLsnReal0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0027 begin');
        const actual: string = runListenerNotify('unknown', 2, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '0|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('0|0|0|-1|-1|-1'));
        expect(actual).assertEqual('0|0|0|-1|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String(runListenerNotify('unknown', 0, 1)));
        expect(actual).assertEqual(runListenerNotify('unknown', 0, 1));
        logAssertion(DOMAIN, TAG, String(actual.split('|').length), String(6));
        expect(actual.split('|').length).assertEqual(6);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2800
     * @tc.name: testLsnReal0028
     * @tc.desc: Verify notifyDataAdd forwards MAX_SAFE_INTEGER without clamping
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0028', 0, async (done: Function) => {
      await runCase('testLsnReal0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0028 begin');
        const actual: string = runListenerNotify('add', Number.MAX_SAFE_INTEGER, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|9007199254740991|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|9007199254740991|-1|-1'));
        expect(actual).assertEqual('1|0|0|9007199254740991|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('9007199254740991'));
        expect(actual.split('|')[3]).assertEqual('9007199254740991');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_2900
     * @tc.name: testLsnReal0029
     * @tc.desc: Verify notifyDataDelete forwards -100 unchanged
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0029', 0, async (done: Function) => {
      await runCase('testLsnReal0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0029 begin');
        const actual: string = runListenerNotify('delete', -100, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-100|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-100|-1|-1'));
        expect(actual).assertEqual('1|0|0|-100|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('-100'));
        expect(actual.split('|')[3]).assertEqual('-100');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('0'));
        expect(actual.split('|')[1]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_3000
     * @tc.name: testLsnReal0030
     * @tc.desc: Verify notifyDataMove fans out to three listeners for from 0
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0030', 0, async (done: Function) => {
      await runCase('testLsnReal0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0030 begin');
        const actual: string = runListenerNotify('move', 0, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|-1|0|1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|-1|0|1'));
        expect(actual).assertEqual('1|1|1|-1|0|1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('1'));
        expect(actual.split('|')[5]).assertEqual('1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[0]), String('1'));
        expect(actual.split('|')[0]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0030 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_3100
     * @tc.name: testLsnReal0031
     * @tc.desc: Verify an add at index 9 reaches three listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0031', 0, async (done: Function) => {
      await runCase('testLsnReal0031', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0031 begin');
        const actual: string = runListenerNotify('add', 9, 3);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|1|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|1|9|-1|-1'));
        expect(actual).assertEqual('1|1|1|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('9'));
        expect(actual.split('|')[3]).assertEqual('9');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[2]), String('1'));
        expect(actual.split('|')[2]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0031 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_3200
     * @tc.name: testLsnReal0032
     * @tc.desc: Verify a change at index 9 reaches the first listener only
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0032', 0, async (done: Function) => {
      await runCase('testLsnReal0032', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0032 begin');
        const actual: string = runListenerNotify('change', 9, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|9|-1|-1'));
        expect(actual).assertEqual('1|0|0|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('9'));
        expect(actual.split('|')[3]).assertEqual('9');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('0'));
        expect(actual.split('|')[1]).assertEqual('0');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0032 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_3300
     * @tc.name: testLsnReal0033
     * @tc.desc: Verify a delete at index 9 reaches two listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0033', 0, async (done: Function) => {
      await runCase('testLsnReal0033', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0033 begin');
        const actual: string = runListenerNotify('delete', 9, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|9|-1|-1'));
        expect(actual).assertEqual('1|1|0|9|-1|-1');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[3]), String('9'));
        expect(actual.split('|')[3]).assertEqual('9');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[1]), String('1'));
        expect(actual.split('|')[1]).assertEqual('1');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0033 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_3400
     * @tc.name: testLsnReal0034
     * @tc.desc: Verify a move from 9 reports 9 and 10
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0034', 0, async (done: Function) => {
      await runCase('testLsnReal0034', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0034 begin');
        const actual: string = runListenerNotify('move', 9, 1);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|0|0|-1|9|10');
        logAssertion(DOMAIN, TAG, String(actual), String('1|0|0|-1|9|10'));
        expect(actual).assertEqual('1|0|0|-1|9|10');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('9'));
        expect(actual.split('|')[4]).assertEqual('9');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('10'));
        expect(actual.split('|')[5]).assertEqual('10');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0034 end');
      }, done);
    });

    /*
     * @tc.number: SUB_REAL_LISTENER_01_3500
     * @tc.name: testLsnReal0035
     * @tc.desc: Verify a move from -9 reports -9 and -8 to both listeners
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testLsnReal0035', 0, async (done: Function) => {
      await runCase('testLsnReal0035', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0035 begin');
        const actual: string = runListenerNotify('move', -9, 2);
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', actual, '1|1|0|-1|-9|-8');
        logAssertion(DOMAIN, TAG, String(actual), String('1|1|0|-1|-9|-8'));
        expect(actual).assertEqual('1|1|0|-1|-9|-8');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[4]), String('-9'));
        expect(actual.split('|')[4]).assertEqual('-9');
        logAssertion(DOMAIN, TAG, String(actual.split('|')[5]), String('-8'));
        expect(actual.split('|')[5]).assertEqual('-8');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testLsnReal0035 end');
      }, done);
    });
  })
}
