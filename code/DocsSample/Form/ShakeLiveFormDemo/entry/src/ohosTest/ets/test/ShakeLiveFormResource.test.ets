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
import { abilityDelegatorRegistry } from '@kit.TestKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let ctx = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function shakeLiveFormResourceTest() {
  describe('ShakeLiveFormResourceTest', () => {

    /**
     * @tc.name   testShakeResource001
     * @tc.number SUB_SHAKE_RESOURCE_001
     * @tc.desc   Load resource module_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource001 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('module_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'module_desc'));
        expect(v === 'module_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource001 end');
    })

    /**
     * @tc.name   testShakeResource002
     * @tc.number SUB_SHAKE_RESOURCE_002
     * @tc.desc   Load resource EntryAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource002 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryAbility_desc'));
        expect(v === 'EntryAbility_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource002 end');
    })

    /**
     * @tc.name   testShakeResource003
     * @tc.number SUB_SHAKE_RESOURCE_003
     * @tc.desc   Load resource EntryAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource003 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryAbility_label');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryAbility_label'));
        expect(v === 'EntryAbility_label').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource003 end');
    })

    /**
     * @tc.name   testShakeResource004
     * @tc.number SUB_SHAKE_RESOURCE_004
     * @tc.desc   Load resource EntryFormAbility_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource004 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryFormAbility_desc'));
        expect(v === 'EntryFormAbility_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource004 end');
    })

    /**
     * @tc.name   testShakeResource005
     * @tc.number SUB_SHAKE_RESOURCE_005
     * @tc.desc   Load resource EntryFormAbility_label.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource005 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('EntryFormAbility_label');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'EntryFormAbility_label'));
        expect(v === 'EntryFormAbility_label').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource005 end');
    })

    /**
     * @tc.name   testShakeResource006
     * @tc.number SUB_SHAKE_RESOURCE_006
     * @tc.desc   Load resource demoCard_desc.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource006 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('demoCard_desc');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'demoCard_desc'));
        expect(v === 'demoCard_desc').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource006 end');
    })

    /**
     * @tc.name   testShakeResource007
     * @tc.number SUB_SHAKE_RESOURCE_007
     * @tc.desc   Load resource demoCard_display_name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource007 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('demoCard_display_name');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'demoCard_display_name'));
        expect(v === 'demoCard_display_name').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource007 end');
    })

    /**
     * @tc.name   testShakeResource008
     * @tc.number SUB_SHAKE_RESOURCE_008
     * @tc.desc   Load resource app_name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource008 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('app_name');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'app_name'));
        expect(v === 'app_name').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeResource008 end');
    })
  })
}
