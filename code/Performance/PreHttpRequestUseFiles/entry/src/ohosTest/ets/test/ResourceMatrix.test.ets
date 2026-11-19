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
import { resourceManager } from '@kit.LocalizationKit';
import { moduleContext } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

class PngFacts {
  static width(bytes: Uint8Array): number {
    return (bytes[16] << 24 >>> 0) + (bytes[17] << 16) + (bytes[18] << 8) + bytes[19];
  }

  static height(bytes: Uint8Array): number {
    return (bytes[20] << 24 >>> 0) + (bytes[21] << 16) + (bytes[22] << 8) + bytes[23];
  }

  static chunkType(bytes: Uint8Array): string {
    return String.fromCharCode(bytes[12], bytes[13], bytes[14], bytes[15]);
  }

  static firstBytesSum(bytes: Uint8Array, count: number): number {
    let total: number = 0;
    for (let k: number = 0; k < count; k++) {
      total += bytes[k];
    }
    return total;
  }
}

function res(): resourceManager.ResourceManager {
  return moduleContext('entry').resourceManager;
}

export default function resourceMatrixTest() {
  describe('ResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0001
     * @tc.name      testResource0001
     * @tc.desc      String app_name keeps 19 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 3;
      logCase('testResource0001', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('I');
      expect(text.substring(probe, probe + 2)).assertEqual('Im');
      expect(text.charCodeAt(0)).assertEqual(85);
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0002
     * @tc.name      testResource0002
     * @tc.desc      String app_name keeps 19 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 6;
      logCase('testResource0002', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('g');
      expect(text.substring(probe, probe + 2)).assertEqual('ge');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('geHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0003
     * @tc.name      testResource0003
     * @tc.desc      String app_name keeps 19 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 9;
      logCase('testResource0003', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.substring(probe, probe + 2)).assertEqual('tt');
      expect(text.toUpperCase().length).assertEqual(19);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0004
     * @tc.name      testResource0004
     * @tc.desc      String app_name keeps 19 characters, probe at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 12;
      logCase('testResource0004', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('R');
      expect(text.substring(probe, probe + 2)).assertEqual('Re');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1945);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('Request');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0005
     * @tc.name      testResource0005
     * @tc.desc      String app_name keeps 19 characters, probe at offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 15;
      logCase('testResource0005', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('u');
      expect(text.substring(probe, probe + 2)).assertEqual('ue');
      expect(text.charCodeAt(0)).assertEqual(85);
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('uest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0006
     * @tc.name      testResource0006
     * @tc.desc      String app_name keeps 19 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 0;
      logCase('testResource0006', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('U');
      expect(text.substring(probe, probe + 2)).assertEqual('Us');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('UseImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0007
     * @tc.name      testResource0007
     * @tc.desc      String app_name keeps 19 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 3;
      logCase('testResource0007', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('I');
      expect(text.substring(probe, probe + 2)).assertEqual('Im');
      expect(text.toUpperCase().length).assertEqual(19);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0008
     * @tc.name      testResource0008
     * @tc.desc      String app_name keeps 19 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 6;
      logCase('testResource0008', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('g');
      expect(text.substring(probe, probe + 2)).assertEqual('ge');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1945);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('geHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0009
     * @tc.name      testResource0009
     * @tc.desc      String app_name keeps 19 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 9;
      logCase('testResource0009', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.substring(probe, probe + 2)).assertEqual('tt');
      expect(text.charCodeAt(0)).assertEqual(85);
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0010
     * @tc.name      testResource0010
     * @tc.desc      String app_name keeps 19 characters, probe at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 12;
      logCase('testResource0010', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('R');
      expect(text.substring(probe, probe + 2)).assertEqual('Re');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('Request');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0011
     * @tc.name      testResource0011
     * @tc.desc      String app_name keeps 19 characters, probe at offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 15;
      logCase('testResource0011', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('u');
      expect(text.substring(probe, probe + 2)).assertEqual('ue');
      expect(text.toUpperCase().length).assertEqual(19);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('uest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0012
     * @tc.name      testResource0012
     * @tc.desc      String app_name keeps 19 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 0;
      logCase('testResource0012', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('U');
      expect(text.substring(probe, probe + 2)).assertEqual('Us');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1945);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('UseImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0013
     * @tc.name      testResource0013
     * @tc.desc      String app_name keeps 19 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 3;
      logCase('testResource0013', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('I');
      expect(text.substring(probe, probe + 2)).assertEqual('Im');
      expect(text.charCodeAt(0)).assertEqual(85);
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0014
     * @tc.name      testResource0014
     * @tc.desc      String app_name keeps 19 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 6;
      logCase('testResource0014', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('g');
      expect(text.substring(probe, probe + 2)).assertEqual('ge');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('geHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0015
     * @tc.name      testResource0015
     * @tc.desc      String app_name keeps 19 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 9;
      logCase('testResource0015', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.substring(probe, probe + 2)).assertEqual('tt');
      expect(text.toUpperCase().length).assertEqual(19);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0016
     * @tc.name      testResource0016
     * @tc.desc      String app_name keeps 19 characters, probe at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 12;
      logCase('testResource0016', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('R');
      expect(text.substring(probe, probe + 2)).assertEqual('Re');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1945);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('Request');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0017
     * @tc.name      testResource0017
     * @tc.desc      String app_name keeps 19 characters, probe at offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 15;
      logCase('testResource0017', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('u');
      expect(text.substring(probe, probe + 2)).assertEqual('ue');
      expect(text.charCodeAt(0)).assertEqual(85);
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('uest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0018
     * @tc.name      testResource0018
     * @tc.desc      String app_name keeps 19 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 0;
      logCase('testResource0018', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('U');
      expect(text.substring(probe, probe + 2)).assertEqual('Us');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('UseImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0019
     * @tc.name      testResource0019
     * @tc.desc      String app_name keeps 19 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 3;
      logCase('testResource0019', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('I');
      expect(text.substring(probe, probe + 2)).assertEqual('Im');
      expect(text.toUpperCase().length).assertEqual(19);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ImageHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0020
     * @tc.name      testResource0020
     * @tc.desc      String app_name keeps 19 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('app_name');
      const probe: number = 6;
      logCase('testResource0020', `key=app_name probe=${probe}`);
      expect(text).assertEqual('UseImageHttpRequest');
      expect(text.length).assertEqual(19);
      expect(text.charAt(probe)).assertEqual('g');
      expect(text.substring(probe, probe + 2)).assertEqual('ge');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1945);
      expect(res().getStringByNameSync('app_name')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('geHttpRequest');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0021
     * @tc.name      testResource0021
     * @tc.desc      String module_desc keeps locale independent text shape, probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 1;
      logCase('testResource0021', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0022
     * @tc.name      testResource0022
     * @tc.desc      String module_desc keeps locale independent text shape, probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 2;
      logCase('testResource0022', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0023
     * @tc.name      testResource0023
     * @tc.desc      String module_desc keeps locale independent text shape, probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 3;
      logCase('testResource0023', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0024
     * @tc.name      testResource0024
     * @tc.desc      String module_desc keeps locale independent text shape, probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 4;
      logCase('testResource0024', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0025
     * @tc.name      testResource0025
     * @tc.desc      String module_desc keeps locale independent text shape, probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 0;
      logCase('testResource0025', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0026
     * @tc.name      testResource0026
     * @tc.desc      String module_desc keeps locale independent text shape, probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 1;
      logCase('testResource0026', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0027
     * @tc.name      testResource0027
     * @tc.desc      String module_desc keeps locale independent text shape, probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 2;
      logCase('testResource0027', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0028
     * @tc.name      testResource0028
     * @tc.desc      String module_desc keeps locale independent text shape, probe 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 3;
      logCase('testResource0028', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0029
     * @tc.name      testResource0029
     * @tc.desc      String module_desc keeps locale independent text shape, probe 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 4;
      logCase('testResource0029', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0030
     * @tc.name      testResource0030
     * @tc.desc      String module_desc keeps locale independent text shape, probe 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 0;
      logCase('testResource0030', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0031
     * @tc.name      testResource0031
     * @tc.desc      String module_desc keeps locale independent text shape, probe 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 1;
      logCase('testResource0031', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0032
     * @tc.name      testResource0032
     * @tc.desc      String module_desc keeps locale independent text shape, probe 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 2;
      logCase('testResource0032', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0033
     * @tc.name      testResource0033
     * @tc.desc      String module_desc keeps locale independent text shape, probe 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 3;
      logCase('testResource0033', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0034
     * @tc.name      testResource0034
     * @tc.desc      String module_desc keeps locale independent text shape, probe 14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 4;
      logCase('testResource0034', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0035
     * @tc.name      testResource0035
     * @tc.desc      String module_desc keeps locale independent text shape, probe 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 0;
      logCase('testResource0035', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0036
     * @tc.name      testResource0036
     * @tc.desc      String module_desc keeps locale independent text shape, probe 16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 1;
      logCase('testResource0036', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0037
     * @tc.name      testResource0037
     * @tc.desc      String module_desc keeps locale independent text shape, probe 17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 2;
      logCase('testResource0037', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0038
     * @tc.name      testResource0038
     * @tc.desc      String module_desc keeps locale independent text shape, probe 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 3;
      logCase('testResource0038', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0039
     * @tc.name      testResource0039
     * @tc.desc      String module_desc keeps locale independent text shape, probe 19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 4;
      logCase('testResource0039', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0040
     * @tc.name      testResource0040
     * @tc.desc      String module_desc keeps locale independent text shape, probe 20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('module_desc');
      const probe: number = 0;
      logCase('testResource0040', `key=module_desc probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('module_desc'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0041
     * @tc.name      testResource0041
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 5;
      logCase('testResource0041', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('ip');
      expect(text.charCodeAt(0)).assertEqual(100);
      expect(text.charAt(text.length - 1)).assertEqual('n');
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('iption');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0042
     * @tc.name      testResource0042
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 8;
      logCase('testResource0042', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('io');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ion');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0043
     * @tc.name      testResource0043
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 1;
      logCase('testResource0043', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('e');
      expect(text.substring(probe, probe + 2)).assertEqual('es');
      expect(text.toUpperCase().length).assertEqual(11);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('escription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0044
     * @tc.name      testResource0044
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 4;
      logCase('testResource0044', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('r');
      expect(text.substring(probe, probe + 2)).assertEqual('ri');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1188);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0045
     * @tc.name      testResource0045
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 7;
      logCase('testResource0045', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.substring(probe, probe + 2)).assertEqual('ti');
      expect(text.charCodeAt(0)).assertEqual(100);
      expect(text.charAt(text.length - 1)).assertEqual('n');
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('tion');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0046
     * @tc.name      testResource0046
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 0;
      logCase('testResource0046', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('d');
      expect(text.substring(probe, probe + 2)).assertEqual('de');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('description');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0047
     * @tc.name      testResource0047
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 3;
      logCase('testResource0047', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('c');
      expect(text.substring(probe, probe + 2)).assertEqual('cr');
      expect(text.toUpperCase().length).assertEqual(11);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('cription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0048
     * @tc.name      testResource0048
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 6;
      logCase('testResource0048', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.substring(probe, probe + 2)).assertEqual('pt');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1188);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ption');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0049
     * @tc.name      testResource0049
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 9;
      logCase('testResource0049', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('o');
      expect(text.substring(probe, probe + 2)).assertEqual('on');
      expect(text.charCodeAt(0)).assertEqual(100);
      expect(text.charAt(text.length - 1)).assertEqual('n');
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('on');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0050
     * @tc.name      testResource0050
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 2;
      logCase('testResource0050', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('sc');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('scription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0051
     * @tc.name      testResource0051
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 5;
      logCase('testResource0051', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('ip');
      expect(text.toUpperCase().length).assertEqual(11);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('iption');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0052
     * @tc.name      testResource0052
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 8;
      logCase('testResource0052', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('io');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1188);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ion');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0053
     * @tc.name      testResource0053
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 1;
      logCase('testResource0053', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('e');
      expect(text.substring(probe, probe + 2)).assertEqual('es');
      expect(text.charCodeAt(0)).assertEqual(100);
      expect(text.charAt(text.length - 1)).assertEqual('n');
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('escription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0054
     * @tc.name      testResource0054
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 4;
      logCase('testResource0054', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('r');
      expect(text.substring(probe, probe + 2)).assertEqual('ri');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0055
     * @tc.name      testResource0055
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 7;
      logCase('testResource0055', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('t');
      expect(text.substring(probe, probe + 2)).assertEqual('ti');
      expect(text.toUpperCase().length).assertEqual(11);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('tion');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0056
     * @tc.name      testResource0056
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 0;
      logCase('testResource0056', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('d');
      expect(text.substring(probe, probe + 2)).assertEqual('de');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1188);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('description');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0057
     * @tc.name      testResource0057
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 3;
      logCase('testResource0057', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('c');
      expect(text.substring(probe, probe + 2)).assertEqual('cr');
      expect(text.charCodeAt(0)).assertEqual(100);
      expect(text.charAt(text.length - 1)).assertEqual('n');
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('cription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0058
     * @tc.name      testResource0058
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 6;
      logCase('testResource0058', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.substring(probe, probe + 2)).assertEqual('pt');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('ption');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0059
     * @tc.name      testResource0059
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 9;
      logCase('testResource0059', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('o');
      expect(text.substring(probe, probe + 2)).assertEqual('on');
      expect(text.toUpperCase().length).assertEqual(11);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('on');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0060
     * @tc.name      testResource0060
     * @tc.desc      String EntryAbility_desc keeps 11 characters, probe at offset 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_desc');
      const probe: number = 2;
      logCase('testResource0060', `key=EntryAbility_desc probe=${probe}`);
      expect(text).assertEqual('description');
      expect(text.length).assertEqual(11);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('sc');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(1188);
      expect(res().getStringByNameSync('EntryAbility_desc')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('scription');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0061
     * @tc.name      testResource0061
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 6;
      logCase('testResource0061', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.substring(probe, probe + 2)).assertEqual('pR');
      expect(text.charCodeAt(0)).assertEqual(80);
      expect(text.charAt(text.length - 1)).assertEqual('s');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('pRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0062
     * @tc.name      testResource0062
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 9;
      logCase('testResource0062', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('q');
      expect(text.substring(probe, probe + 2)).assertEqual('qu');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('questUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0063
     * @tc.name      testResource0063
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 12;
      logCase('testResource0063', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('st');
      expect(text.toUpperCase().length).assertEqual(22);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('stUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0064
     * @tc.name      testResource0064
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 15;
      logCase('testResource0064', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('se');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(2256);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('seFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0065
     * @tc.name      testResource0065
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 18;
      logCase('testResource0065', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('il');
      expect(text.charCodeAt(0)).assertEqual(80);
      expect(text.charAt(text.length - 1)).assertEqual('s');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('iles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0066
     * @tc.name      testResource0066
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 0;
      logCase('testResource0066', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('P');
      expect(text.substring(probe, probe + 2)).assertEqual('Pr');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('PreHttpRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0067
     * @tc.name      testResource0067
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 3;
      logCase('testResource0067', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('H');
      expect(text.substring(probe, probe + 2)).assertEqual('Ht');
      expect(text.toUpperCase().length).assertEqual(22);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('HttpRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0068
     * @tc.name      testResource0068
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 6;
      logCase('testResource0068', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.substring(probe, probe + 2)).assertEqual('pR');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(2256);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('pRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0069
     * @tc.name      testResource0069
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 9;
      logCase('testResource0069', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('q');
      expect(text.substring(probe, probe + 2)).assertEqual('qu');
      expect(text.charCodeAt(0)).assertEqual(80);
      expect(text.charAt(text.length - 1)).assertEqual('s');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('questUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0070
     * @tc.name      testResource0070
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 12;
      logCase('testResource0070', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('st');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('stUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0071
     * @tc.name      testResource0071
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 15;
      logCase('testResource0071', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('se');
      expect(text.toUpperCase().length).assertEqual(22);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('seFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0072
     * @tc.name      testResource0072
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 18;
      logCase('testResource0072', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('il');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(2256);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('iles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0073
     * @tc.name      testResource0073
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 0;
      logCase('testResource0073', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('P');
      expect(text.substring(probe, probe + 2)).assertEqual('Pr');
      expect(text.charCodeAt(0)).assertEqual(80);
      expect(text.charAt(text.length - 1)).assertEqual('s');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('PreHttpRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0074
     * @tc.name      testResource0074
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 3;
      logCase('testResource0074', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('H');
      expect(text.substring(probe, probe + 2)).assertEqual('Ht');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('HttpRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0075
     * @tc.name      testResource0075
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 6;
      logCase('testResource0075', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('p');
      expect(text.substring(probe, probe + 2)).assertEqual('pR');
      expect(text.toUpperCase().length).assertEqual(22);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('pRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0076
     * @tc.name      testResource0076
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 9;
      logCase('testResource0076', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('q');
      expect(text.substring(probe, probe + 2)).assertEqual('qu');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(2256);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('questUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0077
     * @tc.name      testResource0077
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 12;
      logCase('testResource0077', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('st');
      expect(text.charCodeAt(0)).assertEqual(80);
      expect(text.charAt(text.length - 1)).assertEqual('s');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('stUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0078
     * @tc.name      testResource0078
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 15;
      logCase('testResource0078', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('s');
      expect(text.substring(probe, probe + 2)).assertEqual('se');
      expect(text.split(' ').length).assertEqual(1);
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('seFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0079
     * @tc.name      testResource0079
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 18;
      logCase('testResource0079', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('i');
      expect(text.substring(probe, probe + 2)).assertEqual('il');
      expect(text.toUpperCase().length).assertEqual(22);
      expect(text.trim()).assertEqual(text);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('iles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0080
     * @tc.name      testResource0080
     * @tc.desc      String EntryAbility_label keeps 22 characters, probe at offset 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResource0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = res().getStringByNameSync('EntryAbility_label');
      const probe: number = 0;
      logCase('testResource0080', `key=EntryAbility_label probe=${probe}`);
      expect(text).assertEqual('PreHttpRequestUseFiles');
      expect(text.length).assertEqual(22);
      expect(text.charAt(probe)).assertEqual('P');
      expect(text.substring(probe, probe + 2)).assertEqual('Pr');
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum).assertEqual(2256);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual(text);
      expect(text.substring(probe)).assertEqual('PreHttpRequestUseFiles');
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0081
     * @tc.name      testResource0081
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 1;
      logCase('testResource0081', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0082
     * @tc.name      testResource0082
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 2;
      logCase('testResource0082', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0083
     * @tc.name      testResource0083
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 3;
      logCase('testResource0083', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0084
     * @tc.name      testResource0084
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 4;
      logCase('testResource0084', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0085
     * @tc.name      testResource0085
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 0;
      logCase('testResource0085', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0086
     * @tc.name      testResource0086
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 1;
      logCase('testResource0086', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0087
     * @tc.name      testResource0087
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 2;
      logCase('testResource0087', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0088
     * @tc.name      testResource0088
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 3;
      logCase('testResource0088', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0089
     * @tc.name      testResource0089
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 4;
      logCase('testResource0089', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0090
     * @tc.name      testResource0090
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 0;
      logCase('testResource0090', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0091
     * @tc.name      testResource0091
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 1;
      logCase('testResource0091', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0092
     * @tc.name      testResource0092
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 2;
      logCase('testResource0092', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0093
     * @tc.name      testResource0093
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 3;
      logCase('testResource0093', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0094
     * @tc.name      testResource0094
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 4;
      logCase('testResource0094', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0095
     * @tc.name      testResource0095
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 0;
      logCase('testResource0095', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0096
     * @tc.name      testResource0096
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 1;
      logCase('testResource0096', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0097
     * @tc.name      testResource0097
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 2;
      logCase('testResource0097', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.charCodeAt(0) > 0).assertTrue();
      expect(text.charAt(text.length - 1) !== ' ').assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0098
     * @tc.name      testResource0098
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 3;
      logCase('testResource0098', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.indexOf(text.charAt(probe)) >= 0).assertTrue();
      expect(text.substring(probe).length).assertEqual(text.length - probe);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0099
     * @tc.name      testResource0099
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 4;
      logCase('testResource0099', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      expect(text.slice(0, 1).length).assertEqual(1);
      expect(text.substring(1).length).assertEqual(text.length - 1);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0100
     * @tc.name      testResource0100
     * @tc.desc      String internet_reason keeps locale independent text shape, probe 20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = res().getStringByNameSync('internet_reason');
      const probe: number = 0;
      logCase('testResource0100', `key=internet_reason probe=${probe}`);
      expect(text.length > 0).assertTrue();
      expect(text).assertEqual(res().getStringByNameSync('internet_reason'));
      expect(text.trim()).assertEqual(text);
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.split('').length).assertEqual(text.length);
      expect(text.indexOf('\n')).assertEqual(-1);
      expect(text.indexOf('\t')).assertEqual(-1);
      let sum: number = 0;
      for (let i: number = 0; i < text.length; i++) {
        sum += text.charCodeAt(i);
      }
      expect(sum >= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0101
     * @tc.name      testResource0101
     * @tc.desc      Media startIcon keeps 20093 bytes, probe at offset 37
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = res().getMediaByNameSync('startIcon');
      const probe: number = 37;
      logCase('testResource0101', `media=startIcon probe=${probe}`);
      expect(bytes.length).assertEqual(20093);
      expect(bytes[0]).assertEqual(0x89);
      expect(bytes[1]).assertEqual(0x50);
      expect(bytes[probe]).assertEqual(103);
      expect(bytes[probe + 1]).assertEqual(65);
      expect(bytes[probe + 2]).assertEqual(77);
      expect(bytes[probe + 3]).assertEqual(65);
      expect(PngFacts.chunkType(bytes)).assertEqual('IHDR');
      expect(PngFacts.width(bytes)).assertEqual(144);
      expect(PngFacts.height(bytes)).assertEqual(144);
      expect(bytes.slice(probe, probe + 4).length).assertEqual(4);
      expect(PngFacts.width(bytes) * PngFacts.height(bytes)).assertEqual(20736);
    });
    /**
     * @tc.number    SUB_PREHTTP_RES_0102
     * @tc.name      testResource0102
     * @tc.desc      Media startIcon keeps 20093 bytes, probe at offset 74
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResource0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = res().getMediaByNameSync('startIcon');
      const probe: number = 74;
      logCase('testResource0102', `media=startIcon probe=${probe}`);
      expect(bytes.length).assertEqual(20093);
      expect(bytes[0]).assertEqual(0x89);
      expect(bytes[1]).assertEqual(0x50);
