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
import { GlobalContext } from '../../../main/ets/common/utils/GlobalContext';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function GlobalContextMatrixPart1Test(): void {
  describe('GlobalContextMatrixPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0100
     * @tc.name      testSingleton0001
     * @tc.desc      Verify GlobalContext.get returns the same instance twice.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSingleton0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSingleton0001 begin');
      expect(GlobalContext.get() === GlobalContext.get()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSingleton0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0200
     * @tc.name      testStringValue0002
     * @tc.desc      Verify a string stored under a key is returned unchanged.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStringValue0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringValue0002 begin');
      GlobalContext.get().setObject('photoTest.text', 'ready');
      expect(GlobalContext.get().getT<string>('photoTest.text')).assertEqual('ready');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStringValue0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0300
     * @tc.name      testNumberValue0003
     * @tc.desc      Verify a number stored under a key is returned unchanged.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNumberValue0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNumberValue0003 begin');
      GlobalContext.get().setObject('photoTest.number', 42);
      expect(GlobalContext.get().getT<number>('photoTest.number')).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNumberValue0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0400
     * @tc.name      testBooleanValue0004
     * @tc.desc      Verify a boolean stored under a key is returned unchanged.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBooleanValue0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBooleanValue0004 begin');
      GlobalContext.get().setObject('photoTest.boolean', true);
      expect(GlobalContext.get().getT<boolean>('photoTest.boolean')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBooleanValue0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0500
     * @tc.name      testDateObject0005
     * @tc.desc      Verify a Date object keeps its timestamp through storage.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateObject0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateObject0005 begin');
      const stamp: Date = new Date(2026, 0, 2, 3, 4, 5);
      GlobalContext.get().setObject('photoTest.date', stamp);
      expect(GlobalContext.get().getT<Date>('photoTest.date').getTime()).assertEqual(stamp.getTime());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDateObject0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0600
     * @tc.name      testOverwriteValue0006
     * @tc.desc      Verify storing a new value for an existing key replaces the old one.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOverwriteValue0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOverwriteValue0006 begin');
      GlobalContext.get().setObject('photoTest.overwrite', 'first');
      GlobalContext.get().setObject('photoTest.overwrite', 'second');
      expect(GlobalContext.get().getT<string>('photoTest.overwrite')).assertEqual('second');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOverwriteValue0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0700
     * @tc.name      testMissingKey0007
     * @tc.desc      Verify reading an unused key yields undefined.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMissingKey0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingKey0007 begin');
      expect(GlobalContext.get().getT<number>('photoTest.absent') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingKey0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0800
     * @tc.name      testApplyRunsAction0008
     * @tc.desc      Verify apply invokes a stored callable once.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testApplyRunsAction0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyRunsAction0008 begin');
      let calls: number = 0;
      const action: Object = (() => { calls += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.action', action);
      GlobalContext.get().apply('photoTest.action');
      expect(calls).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyRunsAction0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_0900
     * @tc.name      testApplyTwice0009
     * @tc.desc      Verify apply invokes the same callable on every call.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testApplyTwice0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyTwice0009 begin');
      let calls: number = 0;
      const action: Object = (() => { calls += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.actionTwice', action);
      GlobalContext.get().apply('photoTest.actionTwice');
      GlobalContext.get().apply('photoTest.actionTwice');
      expect(calls).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyTwice0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_1000
     * @tc.name      testApplyMissingKey0010
     * @tc.desc      Verify apply on a missing key is a no-op.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testApplyMissingKey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyMissingKey0010 begin');
      let calls: number = 0;
      const action: Object = (() => { calls += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.actionOther', action);
      GlobalContext.get().apply('photoTest.actionMissing');
      expect(calls).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyMissingKey0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_1100
     * @tc.name      testIndependentKeys0011
     * @tc.desc      Verify values under different keys do not interfere.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIndependentKeys0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndependentKeys0011 begin');
      GlobalContext.get().setObject('photoTest.keyA', 11);
      GlobalContext.get().setObject('photoTest.keyB', 22);
      expect(GlobalContext.get().getT<number>('photoTest.keyA')).assertEqual(11);
      expect(GlobalContext.get().getT<number>('photoTest.keyB')).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndependentKeys0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCTXP1_1200
     * @tc.name      testGenericType0012
     * @tc.desc      Verify a numeric key read as string keeps its stored primitive text.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGenericType0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGenericType0012 begin');
      GlobalContext.get().setObject('photoTest.type', 7);
      const asText: string = String(GlobalContext.get().getT<number>('photoTest.type'));
      expect(asText).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testGenericType0012 end');
    })

  })
}
