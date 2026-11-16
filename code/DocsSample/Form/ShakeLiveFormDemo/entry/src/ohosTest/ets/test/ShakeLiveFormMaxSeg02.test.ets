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
import { SegmentationUtil } from '../../../main/ets/common/SegmentationUtil';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function shakeLiveFormMaxSeg02Test() {
  describe('ShakeLiveFormMaxSeg02Test', () => {

    /**
     * @tc.name   testShakeMaxSeg020001
     * @tc.number SUB_SHAKE_MAX_SEG_02_0001
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020001 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020002
     * @tc.number SUB_SHAKE_MAX_SEG_02_0002
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020002 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020003
     * @tc.number SUB_SHAKE_MAX_SEG_02_0003
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020003 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020004
     * @tc.number SUB_SHAKE_MAX_SEG_02_0004
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020004 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020005
     * @tc.number SUB_SHAKE_MAX_SEG_02_0005
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020005 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020006
     * @tc.number SUB_SHAKE_MAX_SEG_02_0006
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020006 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020007
     * @tc.number SUB_SHAKE_MAX_SEG_02_0007
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020007 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020008
     * @tc.number SUB_SHAKE_MAX_SEG_02_0008
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020008 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020009
     * @tc.number SUB_SHAKE_MAX_SEG_02_0009
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020009 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020010
     * @tc.number SUB_SHAKE_MAX_SEG_02_0010
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020010 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020011
     * @tc.number SUB_SHAKE_MAX_SEG_02_0011
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020011 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020012
     * @tc.number SUB_SHAKE_MAX_SEG_02_0012
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020012 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020013
     * @tc.number SUB_SHAKE_MAX_SEG_02_0013
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020013 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020014
     * @tc.number SUB_SHAKE_MAX_SEG_02_0014
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020014 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020015
     * @tc.number SUB_SHAKE_MAX_SEG_02_0015
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020015 end');
    })

    /**
     * @tc.name   testShakeMaxSeg020016
     * @tc.number SUB_SHAKE_MAX_SEG_02_0016
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg020016 end');
    })
  })
}
