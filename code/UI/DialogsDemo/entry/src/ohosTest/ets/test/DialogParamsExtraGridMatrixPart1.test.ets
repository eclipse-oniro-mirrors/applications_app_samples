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
import { ConfirmParams, AlertParams, SelectParams, TipsParams, LoadingParams, CustomParams, buildPrimaryButton } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogParamsExtraGridMatrixPart1Test(): void {
  describe('DialogParamsExtraGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0100
     * @tc.name      testParamsSetter0001
     * @tc.desc      Verify ConfirmParams title.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0001 begin');
      await delayTick();
      const p = new ConfirmParams();
      p.title = 'title-a';
      expect(p.title).assertEqual('title-a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0200
     * @tc.name      testParamsSetter0002
     * @tc.desc      Verify TipsParams title.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0002 begin');
      await delayTick();
      const p = new TipsParams();
      p.title = 'title-a';
      expect(p.title).assertEqual('title-a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0300
     * @tc.name      testParamsSetter0003
     * @tc.desc      Verify ConfirmParams content.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0003 begin');
      await delayTick();
      const p = new ConfirmParams();
      p.content = 'content-b';
      expect(p.content).assertEqual('content-b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0400
     * @tc.name      testParamsSetter0004
     * @tc.desc      Verify TipsParams content.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0004 begin');
      await delayTick();
      const p = new TipsParams();
      p.content = 'content-b';
      expect(p.content).assertEqual('content-b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0500
     * @tc.name      testParamsSetter0005
     * @tc.desc      Verify ConfirmParams checkTips.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0005 begin');
      await delayTick();
      const p = new ConfirmParams();
      p.checkTips = 'tip-c';
      expect(p.checkTips).assertEqual('tip-c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0600
     * @tc.name      testParamsSetter0006
     * @tc.desc      Verify TipsParams checkTips.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0006 begin');
      await delayTick();
      const p = new TipsParams();
      p.checkTips = 'tip-c';
      expect(p.checkTips).assertEqual('tip-c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0700
     * @tc.name      testParamsSetter0007
     * @tc.desc      Verify AlertParams primaryTitle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0007 begin');
      await delayTick();
      const p = new AlertParams();
      p.primaryTitle = 'primary';
      expect(p.primaryTitle).assertEqual('primary');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0800
     * @tc.name      testParamsSetter0008
     * @tc.desc      Verify AlertParams secondaryTitle.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0008 begin');
      await delayTick();
      const p = new AlertParams();
      p.secondaryTitle = 'secondary';
      expect(p.secondaryTitle).assertEqual('secondary');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_0900
     * @tc.name      testParamsSetter0009
     * @tc.desc      Verify AlertParams content.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testParamsSetter0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0009 begin');
      await delayTick();
      const p = new AlertParams();
      p.content = 'content';
      expect(p.content).assertEqual('content');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamsSetter0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1000
     * @tc.name      testCustomButtons0010
     * @tc.desc      Verify CustomParams buttons length 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCustomButtons0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomButtons0010 begin');
      await delayTick();
      const p = new CustomParams();
      p.buttons = [buildPrimaryButton('button-1')];
      expect(p.buttons.length).assertEqual(1);
      expect(p.buttons[0].content).assertEqual('button-1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomButtons0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1100
     * @tc.name      testCustomButtons0011
     * @tc.desc      Verify CustomParams buttons length 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCustomButtons0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomButtons0011 begin');
      await delayTick();
      const p = new CustomParams();
      p.buttons = [buildPrimaryButton('button-2')];
      expect(p.buttons.length).assertEqual(1);
      expect(p.buttons[0].content).assertEqual('button-2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomButtons0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1200
     * @tc.name      testCustomButtons0012
     * @tc.desc      Verify CustomParams buttons length 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCustomButtons0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomButtons0012 begin');
      await delayTick();
      const p = new CustomParams();
      p.buttons = [buildPrimaryButton('button-3')];
      expect(p.buttons.length).assertEqual(1);
      expect(p.buttons[0].content).assertEqual('button-3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomButtons0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1300
     * @tc.name      testSelectIndex0013
     * @tc.desc      Verify SelectParams selectedIndex 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectIndex0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0013 begin');
      await delayTick();
      const p = new SelectParams();
      p.selectedIndex = 1;
      expect(p.selectedIndex).assertEqual(1);
      expect(p.sceneId).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1400
     * @tc.name      testSelectIndex0014
     * @tc.desc      Verify SelectParams selectedIndex 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectIndex0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0014 begin');
      await delayTick();
      const p = new SelectParams();
      p.selectedIndex = 2;
      expect(p.selectedIndex).assertEqual(2);
      expect(p.sceneId).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1500
     * @tc.name      testSelectIndex0015
     * @tc.desc      Verify SelectParams selectedIndex 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectIndex0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0015 begin');
      await delayTick();
      const p = new SelectParams();
      p.selectedIndex = 5;
      expect(p.selectedIndex).assertEqual(5);
      expect(p.sceneId).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DPXP1_1600
     * @tc.name      testSelectIndex0016
     * @tc.desc      Verify SelectParams selectedIndex 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSelectIndex0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0016 begin');
      await delayTick();
      const p = new SelectParams();
      p.selectedIndex = 10;
      expect(p.selectedIndex).assertEqual(10);
      expect(p.sceneId).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSelectIndex0016 end');
    })

  })
}
