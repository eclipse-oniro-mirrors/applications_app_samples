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
const TAG: string = '[Sample_StartMode]';

export default function sampleResourceMatrixTest(): void {
  describe('SampleResourceMatrixTest', () => {
    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0001
     * @tc.name      sampleResourceMatrix0001
     * @tc.desc      字符串资源 entry_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0001 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('entry_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('entry_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0002
     * @tc.name      sampleResourceMatrix0002
     * @tc.desc      字符串资源 mainAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0002 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('mainAbility_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('mainAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0003
     * @tc.name      sampleResourceMatrix0003
     * @tc.desc      字符串资源 mainAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0003 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('mainAbility_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('mainAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0004
     * @tc.name      sampleResourceMatrix0004
     * @tc.desc      字符串资源 standardAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('standardAbility_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('standardAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0005
     * @tc.name      sampleResourceMatrix0005
     * @tc.desc      字符串资源 standardAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('standardAbility_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('standardAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0006
     * @tc.name      sampleResourceMatrix0006
     * @tc.desc      字符串资源 singletonAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('singletonAbility_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('singletonAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0007
     * @tc.name      sampleResourceMatrix0007
     * @tc.desc      字符串资源 singletonAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('singletonAbility_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('singletonAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0008
     * @tc.name      sampleResourceMatrix0008
     * @tc.desc      字符串资源 specifiedAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('specifiedAbility_desc');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('specifiedAbility_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0009
     * @tc.name      sampleResourceMatrix0009
     * @tc.desc      字符串资源 specifiedAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('specifiedAbility_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('specifiedAbility_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0010
     * @tc.name      sampleResourceMatrix0010
     * @tc.desc      字符串资源 category_fruit 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('category_fruit');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('category_fruit');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0011
     * @tc.name      sampleResourceMatrix0011
     * @tc.desc      字符串资源 category_vegetable 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0011 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('category_vegetable');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('category_vegetable');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0011 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0012
     * @tc.name      sampleResourceMatrix0012
     * @tc.desc      字符串资源 category_nut 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0012 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('category_nut');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('category_nut');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0012 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0013
     * @tc.name      sampleResourceMatrix0013
     * @tc.desc      字符串资源 category_seafood 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0013 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('category_seafood');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('category_seafood');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0013 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0014
     * @tc.name      sampleResourceMatrix0014
     * @tc.desc      字符串资源 category_dessert 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0014 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('category_dessert');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('category_dessert');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0014 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0015
     * @tc.name      sampleResourceMatrix0015
     * @tc.desc      字符串资源 diet_record_calorie 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0015 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('diet_record_calorie');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('diet_record_calorie');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0015 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0016
     * @tc.name      sampleResourceMatrix0016
     * @tc.desc      字符串资源 nutrition_element 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0016 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('nutrition_element');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('nutrition_element');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0016 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0017
     * @tc.name      sampleResourceMatrix0017
     * @tc.desc      字符串资源 title_food_detail 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0017 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('title_food_detail');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('title_food_detail');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0017 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0018
     * @tc.name      sampleResourceMatrix0018
     * @tc.desc      字符串资源 unit_weight 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0018 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('unit_weight');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('unit_weight');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0018 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0019
     * @tc.name      sampleResourceMatrix0019
     * @tc.desc      字符串资源 standardMode_title 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0019 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('standardMode_title');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('standardMode_title');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0019 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0020
     * @tc.name      sampleResourceMatrix0020
     * @tc.desc      字符串资源 specifiedMode_title 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0020 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('specifiedMode_title');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('specifiedMode_title');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0020 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0021
     * @tc.name      sampleResourceMatrix0021
     * @tc.desc      字符串资源 singletonMode_title 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0021 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('singletonMode_title');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('singletonMode_title');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0021 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0022
     * @tc.name      sampleResourceMatrix0022
     * @tc.desc      字符串资源 food_name_tomato 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0022 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('food_name_tomato');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('food_name_tomato');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0022 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0023
     * @tc.name      sampleResourceMatrix0023
     * @tc.desc      字符串资源 food_name_cucumber 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0023 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('food_name_cucumber');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('food_name_cucumber');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0023 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0024
     * @tc.name      sampleResourceMatrix0024
     * @tc.desc      字符串资源 food_name_walnut 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0024 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('food_name_walnut');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('food_name_walnut');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0024 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0025
     * @tc.name      sampleResourceMatrix0025
     * @tc.desc      字符串资源 food_name_blueberry 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0025 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('food_name_blueberry');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('food_name_blueberry');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0025 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0026
     * @tc.name      sampleResourceMatrix0026
     * @tc.desc      字符串资源 food_name_crab 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0026 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('food_name_crab');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('food_name_crab');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0026 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0027
     * @tc.name      sampleResourceMatrix0027
     * @tc.desc      字符串资源 food_name_ice_cream 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0027 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('food_name_ice_cream');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('food_name_ice_cream');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0027 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0028
     * @tc.name      sampleResourceMatrix0028
     * @tc.desc      字符串资源 totast 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0028 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('totast');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('totast');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0028 end');
    })

    /**
     * @tc.number    SUB_START_MODE_RESOURCE_0029
     * @tc.name      sampleResourceMatrix0029
     * @tc.desc      颜色资源 theme_color_green 可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0029 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const color: number = context.resourceManager.getColorByNameSync('theme_color_green');
      const actual1: string = typeof color;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: boolean = color !== 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: number = context.resourceManager.getColorByNameSync('theme_color_green');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(color);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0029 end');
    })
  })
}
