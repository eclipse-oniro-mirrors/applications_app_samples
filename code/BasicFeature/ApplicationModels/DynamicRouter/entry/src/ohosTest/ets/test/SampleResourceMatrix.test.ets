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
const TAG: string = '[Sample_DynamicRouter]';

export default function sampleResourceMatrixTest(): void {
  describe('SampleResourceMatrixTest', () => {
    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0001
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
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0002
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
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0003
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
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0004
     * @tc.name      sampleResourceMatrix0004
     * @tc.desc      字符串资源 to_hara_page1 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('to_hara_page1');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('to_hara_page1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0004 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0005
     * @tc.name      sampleResourceMatrix0005
     * @tc.desc      字符串资源 to_hara_page2 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('to_hara_page2');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('to_hara_page2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0005 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0006
     * @tc.name      sampleResourceMatrix0006
     * @tc.desc      字符串资源 to_hara_page3 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('to_hara_page3');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('to_hara_page3');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0006 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0007
     * @tc.name      sampleResourceMatrix0007
     * @tc.desc      字符串资源 to_harb_page1 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('to_harb_page1');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('to_harb_page1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0007 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0008
     * @tc.name      sampleResourceMatrix0008
     * @tc.desc      字符串资源 to_harb_page2 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('to_harb_page2');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('to_harb_page2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0008 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0009
     * @tc.name      sampleResourceMatrix0009
     * @tc.desc      字符串资源 to_harb_page3 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('to_harb_page3');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('to_harb_page3');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0009 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_RESOURCE_0010
     * @tc.name      sampleResourceMatrix0010
     * @tc.desc      颜色资源 start_window_background 可读取
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleResourceMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleResourceMatrix0010 end');
    })
  })
}
