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
const TAG: string = '[Sample_ComponentReuse_ConstantsDataExtended]';

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

export default function constantsDataExtendedTest() {
  describe('constantsDataExtendedTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0065
     * @tc.name      testConstantsData0065
     * @tc.desc      Verify constantsData behavior for matrix index 64.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0065 begin');
      const index: number = 64;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0065 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0066
     * @tc.name      testConstantsData0066
     * @tc.desc      Verify constantsData behavior for matrix index 65.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0066 begin');
      const index: number = 65;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0066 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0067
     * @tc.name      testConstantsData0067
     * @tc.desc      Verify constantsData behavior for matrix index 66.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0067 begin');
      const index: number = 66;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0067 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0068
     * @tc.name      testConstantsData0068
     * @tc.desc      Verify constantsData behavior for matrix index 67.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0068 begin');
      const index: number = 67;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0068 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0069
     * @tc.name      testConstantsData0069
     * @tc.desc      Verify constantsData behavior for matrix index 68.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0069 begin');
      const index: number = 68;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0069 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0070
     * @tc.name      testConstantsData0070
     * @tc.desc      Verify constantsData behavior for matrix index 69.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0070 begin');
      const index: number = 69;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0070 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0071
     * @tc.name      testConstantsData0071
     * @tc.desc      Verify constantsData behavior for matrix index 70.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0071 begin');
      const index: number = 70;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0071 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0072
     * @tc.name      testConstantsData0072
     * @tc.desc      Verify constantsData behavior for matrix index 71.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0072 begin');
      const index: number = 71;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0072 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0073
     * @tc.name      testConstantsData0073
     * @tc.desc      Verify constantsData behavior for matrix index 72.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0073 begin');
      const index: number = 72;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0073 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0074
     * @tc.name      testConstantsData0074
     * @tc.desc      Verify constantsData behavior for matrix index 73.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0074 begin');
      const index: number = 73;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0074 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0075
     * @tc.name      testConstantsData0075
     * @tc.desc      Verify constantsData behavior for matrix index 74.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0075 begin');
      const index: number = 74;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0075 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0076
     * @tc.name      testConstantsData0076
     * @tc.desc      Verify constantsData behavior for matrix index 75.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0076 begin');
      const index: number = 75;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0076 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0077
     * @tc.name      testConstantsData0077
     * @tc.desc      Verify constantsData behavior for matrix index 76.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0077 begin');
      const index: number = 76;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0077 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0078
     * @tc.name      testConstantsData0078
     * @tc.desc      Verify constantsData behavior for matrix index 77.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0078 begin');
      const index: number = 77;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0078 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0079
     * @tc.name      testConstantsData0079
     * @tc.desc      Verify constantsData behavior for matrix index 78.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0079 begin');
      const index: number = 78;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0079 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0080
     * @tc.name      testConstantsData0080
     * @tc.desc      Verify constantsData behavior for matrix index 79.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0080 begin');
      const index: number = 79;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0080 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0081
     * @tc.name      testConstantsData0081
     * @tc.desc      Verify constantsData behavior for matrix index 80.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0081 begin');
      const index: number = 80;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0081 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0082
     * @tc.name      testConstantsData0082
     * @tc.desc      Verify constantsData behavior for matrix index 81.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0082 begin');
      const index: number = 81;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0082 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0083
     * @tc.name      testConstantsData0083
     * @tc.desc      Verify constantsData behavior for matrix index 82.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0083 begin');
      const index: number = 82;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0083 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0084
     * @tc.name      testConstantsData0084
     * @tc.desc      Verify constantsData behavior for matrix index 83.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0084 begin');
      const index: number = 83;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0084 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0085
     * @tc.name      testConstantsData0085
     * @tc.desc      Verify constantsData behavior for matrix index 84.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0085 begin');
      const index: number = 84;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0085 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0086
     * @tc.name      testConstantsData0086
     * @tc.desc      Verify constantsData behavior for matrix index 85.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0086 begin');
      const index: number = 85;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0086 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0087
     * @tc.name      testConstantsData0087
     * @tc.desc      Verify constantsData behavior for matrix index 86.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0087 begin');
      const index: number = 86;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0087 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0088
     * @tc.name      testConstantsData0088
     * @tc.desc      Verify constantsData behavior for matrix index 87.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0088 begin');
      const index: number = 87;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0088 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0089
     * @tc.name      testConstantsData0089
     * @tc.desc      Verify constantsData behavior for matrix index 88.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0089 begin');
      const index: number = 88;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0089 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0090
     * @tc.name      testConstantsData0090
     * @tc.desc      Verify constantsData behavior for matrix index 89.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0090 begin');
      const index: number = 89;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0090 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0091
     * @tc.name      testConstantsData0091
     * @tc.desc      Verify constantsData behavior for matrix index 90.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0091 begin');
      const index: number = 90;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0091 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0092
     * @tc.name      testConstantsData0092
     * @tc.desc      Verify constantsData behavior for matrix index 91.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0092 begin');
      const index: number = 91;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0092 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0093
     * @tc.name      testConstantsData0093
     * @tc.desc      Verify constantsData behavior for matrix index 92.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0093 begin');
      const index: number = 92;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0093 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0094
     * @tc.name      testConstantsData0094
     * @tc.desc      Verify constantsData behavior for matrix index 93.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0094 begin');
      const index: number = 93;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0094 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0095
     * @tc.name      testConstantsData0095
     * @tc.desc      Verify constantsData behavior for matrix index 94.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0095 begin');
      const index: number = 94;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0095 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0096
     * @tc.name      testConstantsData0096
     * @tc.desc      Verify constantsData behavior for matrix index 95.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0096 begin');
      const index: number = 95;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0096 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0097
     * @tc.name      testConstantsData0097
     * @tc.desc      Verify constantsData behavior for matrix index 96.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0097 begin');
      const index: number = 96;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0097 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0098
     * @tc.name      testConstantsData0098
     * @tc.desc      Verify constantsData behavior for matrix index 97.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0098 begin');
      const index: number = 97;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0098 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0099
     * @tc.name      testConstantsData0099
     * @tc.desc      Verify constantsData behavior for matrix index 98.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0099 begin');
      const index: number = 98;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0099 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0100
     * @tc.name      testConstantsData0100
     * @tc.desc      Verify constantsData behavior for matrix index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0100 begin');
      const index: number = 99;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0100 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0101
     * @tc.name      testConstantsData0101
     * @tc.desc      Verify constantsData behavior for matrix index 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0101 begin');
      const index: number = 100;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0101 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0102
     * @tc.name      testConstantsData0102
     * @tc.desc      Verify constantsData behavior for matrix index 101.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0102 begin');
      const index: number = 101;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0102 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0103
     * @tc.name      testConstantsData0103
     * @tc.desc      Verify constantsData behavior for matrix index 102.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0103 begin');
      const index: number = 102;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0103 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0104
     * @tc.name      testConstantsData0104
     * @tc.desc      Verify constantsData behavior for matrix index 103.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0104 begin');
      const index: number = 103;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0104 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0105
     * @tc.name      testConstantsData0105
     * @tc.desc      Verify constantsData behavior for matrix index 104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0105 begin');
      const index: number = 104;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0105 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0106
     * @tc.name      testConstantsData0106
     * @tc.desc      Verify constantsData behavior for matrix index 105.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0106 begin');
      const index: number = 105;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0106 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0107
     * @tc.name      testConstantsData0107
     * @tc.desc      Verify constantsData behavior for matrix index 106.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0107 begin');
      const index: number = 106;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0107 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0108
     * @tc.name      testConstantsData0108
     * @tc.desc      Verify constantsData behavior for matrix index 107.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0108 begin');
      const index: number = 107;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0108 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0109
     * @tc.name      testConstantsData0109
     * @tc.desc      Verify constantsData behavior for matrix index 108.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0109 begin');
      const index: number = 108;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0109 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0110
     * @tc.name      testConstantsData0110
     * @tc.desc      Verify constantsData behavior for matrix index 109.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0110 begin');
      const index: number = 109;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0110 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0111
     * @tc.name      testConstantsData0111
     * @tc.desc      Verify constantsData behavior for matrix index 110.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0111 begin');
      const index: number = 110;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0111 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0112
     * @tc.name      testConstantsData0112
     * @tc.desc      Verify constantsData behavior for matrix index 111.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0112 begin');
      const index: number = 111;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0112 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0113
     * @tc.name      testConstantsData0113
     * @tc.desc      Verify constantsData behavior for matrix index 112.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0113 begin');
      const index: number = 112;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0113 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0114
     * @tc.name      testConstantsData0114
     * @tc.desc      Verify constantsData behavior for matrix index 113.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0114 begin');
      const index: number = 113;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0114 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0115
     * @tc.name      testConstantsData0115
     * @tc.desc      Verify constantsData behavior for matrix index 114.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0115 begin');
      const index: number = 114;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0115 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0116
     * @tc.name      testConstantsData0116
     * @tc.desc      Verify constantsData behavior for matrix index 115.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0116 begin');
      const index: number = 115;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0116 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0117
     * @tc.name      testConstantsData0117
     * @tc.desc      Verify constantsData behavior for matrix index 116.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0117 begin');
      const index: number = 116;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0117 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0118
     * @tc.name      testConstantsData0118
     * @tc.desc      Verify constantsData behavior for matrix index 117.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0118 begin');
      const index: number = 117;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0118 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0119
     * @tc.name      testConstantsData0119
     * @tc.desc      Verify constantsData behavior for matrix index 118.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0119 begin');
      const index: number = 118;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0119 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0120
     * @tc.name      testConstantsData0120
     * @tc.desc      Verify constantsData behavior for matrix index 119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0120 begin');
      const index: number = 119;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0120 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0121
     * @tc.name      testConstantsData0121
     * @tc.desc      Verify constantsData behavior for matrix index 120.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0121 begin');
      const index: number = 120;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0121 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0122
     * @tc.name      testConstantsData0122
     * @tc.desc      Verify constantsData behavior for matrix index 121.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0122 begin');
      const index: number = 121;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0122 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0123
     * @tc.name      testConstantsData0123
     * @tc.desc      Verify constantsData behavior for matrix index 122.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0123 begin');
      const index: number = 122;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0123 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0124
     * @tc.name      testConstantsData0124
     * @tc.desc      Verify constantsData behavior for matrix index 123.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0124 begin');
      const index: number = 123;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0124 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0125
     * @tc.name      testConstantsData0125
     * @tc.desc      Verify constantsData behavior for matrix index 124.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0125 begin');
      const index: number = 124;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0125 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0126
     * @tc.name      testConstantsData0126
     * @tc.desc      Verify constantsData behavior for matrix index 125.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0126 begin');
      const index: number = 125;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0126 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0127
     * @tc.name      testConstantsData0127
     * @tc.desc      Verify constantsData behavior for matrix index 126.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0127 begin');
      const index: number = 126;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0127 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0128
     * @tc.name      testConstantsData0128
     * @tc.desc      Verify constantsData behavior for matrix index 127.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0128 begin');
      const index: number = 127;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0128 end');
    })

  })
}
