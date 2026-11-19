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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemRouter]';

export default function sampleResourceMatrixTest(): void {
  describe('SampleResourceMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0001
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
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0002
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
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0003
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
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0004
     * @tc.name      sampleResourceMatrix0004
     * @tc.desc      字符串资源 navDestination_width 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('navDestination_width');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('navDestination_width');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0005
     * @tc.name      sampleResourceMatrix0005
     * @tc.desc      字符串资源 navDestination_height 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('navDestination_height');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('navDestination_height');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0006
     * @tc.name      sampleResourceMatrix0006
     * @tc.desc      字符串资源 button_width 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('button_width');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('button_width');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0007
     * @tc.name      sampleResourceMatrix0007
     * @tc.desc      字符串资源 button_height 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('button_height');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('button_height');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0008
     * @tc.name      sampleResourceMatrix0008
     * @tc.desc      字符串资源 column_padding 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('column_padding');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('column_padding');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0009
     * @tc.name      sampleResourceMatrix0009
     * @tc.desc      字符串资源 entry_index_title 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('entry_index_title');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('entry_index_title');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0010
     * @tc.name      sampleResourceMatrix0010
     * @tc.desc      字符串资源 entry_index 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('entry_index');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('entry_index');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0011
     * @tc.name      sampleResourceMatrix0011
     * @tc.desc      字符串资源 entry_pageOne 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0011 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('entry_pageOne');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('entry_pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0012
     * @tc.name      sampleResourceMatrix0012
     * @tc.desc      字符串资源 entry_pageTwo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0012 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('entry_pageTwo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('entry_pageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0012 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0013
     * @tc.name      sampleResourceMatrix0013
     * @tc.desc      字符串资源 harA_pageOne 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0013 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('harA_pageOne');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('harA_pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0014
     * @tc.name      sampleResourceMatrix0014
     * @tc.desc      字符串资源 harA_pageTwo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0014 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('harA_pageTwo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('harA_pageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0015
     * @tc.name      sampleResourceMatrix0015
     * @tc.desc      字符串资源 harB_pageOne 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0015 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('harB_pageOne');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('harB_pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0015 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0016
     * @tc.name      sampleResourceMatrix0016
     * @tc.desc      字符串资源 harB_pageTwo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0016 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('harB_pageTwo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('harB_pageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0017
     * @tc.name      sampleResourceMatrix0017
     * @tc.desc      字符串资源 hspA_pageOne 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0017 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('hspA_pageOne');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('hspA_pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0018
     * @tc.name      sampleResourceMatrix0018
     * @tc.desc      字符串资源 hspA_pageTwo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0018 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('hspA_pageTwo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('hspA_pageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0018 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0019
     * @tc.name      sampleResourceMatrix0019
     * @tc.desc      字符串资源 hspB_pageOne 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0019 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('hspB_pageOne');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('hspB_pageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0020
     * @tc.name      sampleResourceMatrix0020
     * @tc.desc      字符串资源 hspB_pageTwo 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0020 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('hspB_pageTwo');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('hspB_pageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_RESOURCE_0021
     * @tc.name      sampleResourceMatrix0021
     * @tc.desc      颜色资源 start_window_background 可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0021 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0021 end');
    })
  })
}
