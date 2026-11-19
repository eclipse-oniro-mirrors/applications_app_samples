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
import { ConfirmParams, AlertParams, SelectParams, TipsParams, LoadingParams, CustomParams, buildSheetInfos } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogParamsGridMatrixPart1Test(): void {
  describe('DialogParamsGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0100
     * @tc.name      testParamsDefault0001
     * @tc.desc      Verify ConfirmParams defaults and isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0001 begin');
      await delayTick();
      const p = new ConfirmParams();
      expect(p.sceneId).assertEqual(1);
      expect(p.title).assertEqual("");
      expect(p.content).assertEqual("");
      expect(p.checkTips).assertEqual("");
      expect(p === new ConfirmParams()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0200
     * @tc.name      testParamsDefault0002
     * @tc.desc      Verify AlertParams defaults and isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsDefault0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0002 begin');
      await delayTick();
      const p = new AlertParams();
      expect(p.sceneId).assertEqual(2);
      expect(p.primaryTitle).assertEqual("");
      expect(p.secondaryTitle).assertEqual("");
      expect(p.content).assertEqual("");
      expect(p === new AlertParams()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0300
     * @tc.name      testParamsDefault0003
     * @tc.desc      Verify SelectParams defaults and isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsDefault0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0003 begin');
      await delayTick();
      const p = new SelectParams();
      expect(p.sceneId).assertEqual(3);
      expect(p.title).assertEqual("");
      expect(p.content).assertEqual("");
      expect(p.selectedIndex).assertEqual(0);
      expect(p.radioContent.length).assertEqual(0);
      expect(p === new SelectParams()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0400
     * @tc.name      testParamsDefault0004
     * @tc.desc      Verify TipsParams defaults and isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsDefault0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0004 begin');
      await delayTick();
      const p = new TipsParams();
      expect(p.sceneId).assertEqual(4);
      expect(p.title).assertEqual("");
      expect(p.content).assertEqual("");
      expect(p.checkTips).assertEqual("");
      expect(p === new TipsParams()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0500
     * @tc.name      testParamsDefault0005
     * @tc.desc      Verify LoadingParams defaults and isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsDefault0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0005 begin');
      await delayTick();
      const p = new LoadingParams();
      expect(p.sceneId).assertEqual(5);
      expect(p.content).assertEqual("");
      expect(p === new LoadingParams()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0600
     * @tc.name      testParamsDefault0006
     * @tc.desc      Verify CustomParams defaults and isolation.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsDefault0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0006 begin');
      await delayTick();
      const p = new CustomParams();
      expect(p.sceneId).assertEqual(6);
      expect(p.primaryTitle).assertEqual("");
      expect(p.secondaryTitle).assertEqual("");
      expect(p.buttons.length).assertEqual(0);
      expect(p === new CustomParams()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsDefault0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0700
     * @tc.name      testConfirmField0007
     * @tc.desc      Verify ConfirmParams.title setter.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfirmField0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfirmField0007 begin');
      await delayTick();
      const p = new ConfirmParams();
      p.title = 'hello';
      expect(p.title).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfirmField0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0800
     * @tc.name      testConfirmField0008
     * @tc.desc      Verify ConfirmParams.content setter.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfirmField0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfirmField0008 begin');
      await delayTick();
      const p = new ConfirmParams();
      p.content = 'body';
      expect(p.content).assertEqual('body');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfirmField0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_0900
     * @tc.name      testConfirmField0009
     * @tc.desc      Verify ConfirmParams.checkTips setter.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testConfirmField0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfirmField0009 begin');
      await delayTick();
      const p = new ConfirmParams();
      p.checkTips = 'tip';
      expect(p.checkTips).assertEqual('tip');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConfirmField0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPGP1_1000
     * @tc.name      testSelectFields0010
     * @tc.desc      Verify SelectParams radio content assignment.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectFields0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectFields0010 begin');
      await delayTick();
      const p = new SelectParams();
      p.selectedIndex = 3;
      p.radioContent = buildSheetInfos(["A", "B"], (index: number) => {});
      expect(p.selectedIndex).assertEqual(3);
      expect(p.radioContent.length).assertEqual(2);
      expect(p.radioContent[1].title).assertEqual("B");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectFields0010 end');
    })

  })
}
