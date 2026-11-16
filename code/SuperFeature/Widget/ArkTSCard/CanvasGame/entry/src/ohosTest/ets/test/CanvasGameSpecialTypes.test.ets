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
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
import logger from '../../../main/ets/model/Logger';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function canvasGameSpecialTypesTest() {
  describe('CanvasGameSpecialTypesTest', () => {

    /**
     * @tc.name   testCanvasSpecial0001
     * @tc.number SUB_CANVAS_SPECIAL_0001
     * @tc.desc   Special type sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'\') === undefined).assertTrue();');
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0001 end');
    })

    /**
     * @tc.name   testCanvasSpecial0002
     * @tc.number SUB_CANVAS_SPECIAL_0002
     * @tc.desc   Special type sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'\') === undefined).assertTrue();');
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0002 end');
    })

    /**
     * @tc.name   testCanvasSpecial0003
     * @tc.number SUB_CANVAS_SPECIAL_0003
     * @tc.desc   Special type sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'\') === undefined).assertTrue();');
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0003 end');
    })

    /**
     * @tc.name   testCanvasSpecial0004
     * @tc.number SUB_CANVAS_SPECIAL_0004
     * @tc.desc   Special type sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'\') === undefined).assertTrue();');
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0004 end');
    })

    /**
     * @tc.name   testCanvasSpecial0005
     * @tc.number SUB_CANVAS_SPECIAL_0005
     * @tc.desc   Special type sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 1; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();');
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0005 end');
    })

    /**
     * @tc.name   testCanvasSpecial0006
     * @tc.number SUB_CANVAS_SPECIAL_0006
     * @tc.desc   Special type sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 2; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();');
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0006 end');
    })

    /**
     * @tc.name   testCanvasSpecial0007
     * @tc.number SUB_CANVAS_SPECIAL_0007
     * @tc.desc   Special type sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 3; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();');
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0007 end');
    })

    /**
     * @tc.name   testCanvasSpecial0008
     * @tc.number SUB_CANVAS_SPECIAL_0008
     * @tc.desc   Special type sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 4; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();');
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0008 end');
    })

    /**
     * @tc.name   testCanvasSpecial0009
     * @tc.number SUB_CANVAS_SPECIAL_0009
     * @tc.desc   Special type sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0009 begin');
      const msg: string = 's'.repeat(576);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(msg) === undefined).assertTrue();');
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(576);');
        expect(msg.length).assertEqual(576);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0009 end');
    })

    /**
     * @tc.name   testCanvasSpecial0010
     * @tc.number SUB_CANVAS_SPECIAL_0010
     * @tc.desc   Special type sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0010 begin');
      const msg: string = 's'.repeat(640);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(msg) === undefined).assertTrue();');
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(640);');
        expect(msg.length).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0010 end');
    })

    /**
     * @tc.name   testCanvasSpecial0011
     * @tc.number SUB_CANVAS_SPECIAL_0011
     * @tc.desc   Special type sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0011 begin');
      const msg: string = 's'.repeat(704);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(msg) === undefined).assertTrue();');
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(704);');
        expect(msg.length).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0011 end');
    })

    /**
     * @tc.name   testCanvasSpecial0012
     * @tc.number SUB_CANVAS_SPECIAL_0012
     * @tc.desc   Special type sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSpecial0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0012 begin');
      const msg: string = 's'.repeat(768);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.debug(msg) === undefined).assertTrue();');
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(768);');
        expect(msg.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasSpecial0012 end');
    })
  })
}
