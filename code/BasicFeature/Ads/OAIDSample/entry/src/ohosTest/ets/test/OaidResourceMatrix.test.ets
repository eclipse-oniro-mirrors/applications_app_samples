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
const TAG: string = '[Sample_OAID]';

export default function oaidResourceMatrixTest(): void {
  describe('OaidResourceMatrixTest', () => {
    /**
     * @tc.number    SUB_OAID_RESOURCE_0001
     * @tc.name      oaidResourceMatrix0001
     * @tc.desc      字符串资源 module_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0001 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0002
     * @tc.name      oaidResourceMatrix0002
     * @tc.desc      字符串资源 EntryAbility_desc 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0002 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0003
     * @tc.name      oaidResourceMatrix0003
     * @tc.desc      字符串资源 EntryAbility_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0003 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0004
     * @tc.name      oaidResourceMatrix0004
     * @tc.desc      字符串资源 oaid_title 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0004 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('oaid_title');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('oaid_title');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0005
     * @tc.name      oaidResourceMatrix0005
     * @tc.desc      字符串资源 oaid_btn_promise 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0005 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('oaid_btn_promise');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('oaid_btn_promise');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0006
     * @tc.name      oaidResourceMatrix0006
     * @tc.desc      字符串资源 oaid_btn_asynccallback 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0006 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('oaid_btn_asynccallback');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('oaid_btn_asynccallback');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0007
     * @tc.name      oaidResourceMatrix0007
     * @tc.desc      字符串资源 oaid_btn_reset 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('oaid_btn_reset');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('oaid_btn_reset');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0007 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0008
     * @tc.name      oaidResourceMatrix0008
     * @tc.desc      字符串资源 oaid_label 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0008 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('oaid_label');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('oaid_label');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0008 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0009
     * @tc.name      oaidResourceMatrix0009
     * @tc.desc      字符串资源 request_permissions_reason 可读取且多次读取一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0009 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const text: string = context.resourceManager.getStringByNameSync('request_permissions_reason');
      const actual1: string = typeof text;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: boolean = text.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const again: string = context.resourceManager.getStringByNameSync('request_permissions_reason');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 again=${again}`);
      expect(again).assertEqual(text);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0009 end');
    })

    /**
     * @tc.number    SUB_OAID_RESOURCE_0010
     * @tc.name      oaidResourceMatrix0010
     * @tc.desc      颜色资源 start_window_background 取值为不透明白色
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidResourceMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0010 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const color: number = context.resourceManager.getColorByNameSync('start_window_background');
      const actual1: string = typeof color;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('number');
      const actual2: boolean = color !== 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = (color & 0xFF) === 0xFF;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidResourceMatrix0010 end');
    })
  })
}
