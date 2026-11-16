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
import logger from '../../../main/ets/model/Logger';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function canvasGameBoundaryTypesTest() {
  describe('CanvasGameBoundaryTypesTest', () => {

    /**
     * @tc.name   testCanvasBoundary0001
     * @tc.number SUB_CANVAS_BOUNDARY_0001
     * @tc.desc   Boundary type sample 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'g'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(512);');
        expect(id.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0001 end');
    })

    /**
     * @tc.name   testCanvasBoundary0002
     * @tc.number SUB_CANVAS_BOUNDARY_0002
     * @tc.desc   Boundary type sample 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'g'.repeat(1024);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1024);');
        expect(id.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0002 end');
    })

    /**
     * @tc.name   testCanvasBoundary0003
     * @tc.number SUB_CANVAS_BOUNDARY_0003
     * @tc.desc   Boundary type sample 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'g'.repeat(1536);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(1536);');
        expect(id.length).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0003 end');
    })

    /**
     * @tc.name   testCanvasBoundary0004
     * @tc.number SUB_CANVAS_BOUNDARY_0004
     * @tc.desc   Boundary type sample 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'g'.repeat(2048);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onUpdateForm(id) === undefined).assertTrue();');
        expect(a.onUpdateForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(id.length).assertEqual(2048);');
        expect(id.length).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0004 end');
    })

    /**
     * @tc.name   testCanvasBoundary0005
     * @tc.number SUB_CANVAS_BOUNDARY_0005
     * @tc.desc   Boundary type sample 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0005 begin');
      const msg: string = 'h'.repeat(1280);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(msg) === undefined).assertTrue();');
        expect(logger.info(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(1280);');
        expect(msg.length).assertEqual(1280);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0005 end');
    })

    /**
     * @tc.name   testCanvasBoundary0006
     * @tc.number SUB_CANVAS_BOUNDARY_0006
     * @tc.desc   Boundary type sample 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0006 begin');
      const msg: string = 'h'.repeat(1536);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(msg) === undefined).assertTrue();');
        expect(logger.info(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(1536);');
        expect(msg.length).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0006 end');
    })

    /**
     * @tc.name   testCanvasBoundary0007
     * @tc.number SUB_CANVAS_BOUNDARY_0007
     * @tc.desc   Boundary type sample 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0007 begin');
      const msg: string = 'h'.repeat(1792);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(msg) === undefined).assertTrue();');
        expect(logger.info(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(1792);');
        expect(msg.length).assertEqual(1792);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0007 end');
    })

    /**
     * @tc.name   testCanvasBoundary0008
     * @tc.number SUB_CANVAS_BOUNDARY_0008
     * @tc.desc   Boundary type sample 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0008 begin');
      const msg: string = 'h'.repeat(2048);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(logger.info(msg) === undefined).assertTrue();');
        expect(logger.info(msg) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(msg.length).assertEqual(2048);');
        expect(msg.length).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0008 end');
    })

    /**
     * @tc.name   testCanvasBoundary0009
     * @tc.number SUB_CANVAS_BOUNDARY_0009
     * @tc.desc   Boundary type sample 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0009 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 10; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
          expect(a.onAcquireFormState({}) >= 0).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0009 end');
    })

    /**
     * @tc.name   testCanvasBoundary0010
     * @tc.number SUB_CANVAS_BOUNDARY_0010
     * @tc.desc   Boundary type sample 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0010 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 10; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
          expect(a.onAcquireFormState({}) >= 0).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0010 end');
    })

    /**
     * @tc.name   testCanvasBoundary0011
     * @tc.number SUB_CANVAS_BOUNDARY_0011
     * @tc.desc   Boundary type sample 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0011 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 10; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
          expect(a.onAcquireFormState({}) >= 0).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0011 end');
    })

    /**
     * @tc.name   testCanvasBoundary0012
     * @tc.number SUB_CANVAS_BOUNDARY_0012
     * @tc.desc   Boundary type sample 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasBoundary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0012 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        for (let n: number = 0; n < 10; n++) {
          hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onAcquireFormState({}) >= 0).assertTrue();');
          expect(a.onAcquireFormState({}) >= 0).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCanvasBoundary0012 end');
    })
  })
}
