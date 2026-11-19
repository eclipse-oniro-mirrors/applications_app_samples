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

export default function contextInputInteractionTest(): void {
  describe('ContextInputInteraction', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'ContextInputInteraction completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0001
     * @tc.name ContextInputInteraction_001
     * @tc.desc Verify Index 0 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0002
     * @tc.name ContextInputInteraction_002
     * @tc.desc Verify Index 1 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0003
     * @tc.name ContextInputInteraction_003
     * @tc.desc Verify Index 2 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0004
     * @tc.name ContextInputInteraction_004
     * @tc.desc Verify Index 3 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0005
     * @tc.name ContextInputInteraction_005
     * @tc.desc Verify Index 5 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0006
     * @tc.name ContextInputInteraction_006
     * @tc.desc Verify Index 8 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0007
     * @tc.name ContextInputInteraction_007
     * @tc.desc Verify Index 13 clicks followed by directional keys []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0008
     * @tc.name ContextInputInteraction_008
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0009
     * @tc.name ContextInputInteraction_009
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0010
     * @tc.name ContextInputInteraction_010
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0011
     * @tc.name ContextInputInteraction_011
     * @tc.desc Verify Index 3 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0012
     * @tc.name ContextInputInteraction_012
     * @tc.desc Verify Index 5 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0013
     * @tc.name ContextInputInteraction_013
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0014
     * @tc.name ContextInputInteraction_014
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0015
     * @tc.name ContextInputInteraction_015
     * @tc.desc Verify Index 0 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0016
     * @tc.name ContextInputInteraction_016
     * @tc.desc Verify Index 1 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0017
     * @tc.name ContextInputInteraction_017
     * @tc.desc Verify Index 2 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0018
     * @tc.name ContextInputInteraction_018
     * @tc.desc Verify Index 3 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0019
     * @tc.name ContextInputInteraction_019
     * @tc.desc Verify Index 5 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0020
     * @tc.name ContextInputInteraction_020
     * @tc.desc Verify Index 8 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0021
     * @tc.name ContextInputInteraction_021
     * @tc.desc Verify Index 13 clicks followed by directional keys [2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_CONTEXTINPUTINTERACTION_0022
     * @tc.name ContextInputInteraction_022
     * @tc.desc Verify Index 0 clicks followed by directional keys [2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('ContextInputInteraction_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2012];
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
  });
}
