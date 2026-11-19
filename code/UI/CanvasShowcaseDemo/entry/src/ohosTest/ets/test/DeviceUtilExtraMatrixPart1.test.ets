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
import { delayTick } from './shared/AsyncYield';
import { DeviceUtil } from '../../../main/ets/model/utils/DeviceUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function DeviceUtilExtraMatrixPart1Test(): void {
  describe('DeviceUtilExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0100
     * @tc.name      testBreakpoint0001
     * @tc.desc      Verify breakpoint for width -100 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0001 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(-100)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(-100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0200
     * @tc.name      testBreakpoint0002
     * @tc.desc      Verify breakpoint for width -1 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0002 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(-1)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(-1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0300
     * @tc.name      testBreakpoint0003
     * @tc.desc      Verify breakpoint for width 0 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0003 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(0)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(0)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0400
     * @tc.name      testBreakpoint0004
     * @tc.desc      Verify breakpoint for width 1 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0004 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(1)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(1)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0500
     * @tc.name      testBreakpoint0005
     * @tc.desc      Verify breakpoint for width 320 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0005 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(320)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(320)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0600
     * @tc.name      testBreakpoint0006
     * @tc.desc      Verify breakpoint for width 599 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0006 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(599)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(599)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0700
     * @tc.name      testBreakpoint0007
     * @tc.desc      Verify breakpoint for width 599.9 is sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0007 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(599.9)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(599.9)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0800
     * @tc.name      testBreakpoint0008
     * @tc.desc      Verify breakpoint for width 600 is md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0008 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(600)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(600)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_0900
     * @tc.name      testBreakpoint0009
     * @tc.desc      Verify breakpoint for width 600.1 is md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0009 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(600.1)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(600.1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_1000
     * @tc.name      testBreakpoint0010
     * @tc.desc      Verify breakpoint for width 839 is md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0010 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(839)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(839)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_1100
     * @tc.name      testBreakpoint0011
     * @tc.desc      Verify breakpoint for width 839.9 is md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0011 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(839.9)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(839.9)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_1200
     * @tc.name      testBreakpoint0012
     * @tc.desc      Verify breakpoint for width 840 is lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0012 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(840)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(840)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_1300
     * @tc.name      testBreakpoint0013
     * @tc.desc      Verify breakpoint for width 840.1 is lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0013 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(840.1)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(840.1)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_1400
     * @tc.name      testBreakpoint0014
     * @tc.desc      Verify breakpoint for width 1024 is lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0014 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(1024)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(1024)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DEXP1_1500
     * @tc.name      testBreakpoint0015
     * @tc.desc      Verify breakpoint for width 2560 is lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBreakpoint0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0015 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(2560)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(2560)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBreakpoint0015 end');
    })

  })
}
