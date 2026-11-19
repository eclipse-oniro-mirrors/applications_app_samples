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

export default function gestureRecognitionTest(): void {
  describe('GestureRecognition', () => {
    beforeAll((): void => {
      expect(requireContext().applicationInfo.name).assertEqual('com.samples.applicationcontext');
    });
    afterAll((): void => {
      hilog.info(0xF811, 'ContextTests', 'GestureRecognition completed');
    });
    /**
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0001
     * @tc.name GestureRecognition_001
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014, 2015, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_001', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0002
     * @tc.name GestureRecognition_002
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014, 2015, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_002', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0003
     * @tc.name GestureRecognition_003
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_003', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0004
     * @tc.name GestureRecognition_004
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_004', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0005
     * @tc.name GestureRecognition_005
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_005', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0006
     * @tc.name GestureRecognition_006
     * @tc.desc Verify Index 3 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_006', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0007
     * @tc.name GestureRecognition_007
     * @tc.desc Verify Index 5 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_007', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0008
     * @tc.name GestureRecognition_008
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_008', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0009
     * @tc.name GestureRecognition_009
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014, 2015, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_009', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0010
     * @tc.name GestureRecognition_010
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_010', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0011
     * @tc.name GestureRecognition_011
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_011', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0012
     * @tc.name GestureRecognition_012
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_012', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0013
     * @tc.name GestureRecognition_013
     * @tc.desc Verify Index 3 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_013', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0014
     * @tc.name GestureRecognition_014
     * @tc.desc Verify Index 5 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_014', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0015
     * @tc.name GestureRecognition_015
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_015', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0016
     * @tc.name GestureRecognition_016
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014, 2015, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_016', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0017
     * @tc.name GestureRecognition_017
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_017', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0018
     * @tc.name GestureRecognition_018
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_018', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0019
     * @tc.name GestureRecognition_019
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_019', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0020
     * @tc.name GestureRecognition_020
     * @tc.desc Verify Index 3 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_020', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0021
     * @tc.name GestureRecognition_021
     * @tc.desc Verify Index 5 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_021', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0022
     * @tc.name GestureRecognition_022
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_022', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0023
     * @tc.name GestureRecognition_023
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014, 2015, 2013]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_023', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2015, 2013];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0024
     * @tc.name GestureRecognition_024
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_024', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0025
     * @tc.name GestureRecognition_025
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_025', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0026
     * @tc.name GestureRecognition_026
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_026', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0027
     * @tc.name GestureRecognition_027
     * @tc.desc Verify Index 3 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_027', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0028
     * @tc.name GestureRecognition_028
     * @tc.desc Verify Index 5 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_028', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0029
     * @tc.name GestureRecognition_029
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_029', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0030
     * @tc.name GestureRecognition_030
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014, 2012, 2014]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_030', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2014];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0031
     * @tc.name GestureRecognition_031
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_031', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0032
     * @tc.name GestureRecognition_032
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_032', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0033
     * @tc.name GestureRecognition_033
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_033', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0034
     * @tc.name GestureRecognition_034
     * @tc.desc Verify Index 3 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_034', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0035
     * @tc.name GestureRecognition_035
     * @tc.desc Verify Index 5 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_035', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0036
     * @tc.name GestureRecognition_036
     * @tc.desc Verify Index 8 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_036', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0037
     * @tc.name GestureRecognition_037
     * @tc.desc Verify Index 13 clicks followed by directional keys [2014, 2012, 2015]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_037', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2015];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0038
     * @tc.name GestureRecognition_038
     * @tc.desc Verify Index 0 clicks followed by directional keys [2014, 2012, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_038', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0039
     * @tc.name GestureRecognition_039
     * @tc.desc Verify Index 1 clicks followed by directional keys [2014, 2012, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_039', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2012];
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
     * @tc.number SUB_APPLICATIONCONTEXT_GESTURERECOGNITION_0040
     * @tc.name GestureRecognition_040
     * @tc.desc Verify Index 2 clicks followed by directional keys [2014, 2012, 2012]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('GestureRecognition_040', 0, async (): Promise<void> => {
      const context: common.ApplicationContext = requireContext();
      const files: string = context.filesDir;
      const cache: string = context.cacheDir;
      const keys: number[] = [2014, 2012, 2012];
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
