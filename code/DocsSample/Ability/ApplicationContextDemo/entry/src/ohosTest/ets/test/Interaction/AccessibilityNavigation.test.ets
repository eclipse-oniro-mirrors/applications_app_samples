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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { common, contextConstant } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import { requireContext, requireModule, requireBundleInfo, byteLength, payload, probeFile, probeEvents,
  probeIndex, switchArea, FileProbe, EventProbe, IndexProbe } from '../Shared/ContextProbe';

export default function accessibilityNavigationTest(): void {
  describe('AccessibilityNavigation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'AccessibilityNavigation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0001
     * @tc.name AccessibilityNavigation_001
     * @tc.desc Verify Index 5 clicks followed by directional keys [2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2012];
      const actual: IndexProbe = await probeIndex(5, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = 'Welcome';
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0002
     * @tc.name AccessibilityNavigation_002
     * @tc.desc Verify Index 8 clicks followed by directional keys [2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2012];
      const actual: IndexProbe = await probeIndex(8, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = 'Welcome';
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0003
     * @tc.name AccessibilityNavigation_003
     * @tc.desc Verify Index 13 clicks followed by directional keys [2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2012];
      const actual: IndexProbe = await probeIndex(13, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = 'Welcome';
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0004
     * @tc.name AccessibilityNavigation_004
     * @tc.desc Verify Index 0 clicks followed by directional keys [2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2013];
      const actual: IndexProbe = await probeIndex(0, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = actual.initial;
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0005
     * @tc.name AccessibilityNavigation_005
     * @tc.desc Verify Index 1 clicks followed by directional keys [2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2013];
      const actual: IndexProbe = await probeIndex(1, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = 'Welcome';
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0006
     * @tc.name AccessibilityNavigation_006
     * @tc.desc Verify Index 2 clicks followed by directional keys [2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2013];
      const actual: IndexProbe = await probeIndex(2, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = 'Welcome';
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_ACCESSIBILITYNAVIGATION_0007
     * @tc.name AccessibilityNavigation_007
     * @tc.desc Verify Index 3 clicks followed by directional keys [2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('AccessibilityNavigation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015, 2013];
      const actual: IndexProbe = await probeIndex(3, keys, false);
      expect(actual.count).assertEqual(1);
      expect(actual.bundleName).assertEqual('com.samples.applicationcontext');
      expect(actual.initial === 'Hello World' || actual.initial === 'Welcome').assertTrue();
      const expected: string = 'Welcome';
      expect(actual.final).assertEqual(expected);
      expect(context.filesDir).assertEqual(files);
      expect(context.cacheDir).assertEqual(cache);
      const module: common.Context = await requireModule();
      expect(module.applicationInfo.name).assertEqual('com.samples.applicationcontext');
      expect(module.resourceManager.getStringByNameSync('module_desc')).assertEqual('module description');
    });
  });
}
