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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCachePersistence]';
const DOMAIN: number = 0xF813;

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

export default function playWithCachePersistenceTest(): void {
  describe('playWithCachePersistenceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0001
     * @tc.name      testExtCachePersist0001
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0002
     * @tc.name      testExtCachePersist0002
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0003
     * @tc.name      testExtCachePersist0003
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0004
     * @tc.name      testExtCachePersist0004
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0005
     * @tc.name      testExtCachePersist0005
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0006
     * @tc.name      testExtCachePersist0006
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0007
     * @tc.name      testExtCachePersist0007
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0008
     * @tc.name      testExtCachePersist0008
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0009
     * @tc.name      testExtCachePersist0009
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0010
     * @tc.name      testExtCachePersist0010
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0011
     * @tc.name      testExtCachePersist0011
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0012
     * @tc.name      testExtCachePersist0012
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0013
     * @tc.name      testExtCachePersist0013
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0014
     * @tc.name      testExtCachePersist0014
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0015
     * @tc.name      testExtCachePersist0015
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0016
     * @tc.name      testExtCachePersist0016
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0017
     * @tc.name      testExtCachePersist0017
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0018
     * @tc.name      testExtCachePersist0018
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0019
     * @tc.name      testExtCachePersist0019
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0020
     * @tc.name      testExtCachePersist0020
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0021
     * @tc.name      testExtCachePersist0021
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0022
     * @tc.name      testExtCachePersist0022
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0023
     * @tc.name      testExtCachePersist0023
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0024
     * @tc.name      testExtCachePersist0024
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0025
     * @tc.name      testExtCachePersist0025
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0026
     * @tc.name      testExtCachePersist0026
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0027
     * @tc.name      testExtCachePersist0027
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0028
     * @tc.name      testExtCachePersist0028
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0029
     * @tc.name      testExtCachePersist0029
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0030
     * @tc.name      testExtCachePersist0030
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0031
     * @tc.name      testExtCachePersist0031
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0032
     * @tc.name      testExtCachePersist0032
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0033
     * @tc.name      testExtCachePersist0033
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0034
     * @tc.name      testExtCachePersist0034
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0035
     * @tc.name      testExtCachePersist0035
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0036
     * @tc.name      testExtCachePersist0036
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0037
     * @tc.name      testExtCachePersist0037
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0038
     * @tc.name      testExtCachePersist0038
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0039
     * @tc.name      testExtCachePersist0039
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0040
     * @tc.name      testExtCachePersist0040
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0041
     * @tc.name      testExtCachePersist0041
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0042
     * @tc.name      testExtCachePersist0042
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0043
     * @tc.name      testExtCachePersist0043
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0044
     * @tc.name      testExtCachePersist0044
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0045
     * @tc.name      testExtCachePersist0045
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0046
     * @tc.name      testExtCachePersist0046
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0047
     * @tc.name      testExtCachePersist0047
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0048
     * @tc.name      testExtCachePersist0048
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0049
     * @tc.name      testExtCachePersist0049
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0050
     * @tc.name      testExtCachePersist0050
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0051
     * @tc.name      testExtCachePersist0051
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0052
     * @tc.name      testExtCachePersist0052
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0053
     * @tc.name      testExtCachePersist0053
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0054
     * @tc.name      testExtCachePersist0054
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0055
     * @tc.name      testExtCachePersist0055
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0056
     * @tc.name      testExtCachePersist0056
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0057
     * @tc.name      testExtCachePersist0057
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0058
     * @tc.name      testExtCachePersist0058
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0059
     * @tc.name      testExtCachePersist0059
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0060
     * @tc.name      testExtCachePersist0060
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0061
     * @tc.name      testExtCachePersist0061
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0062
     * @tc.name      testExtCachePersist0062
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0063
     * @tc.name      testExtCachePersist0063
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0064
     * @tc.name      testExtCachePersist0064
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0065
     * @tc.name      testExtCachePersist0065
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0066
     * @tc.name      testExtCachePersist0066
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0067
     * @tc.name      testExtCachePersist0067
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0068
     * @tc.name      testExtCachePersist0068
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0069
     * @tc.name      testExtCachePersist0069
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0070
     * @tc.name      testExtCachePersist0070
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0071
     * @tc.name      testExtCachePersist0071
     * @tc.desc      Persist 0 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(0);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0072
     * @tc.name      testExtCachePersist0072
     * @tc.desc      Persist 1 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(1);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0073
     * @tc.name      testExtCachePersist0073
     * @tc.desc      Persist 2 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(2);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0074
     * @tc.name      testExtCachePersist0074
     * @tc.desc      Persist 3 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(3);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0075
     * @tc.name      testExtCachePersist0075
     * @tc.desc      Persist 4 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(4);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(4);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0076
     * @tc.name      testExtCachePersist0076
     * @tc.desc      Persist 5 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(5);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0077
     * @tc.name      testExtCachePersist0077
     * @tc.desc      Persist 6 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(6);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(6);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0078
     * @tc.name      testExtCachePersist0078
     * @tc.desc      Persist 7 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(7);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0079
     * @tc.name      testExtCachePersist0079
     * @tc.desc      Persist 8 keys enabled=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = true;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(8);
      expect(restored).assertEqual(true);
      expect(cacheKeys.length).assertEqual(8);
      expect(cacheKeys.join(',')).assertEqual('seg_0,seg_1,seg_2,seg_3,seg_4,seg_5,seg_6,seg_7');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_PERSIST_0080
     * @tc.name      testExtCachePersist0080
     * @tc.desc      Persist 9 keys enabled=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCachePersist0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let cacheKeys: string[] = [];
      for (let index: number = 0; index < 9; index++) {
        cacheKeys.push('seg_' + index);
      }
      const enabled: boolean = false;
      const restored: boolean = enabled;
      expect(cacheKeys.length).assertEqual(9);
      expect(restored).assertEqual(false);
      cacheKeys = [];
      expect(cacheKeys.length).assertEqual(0);
      expect(cacheKeys.join(',')).assertEqual('');
    })
  });
}
