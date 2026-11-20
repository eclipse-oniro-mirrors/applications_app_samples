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

export default function canvasGameVolumeForm01Test() {
  describe('CanvasGameVolumeForm01Test', () => {

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0001
     * @tc.number SUB_CANVAS_VOL_FORM_01_0001
     * @tc.desc   Verify a.onFormEvent(\'id-1\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-1', m) === undefined));
        expect(a.onFormEvent('id-1', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(8));
        expect(m.length).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0002
     * @tc.number SUB_CANVAS_VOL_FORM_01_0002
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 3; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0003
     * @tc.number SUB_CANVAS_VOL_FORM_01_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(3));
        expect(id.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0004
     * @tc.number SUB_CANVAS_VOL_FORM_01_0004
     * @tc.desc   Verify a.onFormEvent(\'id-4\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(32);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-4', m) === undefined));
        expect(a.onFormEvent('id-4', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(32));
        expect(m.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0005
     * @tc.number SUB_CANVAS_VOL_FORM_01_0005
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 1; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0006
     * @tc.number SUB_CANVAS_VOL_FORM_01_0006
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(6));
        expect(id.length).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0007
     * @tc.number SUB_CANVAS_VOL_FORM_01_0007
     * @tc.desc   Verify a.onFormEvent(\'id-7\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(56);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-7', m) === undefined));
        expect(a.onFormEvent('id-7', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(56));
        expect(m.length).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0008
     * @tc.number SUB_CANVAS_VOL_FORM_01_0008
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 4; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0009
     * @tc.number SUB_CANVAS_VOL_FORM_01_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(9);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(9));
        expect(id.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0010
     * @tc.number SUB_CANVAS_VOL_FORM_01_0010
     * @tc.desc   Verify a.onFormEvent(\'id-10\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(80);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-10', m) === undefined));
        expect(a.onFormEvent('id-10', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(80));
        expect(m.length).assertEqual(80);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0011
     * @tc.number SUB_CANVAS_VOL_FORM_01_0011
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 2; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0012
     * @tc.number SUB_CANVAS_VOL_FORM_01_0012
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(12);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(12));
        expect(id.length).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0013
     * @tc.number SUB_CANVAS_VOL_FORM_01_0013
     * @tc.desc   Verify a.onFormEvent(\'id-13\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(104);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-13', m) === undefined));
        expect(a.onFormEvent('id-13', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(104));
        expect(m.length).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0014
     * @tc.number SUB_CANVAS_VOL_FORM_01_0014
     * @tc.desc   Verify a.onChangeFormVisibility(i % 2 === 0) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let i: number = 0; i < 5; i++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onChangeFormVisibility(i % 2 === 0) === undefined));
          expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0015
     * @tc.number SUB_CANVAS_VOL_FORM_01_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'f'.repeat(15);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(15));
        expect(id.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_VolumeForm01_0016
     * @tc.number SUB_CANVAS_VOL_FORM_01_0016
     * @tc.desc   Verify a.onFormEvent(\'id-16\', m) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_VolumeForm01_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'm'.repeat(128);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('id-16', m) === undefined));
        expect(a.onFormEvent('id-16', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(128));
        expect(m.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_VolumeForm01_0016 end');
    })
  })
}
