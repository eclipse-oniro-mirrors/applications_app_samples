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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Resource lookup paths.
 * Resources of a HAR can be reached through the generated Resource object or
 * through the manager's name index. Both paths must agree. The numeric id
 * carried by a Resource is scoped to the owning module, so a bare id passed
 * back to the manager is not resolvable; that limitation is pinned as well,
 * because tooling that stores only the id would fail at runtime.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
export default function resourcePathCrossCheckTest() {
  describe('ResourcePathCrossCheckTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0100
     * @tc.name StringObjectEqualsName001
     * @tc.desc Verify string object equals name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringObjectEqualsName_001', 0, (): void => {
      Logger.info(TAG, 'StringObjectEqualsName_001 begin');
      const byObject: string = manager.getStringSync($r('app.string.publish_multimedia_updates_share'));
      const byName: string = manager.getStringByNameSync('publish_multimedia_updates_share');
      expect(byObject).assertEqual(byName);
      Logger.info(TAG, 'StringObjectEqualsName_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0200
     * @tc.name NumberObjectEqualsName002
     * @tc.desc Verify number object equals name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumberObjectEqualsName_002', 0, (): void => {
      Logger.info(TAG, 'NumberObjectEqualsName_002 begin');
      const byObject: number = manager.getNumber($r('app.integer.publish_multimedia_updates_single_image_width'));
      const byName: number = manager.getNumberByName('publish_multimedia_updates_single_image_width');
      expect(byObject).assertEqual(byName);
      Logger.info(TAG, 'NumberObjectEqualsName_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0300
     * @tc.name ColorObjectEqualsName003
     * @tc.desc Verify color object equals name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ColorObjectEqualsName_003', 0, (): void => {
      Logger.info(TAG, 'ColorObjectEqualsName_003 begin');
      const byObject: number = manager.getColorSync($r('app.color.publish_multimedia_updates_divider_color'));
      const byName: number = manager.getColorByNameSync('publish_multimedia_updates_divider_color');
      expect(byObject).assertEqual(byName);
      Logger.info(TAG, 'ColorObjectEqualsName_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0400
     * @tc.name MediaObjectEqualsName004
     * @tc.desc Verify media object equals name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MediaObjectEqualsName_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'MediaObjectEqualsName_004 begin');
      const byObject: Uint8Array = await manager.getMediaContent($r('app.media.Zoologist'));
      const byName: Uint8Array = await manager.getMediaByName('Zoologist');
      expect(byObject.length).assertEqual(byName.length);
      Logger.info(TAG, 'MediaObjectEqualsName_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0500
     * @tc.name FloatObjectEqualsName005
     * @tc.desc Verify float object equals name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FloatObjectEqualsName_005', 0, (): void => {
      Logger.info(TAG, 'FloatObjectEqualsName_005 begin');
      const byObject: number = manager.getNumber($r('app.float.publish_multimedia_updates_opacity'));
      const byName: number = manager.getNumberByName('publish_multimedia_updates_opacity');
      const sameValue: boolean = byObject === byName;
      Logger.info(TAG, 'sameValue=' + JSON.stringify(sameValue));
      expect(sameValue).assertTrue();
      expect(Math.round(byObject * 10)).assertEqual(6);
      Logger.info(TAG, 'FloatObjectEqualsName_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0600
     * @tc.name BareNumericIdUnsupported006
     * @tc.desc Verify bare numeric id unsupported
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BareNumericIdUnsupported_006', 0, (): void => {
      Logger.info(TAG, 'BareNumericIdUnsupported_006 begin');
      const stringId: number = $r('app.string.publish_multimedia_updates_share').id;
      const numberId: number = $r('app.integer.publish_multimedia_updates_divider_width').id;
      const colorId: number = $r('app.color.publish_multimedia_updates_title_font_color').id;
      let accepted: number = 0;
      try {
        manager.getStringSync(stringId);
        accepted += 1;
      }
      catch (error) {
        Logger.info(TAG, 'string id rejected as expected');
      }
      try {
        manager.getNumber(numberId);
        accepted += 1;
      }
      catch (error) {
        Logger.info(TAG, 'number id rejected as expected');
      }
      try {
        manager.getColorSync(colorId);
        accepted += 1;
      }
      catch (error) {
        Logger.info(TAG, 'color id rejected as expected');
      }
      Logger.info(TAG, 'accepted=' + accepted);
      expect(accepted).assertEqual(0);
      Logger.info(TAG, 'BareNumericIdUnsupported_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0700
     * @tc.name NamePathStableAcrossReads007
     * @tc.desc Verify name path stable across reads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NamePathStableAcrossReads_007', 0, (): void => {
      Logger.info(TAG, 'NamePathStableAcrossReads_007 begin');
      const first: string = manager.getStringByNameSync('toolbarList_Message');
      const second: string = manager.getStringByNameSync('toolbarList_Message');
      expect(first).assertEqual(second);
      Logger.info(TAG, 'NamePathStableAcrossReads_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_RESPATH_0800
     * @tc.name DifferentNamesDifferentValues008
     * @tc.desc Verify different names different values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DifferentNamesDifferentValues_008', 0, (): void => {
      Logger.info(TAG, 'DifferentNamesDifferentValues_008 begin');
      const home: string = manager.getStringByNameSync('toolbarList_home');
      const discover: string = manager.getStringByNameSync('toolbarList_discover');
      const distinct: boolean = home !== discover;
      Logger.info(TAG, 'distinct=' + JSON.stringify(distinct));
      expect(distinct).assertTrue();
      Logger.info(TAG, 'DifferentNamesDifferentValues_008 end');
    });
  });
}
