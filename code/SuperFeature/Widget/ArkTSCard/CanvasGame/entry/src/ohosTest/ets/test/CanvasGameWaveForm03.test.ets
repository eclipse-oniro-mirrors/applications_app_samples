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

export default function canvasGameWaveForm03Test() {
  describe('CanvasGameWaveForm03Test', () => {

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0001
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0001
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(132);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(132));
        expect(id.length).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0002
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0002
     * @tc.desc   Verify a.onFormEvent(\'f-34\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(272);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-34', m) === undefined));
        expect(a.onFormEvent('f-34', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(272));
        expect(m.length).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0003
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(140);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(140));
        expect(id.length).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0004
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0004
     * @tc.desc   Verify a.onFormEvent(\'f-36\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(288);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-36', m) === undefined));
        expect(a.onFormEvent('f-36', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(288));
        expect(m.length).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0005
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0005
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(148);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(148));
        expect(id.length).assertEqual(148);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0006
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0006
     * @tc.desc   Verify a.onFormEvent(\'f-38\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(304);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-38', m) === undefined));
        expect(a.onFormEvent('f-38', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(304));
        expect(m.length).assertEqual(304);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0007
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0007
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(156);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(156));
        expect(id.length).assertEqual(156);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0008
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0008
     * @tc.desc   Verify a.onFormEvent(\'f-40\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(320);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-40', m) === undefined));
        expect(a.onFormEvent('f-40', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(320));
        expect(m.length).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0009
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(164);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(164));
        expect(id.length).assertEqual(164);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0010
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0010
     * @tc.desc   Verify a.onFormEvent(\'f-42\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(336);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-42', m) === undefined));
        expect(a.onFormEvent('f-42', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(336));
        expect(m.length).assertEqual(336);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0011
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0011
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(172);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(172));
        expect(id.length).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0012
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0012
     * @tc.desc   Verify a.onFormEvent(\'f-44\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(352);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-44', m) === undefined));
        expect(a.onFormEvent('f-44', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(352));
        expect(m.length).assertEqual(352);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0013
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0013
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(180);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(180));
        expect(id.length).assertEqual(180);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0014
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0014
     * @tc.desc   Verify a.onFormEvent(\'f-46\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(368);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-46', m) === undefined));
        expect(a.onFormEvent('f-46', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(368));
        expect(m.length).assertEqual(368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0015
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'w'.repeat(188);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(188));
        expect(id.length).assertEqual(188);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_WaveForm03_0016
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0016
     * @tc.desc   Verify a.onFormEvent(\'f-48\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_WaveForm03_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(384);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('f-48', m) === undefined));
        expect(a.onFormEvent('f-48', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(384));
        expect(m.length).assertEqual(384);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_WaveForm03_0016 end');
    })
  })
}
