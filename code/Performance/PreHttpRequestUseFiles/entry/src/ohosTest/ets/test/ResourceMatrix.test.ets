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
