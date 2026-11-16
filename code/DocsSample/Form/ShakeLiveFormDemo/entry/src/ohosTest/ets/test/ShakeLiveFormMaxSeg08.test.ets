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

export default function shakeLiveFormMaxSeg08Test() {
  describe('ShakeLiveFormMaxSeg08Test', () => {

    /**
     * @tc.name   testShakeMaxSeg080001
     * @tc.number SUB_SHAKE_MAX_SEG_08_0001
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080001 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080002
     * @tc.number SUB_SHAKE_MAX_SEG_08_0002
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080002 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080003
     * @tc.number SUB_SHAKE_MAX_SEG_08_0003
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080003 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080004
     * @tc.number SUB_SHAKE_MAX_SEG_08_0004
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080004 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080005
     * @tc.number SUB_SHAKE_MAX_SEG_08_0005
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080005 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080006
     * @tc.number SUB_SHAKE_MAX_SEG_08_0006
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080006 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080007
     * @tc.number SUB_SHAKE_MAX_SEG_08_0007
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080007 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080008
     * @tc.number SUB_SHAKE_MAX_SEG_08_0008
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080008 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080009
     * @tc.number SUB_SHAKE_MAX_SEG_08_0009
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080009 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080010
     * @tc.number SUB_SHAKE_MAX_SEG_08_0010
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080010 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080011
     * @tc.number SUB_SHAKE_MAX_SEG_08_0011
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080011 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080012
     * @tc.number SUB_SHAKE_MAX_SEG_08_0012
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080012 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080013
     * @tc.number SUB_SHAKE_MAX_SEG_08_0013
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080013 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080014
     * @tc.number SUB_SHAKE_MAX_SEG_08_0014
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080014 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080015
     * @tc.number SUB_SHAKE_MAX_SEG_08_0015
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080015 end');
    })

    /**
     * @tc.name   testShakeMaxSeg080016
     * @tc.number SUB_SHAKE_MAX_SEG_08_0016
     * @tc.desc   Verify a === b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxSeg080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMaxSeg080016 end');
    })
  })
}
