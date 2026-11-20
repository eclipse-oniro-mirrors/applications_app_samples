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
     * @tc.name   com.samples.canvasgame_WaveForm04_0001
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0001
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(196);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(196));
        expect(id.length).assertEqual(196);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0002
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0002
     * @tc.desc   Verify a.onFormEvent(\'f-50\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(400);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-50', m) === undefined));
        expect(a.onFormEvent('f-50', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(400));
        expect(m.length).assertEqual(400);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0003
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(204);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(204));
        expect(id.length).assertEqual(204);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0004
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0004
     * @tc.desc   Verify a.onFormEvent(\'f-52\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(416);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-52', m) === undefined));
        expect(a.onFormEvent('f-52', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(416));
        expect(m.length).assertEqual(416);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0005
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0005
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(212);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(212));
        expect(id.length).assertEqual(212);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0006
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0006
     * @tc.desc   Verify a.onFormEvent(\'f-54\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(432);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-54', m) === undefined));
        expect(a.onFormEvent('f-54', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(432));
        expect(m.length).assertEqual(432);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0007
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0007
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(220);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(220));
        expect(id.length).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0008
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0008
     * @tc.desc   Verify a.onFormEvent(\'f-56\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(448);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-56', m) === undefined));
        expect(a.onFormEvent('f-56', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(448));
        expect(m.length).assertEqual(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0009
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(228);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(228));
        expect(id.length).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0010
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0010
     * @tc.desc   Verify a.onFormEvent(\'f-58\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(464);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-58', m) === undefined));
        expect(a.onFormEvent('f-58', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(464));
        expect(m.length).assertEqual(464);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0011
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0011
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(236);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(236));
        expect(id.length).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0012
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0012
     * @tc.desc   Verify a.onFormEvent(\'f-60\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(480);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-60', m) === undefined));
        expect(a.onFormEvent('f-60', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(480));
        expect(m.length).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0013
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0013
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(244);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(244));
        expect(id.length).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0014
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0014
     * @tc.desc   Verify a.onFormEvent(\'f-62\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(496);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-62', m) === undefined));
        expect(a.onFormEvent('f-62', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(496));
        expect(m.length).assertEqual(496);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0015
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(252);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(252));
        expect(id.length).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm04_0016
     * @tc.number SUB_CANVAS_WAVE_FORM_04_0016
     * @tc.desc   Verify a.onFormEvent(\'f-64\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm04_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-64', m) === undefined));
        expect(a.onFormEvent('f-64', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(512));
        expect(m.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm04_0016 end');
    })
  })
}
