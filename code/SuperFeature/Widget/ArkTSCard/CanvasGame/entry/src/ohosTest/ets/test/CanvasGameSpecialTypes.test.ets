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
     * @tc.name   com.samples.canvasgame_SpecialTypes_0001
     * @tc.number SUB_CANVAS_SPECIAL_0001
     * @tc.desc   Special type sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('') === undefined));
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('') === undefined));
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAcquireFormState({}) >= 0));
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0002
     * @tc.number SUB_CANVAS_SPECIAL_0002
     * @tc.desc   Special type sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('') === undefined));
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('') === undefined));
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAcquireFormState({}) >= 0));
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0003
     * @tc.number SUB_CANVAS_SPECIAL_0003
     * @tc.desc   Special type sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('') === undefined));
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('') === undefined));
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAcquireFormState({}) >= 0));
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0004
     * @tc.number SUB_CANVAS_SPECIAL_0004
     * @tc.desc   Special type sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onCastToNormalForm('') === undefined));
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm('') === undefined));
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onAcquireFormState({}) >= 0));
        expect(a.onAcquireFormState({}) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0005
     * @tc.number SUB_CANVAS_SPECIAL_0005
     * @tc.desc   Special type sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 1; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(n % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0006
     * @tc.number SUB_CANVAS_SPECIAL_0006
     * @tc.desc   Special type sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 2; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(n % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0007
     * @tc.number SUB_CANVAS_SPECIAL_0007
     * @tc.desc   Special type sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 3; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(n % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0008
     * @tc.number SUB_CANVAS_SPECIAL_0008
     * @tc.desc   Special type sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 4; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(n % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(n % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0009
     * @tc.number SUB_CANVAS_SPECIAL_0009
     * @tc.desc   Special type sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0009 begin');
      const msg: string = 's'.repeat(576);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug(msg) === undefined));
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(msg.length), String(576));
        expect(msg.length).assertEqual(576);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0010
     * @tc.number SUB_CANVAS_SPECIAL_0010
     * @tc.desc   Special type sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0010 begin');
      const msg: string = 's'.repeat(640);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug(msg) === undefined));
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(msg.length), String(640));
        expect(msg.length).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0011
     * @tc.number SUB_CANVAS_SPECIAL_0011
     * @tc.desc   Special type sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0011 begin');
      const msg: string = 's'.repeat(704);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug(msg) === undefined));
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(msg.length), String(704));
        expect(msg.length).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_SpecialTypes_0012
     * @tc.number SUB_CANVAS_SPECIAL_0012
     * @tc.desc   Special type sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_SpecialTypes_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0012 begin');
      const msg: string = 's'.repeat(768);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(logger.debug(msg) === undefined));
        expect(logger.debug(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(msg.length), String(768));
        expect(msg.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_SpecialTypes_0012 end');
    })
  })
}
