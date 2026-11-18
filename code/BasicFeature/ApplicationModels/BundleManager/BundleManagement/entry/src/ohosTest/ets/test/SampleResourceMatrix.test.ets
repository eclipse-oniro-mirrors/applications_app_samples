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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function sampleResourceMatrixTest(): void {
  describe('SampleResourceMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0001
     * @tc.name      sampleResourceMatrix0001
     * @tc.desc      字符串资源 module_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0001 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('module_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('module_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0002
     * @tc.name      sampleResourceMatrix0002
     * @tc.desc      字符串资源 EntryAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0002 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('EntryAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0003
     * @tc.name      sampleResourceMatrix0003
     * @tc.desc      字符串资源 EntryAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0003 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('EntryAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0004
     * @tc.name      sampleResourceMatrix0004
     * @tc.desc      字符串资源 shortcut 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('shortcut');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('shortcut');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0005
     * @tc.name      sampleResourceMatrix0005
     * @tc.desc      字符串资源 empty 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('empty');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('empty');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0006
     * @tc.name      sampleResourceMatrix0006
     * @tc.desc      字符串资源 NewAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('NewAbility_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('NewAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0007
     * @tc.name      sampleResourceMatrix0007
     * @tc.desc      字符串资源 NewAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('NewAbility_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('NewAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0008
     * @tc.name      sampleResourceMatrix0008
     * @tc.desc      字符串资源 bundleManagement 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('bundleManagement');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('bundleManagement');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0009
     * @tc.name      sampleResourceMatrix0009
     * @tc.desc      字符串资源 interface 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('interface');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('interface');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0010
     * @tc.name      sampleResourceMatrix0010
     * @tc.desc      字符串资源 adler_crc_interface 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('adler_crc_interface');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('adler_crc_interface');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0011
     * @tc.name      sampleResourceMatrix0011
     * @tc.desc      字符串资源 EntryAbility1_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0011 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('EntryAbility1_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('EntryAbility1_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0011 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0012
     * @tc.name      sampleResourceMatrix0012
     * @tc.desc      字符串资源 EntryAbility1_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0012 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('EntryAbility1_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('EntryAbility1_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0012 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0013
     * @tc.name      sampleResourceMatrix0013
     * @tc.desc      字符串资源 GetBundleInfoCurrentApplication 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0013 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetBundleInfoCurrentApplication');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetBundleInfoCurrentApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0013 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0014
     * @tc.name      sampleResourceMatrix0014
     * @tc.desc      字符串资源 GetBundleInfo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0014 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetBundleInfo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetBundleInfo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0014 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0015
     * @tc.name      sampleResourceMatrix0015
     * @tc.desc      字符串资源 GetBundleInfoCombination 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0015 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetBundleInfoCombination');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetBundleInfoCombination');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0015 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0016
     * @tc.name      sampleResourceMatrix0016
     * @tc.desc      字符串资源 GetBundleInfoSync 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0016 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetBundleInfoSync');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetBundleInfoSync');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0016 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0017
     * @tc.name      sampleResourceMatrix0017
     * @tc.desc      字符串资源 GetConfiguration 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0017 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetConfiguration');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetConfiguration');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0017 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0018
     * @tc.name      sampleResourceMatrix0018
     * @tc.desc      字符串资源 GetConfigurationJson 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0018 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetConfigurationJson');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetConfigurationJson');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0018 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0019
     * @tc.name      sampleResourceMatrix0019
     * @tc.desc      字符串资源 GetConfigurationArray 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0019 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetConfigurationArray');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetConfigurationArray');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0019 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0020
     * @tc.name      sampleResourceMatrix0020
     * @tc.desc      字符串资源 GetConfigurationArraySync 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0020 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetConfigurationArraySync');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetConfigurationArraySync');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0020 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0021
     * @tc.name      sampleResourceMatrix0021
     * @tc.desc      字符串资源 GetConfigurationJsonSync 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0021 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('GetConfigurationJsonSync');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('GetConfigurationJsonSync');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0021 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0022
     * @tc.name      sampleResourceMatrix0022
     * @tc.desc      字符串资源 VerifyFile 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0022 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('VerifyFile');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('VerifyFile');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0022 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0023
     * @tc.name      sampleResourceMatrix0023
     * @tc.desc      字符串资源 DeleteFile 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0023 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('DeleteFile');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('DeleteFile');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0023 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0024
     * @tc.name      sampleResourceMatrix0024
     * @tc.desc      字符串资源 VerifyLink 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0024 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('VerifyLink');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('VerifyLink');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0024 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0025
     * @tc.name      sampleResourceMatrix0025
     * @tc.desc      字符串资源 VerifyLinkOpened 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0025 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('VerifyLinkOpened');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('VerifyLinkOpened');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0025 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0026
     * @tc.name      sampleResourceMatrix0026
     * @tc.desc      字符串资源 DetermineDefaultApplications 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0026 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('DetermineDefaultApplications');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('DetermineDefaultApplications');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0026 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0027
     * @tc.name      sampleResourceMatrix0027
     * @tc.desc      字符串资源 DetermineDefaultApplication 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0027 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('DetermineDefaultApplication');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('DetermineDefaultApplication');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0027 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0028
     * @tc.name      sampleResourceMatrix0028
     * @tc.desc      字符串资源 DetermineDefaultApplicationSync 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0028 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('DetermineDefaultApplicationSync');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('DetermineDefaultApplicationSync');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0028 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0029
     * @tc.name      sampleResourceMatrix0029
     * @tc.desc      字符串资源 SetOverlayStatus 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0029 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('SetOverlayStatus');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('SetOverlayStatus');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0029 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0030
     * @tc.name      sampleResourceMatrix0030
     * @tc.desc      字符串资源 SetDisableEnableStatus 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0030 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('SetDisableEnableStatus');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('SetDisableEnableStatus');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0030 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0031
     * @tc.name      sampleResourceMatrix0031
     * @tc.desc      字符串资源 ObtainOverlayModuleInfo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0031 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('ObtainOverlayModuleInfo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('ObtainOverlayModuleInfo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0031 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0032
     * @tc.name      sampleResourceMatrix0032
     * @tc.desc      字符串资源 ObtainOverlayModuleInfoInformation 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0032 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('ObtainOverlayModuleInfoInformation');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('ObtainOverlayModuleInfoInformation');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0032 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0033
     * @tc.name      sampleResourceMatrix0033
     * @tc.desc      字符串资源 ObtainMultipleOverlayModuleInfoInformation 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0033 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('ObtainMultipleOverlayModuleInfoInformation');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('ObtainMultipleOverlayModuleInfoInformation');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0033 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_RESOURCE_0034
     * @tc.name      sampleResourceMatrix0034
     * @tc.desc      颜色资源 start_window_background 可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0034 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const color: number = context.resourceManager.getColorByNameSync('start_window_background');
      const actual1: string = typeof color;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: boolean = color !== 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: number = context.resourceManager.getColorByNameSync('start_window_background');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(color);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0034 end');
    })
  })
}
