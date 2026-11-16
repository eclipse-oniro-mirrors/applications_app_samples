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
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function canvasGameFinalFormTest() {
  describe('CanvasGameFinalFormTest', () => {

    /**
     * @tc.name   testCanvasFinalForm0001
     * @tc.number SUB_CANVAS_FINAL_FORM_0001
     * @tc.desc   Final form boundary 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(16);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(16);');
        expect(id.length).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0001 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0002
     * @tc.number SUB_CANVAS_FINAL_FORM_0002
     * @tc.desc   Final form boundary 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(32);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(32);');
        expect(id.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0002 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0003
     * @tc.number SUB_CANVAS_FINAL_FORM_0003
     * @tc.desc   Final form boundary 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(48);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(48);');
        expect(id.length).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0003 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0004
     * @tc.number SUB_CANVAS_FINAL_FORM_0004
     * @tc.desc   Final form boundary 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(64);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(64);');
        expect(id.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0004 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0005
     * @tc.number SUB_CANVAS_FINAL_FORM_0005
     * @tc.desc   Final form boundary 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(80);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(80);');
        expect(id.length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0005 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0006
     * @tc.number SUB_CANVAS_FINAL_FORM_0006
     * @tc.desc   Final form boundary 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(96);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(96);');
        expect(id.length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0006 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0007
     * @tc.number SUB_CANVAS_FINAL_FORM_0007
     * @tc.desc   Final form boundary 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(112);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(112);');
        expect(id.length).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0007 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0008
     * @tc.number SUB_CANVAS_FINAL_FORM_0008
     * @tc.desc   Final form boundary 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(128);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(128);');
        expect(id.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0008 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0009
     * @tc.number SUB_CANVAS_FINAL_FORM_0009
     * @tc.desc   Final form boundary 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(144);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(144);');
        expect(id.length).assertEqual(144);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0009 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0010
     * @tc.number SUB_CANVAS_FINAL_FORM_0010
     * @tc.desc   Final form boundary 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(160);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(160);');
        expect(id.length).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0010 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0011
     * @tc.number SUB_CANVAS_FINAL_FORM_0011
     * @tc.desc   Final form boundary 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(176);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(176);');
        expect(id.length).assertEqual(176);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0011 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0012
     * @tc.number SUB_CANVAS_FINAL_FORM_0012
     * @tc.desc   Final form boundary 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(192);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(192);');
        expect(id.length).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0012 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0013
     * @tc.number SUB_CANVAS_FINAL_FORM_0013
     * @tc.desc   Final form boundary 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(208);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(208);');
        expect(id.length).assertEqual(208);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0013 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0014
     * @tc.number SUB_CANVAS_FINAL_FORM_0014
     * @tc.desc   Final form boundary 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(224);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(224);');
        expect(id.length).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0014 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0015
     * @tc.number SUB_CANVAS_FINAL_FORM_0015
     * @tc.desc   Final form boundary 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(240);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(240);');
        expect(id.length).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0015 end');
    })

    /**
     * @tc.name   testCanvasFinalForm0016
     * @tc.number SUB_CANVAS_FINAL_FORM_0016
     * @tc.desc   Final form boundary 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'z'.repeat(256);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(256);');
        expect(id.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasFinalForm0016 end');
    })
  })
}
