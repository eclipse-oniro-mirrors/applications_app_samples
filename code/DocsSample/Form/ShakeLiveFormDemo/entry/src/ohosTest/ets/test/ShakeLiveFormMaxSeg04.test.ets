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

export default function shakeLiveFormMaxSeg04Test() {
  describe('ShakeLiveFormMaxSeg04Test', () => {

    /**
     * @tc.name   testShakeMaxSeg040001
     * @tc.number SUB_SHAKE_MAX_SEG_04_0001
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040001 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040002
     * @tc.number SUB_SHAKE_MAX_SEG_04_0002
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040002 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040003
     * @tc.number SUB_SHAKE_MAX_SEG_04_0003
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040003 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040004
     * @tc.number SUB_SHAKE_MAX_SEG_04_0004
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040004 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040005
     * @tc.number SUB_SHAKE_MAX_SEG_04_0005
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040005 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040006
     * @tc.number SUB_SHAKE_MAX_SEG_04_0006
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040006 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040007
     * @tc.number SUB_SHAKE_MAX_SEG_04_0007
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040007 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040008
     * @tc.number SUB_SHAKE_MAX_SEG_04_0008
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040008 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040009
     * @tc.number SUB_SHAKE_MAX_SEG_04_0009
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040009 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040010
     * @tc.number SUB_SHAKE_MAX_SEG_04_0010
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040010 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040011
     * @tc.number SUB_SHAKE_MAX_SEG_04_0011
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040011 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040012
     * @tc.number SUB_SHAKE_MAX_SEG_04_0012
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040012 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040013
     * @tc.number SUB_SHAKE_MAX_SEG_04_0013
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040013 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040014
     * @tc.number SUB_SHAKE_MAX_SEG_04_0014
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040014 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040015
     * @tc.number SUB_SHAKE_MAX_SEG_04_0015
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040015 end');
    })

    /**
     * @tc.name   testShakeMaxSeg040016
     * @tc.number SUB_SHAKE_MAX_SEG_04_0016
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg040016 end');
    })
  })
}
