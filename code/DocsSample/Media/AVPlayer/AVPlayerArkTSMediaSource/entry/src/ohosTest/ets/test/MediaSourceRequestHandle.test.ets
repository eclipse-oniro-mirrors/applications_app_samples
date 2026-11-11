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
import { beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HashMap } from '@kit.ArkTS';

const TAG: string = '[Sample_MediaSourceRequestHandle]';
const DOMAIN: number = 0xF812;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceRequestHandleTest(): void {
  describe('mediaSourceRequestHandleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0001
     * @tc.name      testExtRequestHandle0000
     * @tc.desc      Open 1 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0002
     * @tc.name      testExtRequestHandle0001
     * @tc.desc      Open 2 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0003
     * @tc.name      testExtRequestHandle0002
     * @tc.desc      Open 3 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0004
     * @tc.name      testExtRequestHandle0003
     * @tc.desc      Open 4 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0005
     * @tc.name      testExtRequestHandle0004
     * @tc.desc      Open 5 handles, close handle 5, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      const closeKey: number = 5;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0006
     * @tc.name      testExtRequestHandle0005
     * @tc.desc      Open 6 handles, close handle 6, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      const closeKey: number = 6;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0007
     * @tc.name      testExtRequestHandle0006
     * @tc.desc      Open 7 handles, close handle 7, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      const closeKey: number = 7;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0008
     * @tc.name      testExtRequestHandle0007
     * @tc.desc      Open 8 handles, close handle 8, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      const closeKey: number = 8;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0009
     * @tc.name      testExtRequestHandle0008
     * @tc.desc      Open 9 handles, close handle 9, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      const closeKey: number = 9;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0010
     * @tc.name      testExtRequestHandle0009
     * @tc.desc      Open 10 handles, close handle 10, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      const closeKey: number = 10;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0011
     * @tc.name      testExtRequestHandle0010
     * @tc.desc      Open 11 handles, close handle 11, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      const closeKey: number = 11;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0012
     * @tc.name      testExtRequestHandle0011
     * @tc.desc      Open 12 handles, close handle 12, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      const closeKey: number = 12;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0013
     * @tc.name      testExtRequestHandle0012
     * @tc.desc      Open 13 handles, close handle 13, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      const closeKey: number = 13;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0014
     * @tc.name      testExtRequestHandle0013
     * @tc.desc      Open 14 handles, close handle 14, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      const closeKey: number = 14;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0015
     * @tc.name      testExtRequestHandle0014
     * @tc.desc      Open 15 handles, close handle 15, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      const closeKey: number = 15;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0016
     * @tc.name      testExtRequestHandle0015
     * @tc.desc      Open 16 handles, close handle 16, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      const closeKey: number = 16;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(15);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0017
     * @tc.name      testExtRequestHandle0016
     * @tc.desc      Open 17 handles, close handle 17, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      const closeKey: number = 17;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0018
     * @tc.name      testExtRequestHandle0017
     * @tc.desc      Open 1 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0019
     * @tc.name      testExtRequestHandle0018
     * @tc.desc      Open 2 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0020
     * @tc.name      testExtRequestHandle0019
     * @tc.desc      Open 3 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0021
     * @tc.name      testExtRequestHandle0020
     * @tc.desc      Open 4 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0022
     * @tc.name      testExtRequestHandle0021
     * @tc.desc      Open 5 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0023
     * @tc.name      testExtRequestHandle0022
     * @tc.desc      Open 6 handles, close handle 5, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      const closeKey: number = 5;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0024
     * @tc.name      testExtRequestHandle0023
     * @tc.desc      Open 7 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0025
     * @tc.name      testExtRequestHandle0024
     * @tc.desc      Open 8 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0026
     * @tc.name      testExtRequestHandle0025
     * @tc.desc      Open 9 handles, close handle 8, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      const closeKey: number = 8;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0027
     * @tc.name      testExtRequestHandle0026
     * @tc.desc      Open 10 handles, close handle 7, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      const closeKey: number = 7;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0028
     * @tc.name      testExtRequestHandle0027
     * @tc.desc      Open 11 handles, close handle 6, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      const closeKey: number = 6;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0029
     * @tc.name      testExtRequestHandle0028
     * @tc.desc      Open 12 handles, close handle 5, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      const closeKey: number = 5;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0030
     * @tc.name      testExtRequestHandle0029
     * @tc.desc      Open 13 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0031
     * @tc.name      testExtRequestHandle0030
     * @tc.desc      Open 14 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0032
     * @tc.name      testExtRequestHandle0031
     * @tc.desc      Open 15 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0033
     * @tc.name      testExtRequestHandle0032
     * @tc.desc      Open 16 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(15);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0034
     * @tc.name      testExtRequestHandle0033
     * @tc.desc      Open 17 handles, close handle 17, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      const closeKey: number = 17;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0035
     * @tc.name      testExtRequestHandle0034
     * @tc.desc      Open 1 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0036
     * @tc.name      testExtRequestHandle0035
     * @tc.desc      Open 2 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0037
     * @tc.name      testExtRequestHandle0036
     * @tc.desc      Open 3 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0038
     * @tc.name      testExtRequestHandle0037
     * @tc.desc      Open 4 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0039
     * @tc.name      testExtRequestHandle0038
     * @tc.desc      Open 5 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0040
     * @tc.name      testExtRequestHandle0039
     * @tc.desc      Open 6 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0041
     * @tc.name      testExtRequestHandle0040
     * @tc.desc      Open 7 handles, close handle 6, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      const closeKey: number = 6;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0042
     * @tc.name      testExtRequestHandle0041
     * @tc.desc      Open 8 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0043
     * @tc.name      testExtRequestHandle0042
     * @tc.desc      Open 9 handles, close handle 7, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      const closeKey: number = 7;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0044
     * @tc.name      testExtRequestHandle0043
     * @tc.desc      Open 10 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0045
     * @tc.name      testExtRequestHandle0044
     * @tc.desc      Open 11 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0046
     * @tc.name      testExtRequestHandle0045
     * @tc.desc      Open 12 handles, close handle 10, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      const closeKey: number = 10;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0047
     * @tc.name      testExtRequestHandle0046
     * @tc.desc      Open 13 handles, close handle 8, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      const closeKey: number = 8;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0048
     * @tc.name      testExtRequestHandle0047
     * @tc.desc      Open 14 handles, close handle 6, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      const closeKey: number = 6;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0049
     * @tc.name      testExtRequestHandle0048
     * @tc.desc      Open 15 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0050
     * @tc.name      testExtRequestHandle0049
     * @tc.desc      Open 16 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(15);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0051
     * @tc.name      testExtRequestHandle0050
     * @tc.desc      Open 17 handles, close handle 17, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      const closeKey: number = 17;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0052
     * @tc.name      testExtRequestHandle0051
     * @tc.desc      Open 1 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0053
     * @tc.name      testExtRequestHandle0052
     * @tc.desc      Open 2 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0054
     * @tc.name      testExtRequestHandle0053
     * @tc.desc      Open 3 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0055
     * @tc.name      testExtRequestHandle0054
     * @tc.desc      Open 4 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0056
     * @tc.name      testExtRequestHandle0055
     * @tc.desc      Open 5 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0057
     * @tc.name      testExtRequestHandle0056
     * @tc.desc      Open 6 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0058
     * @tc.name      testExtRequestHandle0057
     * @tc.desc      Open 7 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0059
     * @tc.name      testExtRequestHandle0058
     * @tc.desc      Open 8 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(7);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0060
     * @tc.name      testExtRequestHandle0059
     * @tc.desc      Open 9 handles, close handle 6, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      const closeKey: number = 6;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(8);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0061
     * @tc.name      testExtRequestHandle0060
     * @tc.desc      Open 10 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0062
     * @tc.name      testExtRequestHandle0061
     * @tc.desc      Open 11 handles, close handle 7, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      const closeKey: number = 7;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0063
     * @tc.name      testExtRequestHandle0062
     * @tc.desc      Open 12 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(11);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0064
     * @tc.name      testExtRequestHandle0063
     * @tc.desc      Open 13 handles, close handle 12, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      const closeKey: number = 12;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(12);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0065
     * @tc.name      testExtRequestHandle0064
     * @tc.desc      Open 14 handles, close handle 9, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      const closeKey: number = 9;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0066
     * @tc.name      testExtRequestHandle0065
     * @tc.desc      Open 15 handles, close handle 6, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      const closeKey: number = 6;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0067
     * @tc.name      testExtRequestHandle0066
     * @tc.desc      Open 16 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(15);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0068
     * @tc.name      testExtRequestHandle0067
     * @tc.desc      Open 17 handles, close handle 17, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      const closeKey: number = 17;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(16);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0069
     * @tc.name      testExtRequestHandle0068
     * @tc.desc      Open 1 handles, close handle 1, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      const closeKey: number = 1;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0070
     * @tc.name      testExtRequestHandle0069
     * @tc.desc      Open 2 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0071
     * @tc.name      testExtRequestHandle0070
     * @tc.desc      Open 3 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0072
     * @tc.name      testExtRequestHandle0071
     * @tc.desc      Open 4 handles, close handle 4, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      const closeKey: number = 4;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(3);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0073
     * @tc.name      testExtRequestHandle0072
     * @tc.desc      Open 5 handles, close handle 3, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      const closeKey: number = 3;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(4);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0074
     * @tc.name      testExtRequestHandle0073
     * @tc.desc      Open 6 handles, close handle 2, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      const closeKey: number = 2;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_HANDLE_0075
     * @tc.name      testExtRequestHandle0074
     * @tc.desc      Open 7 handles, close handle 5, map stays consistent.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRequestHandle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'request_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      const closeKey: number = 5;
      expect(requests.hasKey(closeKey)).assertTrue();
      expect(requests.get(closeKey)).assertEqual('request_' + closeKey);
      requests.remove(closeKey);
      expect(requests.hasKey(closeKey)).assertFalse();
      expect(requests.length).assertEqual(6);
    })
  });
}
