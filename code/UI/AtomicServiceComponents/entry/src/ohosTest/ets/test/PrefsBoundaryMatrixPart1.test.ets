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
import { delayTick } from './shared/AsyncYield';
import { PREFS_MAX_LENGTH, normalizePrefsText, canSaveText, nextCount, readCount, readText, buildPrefsSummary } from '../../../main/ets/model/PrefsStore';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function PrefsBoundaryMatrixPart1Test(): void {
  describe('PrefsBoundaryMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0100
     * @tc.name      testNormalize0001
     * @tc.desc      Verify normalizePrefsText for raw variant 0 (length 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0001 begin');
      await delayTick();
      expect(normalizePrefsText('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0200
     * @tc.name      testCanSave0002
     * @tc.desc      Verify canSaveText for raw variant 0 is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0002 begin');
      await delayTick();
      expect(canSaveText('')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0300
     * @tc.name      testNormalize0003
     * @tc.desc      Verify normalizePrefsText for raw variant 1 (length 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0003 begin');
      await delayTick();
      expect(normalizePrefsText(' ')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0400
     * @tc.name      testCanSave0004
     * @tc.desc      Verify canSaveText for raw variant 1 is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0004 begin');
      await delayTick();
      expect(canSaveText(' ')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0500
     * @tc.name      testNormalize0005
     * @tc.desc      Verify normalizePrefsText for raw variant 2 (length 5).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0005 begin');
      await delayTick();
      expect(normalizePrefsText('  a  ')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0600
     * @tc.name      testCanSave0006
     * @tc.desc      Verify canSaveText for raw variant 2 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0006 begin');
      await delayTick();
      expect(canSaveText('  a  ')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0700
     * @tc.name      testNormalize0007
     * @tc.desc      Verify normalizePrefsText for raw variant 3 (length 1).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0007 begin');
      await delayTick();
      expect(normalizePrefsText('a')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0800
     * @tc.name      testCanSave0008
     * @tc.desc      Verify canSaveText for raw variant 3 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0008 begin');
      await delayTick();
      expect(canSaveText('a')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_0900
     * @tc.name      testNormalize0009
     * @tc.desc      Verify normalizePrefsText for raw variant 4 (length 79).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0009 begin');
      await delayTick();
      expect(normalizePrefsText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1000
     * @tc.name      testCanSave0010
     * @tc.desc      Verify canSaveText for raw variant 4 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0010 begin');
      await delayTick();
      expect(canSaveText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1100
     * @tc.name      testNormalize0011
     * @tc.desc      Verify normalizePrefsText for raw variant 5 (length 80).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0011 begin');
      await delayTick();
      expect(normalizePrefsText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1200
     * @tc.name      testCanSave0012
     * @tc.desc      Verify canSaveText for raw variant 5 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0012 begin');
      await delayTick();
      expect(canSaveText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1300
     * @tc.name      testNormalize0013
     * @tc.desc      Verify normalizePrefsText for raw variant 6 (length 81).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0013 begin');
      await delayTick();
      expect(normalizePrefsText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1400
     * @tc.name      testCanSave0014
     * @tc.desc      Verify canSaveText for raw variant 6 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0014 begin');
      await delayTick();
      expect(canSaveText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1500
     * @tc.name      testNormalize0015
     * @tc.desc      Verify normalizePrefsText for raw variant 7 (length 100).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0015 begin');
      await delayTick();
      expect(normalizePrefsText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1600
     * @tc.name      testCanSave0016
     * @tc.desc      Verify canSaveText for raw variant 7 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0016 begin');
      await delayTick();
      expect(canSaveText('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1700
     * @tc.name      testNormalize0017
     * @tc.desc      Verify normalizePrefsText for raw variant 8 (length 2).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0017 begin');
      await delayTick();
      expect(normalizePrefsText('中文')).assertEqual('中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1800
     * @tc.name      testCanSave0018
     * @tc.desc      Verify canSaveText for raw variant 8 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0018 begin');
      await delayTick();
      expect(canSaveText('中文')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_1900
     * @tc.name      testNormalize0019
     * @tc.desc      Verify normalizePrefsText for raw variant 9 (length 4).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0019 begin');
      await delayTick();
      expect(normalizePrefsText(' 中文 ')).assertEqual('中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2000
     * @tc.name      testCanSave0020
     * @tc.desc      Verify canSaveText for raw variant 9 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0020 begin');
      await delayTick();
      expect(canSaveText(' 中文 ')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2100
     * @tc.name      testNormalize0021
     * @tc.desc      Verify normalizePrefsText for raw variant 10 (length 3).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNormalize0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0021 begin');
      await delayTick();
      expect(normalizePrefsText('a\nb')).assertEqual('a\nb');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNormalize0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2200
     * @tc.name      testCanSave0022
     * @tc.desc      Verify canSaveText for raw variant 10 is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanSave0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0022 begin');
      await delayTick();
      expect(canSaveText('a\nb')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanSave0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2300
     * @tc.name      testNextCount0023
     * @tc.desc      Verify nextCount(-2) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextCount0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0023 begin');
      await delayTick();
      expect(nextCount(-2)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2400
     * @tc.name      testNextCount0024
     * @tc.desc      Verify nextCount(-1) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextCount0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0024 begin');
      await delayTick();
      expect(nextCount(-1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2500
     * @tc.name      testNextCount0025
     * @tc.desc      Verify nextCount(0) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextCount0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0025 begin');
      await delayTick();
      expect(nextCount(0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2600
     * @tc.name      testNextCount0026
     * @tc.desc      Verify nextCount(1) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextCount0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0026 begin');
      await delayTick();
      expect(nextCount(1)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2700
     * @tc.name      testNextCount0027
     * @tc.desc      Verify nextCount(99) returns 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextCount0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0027 begin');
      await delayTick();
      expect(nextCount(99)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2800
     * @tc.name      testNextCount0028
     * @tc.desc      Verify nextCount(2147483647) returns 2147483648.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNextCount0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0028 begin');
      await delayTick();
      expect(nextCount(2147483647)).assertEqual(2147483648);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNextCount0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_2900
     * @tc.name      testReadCount0029
     * @tc.desc      Verify readCount(-1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCount0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0029 begin');
      await delayTick();
      expect(readCount(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3000
     * @tc.name      testReadCount0030
     * @tc.desc      Verify readCount(0) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCount0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0030 begin');
      await delayTick();
      expect(readCount(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3100
     * @tc.name      testReadCount0031
     * @tc.desc      Verify readCount(1) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCount0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0031 begin');
      await delayTick();
      expect(readCount(1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3200
     * @tc.name      testReadCount0032
     * @tc.desc      Verify readCount(1.9) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCount0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0032 begin');
      await delayTick();
      expect(readCount(1.9)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3300
     * @tc.name      testReadCount0033
     * @tc.desc      Verify readCount(2.9) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCount0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0033 begin');
      await delayTick();
      expect(readCount(2.9)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3400
     * @tc.name      testReadCount0034
     * @tc.desc      Verify readCount(99) returns 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCount0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0034 begin');
      await delayTick();
      expect(readCount(99)).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCount0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3500
     * @tc.name      testReadCountString0035
     * @tc.desc      Verify readCount string returns zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCountString0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCountString0035 begin');
      await delayTick();
      expect(readCount('5')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCountString0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3600
     * @tc.name      testReadCountBoolean0036
     * @tc.desc      Verify readCount boolean returns zero.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadCountBoolean0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCountBoolean0036 begin');
      await delayTick();
      expect(readCount(true)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadCountBoolean0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3700
     * @tc.name      testReadText0037
     * @tc.desc      Verify readText('') returns ''.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadText0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadText0037 begin');
      await delayTick();
      expect(readText('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadText0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3800
     * @tc.name      testReadText0038
     * @tc.desc      Verify readText('x') returns 'x'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadText0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadText0038 begin');
      await delayTick();
      expect(readText('x')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadText0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_3900
     * @tc.name      testReadText0039
     * @tc.desc      Verify readText('中文') returns '中文'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadText0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadText0039 begin');
      await delayTick();
      expect(readText('中文')).assertEqual('中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadText0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_PBMP1_4000
     * @tc.name      testReadTextNumber0040
     * @tc.desc      Verify readText number returns empty.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testReadTextNumber0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadTextNumber0040 begin');
      await delayTick();
      expect(readText(5)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReadTextNumber0040 end');
    })

  })
}
