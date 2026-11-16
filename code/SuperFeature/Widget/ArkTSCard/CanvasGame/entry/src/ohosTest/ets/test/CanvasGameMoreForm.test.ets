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

export default function canvasGameMoreFormTest() {
  describe('CanvasGameMoreFormTest', () => {

    /**
     * @tc.name   testCanvasMoreForm0001
     * @tc.number SUB_CANVAS_MORE_FORM_0001
     * @tc.desc   More form event boundary 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(32); expect(a.onFormEvent('event-1', m) === undefined).assertTrue(); expect(m.length).assertEqual(32);
    })

    /**
     * @tc.name   testCanvasMoreForm0002
     * @tc.number SUB_CANVAS_MORE_FORM_0002
     * @tc.desc   More form event boundary 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(64); expect(a.onFormEvent('event-2', m) === undefined).assertTrue(); expect(m.length).assertEqual(64);
    })

    /**
     * @tc.name   testCanvasMoreForm0003
     * @tc.number SUB_CANVAS_MORE_FORM_0003
     * @tc.desc   More form event boundary 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(96); expect(a.onFormEvent('event-3', m) === undefined).assertTrue(); expect(m.length).assertEqual(96);
    })

    /**
     * @tc.name   testCanvasMoreForm0004
     * @tc.number SUB_CANVAS_MORE_FORM_0004
     * @tc.desc   More form event boundary 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(128); expect(a.onFormEvent('event-4', m) === undefined).assertTrue(); expect(m.length).assertEqual(128);
    })

    /**
     * @tc.name   testCanvasMoreForm0005
     * @tc.number SUB_CANVAS_MORE_FORM_0005
     * @tc.desc   More form event boundary 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(160); expect(a.onFormEvent('event-5', m) === undefined).assertTrue(); expect(m.length).assertEqual(160);
    })

    /**
     * @tc.name   testCanvasMoreForm0006
     * @tc.number SUB_CANVAS_MORE_FORM_0006
     * @tc.desc   More form event boundary 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(192); expect(a.onFormEvent('event-6', m) === undefined).assertTrue(); expect(m.length).assertEqual(192);
    })

    /**
     * @tc.name   testCanvasMoreForm0007
     * @tc.number SUB_CANVAS_MORE_FORM_0007
     * @tc.desc   More form event boundary 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(224); expect(a.onFormEvent('event-7', m) === undefined).assertTrue(); expect(m.length).assertEqual(224);
    })

    /**
     * @tc.name   testCanvasMoreForm0008
     * @tc.number SUB_CANVAS_MORE_FORM_0008
     * @tc.desc   More form event boundary 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(256); expect(a.onFormEvent('event-8', m) === undefined).assertTrue(); expect(m.length).assertEqual(256);
    })

    /**
     * @tc.name   testCanvasMoreForm0009
     * @tc.number SUB_CANVAS_MORE_FORM_0009
     * @tc.desc   More form event boundary 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(288); expect(a.onFormEvent('event-9', m) === undefined).assertTrue(); expect(m.length).assertEqual(288);
    })

    /**
     * @tc.name   testCanvasMoreForm0010
     * @tc.number SUB_CANVAS_MORE_FORM_0010
     * @tc.desc   More form event boundary 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(320); expect(a.onFormEvent('event-10', m) === undefined).assertTrue(); expect(m.length).assertEqual(320);
    })

    /**
     * @tc.name   testCanvasMoreForm0011
     * @tc.number SUB_CANVAS_MORE_FORM_0011
     * @tc.desc   More form event boundary 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(352); expect(a.onFormEvent('event-11', m) === undefined).assertTrue(); expect(m.length).assertEqual(352);
    })

    /**
     * @tc.name   testCanvasMoreForm0012
     * @tc.number SUB_CANVAS_MORE_FORM_0012
     * @tc.desc   More form event boundary 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(384); expect(a.onFormEvent('event-12', m) === undefined).assertTrue(); expect(m.length).assertEqual(384);
    })

    /**
     * @tc.name   testCanvasMoreForm0013
     * @tc.number SUB_CANVAS_MORE_FORM_0013
     * @tc.desc   More form event boundary 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(416); expect(a.onFormEvent('event-13', m) === undefined).assertTrue(); expect(m.length).assertEqual(416);
    })

    /**
     * @tc.name   testCanvasMoreForm0014
     * @tc.number SUB_CANVAS_MORE_FORM_0014
     * @tc.desc   More form event boundary 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(448); expect(a.onFormEvent('event-14', m) === undefined).assertTrue(); expect(m.length).assertEqual(448);
    })

    /**
     * @tc.name   testCanvasMoreForm0015
     * @tc.number SUB_CANVAS_MORE_FORM_0015
     * @tc.desc   More form event boundary 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(480); expect(a.onFormEvent('event-15', m) === undefined).assertTrue(); expect(m.length).assertEqual(480);
    })

    /**
     * @tc.name   testCanvasMoreForm0016
     * @tc.number SUB_CANVAS_MORE_FORM_0016
     * @tc.desc   More form event boundary 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasMoreForm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(512); expect(a.onFormEvent('event-16', m) === undefined).assertTrue(); expect(m.length).assertEqual(512);
    })
  })
}
