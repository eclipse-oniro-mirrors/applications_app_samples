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
const TAG: string = '[Sample_ComponentReuse_ConstantsDataTail]';

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

export default function constantsDataTailTest() {
  describe('constantsDataTailTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0193
     * @tc.name      testConstantsData0193
     * @tc.desc      Verify constantsData behavior for matrix index 192.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0193 begin');
      const index: number = 192;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0193 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0194
     * @tc.name      testConstantsData0194
     * @tc.desc      Verify constantsData behavior for matrix index 193.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0194 begin');
      const index: number = 193;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0194 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0195
     * @tc.name      testConstantsData0195
     * @tc.desc      Verify constantsData behavior for matrix index 194.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0195 begin');
      const index: number = 194;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0195 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0196
     * @tc.name      testConstantsData0196
     * @tc.desc      Verify constantsData behavior for matrix index 195.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0196 begin');
      const index: number = 195;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0196 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0197
     * @tc.name      testConstantsData0197
     * @tc.desc      Verify constantsData behavior for matrix index 196.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0197 begin');
      const index: number = 196;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0197 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0198
     * @tc.name      testConstantsData0198
     * @tc.desc      Verify constantsData behavior for matrix index 197.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0198 begin');
      const index: number = 197;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0198 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0199
     * @tc.name      testConstantsData0199
     * @tc.desc      Verify constantsData behavior for matrix index 198.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0199 begin');
      const index: number = 198;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0199 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0200
     * @tc.name      testConstantsData0200
     * @tc.desc      Verify constantsData behavior for matrix index 199.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0200 begin');
      const index: number = 199;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0200 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0201
     * @tc.name      testConstantsData0201
     * @tc.desc      Verify constantsData behavior for matrix index 200.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0201 begin');
      const index: number = 200;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0201 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0202
     * @tc.name      testConstantsData0202
     * @tc.desc      Verify constantsData behavior for matrix index 201.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0202 begin');
      const index: number = 201;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0202 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0203
     * @tc.name      testConstantsData0203
     * @tc.desc      Verify constantsData behavior for matrix index 202.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0203 begin');
      const index: number = 202;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0203 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0204
     * @tc.name      testConstantsData0204
     * @tc.desc      Verify constantsData behavior for matrix index 203.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0204 begin');
      const index: number = 203;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0204 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0205
     * @tc.name      testConstantsData0205
     * @tc.desc      Verify constantsData behavior for matrix index 204.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0205 begin');
      const index: number = 204;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0205 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0206
     * @tc.name      testConstantsData0206
     * @tc.desc      Verify constantsData behavior for matrix index 205.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0206 begin');
      const index: number = 205;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0206 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0207
     * @tc.name      testConstantsData0207
     * @tc.desc      Verify constantsData behavior for matrix index 206.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0207 begin');
      const index: number = 206;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0207 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0208
     * @tc.name      testConstantsData0208
     * @tc.desc      Verify constantsData behavior for matrix index 207.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0208 begin');
      const index: number = 207;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0208 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0209
     * @tc.name      testConstantsData0209
     * @tc.desc      Verify constantsData behavior for matrix index 208.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0209 begin');
      const index: number = 208;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0209 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0210
     * @tc.name      testConstantsData0210
     * @tc.desc      Verify constantsData behavior for matrix index 209.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0210 begin');
      const index: number = 209;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0210 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0211
     * @tc.name      testConstantsData0211
     * @tc.desc      Verify constantsData behavior for matrix index 210.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0211 begin');
      const index: number = 210;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0211 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0212
     * @tc.name      testConstantsData0212
     * @tc.desc      Verify constantsData behavior for matrix index 211.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0212 begin');
      const index: number = 211;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0212 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0213
     * @tc.name      testConstantsData0213
     * @tc.desc      Verify constantsData behavior for matrix index 212.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0213 begin');
      const index: number = 212;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0213 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0214
     * @tc.name      testConstantsData0214
     * @tc.desc      Verify constantsData behavior for matrix index 213.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0214 begin');
      const index: number = 213;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0214 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0215
     * @tc.name      testConstantsData0215
     * @tc.desc      Verify constantsData behavior for matrix index 214.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0215 begin');
      const index: number = 214;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0215 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0216
     * @tc.name      testConstantsData0216
     * @tc.desc      Verify constantsData behavior for matrix index 215.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0216 begin');
      const index: number = 215;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0216 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0217
     * @tc.name      testConstantsData0217
     * @tc.desc      Verify constantsData behavior for matrix index 216.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0217 begin');
      const index: number = 216;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0217 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0218
     * @tc.name      testConstantsData0218
     * @tc.desc      Verify constantsData behavior for matrix index 217.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0218 begin');
      const index: number = 217;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0218 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0219
     * @tc.name      testConstantsData0219
     * @tc.desc      Verify constantsData behavior for matrix index 218.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0219 begin');
      const index: number = 218;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0219 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0220
     * @tc.name      testConstantsData0220
     * @tc.desc      Verify constantsData behavior for matrix index 219.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0220 begin');
      const index: number = 219;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0220 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0221
     * @tc.name      testConstantsData0221
     * @tc.desc      Verify constantsData behavior for matrix index 220.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0221 begin');
      const index: number = 220;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0221 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0222
     * @tc.name      testConstantsData0222
     * @tc.desc      Verify constantsData behavior for matrix index 221.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0222 begin');
      const index: number = 221;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0222 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0223
     * @tc.name      testConstantsData0223
     * @tc.desc      Verify constantsData behavior for matrix index 222.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0223 begin');
      const index: number = 222;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0223 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0224
     * @tc.name      testConstantsData0224
     * @tc.desc      Verify constantsData behavior for matrix index 223.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0224 begin');
      const index: number = 223;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0224 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0225
     * @tc.name      testConstantsData0225
     * @tc.desc      Verify constantsData behavior for matrix index 224.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0225 begin');
      const index: number = 224;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0225 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0226
     * @tc.name      testConstantsData0226
     * @tc.desc      Verify constantsData behavior for matrix index 225.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0226 begin');
      const index: number = 225;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0226 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0227
     * @tc.name      testConstantsData0227
     * @tc.desc      Verify constantsData behavior for matrix index 226.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0227 begin');
      const index: number = 226;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0227 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0228
     * @tc.name      testConstantsData0228
     * @tc.desc      Verify constantsData behavior for matrix index 227.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0228 begin');
      const index: number = 227;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0228 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0229
     * @tc.name      testConstantsData0229
     * @tc.desc      Verify constantsData behavior for matrix index 228.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0229 begin');
      const index: number = 228;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0229 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0230
     * @tc.name      testConstantsData0230
     * @tc.desc      Verify constantsData behavior for matrix index 229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0230 begin');
      const index: number = 229;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0230 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0231
     * @tc.name      testConstantsData0231
     * @tc.desc      Verify constantsData behavior for matrix index 230.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0231 begin');
      const index: number = 230;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0231 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0232
     * @tc.name      testConstantsData0232
     * @tc.desc      Verify constantsData behavior for matrix index 231.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0232 begin');
      const index: number = 231;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0232 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0233
     * @tc.name      testConstantsData0233
     * @tc.desc      Verify constantsData behavior for matrix index 232.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0233 begin');
      const index: number = 232;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0233 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0234
     * @tc.name      testConstantsData0234
     * @tc.desc      Verify constantsData behavior for matrix index 233.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0234 begin');
      const index: number = 233;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0234 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0235
     * @tc.name      testConstantsData0235
     * @tc.desc      Verify constantsData behavior for matrix index 234.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0235 begin');
      const index: number = 234;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0235 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0236
     * @tc.name      testConstantsData0236
     * @tc.desc      Verify constantsData behavior for matrix index 235.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0236 begin');
      const index: number = 235;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0236 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0237
     * @tc.name      testConstantsData0237
     * @tc.desc      Verify constantsData behavior for matrix index 236.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0237 begin');
      const index: number = 236;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0237 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0238
     * @tc.name      testConstantsData0238
     * @tc.desc      Verify constantsData behavior for matrix index 237.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0238 begin');
      const index: number = 237;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0238 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0239
     * @tc.name      testConstantsData0239
     * @tc.desc      Verify constantsData behavior for matrix index 238.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0239 begin');
      const index: number = 238;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0239 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0240
     * @tc.name      testConstantsData0240
     * @tc.desc      Verify constantsData behavior for matrix index 239.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0240 begin');
      const index: number = 239;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0240 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0241
     * @tc.name      testConstantsData0241
     * @tc.desc      Verify constantsData behavior for matrix index 240.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0241 begin');
      const index: number = 240;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0241 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0242
     * @tc.name      testConstantsData0242
     * @tc.desc      Verify constantsData behavior for matrix index 241.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0242 begin');
      const index: number = 241;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0242 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0243
     * @tc.name      testConstantsData0243
     * @tc.desc      Verify constantsData behavior for matrix index 242.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0243 begin');
      const index: number = 242;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0243 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0244
     * @tc.name      testConstantsData0244
     * @tc.desc      Verify constantsData behavior for matrix index 243.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0244 begin');
      const index: number = 243;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0244 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0245
     * @tc.name      testConstantsData0245
     * @tc.desc      Verify constantsData behavior for matrix index 244.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0245 begin');
      const index: number = 244;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0245 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0246
     * @tc.name      testConstantsData0246
     * @tc.desc      Verify constantsData behavior for matrix index 245.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0246 begin');
      const index: number = 245;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0246 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0247
     * @tc.name      testConstantsData0247
     * @tc.desc      Verify constantsData behavior for matrix index 246.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0247 begin');
      const index: number = 246;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0247 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0248
     * @tc.name      testConstantsData0248
     * @tc.desc      Verify constantsData behavior for matrix index 247.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0248 begin');
      const index: number = 247;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0248 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0249
     * @tc.name      testConstantsData0249
     * @tc.desc      Verify constantsData behavior for matrix index 248.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0249 begin');
      const index: number = 248;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0249 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0250
     * @tc.name      testConstantsData0250
     * @tc.desc      Verify constantsData behavior for matrix index 249.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0250 begin');
      const index: number = 249;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0250 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0251
     * @tc.name      testConstantsData0251
     * @tc.desc      Verify constantsData behavior for matrix index 250.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0251 begin');
      const index: number = 250;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0251 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0252
     * @tc.name      testConstantsData0252
     * @tc.desc      Verify constantsData behavior for matrix index 251.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0252 begin');
      const index: number = 251;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0252 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0253
     * @tc.name      testConstantsData0253
     * @tc.desc      Verify constantsData behavior for matrix index 252.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0253 begin');
      const index: number = 252;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0253 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0254
     * @tc.name      testConstantsData0254
     * @tc.desc      Verify constantsData behavior for matrix index 253.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0254 begin');
      const index: number = 253;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0254 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0255
     * @tc.name      testConstantsData0255
     * @tc.desc      Verify constantsData behavior for matrix index 254.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0255 begin');
      const index: number = 254;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0255 end');
    })

    /**
     * @tc.number    SUB_COMPONENT_REUSE_CONSTANTS_0256
     * @tc.name      testConstantsData0256
     * @tc.desc      Verify constantsData behavior for matrix index 255.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testConstantsData0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0256 begin');
      const index: number = 255;
      expect(Constants.navDestinationData.length).assertEqual(EXPECTED_DESTINATION_IDS.length);
      expect(Constants.LIST_SPACE).assertEqual(12);
      expect(Constants.LAYOUT_MAX).assertEqual('100%');
      expect(Constants.COMM_INIT).assertEqual(0);
      const entryIndex: number = index % EXPECTED_DESTINATION_IDS.length;
      const entry = Constants.navDestinationData[entryIndex];
      expect(entry.id).assertEqual(EXPECTED_DESTINATION_IDS[entryIndex]);
      expect(EXPECTED_DESTINATION_IDS.indexOf(entry.id)).assertEqual(entryIndex);
      expect(entry.detail !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConstantsData0256 end');
    })

  })
}
