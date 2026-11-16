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

export default function shakeLiveFormMoreSeg01Test() {
  describe('ShakeLiveFormMoreSeg01Test', () => {

    /**
     * @tc.name   testShakeMoreSeg010001
     * @tc.number SUB_SHAKE_MORE_SEG_01_0001
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010001 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010002
     * @tc.number SUB_SHAKE_MORE_SEG_01_0002
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010002 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010002 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010003
     * @tc.number SUB_SHAKE_MORE_SEG_01_0003
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010003 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010003 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010004
     * @tc.number SUB_SHAKE_MORE_SEG_01_0004
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010004 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010004 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010005
     * @tc.number SUB_SHAKE_MORE_SEG_01_0005
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010005 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010005 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010006
     * @tc.number SUB_SHAKE_MORE_SEG_01_0006
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010006 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010006 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010007
     * @tc.number SUB_SHAKE_MORE_SEG_01_0007
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010007 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010007 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010008
     * @tc.number SUB_SHAKE_MORE_SEG_01_0008
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010008 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010008 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010009
     * @tc.number SUB_SHAKE_MORE_SEG_01_0009
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010009 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010009 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010010
     * @tc.number SUB_SHAKE_MORE_SEG_01_0010
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010010 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010010 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010011
     * @tc.number SUB_SHAKE_MORE_SEG_01_0011
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010011 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010011 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010012
     * @tc.number SUB_SHAKE_MORE_SEG_01_0012
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010012 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010012 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010013
     * @tc.number SUB_SHAKE_MORE_SEG_01_0013
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010013 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010013 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010014
     * @tc.number SUB_SHAKE_MORE_SEG_01_0014
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010014 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010014 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010015
     * @tc.number SUB_SHAKE_MORE_SEG_01_0015
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010015 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010015 end');
    })

    /**
     * @tc.name   testShakeMoreSeg010016
     * @tc.number SUB_SHAKE_MORE_SEG_01_0016
     * @tc.desc   Verify a === SegmentationUtil.getInstance().
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreSeg010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010016 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === SegmentationUtil.getInstance()).assertTrue();');
        expect(a === SegmentationUtil.getInstance()).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.SegmentationImage === \'function\').assertTrue();');
        expect(typeof a.SegmentationImage === 'function').assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof a.loadImage === \'function\').assertTrue();');
        expect(typeof a.loadImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeMoreSeg010016 end');
    })
  })
}
