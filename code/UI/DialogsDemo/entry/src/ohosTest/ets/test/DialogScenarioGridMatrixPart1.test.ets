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
import { ScenarioInfo, listScenarios, getScenario } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogScenarioGridMatrixPart1Test(): void {
  describe('DialogScenarioGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0100
     * @tc.name      testScenarioGrid0001
     * @tc.desc      Verify scenario 1 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0001 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(1);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(1);
        expect(info.title).assertEqual('Confirm dialog');
        expect(info.api).assertEqual('ConfirmDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0200
     * @tc.name      testScenarioGrid0002
     * @tc.desc      Verify scenario 2 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0002 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(2);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(2);
        expect(info.title).assertEqual('Alert detail dialog');
        expect(info.api).assertEqual('AlertDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0300
     * @tc.name      testScenarioGrid0003
     * @tc.desc      Verify scenario 3 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0003 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(3);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(3);
        expect(info.title).assertEqual('Single-select dialog');
        expect(info.api).assertEqual('SelectDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0400
     * @tc.name      testScenarioGrid0004
     * @tc.desc      Verify scenario 4 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0004 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(4);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(4);
        expect(info.title).assertEqual('Tips dialog');
        expect(info.api).assertEqual('TipsDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0500
     * @tc.name      testScenarioGrid0005
     * @tc.desc      Verify scenario 5 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0005 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(5);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(5);
        expect(info.title).assertEqual('Loading dialog');
        expect(info.api).assertEqual('LoadingDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0600
     * @tc.name      testScenarioGrid0006
     * @tc.desc      Verify scenario 6 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0006 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(6);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(6);
        expect(info.title).assertEqual('Custom content dialog');
        expect(info.api).assertEqual('CustomContentDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0700
     * @tc.name      testScenarioGrid0007
     * @tc.desc      Verify scenario 7 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0007 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(7);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(7);
        expect(info.title).assertEqual('Popover dialog');
        expect(info.api).assertEqual('PopoverDialogV2');
        expect(info.group).assertEqual('DialogV2');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0800
     * @tc.name      testScenarioGrid0008
     * @tc.desc      Verify scenario 8 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0008 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(8);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(8);
        expect(info.title).assertEqual('Interstitial dialog');
        expect(info.api).assertEqual('InterstitialDialogAction');
        expect(info.group).assertEqual('Interstitial');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_0900
     * @tc.name      testScenarioGrid0009
     * @tc.desc      Verify scenario 9 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0009 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(9);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(9);
        expect(info.title).assertEqual('Action sheet');
        expect(info.api).assertEqual('showActionSheet');
        expect(info.group).assertEqual('SystemPrompt');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1000
     * @tc.name      testScenarioGrid0010
     * @tc.desc      Verify scenario 10 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0010 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(10);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(10);
        expect(info.title).assertEqual('Date picker dialog');
        expect(info.api).assertEqual('showDatePickerDialog');
        expect(info.group).assertEqual('SystemPicker');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1100
     * @tc.name      testScenarioGrid0011
     * @tc.desc      Verify scenario 11 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0011 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(11);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(11);
        expect(info.title).assertEqual('Time picker dialog');
        expect(info.api).assertEqual('showTimePickerDialog');
        expect(info.group).assertEqual('SystemPicker');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1200
     * @tc.name      testScenarioGrid0012
     * @tc.desc      Verify scenario 12 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0012 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(12);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(12);
        expect(info.title).assertEqual('Text picker dialog');
        expect(info.api).assertEqual('showTextPickerDialog');
        expect(info.group).assertEqual('SystemPicker');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1300
     * @tc.name      testScenarioGrid0013
     * @tc.desc      Verify scenario 13 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0013 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(13);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(13);
        expect(info.title).assertEqual('Toast');
        expect(info.api).assertEqual('openToast');
        expect(info.group).assertEqual('SystemPrompt');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1400
     * @tc.name      testScenarioGrid0014
     * @tc.desc      Verify scenario 14 metadata.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGrid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0014 begin');
      await delayTick();
      const info: ScenarioInfo | null = getScenario(14);
      expect(info !== null).assertTrue();
      if (info !== null) {
        expect(info.id).assertEqual(14);
        expect(info.title).assertEqual('System button dialog');
        expect(info.api).assertEqual('showDialog');
        expect(info.group).assertEqual('SystemPrompt');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGrid0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1500
     * @tc.name      testScenarioMissing0015
     * @tc.desc      Verify getScenario(-100) is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioMissing0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0015 begin');
      await delayTick();
      expect(getScenario(-100) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1600
     * @tc.name      testScenarioMissing0016
     * @tc.desc      Verify getScenario(-1) is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioMissing0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0016 begin');
      await delayTick();
      expect(getScenario(-1) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1700
     * @tc.name      testScenarioMissing0017
     * @tc.desc      Verify getScenario(0) is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioMissing0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0017 begin');
      await delayTick();
      expect(getScenario(0) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1800
     * @tc.name      testScenarioMissing0018
     * @tc.desc      Verify getScenario(15) is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioMissing0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0018 begin');
      await delayTick();
      expect(getScenario(15) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_1900
     * @tc.name      testScenarioMissing0019
     * @tc.desc      Verify getScenario(99) is null.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioMissing0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0019 begin');
      await delayTick();
      expect(getScenario(99) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioMissing0019 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_2000
     * @tc.name      testScenarioAll0020
     * @tc.desc      Verify listScenarios returns 14 items in id order.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioAll0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioAll0020 begin');
      await delayTick();
      const all: ScenarioInfo[] = listScenarios();
      expect(all.length).assertEqual(14);
      expect(all.map((item: ScenarioInfo) => item.id).join(',')).assertEqual('1,2,3,4,5,6,7,8,9,10,11,12,13,14');
      expect(all[0].api).assertEqual('ConfirmDialogV2');
      expect(all[13].group).assertEqual('SystemPrompt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioAll0020 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SCNP1_2100
     * @tc.name      testScenarioGroups0021
     * @tc.desc      Verify scenario groups are from the documented set.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testScenarioGroups0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGroups0021 begin');
      await delayTick();
      const groups: string[] = listScenarios().map((item: ScenarioInfo) => item.group);
      expect(groups.includes('DialogV2')).assertTrue();
      expect(groups.includes('Interstitial')).assertTrue();
      expect(groups.includes('SystemPrompt')).assertTrue();
      expect(groups.includes('SystemPicker')).assertTrue();
      expect(groups.includes('Unknown')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testScenarioGroups0021 end');
    })

  })
}
