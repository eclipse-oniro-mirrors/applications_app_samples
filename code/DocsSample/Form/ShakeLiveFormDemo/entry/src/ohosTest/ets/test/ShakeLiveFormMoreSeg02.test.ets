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

export default function shakeLiveFormMoreSeg02Test() {
  describe('ShakeLiveFormMoreSeg02Test', () => {

    /**
     * @tc.name   testShakeMoreSeg020001
     * @tc.number SUB_SHAKE_MORE_SEG_02_0001
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020001 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020002
     * @tc.number SUB_SHAKE_MORE_SEG_02_0002
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020002 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020003
     * @tc.number SUB_SHAKE_MORE_SEG_02_0003
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020003 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020004
     * @tc.number SUB_SHAKE_MORE_SEG_02_0004
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020004 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020005
     * @tc.number SUB_SHAKE_MORE_SEG_02_0005
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020005 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020006
     * @tc.number SUB_SHAKE_MORE_SEG_02_0006
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020006 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020007
     * @tc.number SUB_SHAKE_MORE_SEG_02_0007
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020007 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020008
     * @tc.number SUB_SHAKE_MORE_SEG_02_0008
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020008 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020009
     * @tc.number SUB_SHAKE_MORE_SEG_02_0009
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020009 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020010
     * @tc.number SUB_SHAKE_MORE_SEG_02_0010
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020010 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020011
     * @tc.number SUB_SHAKE_MORE_SEG_02_0011
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020011 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020012
     * @tc.number SUB_SHAKE_MORE_SEG_02_0012
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020012 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020013
     * @tc.number SUB_SHAKE_MORE_SEG_02_0013
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020013 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020014
     * @tc.number SUB_SHAKE_MORE_SEG_02_0014
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020014 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020015
     * @tc.number SUB_SHAKE_MORE_SEG_02_0015
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020015 end');
    })

    /**
     * @tc.name   testShakeMoreSeg020016
     * @tc.number SUB_SHAKE_MORE_SEG_02_0016
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(a === SegmentationUtil.getInstance()));
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.SegmentationImage === 'function'));
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof a.loadImage === 'function'));
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg020016 end');
    })
  })
}
