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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ContextSnapshot, contextSnapshot, contextUnknownText, safeText
} from '../../../main/ets/model/ExtensionContextInfo';
import { EXTENSION_TYPE_DISTRIBUTED } from '../../../main/ets/common/AppConstants';

/**
 * 分布式扩展的上下文快照：扩展进程里的 extensionAbilityInfo / currentHapModuleInfo / config
 * 三个字段都可能读不到，页面与 hilog 里必须看到占位符而不是 undefined。
 * 这里逐字段验证兜底规则，并核对 type 28 被正确标成 distributed。
 */
export default function distributedContextMatrixTest() {
  describe('DistributedContextMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0100
     * @tc.name testContext0001
     * @tc.desc Verify the unknown placeholder text is stable and non empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0001', 0, () => {
      expect(contextUnknownText()).assertEqual('（未提供）');
      expect(contextUnknownText().length).assertEqual(5);
      expect(contextUnknownText().includes('undefined')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0200
     * @tc.name testContext0002
     * @tc.desc Verify an empty ability name falls back to the placeholder.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0002', 0, () => {
      const empty = contextSnapshot('', EXTENSION_TYPE_DISTRIBUTED, 'entry', 'zh-Hans');
      expect(empty.abilityName).assertEqual(contextUnknownText());
      expect(empty.moduleName).assertEqual('entry');
      expect(empty.language).assertEqual('zh-Hans');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0300
     * @tc.name testContext0003
     * @tc.desc Verify an empty module name falls back while the ability name is kept.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0003', 0, () => {
      const snapshot = contextSnapshot('DistributedExtAbility', EXTENSION_TYPE_DISTRIBUTED, '', 'en');
      expect(snapshot.moduleName).assertEqual(contextUnknownText());
      expect(snapshot.abilityName).assertEqual('DistributedExtAbility');
      expect(snapshot.describe().includes('模块 （未提供）')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0400
     * @tc.name testContext0004
     * @tc.desc Verify an empty language falls back while the other fields survive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0004', 0, () => {
      const snapshot = contextSnapshot('DistributedExtAbility', EXTENSION_TYPE_DISTRIBUTED, 'entry', '');
      expect(snapshot.language).assertEqual(contextUnknownText());
      expect(snapshot.abilityName).assertEqual('DistributedExtAbility');
      expect(snapshot.describe().endsWith('语言 （未提供）')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0500
     * @tc.name testContext0005
     * @tc.desc Verify all three text fields fall back together when the context is unreadable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testContext0005', 0, () => {
      const blank = contextSnapshot('', EXTENSION_TYPE_DISTRIBUTED, '', '');
      expect(blank.abilityName).assertEqual(contextUnknownText());
      expect(blank.moduleName).assertEqual(contextUnknownText());
      expect(blank.language).assertEqual(contextUnknownText());
      expect(blank.describe().includes('undefined')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0600
     * @tc.name testContext0006
     * @tc.desc Verify the distributed extension type is rendered with its numeric value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0006', 0, () => {
      expect(EXTENSION_TYPE_DISTRIBUTED).assertEqual(28);
      expect(contextSnapshot('a', 28, 'm', 'l').typeName()).assertEqual('28（distributed）');
      expect(contextSnapshot('a', 28, 'm', 'l').typeName().startsWith('28')).assertTrue();
      expect(contextSnapshot('a', EXTENSION_TYPE_DISTRIBUTED, 'm', 'l').typeName().includes('distributed')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0700
     * @tc.name testContext0007
     * @tc.desc Verify any other extension type is marked as not distributed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0007', 0, () => {
      expect(contextSnapshot('a', 27, 'm', 'l').typeName()).assertEqual('27（非 distributed）');
      expect(contextSnapshot('a', 29, 'm', 'l').typeName()).assertEqual('29（非 distributed）');
      expect(contextSnapshot('a', 0, 'm', 'l').typeName()).assertEqual('0（非 distributed）');
      expect(contextSnapshot('a', -1, 'm', 'l').typeName()).assertEqual('-1（非 distributed）');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0800
     * @tc.name testContext0008
     * @tc.desc Verify the describe line carries every field in the documented order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0008', 0, () => {
      const text = contextSnapshot('DistributedExtAbility', 28, 'entry', 'zh-Hans').describe();
      expect(text).assertEqual('context 可用：DistributedExtAbility，type=28（distributed），模块 entry，语言 zh-Hans');
      expect(text.startsWith('context 可用：')).assertTrue();
      expect(text.indexOf('type=') < text.indexOf('模块')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_0900
     * @tc.name testContext0009
     * @tc.desc Verify the numeric type is kept verbatim instead of being normalised.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testContext0009', 0, () => {
      expect(contextSnapshot('a', 28, 'm', 'l').abilityType).assertEqual(28);
      expect(contextSnapshot('a', 0, 'm', 'l').abilityType).assertEqual(0);
      expect(contextSnapshot('a', 0, 'm', 'l').typeName() === '0（distributed）').assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_1000
     * @tc.name testContext0010
     * @tc.desc Verify the factory and the constructor produce the same snapshot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testContext0010', 0, () => {
      const built = new ContextSnapshot('a', 28, 'm', 'zh-Hans');
      const made = contextSnapshot('a', 28, 'm', 'zh-Hans');
      expect(made.describe()).assertEqual(built.describe());
      expect(made.typeName()).assertEqual(built.typeName());
      expect(made.abilityType).assertEqual(built.abilityType);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_1100
     * @tc.name testContext0011
     * @tc.desc Verify safeText turns an undefined optional field into an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContext0011', 0, () => {
      expect(safeText(undefined)).assertEqual('');
      expect(safeText('zh-Hans')).assertEqual('zh-Hans');
      expect(safeText('')).assertEqual('');
      expect(contextSnapshot('a', 28, 'm', safeText(undefined)).language).assertEqual(contextUnknownText());
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CONTEXT_1200
     * @tc.name testContext0012
     * @tc.desc Verify a language tag with a script subtag is preserved without truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testContext0012', 0, () => {
      const snapshot = contextSnapshot('a', 28, 'entry', 'zh-Hans-CN');
      expect(snapshot.language).assertEqual('zh-Hans-CN');
      expect(snapshot.language.includes('zh')).assertTrue();
      expect(snapshot.describe().includes('zh-Hans-CN')).assertTrue();
    });
  });
}
