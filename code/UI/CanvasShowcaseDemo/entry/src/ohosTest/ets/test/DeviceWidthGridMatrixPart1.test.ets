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

export default function DeviceWidthGridMatrixPart1Test(): void {
  describe('DeviceWidthGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0100
     * @tc.name      testWidthGrid0001
     * @tc.desc      Verify width 450 maps to sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0001 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(450)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(450)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0200
     * @tc.name      testWidthGrid0002
     * @tc.desc      Verify width 550 maps to sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0002 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(550)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(550)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0300
     * @tc.name      testWidthGrid0003
     * @tc.desc      Verify width 599.5 maps to sm.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0003 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(599.5)).assertEqual('sm');
      expect(DeviceUtil.preferTwoColumn(599.5)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0400
     * @tc.name      testWidthGrid0004
     * @tc.desc      Verify width 600.5 maps to md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0004 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(600.5)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(600.5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0500
     * @tc.name      testWidthGrid0005
     * @tc.desc      Verify width 650 maps to md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0005 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(650)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(650)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0600
     * @tc.name      testWidthGrid0006
     * @tc.desc      Verify width 700 maps to md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0006 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(700)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(700)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0700
     * @tc.name      testWidthGrid0007
     * @tc.desc      Verify width 799 maps to md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0007 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(799)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(799)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0800
     * @tc.name      testWidthGrid0008
     * @tc.desc      Verify width 839.5 maps to md.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0008 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(839.5)).assertEqual('md');
      expect(DeviceUtil.preferTwoColumn(839.5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_0900
     * @tc.name      testWidthGrid0009
     * @tc.desc      Verify width 840.5 maps to lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0009 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(840.5)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(840.5)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_1000
     * @tc.name      testWidthGrid0010
     * @tc.desc      Verify width 900 maps to lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0010 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(900)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(900)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_1100
     * @tc.name      testWidthGrid0011
     * @tc.desc      Verify width 1000 maps to lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0011 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(1000)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(1000)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_1200
     * @tc.name      testWidthGrid0012
     * @tc.desc      Verify width 1200 maps to lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0012 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(1200)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(1200)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_1300
     * @tc.name      testWidthGrid0013
     * @tc.desc      Verify width 1599 maps to lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0013 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(1599)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(1599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_DWGP1_1400
     * @tc.name      testWidthGrid0014
     * @tc.desc      Verify width 1920 maps to lg.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWidthGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0014 begin');
      await delayTick();
      expect(DeviceUtil.getBreakpoint(1920)).assertEqual('lg');
      expect(DeviceUtil.preferTwoColumn(1920)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWidthGrid0014 end');
    })

  })
}
