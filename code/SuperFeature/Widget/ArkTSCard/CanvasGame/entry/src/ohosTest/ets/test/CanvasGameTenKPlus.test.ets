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

export default function canvasGameTenKPlusTest() {
  describe('CanvasGameTenKPlusTest', () => {

    /**
     * @tc.name   testCanvasTenKPlus0001
     * @tc.number SUB_CANVAS_10K_PLUS_0001
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(256);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(256));
        expect(id.length).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0001 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0002
     * @tc.number SUB_CANVAS_10K_PLUS_0002
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(512));
        expect(id.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0002 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0003
     * @tc.number SUB_CANVAS_10K_PLUS_0003
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(768);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(768));
        expect(id.length).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0003 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0004
     * @tc.number SUB_CANVAS_10K_PLUS_0004
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(1024);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1024));
        expect(id.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0004 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0005
     * @tc.number SUB_CANVAS_10K_PLUS_0005
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0005 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(1280);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1280));
        expect(id.length).assertEqual(1280);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0005 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0006
     * @tc.number SUB_CANVAS_10K_PLUS_0006
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0006 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(1536);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1536));
        expect(id.length).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0006 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0007
     * @tc.number SUB_CANVAS_10K_PLUS_0007
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0007 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(1792);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1792));
        expect(id.length).assertEqual(1792);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0007 end');
    })

    /**
     * @tc.name   testCanvasTenKPlus0008
     * @tc.number SUB_CANVAS_10K_PLUS_0008
     * @tc.desc   Final CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasTenKPlus0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0008 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'p'.repeat(2048);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onUpdateForm(id) === undefined));
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2048));
        expect(id.length).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasTenKPlus0008 end');
    })
  })
}
