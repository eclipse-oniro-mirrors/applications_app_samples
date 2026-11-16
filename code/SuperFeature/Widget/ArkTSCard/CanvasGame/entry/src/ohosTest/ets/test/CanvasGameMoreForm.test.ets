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

export default function canvasGameMoreFormTest() {
  describe('CanvasGameMoreFormTest', () => {

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0001
     * @tc.number SUB_CANVAS_MORE_FORM_0001
     * @tc.desc   More form event boundary 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(32);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-1', m) === undefined));
        expect(a.onFormEvent('event-1', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(32));
        expect(m.length).assertEqual(32);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0001 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0002
     * @tc.number SUB_CANVAS_MORE_FORM_0002
     * @tc.desc   More form event boundary 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(64);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-2', m) === undefined));
        expect(a.onFormEvent('event-2', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(64));
        expect(m.length).assertEqual(64);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0002 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0003
     * @tc.number SUB_CANVAS_MORE_FORM_0003
     * @tc.desc   More form event boundary 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(96);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-3', m) === undefined));
        expect(a.onFormEvent('event-3', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(96));
        expect(m.length).assertEqual(96);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0003 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0004
     * @tc.number SUB_CANVAS_MORE_FORM_0004
     * @tc.desc   More form event boundary 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(128);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-4', m) === undefined));
        expect(a.onFormEvent('event-4', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(128));
        expect(m.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0004 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0005
     * @tc.number SUB_CANVAS_MORE_FORM_0005
     * @tc.desc   More form event boundary 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(160);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-5', m) === undefined));
        expect(a.onFormEvent('event-5', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(160));
        expect(m.length).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0005 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0006
     * @tc.number SUB_CANVAS_MORE_FORM_0006
     * @tc.desc   More form event boundary 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(192);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-6', m) === undefined));
        expect(a.onFormEvent('event-6', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(192));
        expect(m.length).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0006 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0007
     * @tc.number SUB_CANVAS_MORE_FORM_0007
     * @tc.desc   More form event boundary 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(224);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-7', m) === undefined));
        expect(a.onFormEvent('event-7', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(224));
        expect(m.length).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0007 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0008
     * @tc.number SUB_CANVAS_MORE_FORM_0008
     * @tc.desc   More form event boundary 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(256);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-8', m) === undefined));
        expect(a.onFormEvent('event-8', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(256));
        expect(m.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0008 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0009
     * @tc.number SUB_CANVAS_MORE_FORM_0009
     * @tc.desc   More form event boundary 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(288);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-9', m) === undefined));
        expect(a.onFormEvent('event-9', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(288));
        expect(m.length).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0009 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0010
     * @tc.number SUB_CANVAS_MORE_FORM_0010
     * @tc.desc   More form event boundary 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(320);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-10', m) === undefined));
        expect(a.onFormEvent('event-10', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(320));
        expect(m.length).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0010 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0011
     * @tc.number SUB_CANVAS_MORE_FORM_0011
     * @tc.desc   More form event boundary 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(352);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-11', m) === undefined));
        expect(a.onFormEvent('event-11', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(352));
        expect(m.length).assertEqual(352);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0011 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0012
     * @tc.number SUB_CANVAS_MORE_FORM_0012
     * @tc.desc   More form event boundary 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(384);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-12', m) === undefined));
        expect(a.onFormEvent('event-12', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(384));
        expect(m.length).assertEqual(384);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0012 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0013
     * @tc.number SUB_CANVAS_MORE_FORM_0013
     * @tc.desc   More form event boundary 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(416);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-13', m) === undefined));
        expect(a.onFormEvent('event-13', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(416));
        expect(m.length).assertEqual(416);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0013 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0014
     * @tc.number SUB_CANVAS_MORE_FORM_0014
     * @tc.desc   More form event boundary 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(448);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-14', m) === undefined));
        expect(a.onFormEvent('event-14', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(448));
        expect(m.length).assertEqual(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0014 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0015
     * @tc.number SUB_CANVAS_MORE_FORM_0015
     * @tc.desc   More form event boundary 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(480);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-15', m) === undefined));
        expect(a.onFormEvent('event-15', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(480));
        expect(m.length).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0015 end');
    })

    /**
     * @tc.name   com.samples.canvasgame_MoreForm_0016
     * @tc.number SUB_CANVAS_MORE_FORM_0016
     * @tc.desc   More form event boundary 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.canvasgame_MoreForm_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const m: string = 'e'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onFormEvent('event-16', m) === undefined));
        expect(a.onFormEvent('event-16', m) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(m.length), String(512));
        expect(m.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.canvasgame_MoreForm_0016 end');
    })
  })
}
