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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { Constants } from '../../../main/ets/common/Constants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentReuse_ConstantsDataAdvanced]';

const EXPECTED_DESTINATION_IDS: string[] = [
  Constants.NAV_DESTINATION_ITEM_0,
  Constants.NAV_DESTINATION_ITEM_0_1,
  Constants.NAV_DESTINATION_ITEM_1,
  Constants.NAV_DESTINATION_ITEM_1_1,
  Constants.NAV_DESTINATION_ITEM_1_2,
  Constants.NAV_DESTINATION_ITEM_1_3,
  Constants.NAV_DESTINATION_ITEM_2,
  Constants.NAV_DESTINATION_ITEM_2_1,
  Constants.NAV_DESTINATION_ITEM_3,
  Constants.NAV_DESTINATION_ITEM_3_1
];

export default function constantsDataAdvancedTest() {
  describe('constantsDataAdvancedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0129
     * @tc.name      testConstantsData0129
     * @tc.desc      Verify constantsData behavior for matrix index 128.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0129 begin');
      const index: number = 128;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0129 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0130
     * @tc.name      testConstantsData0130
     * @tc.desc      Verify constantsData behavior for matrix index 129.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0130 begin');
      const index: number = 129;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0130 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0131
     * @tc.name      testConstantsData0131
     * @tc.desc      Verify constantsData behavior for matrix index 130.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0131 begin');
      const index: number = 130;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0131 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0132
     * @tc.name      testConstantsData0132
     * @tc.desc      Verify constantsData behavior for matrix index 131.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0132 begin');
      const index: number = 131;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0132 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0133
     * @tc.name      testConstantsData0133
     * @tc.desc      Verify constantsData behavior for matrix index 132.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0133 begin');
      const index: number = 132;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0133 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0134
     * @tc.name      testConstantsData0134
     * @tc.desc      Verify constantsData behavior for matrix index 133.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0134 begin');
      const index: number = 133;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0134 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0135
     * @tc.name      testConstantsData0135
     * @tc.desc      Verify constantsData behavior for matrix index 134.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0135 begin');
      const index: number = 134;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0135 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0136
     * @tc.name      testConstantsData0136
     * @tc.desc      Verify constantsData behavior for matrix index 135.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0136 begin');
      const index: number = 135;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0136 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0137
     * @tc.name      testConstantsData0137
     * @tc.desc      Verify constantsData behavior for matrix index 136.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0137 begin');
      const index: number = 136;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0137 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0138
     * @tc.name      testConstantsData0138
     * @tc.desc      Verify constantsData behavior for matrix index 137.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0138 begin');
      const index: number = 137;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0138 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0139
     * @tc.name      testConstantsData0139
     * @tc.desc      Verify constantsData behavior for matrix index 138.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0139 begin');
      const index: number = 138;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0139 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0140
     * @tc.name      testConstantsData0140
     * @tc.desc      Verify constantsData behavior for matrix index 139.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0140 begin');
      const index: number = 139;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0140 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0141
     * @tc.name      testConstantsData0141
     * @tc.desc      Verify constantsData behavior for matrix index 140.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0141 begin');
      const index: number = 140;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0141 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0142
     * @tc.name      testConstantsData0142
     * @tc.desc      Verify constantsData behavior for matrix index 141.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0142 begin');
      const index: number = 141;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0142 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0143
     * @tc.name      testConstantsData0143
     * @tc.desc      Verify constantsData behavior for matrix index 142.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0143 begin');
      const index: number = 142;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0143 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0144
     * @tc.name      testConstantsData0144
     * @tc.desc      Verify constantsData behavior for matrix index 143.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0144 begin');
      const index: number = 143;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0144 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0145
     * @tc.name      testConstantsData0145
     * @tc.desc      Verify constantsData behavior for matrix index 144.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0145 begin');
      const index: number = 144;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0145 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0146
     * @tc.name      testConstantsData0146
     * @tc.desc      Verify constantsData behavior for matrix index 145.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0146 begin');
      const index: number = 145;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0146 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0147
     * @tc.name      testConstantsData0147
     * @tc.desc      Verify constantsData behavior for matrix index 146.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0147 begin');
      const index: number = 146;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0147 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0148
     * @tc.name      testConstantsData0148
     * @tc.desc      Verify constantsData behavior for matrix index 147.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0148 begin');
      const index: number = 147;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0148 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0149
     * @tc.name      testConstantsData0149
     * @tc.desc      Verify constantsData behavior for matrix index 148.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0149 begin');
      const index: number = 148;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0149 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0150
     * @tc.name      testConstantsData0150
     * @tc.desc      Verify constantsData behavior for matrix index 149.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0150 begin');
      const index: number = 149;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0150 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0151
     * @tc.name      testConstantsData0151
     * @tc.desc      Verify constantsData behavior for matrix index 150.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0151 begin');
      const index: number = 150;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0151 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0152
     * @tc.name      testConstantsData0152
     * @tc.desc      Verify constantsData behavior for matrix index 151.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0152 begin');
      const index: number = 151;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0152 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0153
     * @tc.name      testConstantsData0153
     * @tc.desc      Verify constantsData behavior for matrix index 152.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0153 begin');
      const index: number = 152;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0153 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0154
     * @tc.name      testConstantsData0154
     * @tc.desc      Verify constantsData behavior for matrix index 153.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0154 begin');
      const index: number = 153;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0154 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0155
     * @tc.name      testConstantsData0155
     * @tc.desc      Verify constantsData behavior for matrix index 154.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0155 begin');
      const index: number = 154;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0155 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0156
     * @tc.name      testConstantsData0156
     * @tc.desc      Verify constantsData behavior for matrix index 155.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0156 begin');
      const index: number = 155;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0156 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0157
     * @tc.name      testConstantsData0157
     * @tc.desc      Verify constantsData behavior for matrix index 156.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0157 begin');
      const index: number = 156;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0157 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0158
     * @tc.name      testConstantsData0158
     * @tc.desc      Verify constantsData behavior for matrix index 157.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0158 begin');
      const index: number = 157;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0158 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0159
     * @tc.name      testConstantsData0159
     * @tc.desc      Verify constantsData behavior for matrix index 158.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0159 begin');
      const index: number = 158;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0159 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0160
     * @tc.name      testConstantsData0160
     * @tc.desc      Verify constantsData behavior for matrix index 159.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0160 begin');
      const index: number = 159;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0160 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0161
     * @tc.name      testConstantsData0161
     * @tc.desc      Verify constantsData behavior for matrix index 160.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0161 begin');
      const index: number = 160;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0161 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0162
     * @tc.name      testConstantsData0162
     * @tc.desc      Verify constantsData behavior for matrix index 161.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0162 begin');
      const index: number = 161;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0162 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0163
     * @tc.name      testConstantsData0163
     * @tc.desc      Verify constantsData behavior for matrix index 162.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0163 begin');
      const index: number = 162;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0163 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0164
     * @tc.name      testConstantsData0164
     * @tc.desc      Verify constantsData behavior for matrix index 163.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0164 begin');
      const index: number = 163;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0164 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0165
     * @tc.name      testConstantsData0165
     * @tc.desc      Verify constantsData behavior for matrix index 164.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0165 begin');
      const index: number = 164;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0165 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0166
     * @tc.name      testConstantsData0166
     * @tc.desc      Verify constantsData behavior for matrix index 165.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0166 begin');
      const index: number = 165;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0166 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0167
     * @tc.name      testConstantsData0167
     * @tc.desc      Verify constantsData behavior for matrix index 166.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0167 begin');
      const index: number = 166;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0167 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0168
     * @tc.name      testConstantsData0168
     * @tc.desc      Verify constantsData behavior for matrix index 167.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0168 begin');
      const index: number = 167;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0168 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0169
     * @tc.name      testConstantsData0169
     * @tc.desc      Verify constantsData behavior for matrix index 168.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0169 begin');
      const index: number = 168;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0169 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0170
     * @tc.name      testConstantsData0170
     * @tc.desc      Verify constantsData behavior for matrix index 169.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0170 begin');
      const index: number = 169;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0170 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0171
     * @tc.name      testConstantsData0171
     * @tc.desc      Verify constantsData behavior for matrix index 170.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0171 begin');
      const index: number = 170;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0171 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0172
     * @tc.name      testConstantsData0172
     * @tc.desc      Verify constantsData behavior for matrix index 171.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0172 begin');
      const index: number = 171;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0172 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0173
     * @tc.name      testConstantsData0173
     * @tc.desc      Verify constantsData behavior for matrix index 172.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0173 begin');
      const index: number = 172;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0173 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0174
     * @tc.name      testConstantsData0174
     * @tc.desc      Verify constantsData behavior for matrix index 173.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0174 begin');
      const index: number = 173;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0174 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0175
     * @tc.name      testConstantsData0175
     * @tc.desc      Verify constantsData behavior for matrix index 174.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0175 begin');
      const index: number = 174;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0175 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0176
     * @tc.name      testConstantsData0176
     * @tc.desc      Verify constantsData behavior for matrix index 175.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0176 begin');
      const index: number = 175;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0176 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0177
     * @tc.name      testConstantsData0177
     * @tc.desc      Verify constantsData behavior for matrix index 176.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0177 begin');
      const index: number = 176;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0177 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0178
     * @tc.name      testConstantsData0178
     * @tc.desc      Verify constantsData behavior for matrix index 177.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0178 begin');
      const index: number = 177;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0178 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0179
     * @tc.name      testConstantsData0179
     * @tc.desc      Verify constantsData behavior for matrix index 178.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0179 begin');
      const index: number = 178;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0179 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0180
     * @tc.name      testConstantsData0180
     * @tc.desc      Verify constantsData behavior for matrix index 179.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0180 begin');
      const index: number = 179;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0180 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0181
     * @tc.name      testConstantsData0181
     * @tc.desc      Verify constantsData behavior for matrix index 180.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0181 begin');
      const index: number = 180;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0181 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0182
     * @tc.name      testConstantsData0182
     * @tc.desc      Verify constantsData behavior for matrix index 181.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0182 begin');
      const index: number = 181;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0182 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0183
     * @tc.name      testConstantsData0183
     * @tc.desc      Verify constantsData behavior for matrix index 182.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0183 begin');
      const index: number = 182;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0183 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0184
     * @tc.name      testConstantsData0184
     * @tc.desc      Verify constantsData behavior for matrix index 183.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0184 begin');
      const index: number = 183;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0184 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0185
     * @tc.name      testConstantsData0185
     * @tc.desc      Verify constantsData behavior for matrix index 184.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0185 begin');
      const index: number = 184;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0185 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0186
     * @tc.name      testConstantsData0186
     * @tc.desc      Verify constantsData behavior for matrix index 185.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0186 begin');
      const index: number = 185;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0186 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0187
     * @tc.name      testConstantsData0187
     * @tc.desc      Verify constantsData behavior for matrix index 186.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0187 begin');
      const index: number = 186;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0187 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0188
     * @tc.name      testConstantsData0188
     * @tc.desc      Verify constantsData behavior for matrix index 187.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0188 begin');
      const index: number = 187;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0188 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0189
     * @tc.name      testConstantsData0189
     * @tc.desc      Verify constantsData behavior for matrix index 188.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0189 begin');
      const index: number = 188;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0189 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0190
     * @tc.name      testConstantsData0190
     * @tc.desc      Verify constantsData behavior for matrix index 189.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0190 begin');
      const index: number = 189;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0190 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0191
     * @tc.name      testConstantsData0191
     * @tc.desc      Verify constantsData behavior for matrix index 190.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0191 begin');
      const index: number = 190;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0191 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0192
     * @tc.name      testConstantsData0192
     * @tc.desc      Verify constantsData behavior for matrix index 191.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0192 begin');
      const index: number = 191;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0192 end');
    })

  })
}
