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

export default function canvasGameCompositeTypesTest() {
  describe('CanvasGameCompositeTypesTest', () => {

    /**
     * @tc.name   testCanvasComposite0001
     * @tc.number SUB_CANVAS_COMPOSITE_0001
     * @tc.desc   Composite type sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const data = a.onAddForm({}); expect(data !== undefined).assertTrue(); expect(typeof data === 'object').assertTrue();
    })

    /**
     * @tc.name   testCanvasComposite0002
     * @tc.number SUB_CANVAS_COMPOSITE_0002
     * @tc.desc   Composite type sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const data = a.onAddForm({}); expect(data !== undefined).assertTrue(); expect(typeof data === 'object').assertTrue();
    })

    /**
     * @tc.name   testCanvasComposite0003
     * @tc.number SUB_CANVAS_COMPOSITE_0003
     * @tc.desc   Composite type sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const data = a.onAddForm({}); expect(data !== undefined).assertTrue(); expect(typeof data === 'object').assertTrue();
    })

    /**
     * @tc.name   testCanvasComposite0004
     * @tc.number SUB_CANVAS_COMPOSITE_0004
     * @tc.desc   Composite type sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const data = a.onAddForm({}); expect(data !== undefined).assertTrue(); expect(typeof data === 'object').assertTrue();
    })

    /**
     * @tc.name   testCanvasComposite0005
     * @tc.number SUB_CANVAS_COMPOSITE_0005
     * @tc.desc   Composite type sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-5', values.join('-')) === undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasComposite0006
     * @tc.number SUB_CANVAS_COMPOSITE_0006
     * @tc.desc   Composite type sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-6', values.join('-')) === undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasComposite0007
     * @tc.number SUB_CANVAS_COMPOSITE_0007
     * @tc.desc   Composite type sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-7', values.join('-')) === undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasComposite0008
     * @tc.number SUB_CANVAS_COMPOSITE_0008
     * @tc.desc   Composite type sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-8', values.join('-')) === undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasComposite0009
     * @tc.number SUB_CANVAS_COMPOSITE_0009
     * @tc.desc   Composite type sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d') === undefined).assertTrue(); const tuple: string[] = ['x','y']; expect(tuple.length).assertEqual(2); expect(tuple[0]).assertEqual('x');
    })

    /**
     * @tc.name   testCanvasComposite0010
     * @tc.number SUB_CANVAS_COMPOSITE_0010
     * @tc.desc   Composite type sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d') === undefined).assertTrue(); const tuple: string[] = ['x','y']; expect(tuple.length).assertEqual(2); expect(tuple[0]).assertEqual('x');
    })

    /**
     * @tc.name   testCanvasComposite0011
     * @tc.number SUB_CANVAS_COMPOSITE_0011
     * @tc.desc   Composite type sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d') === undefined).assertTrue(); const tuple: string[] = ['x','y']; expect(tuple.length).assertEqual(2); expect(tuple[0]).assertEqual('x');
    })

    /**
     * @tc.name   testCanvasComposite0012
     * @tc.number SUB_CANVAS_COMPOSITE_0012
     * @tc.desc   Composite type sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasComposite0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(logger.info('a','b','c','d') === undefined).assertTrue(); const tuple: string[] = ['x','y']; expect(tuple.length).assertEqual(2); expect(tuple[0]).assertEqual('x');
    })
  })
}
