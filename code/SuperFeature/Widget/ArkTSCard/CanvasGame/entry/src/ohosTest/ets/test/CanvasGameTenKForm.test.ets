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

export default function canvasGameTenKFormTest() {
  describe('CanvasGameTenKFormTest', () => {

    /**
     * @tc.name   testCanvasTenKForm0001
     * @tc.number SUB_CANVAS_10K_FORM_0001
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(128);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(128);');
        expect(id.length).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0001 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0002
     * @tc.number SUB_CANVAS_10K_FORM_0002
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(256);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(256);');
        expect(id.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0002 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0003
     * @tc.number SUB_CANVAS_10K_FORM_0003
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(384);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(384);');
        expect(id.length).assertEqual(384);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0003 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0004
     * @tc.number SUB_CANVAS_10K_FORM_0004
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(512);');
        expect(id.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0004 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0005
     * @tc.number SUB_CANVAS_10K_FORM_0005
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(640);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(640);');
        expect(id.length).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0005 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0006
     * @tc.number SUB_CANVAS_10K_FORM_0006
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(768);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(768);');
        expect(id.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0006 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0007
     * @tc.number SUB_CANVAS_10K_FORM_0007
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(896);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(896);');
        expect(id.length).assertEqual(896);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0007 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0008
     * @tc.number SUB_CANVAS_10K_FORM_0008
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1024);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1024);');
        expect(id.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0008 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0009
     * @tc.number SUB_CANVAS_10K_FORM_0009
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1152);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1152);');
        expect(id.length).assertEqual(1152);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0009 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0010
     * @tc.number SUB_CANVAS_10K_FORM_0010
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1280);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1280);');
        expect(id.length).assertEqual(1280);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0010 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0011
     * @tc.number SUB_CANVAS_10K_FORM_0011
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1408);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1408);');
        expect(id.length).assertEqual(1408);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0011 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0012
     * @tc.number SUB_CANVAS_10K_FORM_0012
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1536);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1536);');
        expect(id.length).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0012 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0013
     * @tc.number SUB_CANVAS_10K_FORM_0013
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0013 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1664);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1664);');
        expect(id.length).assertEqual(1664);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0013 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0014
     * @tc.number SUB_CANVAS_10K_FORM_0014
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0014 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1792);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1792);');
        expect(id.length).assertEqual(1792);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0014 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0015
     * @tc.number SUB_CANVAS_10K_FORM_0015
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0015 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(1920);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1920);');
        expect(id.length).assertEqual(1920);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0015 end');
    })

    /**
     * @tc.name   testCanvasTenKForm0016
     * @tc.number SUB_CANVAS_10K_FORM_0016
     * @tc.desc   Verify a.onUpdateForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKForm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0016 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'k'.repeat(2048);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(2048);');
        expect(id.length).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKForm0016 end');
    })
  })
}
