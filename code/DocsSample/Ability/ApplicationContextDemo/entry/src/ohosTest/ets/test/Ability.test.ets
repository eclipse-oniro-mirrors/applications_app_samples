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

import { describe, it, expect } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { requireContext, requireBundleInfo, probeIndex, IndexProbe } from './Shared/ContextProbe';

export default function abilityTest(): void {
  describe('ApplicationContextEntryAbility', () => {
    it('launchesActualEntryAbility', 0, async (): Promise<void> => {
      const actual: IndexProbe = await probeIndex(0, [], false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      expect(actual.final).assertEqual(actual.initial);
    });
    it('clicksActualIndexText', 0, async (): Promise<void> => {
      const actual: IndexProbe = await probeIndex(1, [], false);
      expect(actual.final).assertEqual('Welcome');
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
    });
    it('resolvesConfiguredApplicationIdentity', 0, (): void => {
      const context = requireContext();
      expect(context.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(requireBundleInfo().versionName).assertEqual('1.0.0');
      expect(requireBundleInfo().versionCode).assertEqual(1000000);
    });
    it('resolvesDelegatorTargetBundle', 0, (): void => {
      const args = abilityDelegatorRegistry.getArguments();
      expect(args.bundleName).assertEqual('com.samples.applicationcontext');
      const actual = requireContext();
      expect(actual.filesDir.endsWith('/files')).assertTrue();
      expect(actual.cacheDir.endsWith('/cache')).assertTrue();
      expect(actual.filesDir === actual.cacheDir).assertFalse();
    });
  });
}
