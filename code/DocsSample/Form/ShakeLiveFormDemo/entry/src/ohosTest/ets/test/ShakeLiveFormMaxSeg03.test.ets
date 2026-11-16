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

export default function shakeLiveFormMaxSeg03Test() {
  describe('ShakeLiveFormMaxSeg03Test', () => {

    /**
     * @tc.name   testShakeMaxSeg030001
     * @tc.number SUB_SHAKE_MAX_SEG_03_0001
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030001 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030002
     * @tc.number SUB_SHAKE_MAX_SEG_03_0002
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030002 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030003
     * @tc.number SUB_SHAKE_MAX_SEG_03_0003
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030003 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030004
     * @tc.number SUB_SHAKE_MAX_SEG_03_0004
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030004 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030005
     * @tc.number SUB_SHAKE_MAX_SEG_03_0005
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030005 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030006
     * @tc.number SUB_SHAKE_MAX_SEG_03_0006
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030006 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030007
     * @tc.number SUB_SHAKE_MAX_SEG_03_0007
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030007 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030008
     * @tc.number SUB_SHAKE_MAX_SEG_03_0008
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030008 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030009
     * @tc.number SUB_SHAKE_MAX_SEG_03_0009
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030009 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030010
     * @tc.number SUB_SHAKE_MAX_SEG_03_0010
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030010 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030011
     * @tc.number SUB_SHAKE_MAX_SEG_03_0011
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030011 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030012
     * @tc.number SUB_SHAKE_MAX_SEG_03_0012
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030012 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030013
     * @tc.number SUB_SHAKE_MAX_SEG_03_0013
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030013 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030014
     * @tc.number SUB_SHAKE_MAX_SEG_03_0014
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030014 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030015
     * @tc.number SUB_SHAKE_MAX_SEG_03_0015
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030015 end');
    })

    /**
     * @tc.name   testShakeMaxSeg030016
     * @tc.number SUB_SHAKE_MAX_SEG_03_0016
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === b));
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg030016 end');
    })
  })
}
