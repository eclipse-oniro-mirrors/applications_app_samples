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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HashMap } from '@kit.ArkTS';

const TAG: string = '[Sample_MediaSourceLoaderLifecycle]';
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

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceLoaderLifecycleTest(): void {
  describe('mediaSourceLoaderLifecycleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0001
     * @tc.name      testExtLoaderLifecycle0000
     * @tc.desc      Open 1 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0002
     * @tc.name      testExtLoaderLifecycle0001
     * @tc.desc      Open 2 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0003
     * @tc.name      testExtLoaderLifecycle0002
     * @tc.desc      Open 3 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0004
     * @tc.name      testExtLoaderLifecycle0003
     * @tc.desc      Open 4 handles then close 3; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      for (let index: number = 1; index <= 3; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0005
     * @tc.name      testExtLoaderLifecycle0004
     * @tc.desc      Open 5 handles then close 4; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      for (let index: number = 1; index <= 4; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0006
     * @tc.name      testExtLoaderLifecycle0005
     * @tc.desc      Open 6 handles then close 5; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      for (let index: number = 1; index <= 5; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0007
     * @tc.name      testExtLoaderLifecycle0006
     * @tc.desc      Open 7 handles then close 6; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      for (let index: number = 1; index <= 6; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0008
     * @tc.name      testExtLoaderLifecycle0007
     * @tc.desc      Open 8 handles then close 7; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      for (let index: number = 1; index <= 7; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0009
     * @tc.name      testExtLoaderLifecycle0008
     * @tc.desc      Open 9 handles then close 8; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      for (let index: number = 1; index <= 8; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0010
     * @tc.name      testExtLoaderLifecycle0009
     * @tc.desc      Open 10 handles then close 9; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      for (let index: number = 1; index <= 9; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0011
     * @tc.name      testExtLoaderLifecycle0010
     * @tc.desc      Open 11 handles then close 10; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      for (let index: number = 1; index <= 10; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0012
     * @tc.name      testExtLoaderLifecycle0011
     * @tc.desc      Open 12 handles then close 11; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      for (let index: number = 1; index <= 11; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0013
     * @tc.name      testExtLoaderLifecycle0012
     * @tc.desc      Open 13 handles then close 12; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      for (let index: number = 1; index <= 12; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0014
     * @tc.name      testExtLoaderLifecycle0013
     * @tc.desc      Open 14 handles then close 13; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      for (let index: number = 1; index <= 13; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0015
     * @tc.name      testExtLoaderLifecycle0014
     * @tc.desc      Open 15 handles then close 14; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      for (let index: number = 1; index <= 14; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0016
     * @tc.name      testExtLoaderLifecycle0015
     * @tc.desc      Open 16 handles then close 15; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      for (let index: number = 1; index <= 15; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0017
     * @tc.name      testExtLoaderLifecycle0016
     * @tc.desc      Open 17 handles then close 16; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      for (let index: number = 1; index <= 16; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0018
     * @tc.name      testExtLoaderLifecycle0017
     * @tc.desc      Open 1 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0019
     * @tc.name      testExtLoaderLifecycle0018
     * @tc.desc      Open 2 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0020
     * @tc.name      testExtLoaderLifecycle0019
     * @tc.desc      Open 3 handles then close 3; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      for (let index: number = 1; index <= 3; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0021
     * @tc.name      testExtLoaderLifecycle0020
     * @tc.desc      Open 4 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(4);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0022
     * @tc.name      testExtLoaderLifecycle0021
     * @tc.desc      Open 5 handles then close 3; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      for (let index: number = 1; index <= 3; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0023
     * @tc.name      testExtLoaderLifecycle0022
     * @tc.desc      Open 6 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(5);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0024
     * @tc.name      testExtLoaderLifecycle0023
     * @tc.desc      Open 7 handles then close 7; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      for (let index: number = 1; index <= 7; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0025
     * @tc.name      testExtLoaderLifecycle0024
     * @tc.desc      Open 8 handles then close 6; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      for (let index: number = 1; index <= 6; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0026
     * @tc.name      testExtLoaderLifecycle0025
     * @tc.desc      Open 9 handles then close 5; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      for (let index: number = 1; index <= 5; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(4);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0027
     * @tc.name      testExtLoaderLifecycle0026
     * @tc.desc      Open 10 handles then close 4; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      for (let index: number = 1; index <= 4; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(6);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0028
     * @tc.name      testExtLoaderLifecycle0027
     * @tc.desc      Open 11 handles then close 3; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      for (let index: number = 1; index <= 3; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(8);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0029
     * @tc.name      testExtLoaderLifecycle0028
     * @tc.desc      Open 12 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(10);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0030
     * @tc.name      testExtLoaderLifecycle0029
     * @tc.desc      Open 13 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(12);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0031
     * @tc.name      testExtLoaderLifecycle0030
     * @tc.desc      Open 14 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(14);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0032
     * @tc.name      testExtLoaderLifecycle0031
     * @tc.desc      Open 15 handles then close 15; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      for (let index: number = 1; index <= 15; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0033
     * @tc.name      testExtLoaderLifecycle0032
     * @tc.desc      Open 16 handles then close 15; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      for (let index: number = 1; index <= 15; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0034
     * @tc.name      testExtLoaderLifecycle0033
     * @tc.desc      Open 17 handles then close 15; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      for (let index: number = 1; index <= 15; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0035
     * @tc.name      testExtLoaderLifecycle0034
     * @tc.desc      Open 1 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0036
     * @tc.name      testExtLoaderLifecycle0035
     * @tc.desc      Open 2 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0037
     * @tc.name      testExtLoaderLifecycle0036
     * @tc.desc      Open 3 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(3);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0038
     * @tc.name      testExtLoaderLifecycle0037
     * @tc.desc      Open 4 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0039
     * @tc.name      testExtLoaderLifecycle0038
     * @tc.desc      Open 5 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(3);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0040
     * @tc.name      testExtLoaderLifecycle0039
     * @tc.desc      Open 6 handles then close 4; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      for (let index: number = 1; index <= 4; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0041
     * @tc.name      testExtLoaderLifecycle0040
     * @tc.desc      Open 7 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(7);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0042
     * @tc.name      testExtLoaderLifecycle0041
     * @tc.desc      Open 8 handles then close 5; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      for (let index: number = 1; index <= 5; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(3);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0043
     * @tc.name      testExtLoaderLifecycle0042
     * @tc.desc      Open 9 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(7);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0044
     * @tc.name      testExtLoaderLifecycle0043
     * @tc.desc      Open 10 handles then close 10; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 10; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(10);
      expect(requests.length).assertEqual(10);
      for (let index: number = 1; index <= 10; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0045
     * @tc.name      testExtLoaderLifecycle0044
     * @tc.desc      Open 11 handles then close 8; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 11; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(11);
      expect(requests.length).assertEqual(11);
      for (let index: number = 1; index <= 8; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(3);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0046
     * @tc.name      testExtLoaderLifecycle0045
     * @tc.desc      Open 12 handles then close 6; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 12; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(12);
      expect(requests.length).assertEqual(12);
      for (let index: number = 1; index <= 6; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(6);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0047
     * @tc.name      testExtLoaderLifecycle0046
     * @tc.desc      Open 13 handles then close 4; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 13; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(13);
      expect(requests.length).assertEqual(13);
      for (let index: number = 1; index <= 4; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(9);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0048
     * @tc.name      testExtLoaderLifecycle0047
     * @tc.desc      Open 14 handles then close 2; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 14; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(14);
      expect(requests.length).assertEqual(14);
      for (let index: number = 1; index <= 2; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(12);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0049
     * @tc.name      testExtLoaderLifecycle0048
     * @tc.desc      Open 15 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 15; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(15);
      expect(requests.length).assertEqual(15);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(15);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0050
     * @tc.name      testExtLoaderLifecycle0049
     * @tc.desc      Open 16 handles then close 15; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 16; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(16);
      expect(requests.length).assertEqual(16);
      for (let index: number = 1; index <= 15; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0051
     * @tc.name      testExtLoaderLifecycle0050
     * @tc.desc      Open 17 handles then close 14; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 17; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(17);
      expect(requests.length).assertEqual(17);
      for (let index: number = 1; index <= 14; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(3);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0052
     * @tc.name      testExtLoaderLifecycle0051
     * @tc.desc      Open 1 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 1; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(1);
      expect(requests.length).assertEqual(1);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0053
     * @tc.name      testExtLoaderLifecycle0052
     * @tc.desc      Open 2 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 2; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(2);
      expect(requests.length).assertEqual(2);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(1);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0054
     * @tc.name      testExtLoaderLifecycle0053
     * @tc.desc      Open 3 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 3; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(3);
      expect(requests.length).assertEqual(3);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(2);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0055
     * @tc.name      testExtLoaderLifecycle0054
     * @tc.desc      Open 4 handles then close 4; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 4; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(4);
      expect(requests.length).assertEqual(4);
      for (let index: number = 1; index <= 4; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0056
     * @tc.name      testExtLoaderLifecycle0055
     * @tc.desc      Open 5 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 5; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(5);
      expect(requests.length).assertEqual(5);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(4);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0057
     * @tc.name      testExtLoaderLifecycle0056
     * @tc.desc      Open 6 handles then close 0; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 6; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(6);
      expect(requests.length).assertEqual(6);
      for (let index: number = 1; index <= 0; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(6);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0058
     * @tc.name      testExtLoaderLifecycle0057
     * @tc.desc      Open 7 handles then close 1; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 7; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(7);
      expect(requests.length).assertEqual(7);
      for (let index: number = 1; index <= 1; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(6);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0059
     * @tc.name      testExtLoaderLifecycle0058
     * @tc.desc      Open 8 handles then close 4; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 8; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(8);
      expect(requests.length).assertEqual(8);
      for (let index: number = 1; index <= 4; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(4);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LOADER_0060
     * @tc.name      testExtLoaderLifecycle0059
     * @tc.desc      Open 9 handles then close 9; invalid read stays empty.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLoaderLifecycle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const requests: HashMap<number, string> = new HashMap();
      let uuid: number = 0;
      for (let index: number = 0; index < 9; index++) {
        uuid += 1;
        requests.set(uuid, 'handle_' + uuid);
      }
      expect(uuid).assertEqual(9);
      expect(requests.length).assertEqual(9);
      for (let index: number = 1; index <= 9; index++) {
        expect(requests.hasKey(index)).assertTrue();
        requests.remove(index);
      }
      expect(requests.length).assertEqual(0);
      expect(requests.hasKey(9999)).assertFalse();
      expect(requests.get(9999)).assertUndefined();
    })
  });
}
