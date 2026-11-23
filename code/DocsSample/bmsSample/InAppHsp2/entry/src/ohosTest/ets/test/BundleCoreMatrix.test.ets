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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { BUNDLE_NAME, VENDOR, VERSION_NAME, VERSION_CODE, ENTRY_MODULE, APP_NAME_TEXT, SELF_FLAGS,
  selfBundle, findModule, appContext } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function bundleCoreMatrixTest() {
  describe('BundleCoreMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0001
     * @tc.name      testBundleCore0001
     * @tc.desc      Bundle name keeps character at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 0;
      logCase('testBundleCore0001', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('o');
      expect(name.charCodeAt(probe)).assertEqual(111);
      expect(name.substring(probe)).assertEqual('ohos.app.hap.myapplication');
      expect(name.substring(probe, 3)).assertEqual('oho');
      expect(name.indexOf('o', probe)).assertEqual(0);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0002
     * @tc.name      testBundleCore0002
     * @tc.desc      Bundle name keeps character at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 1;
      logCase('testBundleCore0002', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('h');
      expect(name.charCodeAt(probe)).assertEqual(104);
      expect(name.substring(probe)).assertEqual('hos.app.hap.myapplication');
      expect(name.substring(probe, 4)).assertEqual('hos');
      expect(name.indexOf('h', probe)).assertEqual(1);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0003
     * @tc.name      testBundleCore0003
     * @tc.desc      Bundle name keeps character at offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 2;
      logCase('testBundleCore0003', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('o');
      expect(name.charCodeAt(probe)).assertEqual(111);
      expect(name.substring(probe)).assertEqual('os.app.hap.myapplication');
      expect(name.substring(probe, 5)).assertEqual('os.');
      expect(name.indexOf('o', probe)).assertEqual(2);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0004
     * @tc.name      testBundleCore0004
     * @tc.desc      Bundle name keeps character at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 3;
      logCase('testBundleCore0004', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('s');
      expect(name.charCodeAt(probe)).assertEqual(115);
      expect(name.substring(probe)).assertEqual('s.app.hap.myapplication');
      expect(name.substring(probe, 6)).assertEqual('s.a');
      expect(name.indexOf('s', probe)).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0005
     * @tc.name      testBundleCore0005
     * @tc.desc      Bundle name keeps character at offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 4;
      logCase('testBundleCore0005', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('.');
      expect(name.charCodeAt(probe)).assertEqual(46);
      expect(name.substring(probe)).assertEqual('.app.hap.myapplication');
      expect(name.substring(probe, 7)).assertEqual('.ap');
      expect(name.indexOf('.', probe)).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0006
     * @tc.name      testBundleCore0006
     * @tc.desc      Bundle name keeps character at offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 5;
      logCase('testBundleCore0006', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('a');
      expect(name.charCodeAt(probe)).assertEqual(97);
      expect(name.substring(probe)).assertEqual('app.hap.myapplication');
      expect(name.substring(probe, 8)).assertEqual('app');
      expect(name.indexOf('a', probe)).assertEqual(5);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0007
     * @tc.name      testBundleCore0007
     * @tc.desc      Bundle name keeps character at offset 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 8;
      logCase('testBundleCore0007', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('.');
      expect(name.charCodeAt(probe)).assertEqual(46);
      expect(name.substring(probe)).assertEqual('.hap.myapplication');
      expect(name.substring(probe, 11)).assertEqual('.ha');
      expect(name.indexOf('.', probe)).assertEqual(8);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0008
     * @tc.name      testBundleCore0008
     * @tc.desc      Bundle name keeps character at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 9;
      logCase('testBundleCore0008', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('h');
      expect(name.charCodeAt(probe)).assertEqual(104);
      expect(name.substring(probe)).assertEqual('hap.myapplication');
      expect(name.substring(probe, 12)).assertEqual('hap');
      expect(name.indexOf('h', probe)).assertEqual(9);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0009
     * @tc.name      testBundleCore0009
     * @tc.desc      Bundle name keeps character at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 12;
      logCase('testBundleCore0009', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('.');
      expect(name.charCodeAt(probe)).assertEqual(46);
      expect(name.substring(probe)).assertEqual('.myapplication');
      expect(name.substring(probe, 15)).assertEqual('.my');
      expect(name.indexOf('.', probe)).assertEqual(12);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0010
     * @tc.name      testBundleCore0010
     * @tc.desc      Bundle name keeps character at offset 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 13;
      logCase('testBundleCore0010', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('m');
      expect(name.charCodeAt(probe)).assertEqual(109);
      expect(name.substring(probe)).assertEqual('myapplication');
      expect(name.substring(probe, 16)).assertEqual('mya');
      expect(name.indexOf('m', probe)).assertEqual(13);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0011
     * @tc.name      testBundleCore0011
     * @tc.desc      Bundle name keeps character at offset 20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 20;
      logCase('testBundleCore0011', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('c');
      expect(name.charCodeAt(probe)).assertEqual(99);
      expect(name.substring(probe)).assertEqual('cation');
      expect(name.substring(probe, 23)).assertEqual('cat');
      expect(name.indexOf('c', probe)).assertEqual(20);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0012
     * @tc.name      testBundleCore0012
     * @tc.desc      Bundle name keeps character at offset 21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 21;
      logCase('testBundleCore0012', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('a');
      expect(name.charCodeAt(probe)).assertEqual(97);
      expect(name.substring(probe)).assertEqual('ation');
      expect(name.substring(probe, 24)).assertEqual('ati');
      expect(name.indexOf('a', probe)).assertEqual(21);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0013
     * @tc.name      testBundleCore0013
     * @tc.desc      Bundle name keeps character at offset 24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 24;
      logCase('testBundleCore0013', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('o');
      expect(name.charCodeAt(probe)).assertEqual(111);
      expect(name.substring(probe)).assertEqual('on');
      expect(name.substring(probe, 26)).assertEqual('on');
      expect(name.indexOf('o', probe)).assertEqual(24);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0014
     * @tc.name      testBundleCore0014
     * @tc.desc      Bundle name keeps character at offset 25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      const probe: number = 25;
      logCase('testBundleCore0014', 'name offset ' + probe);
      expect(name).assertEqual(BUNDLE_NAME);
      expect(name.length).assertEqual(26);
      expect(name.charAt(probe)).assertEqual('n');
      expect(name.charCodeAt(probe)).assertEqual(110);
      expect(name.substring(probe)).assertEqual('n');
      expect(name.substring(probe, 26)).assertEqual('n');
      expect(name.indexOf('n', probe)).assertEqual(25);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0015
     * @tc.name      testBundleCore0015
     * @tc.desc      Bundle name locates token ohos
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0015', 'token ohos');
      expect(name.indexOf('ohos')).assertEqual(0);
      expect(name.includes('ohos')).assertEqual(true);
      expect(name.indexOf('ohos') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[0].length).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0016
     * @tc.name      testBundleCore0016
     * @tc.desc      Bundle name locates token app
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0016', 'token app');
      expect(name.indexOf('app')).assertEqual(5);
      expect(name.includes('app')).assertEqual(true);
      expect(name.indexOf('app') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[1].length).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0017
     * @tc.name      testBundleCore0017
     * @tc.desc      Bundle name locates token hap
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0017', 'token hap');
      expect(name.indexOf('hap')).assertEqual(9);
      expect(name.includes('hap')).assertEqual(true);
      expect(name.indexOf('hap') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[2].length).assertEqual(3);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0018
     * @tc.name      testBundleCore0018
     * @tc.desc      Bundle name locates token myapplication
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0018', 'token myapplication');
      expect(name.indexOf('myapplication')).assertEqual(13);
      expect(name.includes('myapplication')).assertEqual(true);
      expect(name.indexOf('myapplication') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[3].length).assertEqual(13);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0019
     * @tc.name      testBundleCore0019
     * @tc.desc      Bundle name locates token .
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleCore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0019', 'token .');
      expect(name.indexOf('.')).assertEqual(4);
      expect(name.includes('.')).assertEqual(true);
      expect(name.indexOf('.') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[0].length).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0020
     * @tc.name      testBundleCore0020
     * @tc.desc      Bundle name locates token hsp
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0020', 'token hsp');
      expect(name.indexOf('hsp')).assertEqual(-1);
      expect(name.includes('hsp')).assertEqual(false);
      expect(name.indexOf('hsp') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[3]).assertEqual('myapplication');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0021
     * @tc.name      testBundleCore0021
     * @tc.desc      Bundle name locates token application
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0021', 'token application');
      expect(name.indexOf('application')).assertEqual(15);
      expect(name.includes('application')).assertEqual(true);
      expect(name.indexOf('application') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[3].length).assertEqual(13);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0022
     * @tc.name      testBundleCore0022
     * @tc.desc      Bundle name locates token ohos.app
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const name: string = info.name;
      logCase('testBundleCore0022', 'token ohos.app');
      expect(name.indexOf('ohos.app')).assertEqual(0);
      expect(name.includes('ohos.app')).assertEqual(true);
      expect(name.indexOf('ohos.app') <= 26).assertTrue();
      expect(name.startsWith('ohos')).assertTrue();
      expect(name.endsWith('myapplication')).assertTrue();
      expect(name.split('.').length).assertEqual(4);
      expect(name.split('.')[0].length).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0023
     * @tc.name      testBundleCore0023
     * @tc.desc      Bundle vendor keeps character at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 0;
      logCase('testBundleCore0023', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('e');
      expect(vendor.substring(probe)).assertEqual('example');
      expect(vendor.indexOf('e')).assertEqual(0);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0024
     * @tc.name      testBundleCore0024
     * @tc.desc      Bundle vendor keeps character at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 1;
      logCase('testBundleCore0024', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('x');
      expect(vendor.substring(probe)).assertEqual('xample');
      expect(vendor.indexOf('x')).assertEqual(1);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0025
     * @tc.name      testBundleCore0025
     * @tc.desc      Bundle vendor keeps character at offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 2;
      logCase('testBundleCore0025', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('a');
      expect(vendor.substring(probe)).assertEqual('ample');
      expect(vendor.indexOf('a')).assertEqual(2);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0026
     * @tc.name      testBundleCore0026
     * @tc.desc      Bundle vendor keeps character at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 3;
      logCase('testBundleCore0026', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('m');
      expect(vendor.substring(probe)).assertEqual('mple');
      expect(vendor.indexOf('m')).assertEqual(3);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0027
     * @tc.name      testBundleCore0027
     * @tc.desc      Bundle vendor keeps character at offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 4;
      logCase('testBundleCore0027', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('p');
      expect(vendor.substring(probe)).assertEqual('ple');
      expect(vendor.indexOf('p')).assertEqual(4);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0028
     * @tc.name      testBundleCore0028
     * @tc.desc      Bundle vendor keeps character at offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 5;
      logCase('testBundleCore0028', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('l');
      expect(vendor.substring(probe)).assertEqual('le');
      expect(vendor.indexOf('l')).assertEqual(5);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0029
     * @tc.name      testBundleCore0029
     * @tc.desc      Bundle vendor keeps character at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      const probe: number = 6;
      logCase('testBundleCore0029', 'vendor offset ' + probe);
      expect(vendor).assertEqual(VENDOR);
      expect(vendor.length).assertEqual(7);
      expect(vendor.charAt(probe)).assertEqual('e');
      expect(vendor.substring(probe)).assertEqual('e');
      expect(vendor.indexOf('e')).assertEqual(0);
      expect(vendor.toUpperCase()).assertEqual('EXAMPLE');
    });
    /**
     * @tc.number    SUB_IHSP_BUNDLE_0030
     * @tc.name      testBundleCore0030
     * @tc.desc      Vendor keeps the first and last character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleCore0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const vendor: string = info.vendor;
      logCase('testBundleCore0030', 'vendor edges');
      expect(vendor.startsWith('e')).assertTrue();
      expect(vendor.endsWith('e')).assertTrue();
      expect(vendor.substring(2, 5)).assertEqual('amp');
      expect(vendor.lastIndexOf('e')).assertEqual(6);
      expect(vendor.toUpperCase().length).assertEqual(vendor.length);
      expect(vendor.trim()).assertEqual(vendor);
    });
;
  });
}
