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

export default function canvasGameWaveForm04Test() {
  describe('CanvasGameWaveForm04Test', () => {

    /**
     * @tc.name   testCanvasWaveForm040001
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0001
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(196);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(196);');
        expect(id.length).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040001 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040002
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0002
     * @tc.desc   Verify a.onFormEvent(\'f-50\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(400);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-50\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-50', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(400);');
        expect(m.length).assertEqual(400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040002 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040003
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(204);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(204);');
        expect(id.length).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040003 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040004
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0004
     * @tc.desc   Verify a.onFormEvent(\'f-52\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(416);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-52\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-52', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(416);');
        expect(m.length).assertEqual(416);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040004 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040005
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0005
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(212);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(212);');
        expect(id.length).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040005 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040006
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0006
     * @tc.desc   Verify a.onFormEvent(\'f-54\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(432);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-54\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-54', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(432);');
        expect(m.length).assertEqual(432);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040006 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040007
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0007
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(220);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(220);');
        expect(id.length).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040007 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040008
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0008
     * @tc.desc   Verify a.onFormEvent(\'f-56\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(448);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-56\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-56', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(448);');
        expect(m.length).assertEqual(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040008 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040009
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(228);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(228);');
        expect(id.length).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040009 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040010
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0010
     * @tc.desc   Verify a.onFormEvent(\'f-58\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(464);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-58\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-58', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(464);');
        expect(m.length).assertEqual(464);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040010 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040011
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0011
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(236);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(236);');
        expect(id.length).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040011 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040012
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0012
     * @tc.desc   Verify a.onFormEvent(\'f-60\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(480);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-60\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-60', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(480);');
        expect(m.length).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040012 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040013
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0013
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(244);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(244);');
        expect(id.length).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040013 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040014
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0014
     * @tc.desc   Verify a.onFormEvent(\'f-62\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(496);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-62\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-62', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(496);');
        expect(m.length).assertEqual(496);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040014 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040015
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(252);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(252);');
        expect(id.length).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040015 end');
    })

    /**
     * @tc.name   testCanvasWaveForm040016
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0016
     * @tc.desc   Verify a.onFormEvent(\'f-64\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f-64\', m) === undefined).assertTrue();');
        expect(a.onFormEvent('f-64', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(m.length).assertEqual(512);');
        expect(m.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasWaveForm040016 end');
    })
  })
}
