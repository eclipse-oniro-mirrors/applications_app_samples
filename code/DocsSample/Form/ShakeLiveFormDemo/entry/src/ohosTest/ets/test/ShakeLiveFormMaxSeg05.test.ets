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

export default function shakeLiveFormMaxSeg05Test() {
  describe('ShakeLiveFormMaxSeg05Test', () => {

    /**
     * @tc.name   testShakeMaxSeg050001
     * @tc.number SUB_SHAKE_MAX_SEG_05_0001
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050001 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050002
     * @tc.number SUB_SHAKE_MAX_SEG_05_0002
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050002 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050003
     * @tc.number SUB_SHAKE_MAX_SEG_05_0003
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050003 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050004
     * @tc.number SUB_SHAKE_MAX_SEG_05_0004
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050004 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050005
     * @tc.number SUB_SHAKE_MAX_SEG_05_0005
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050005 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050006
     * @tc.number SUB_SHAKE_MAX_SEG_05_0006
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050006 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050007
     * @tc.number SUB_SHAKE_MAX_SEG_05_0007
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050007 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050008
     * @tc.number SUB_SHAKE_MAX_SEG_05_0008
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050008 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050009
     * @tc.number SUB_SHAKE_MAX_SEG_05_0009
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050009 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050010
     * @tc.number SUB_SHAKE_MAX_SEG_05_0010
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050010 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050011
     * @tc.number SUB_SHAKE_MAX_SEG_05_0011
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050011 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050012
     * @tc.number SUB_SHAKE_MAX_SEG_05_0012
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050012 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050013
     * @tc.number SUB_SHAKE_MAX_SEG_05_0013
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050013 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050014
     * @tc.number SUB_SHAKE_MAX_SEG_05_0014
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050014 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050015
     * @tc.number SUB_SHAKE_MAX_SEG_05_0015
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050015 end');
    })

    /**
     * @tc.name   testShakeMaxSeg050016
     * @tc.number SUB_SHAKE_MAX_SEG_05_0016
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg050016 end');
    })
  })
}
