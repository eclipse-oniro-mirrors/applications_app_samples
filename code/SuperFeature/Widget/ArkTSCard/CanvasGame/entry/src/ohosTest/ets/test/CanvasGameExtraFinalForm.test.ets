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

export default function canvasGameExtraFinalFormTest() {
  describe('CanvasGameExtraFinalFormTest', () => {

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0001
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0001
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(192);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(192));
        expect(id.length).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0002
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0002
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(384);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(384));
        expect(id.length).assertEqual(384);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0003
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(576);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(576));
        expect(id.length).assertEqual(576);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0004
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0004
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(768);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(768));
        expect(id.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0005
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0005
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(960);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(960));
        expect(id.length).assertEqual(960);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0006
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0006
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(1152);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1152));
        expect(id.length).assertEqual(1152);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0007
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0007
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(1344);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1344));
        expect(id.length).assertEqual(1344);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0008
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0008
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(1536);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1536));
        expect(id.length).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0009
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(1728);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1728));
        expect(id.length).assertEqual(1728);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0010
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0010
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(1920);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1920));
        expect(id.length).assertEqual(1920);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0011
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0011
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(2112);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2112));
        expect(id.length).assertEqual(2112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0012
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0012
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(2304);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2304));
        expect(id.length).assertEqual(2304);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0013
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0013
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(2496);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2496));
        expect(id.length).assertEqual(2496);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0014
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0014
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(2688);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2688));
        expect(id.length).assertEqual(2688);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0015
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(2880);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2880));
        expect(id.length).assertEqual(2880);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_ExtraFinalForm_0016
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0016
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_ExtraFinalForm_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'u'.repeat(3072);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(3072));
        expect(id.length).assertEqual(3072);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_ExtraFinalForm_0016 end');
    })
  })
}
