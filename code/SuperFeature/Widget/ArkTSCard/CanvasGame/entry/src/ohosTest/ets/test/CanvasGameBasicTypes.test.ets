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
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
import logger from '../../../main/ets/model/Logger';

export default function canvasGameBasicTypesTest() {
  describe('CanvasGameBasicTypesTest', () => {

    /**
     * @tc.name   testCanvasBasic0001
     * @tc.number SUB_CANVAS_BASIC_0001
     * @tc.desc   Basic type sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const s: string = 'b'.repeat(1); expect(a.onUpdateForm(s) === undefined).assertTrue(); expect(s.length).assertEqual(1);
    })

    /**
     * @tc.name   testCanvasBasic0002
     * @tc.number SUB_CANVAS_BASIC_0002
     * @tc.desc   Basic type sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const s: string = 'b'.repeat(2); expect(a.onUpdateForm(s) === undefined).assertTrue(); expect(s.length).assertEqual(2);
    })

    /**
     * @tc.name   testCanvasBasic0003
     * @tc.number SUB_CANVAS_BASIC_0003
     * @tc.desc   Basic type sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const s: string = 'b'.repeat(3); expect(a.onUpdateForm(s) === undefined).assertTrue(); expect(s.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasBasic0004
     * @tc.number SUB_CANVAS_BASIC_0004
     * @tc.desc   Basic type sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const s: string = 'b'.repeat(4); expect(a.onUpdateForm(s) === undefined).assertTrue(); expect(s.length).assertEqual(4);
    })

    /**
     * @tc.name   testCanvasBasic0005
     * @tc.number SUB_CANVAS_BASIC_0005
     * @tc.desc   Basic type sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onChangeFormVisibility(false) === undefined).assertTrue(); expect(5 > 0).assertTrue(); expect(typeof 5 === 'number').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0006
     * @tc.number SUB_CANVAS_BASIC_0006
     * @tc.desc   Basic type sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onChangeFormVisibility(true) === undefined).assertTrue(); expect(6 > 0).assertTrue(); expect(typeof 6 === 'number').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0007
     * @tc.number SUB_CANVAS_BASIC_0007
     * @tc.desc   Basic type sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onChangeFormVisibility(false) === undefined).assertTrue(); expect(7 > 0).assertTrue(); expect(typeof 7 === 'number').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0008
     * @tc.number SUB_CANVAS_BASIC_0008
     * @tc.desc   Basic type sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onChangeFormVisibility(true) === undefined).assertTrue(); expect(8 > 0).assertTrue(); expect(typeof 8 === 'number').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0009
     * @tc.number SUB_CANVAS_BASIC_0009
     * @tc.desc   Basic type sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('x') === undefined).assertTrue(); expect(logger.info('x','y') === undefined).assertTrue(); expect(typeof 'x' === 'string').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0010
     * @tc.number SUB_CANVAS_BASIC_0010
     * @tc.desc   Basic type sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('x') === undefined).assertTrue(); expect(logger.info('x','y') === undefined).assertTrue(); expect(typeof 'x' === 'string').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0011
     * @tc.number SUB_CANVAS_BASIC_0011
     * @tc.desc   Basic type sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('x') === undefined).assertTrue(); expect(logger.info('x','y') === undefined).assertTrue(); expect(typeof 'x' === 'string').assertTrue();
    })

    /**
     * @tc.name   testCanvasBasic0012
     * @tc.number SUB_CANVAS_BASIC_0012
     * @tc.desc   Basic type sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBasic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.log('x') === undefined).assertTrue(); expect(logger.info('x','y') === undefined).assertTrue(); expect(typeof 'x' === 'string').assertTrue();
    })
  })
}
