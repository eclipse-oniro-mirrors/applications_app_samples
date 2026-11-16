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
import { Constants } from '../../../main/ets/common/Constants';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function shakeLiveFormBoundaryTypesTest() {
  describe('ShakeLiveFormBoundaryTypesTest', () => {

    /**
     * @tc.name   testShakeBoundary0001
     * @tc.number SUB_SHAKE_BOUNDARY_0001
     * @tc.desc   Verify a.onRemoveForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0001 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'x'.repeat(512);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm(id) === undefined));
        expect(a.onRemoveForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(512));
        expect(id.length).assertEqual(512);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0001 end');
    })

    /**
     * @tc.name   testShakeBoundary0002
     * @tc.number SUB_SHAKE_BOUNDARY_0002
     * @tc.desc   Verify a.onRemoveForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'x'.repeat(1024);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm(id) === undefined));
        expect(a.onRemoveForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1024));
        expect(id.length).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0002 end');
    })

    /**
     * @tc.name   testShakeBoundary0003
     * @tc.number SUB_SHAKE_BOUNDARY_0003
     * @tc.desc   Verify a.onRemoveForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'x'.repeat(1536);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm(id) === undefined));
        expect(a.onRemoveForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(1536));
        expect(id.length).assertEqual(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0003 end');
    })

    /**
     * @tc.name   testShakeBoundary0004
     * @tc.number SUB_SHAKE_BOUNDARY_0004
     * @tc.desc   Verify a.onRemoveForm(id) is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0004 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        const id: string = 'x'.repeat(2048);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a.onRemoveForm(id) === undefined));
        expect(a.onRemoveForm(id) === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(id.length), String(2048));
        expect(id.length).assertEqual(2048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0004 end');
    })

    /**
     * @tc.name   testShakeBoundary0005
     * @tc.number SUB_SHAKE_BOUNDARY_0005
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * width equals -25.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0005 begin');
      const width: number = 250;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * width), String(-25.0));
        expect(-Constants.OVERFLOW_LEFT_RATIO * width).assertEqual(-25.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * width), String(300.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * width).assertEqual(300.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0005 end');
    })

    /**
     * @tc.name   testShakeBoundary0006
     * @tc.number SUB_SHAKE_BOUNDARY_0006
     * @tc.desc   Verify Math.abs(left - (-30)) < 0.000001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0006 begin');
      const width: number = 300;
      const left: number = -Constants.OVERFLOW_LEFT_RATIO * width;
      const scaled: number = Constants.OVERFLOW_WIDTH_RATIO * width;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Math.abs(left - (-30)) < 0.000001));
      expect(Math.abs(left - (-30)) < 0.000001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Math.abs(scaled - 360) < 0.000001));
      expect(Math.abs(scaled - 360) < 0.000001).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0006 end');
    })

    /**
     * @tc.name   testShakeBoundary0007
     * @tc.number SUB_SHAKE_BOUNDARY_0007
     * @tc.desc   Verify -Constants.OVERFLOW_LEFT_RATIO * width equals -35.0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0007 begin');
      const width: number = 350;
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(-Constants.OVERFLOW_LEFT_RATIO * width), String(-35.0));
        expect(-Constants.OVERFLOW_LEFT_RATIO * width).assertEqual(-35.0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO * width), String(420.0));
        expect(Constants.OVERFLOW_WIDTH_RATIO * width).assertEqual(420.0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0007 end');
    })

    /**
     * @tc.name   testShakeBoundary0008
     * @tc.number SUB_SHAKE_BOUNDARY_0008
     * @tc.desc   Verify Constants.OVERFLOW_DURATION equals 3500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_DURATION > 0));
        expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0008 end');
    })

    /**
     * @tc.name   testShakeBoundary0009
     * @tc.number SUB_SHAKE_BOUNDARY_0009
     * @tc.desc   Verify Constants.OVERFLOW_DURATION equals 3500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0009 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_DURATION > 0));
        expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0009 end');
    })

    /**
     * @tc.name   testShakeBoundary0010
     * @tc.number SUB_SHAKE_BOUNDARY_0010
     * @tc.desc   Verify Constants.OVERFLOW_DURATION equals 3500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeBoundary0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0010 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(3500));
      expect(Constants.OVERFLOW_DURATION).assertEqual(3500);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_DURATION > 0));
        expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeBoundary0010 end');
    })
  })
}
