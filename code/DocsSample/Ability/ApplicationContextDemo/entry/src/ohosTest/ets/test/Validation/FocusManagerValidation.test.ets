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

export default function focusManagerValidationTest(): void {
  describe('FocusManagerValidation', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'FocusManagerValidation completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0001
     * @tc.name FocusManagerValidation_001
     * @tc.desc Verify Index 1 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0002
     * @tc.name FocusManagerValidation_002
     * @tc.desc Verify Index 2 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0003
     * @tc.name FocusManagerValidation_003
     * @tc.desc Verify Index 3 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0004
     * @tc.name FocusManagerValidation_004
     * @tc.desc Verify Index 5 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0005
     * @tc.name FocusManagerValidation_005
     * @tc.desc Verify Index 8 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0006
     * @tc.name FocusManagerValidation_006
     * @tc.desc Verify Index 13 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0007
     * @tc.name FocusManagerValidation_007
     * @tc.desc Verify Index 0 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0008
     * @tc.name FocusManagerValidation_008
     * @tc.desc Verify Index 1 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0009
     * @tc.name FocusManagerValidation_009
     * @tc.desc Verify Index 2 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0010
     * @tc.name FocusManagerValidation_010
     * @tc.desc Verify Index 3 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0011
     * @tc.name FocusManagerValidation_011
     * @tc.desc Verify Index 5 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0012
     * @tc.name FocusManagerValidation_012
     * @tc.desc Verify Index 8 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0013
     * @tc.name FocusManagerValidation_013
     * @tc.desc Verify Index 13 clicks followed by directional keys [2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0014
     * @tc.name FocusManagerValidation_014
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0015
     * @tc.name FocusManagerValidation_015
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_FOCUSMANAGERVALIDATION_0016
     * @tc.name FocusManagerValidation_016
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('FocusManagerValidation_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2014];
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
  });
}
