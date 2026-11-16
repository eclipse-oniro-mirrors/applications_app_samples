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

export default function canvasGameVolumeForm05Test() {
  describe('CanvasGameVolumeForm05Test', () => {

    /**
     * @tc.name   testCanvasVolForm050001
     * @tc.number SUB_CANVAS_VOL_FORM_05_0001
     * @tc.desc   Verify a.onFormEvent(\'id-65\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(520);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-65', m) === undefined));
        expect(a.onFormEvent('id-65', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(520));
        expect(m.length).assertEqual(520);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050001 end');
    })

    /**
     * @tc.name   testCanvasVolForm050002
     * @tc.number SUB_CANVAS_VOL_FORM_05_0002
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 2; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050002 end');
    })

    /**
     * @tc.name   testCanvasVolForm050003
     * @tc.number SUB_CANVAS_VOL_FORM_05_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(67);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(67));
        expect(id.length).assertEqual(67);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050003 end');
    })

    /**
     * @tc.name   testCanvasVolForm050004
     * @tc.number SUB_CANVAS_VOL_FORM_05_0004
     * @tc.desc   Verify a.onFormEvent(\'id-68\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(544);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-68', m) === undefined));
        expect(a.onFormEvent('id-68', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(544));
        expect(m.length).assertEqual(544);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050004 end');
    })

    /**
     * @tc.name   testCanvasVolForm050005
     * @tc.number SUB_CANVAS_VOL_FORM_05_0005
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 5; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050005 end');
    })

    /**
     * @tc.name   testCanvasVolForm050006
     * @tc.number SUB_CANVAS_VOL_FORM_05_0006
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(70);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(70));
        expect(id.length).assertEqual(70);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050006 end');
    })

    /**
     * @tc.name   testCanvasVolForm050007
     * @tc.number SUB_CANVAS_VOL_FORM_05_0007
     * @tc.desc   Verify a.onFormEvent(\'id-71\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(568);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-71', m) === undefined));
        expect(a.onFormEvent('id-71', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(568));
        expect(m.length).assertEqual(568);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050007 end');
    })

    /**
     * @tc.name   testCanvasVolForm050008
     * @tc.number SUB_CANVAS_VOL_FORM_05_0008
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 3; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050008 end');
    })

    /**
     * @tc.name   testCanvasVolForm050009
     * @tc.number SUB_CANVAS_VOL_FORM_05_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(73);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(73));
        expect(id.length).assertEqual(73);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050009 end');
    })

    /**
     * @tc.name   testCanvasVolForm050010
     * @tc.number SUB_CANVAS_VOL_FORM_05_0010
     * @tc.desc   Verify a.onFormEvent(\'id-74\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(592);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-74', m) === undefined));
        expect(a.onFormEvent('id-74', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(592));
        expect(m.length).assertEqual(592);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050010 end');
    })

    /**
     * @tc.name   testCanvasVolForm050011
     * @tc.number SUB_CANVAS_VOL_FORM_05_0011
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 1; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050011 end');
    })

    /**
     * @tc.name   testCanvasVolForm050012
     * @tc.number SUB_CANVAS_VOL_FORM_05_0012
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(76);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(76));
        expect(id.length).assertEqual(76);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050012 end');
    })

    /**
     * @tc.name   testCanvasVolForm050013
     * @tc.number SUB_CANVAS_VOL_FORM_05_0013
     * @tc.desc   Verify a.onFormEvent(\'id-77\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(616);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-77', m) === undefined));
        expect(a.onFormEvent('id-77', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(616));
        expect(m.length).assertEqual(616);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050013 end');
    })

    /**
     * @tc.name   testCanvasVolForm050014
     * @tc.number SUB_CANVAS_VOL_FORM_05_0014
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 4; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050014 end');
    })

    /**
     * @tc.name   testCanvasVolForm050015
     * @tc.number SUB_CANVAS_VOL_FORM_05_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(79);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(79));
        expect(id.length).assertEqual(79);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050015 end');
    })

    /**
     * @tc.name   testCanvasVolForm050016
     * @tc.number SUB_CANVAS_VOL_FORM_05_0016
     * @tc.desc   Verify a.onFormEvent(\'id-80\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(640);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-80', m) === undefined));
        expect(a.onFormEvent('id-80', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(640));
        expect(m.length).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasVolForm050016 end');
    })
  })
}
