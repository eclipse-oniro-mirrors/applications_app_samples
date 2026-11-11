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

const TAG: string = '[Sample_playWithCacheAppStorage]';
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

export default function playWithCacheAppStorageTest(): void {
  describe('playWithCacheAppStorageTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0001
     * @tc.name      testExtCacheStorage0000
     * @tc.desc      AppStorage key cache_duration_0000 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0000';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0002
     * @tc.name      testExtCacheStorage0001
     * @tc.desc      AppStorage key cache_duration_0001 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0001';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0003
     * @tc.name      testExtCacheStorage0002
     * @tc.desc      AppStorage key cache_duration_0002 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0002';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0004
     * @tc.name      testExtCacheStorage0003
     * @tc.desc      AppStorage key cache_duration_0003 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0003';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0005
     * @tc.name      testExtCacheStorage0004
     * @tc.desc      AppStorage key cache_duration_0004 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0004';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0006
     * @tc.name      testExtCacheStorage0005
     * @tc.desc      AppStorage key cache_duration_0005 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0005';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0007
     * @tc.name      testExtCacheStorage0006
     * @tc.desc      AppStorage key cache_duration_0006 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0006';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0008
     * @tc.name      testExtCacheStorage0007
     * @tc.desc      AppStorage key cache_duration_0007 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0007';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0009
     * @tc.name      testExtCacheStorage0008
     * @tc.desc      AppStorage key cache_duration_0008 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0008';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0010
     * @tc.name      testExtCacheStorage0009
     * @tc.desc      AppStorage key cache_duration_0009 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0009';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0011
     * @tc.name      testExtCacheStorage0010
     * @tc.desc      AppStorage key cache_duration_0010 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0010';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0012
     * @tc.name      testExtCacheStorage0011
     * @tc.desc      AppStorage key cache_duration_0011 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0011';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0013
     * @tc.name      testExtCacheStorage0012
     * @tc.desc      AppStorage key cache_duration_0012 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0012';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0014
     * @tc.name      testExtCacheStorage0013
     * @tc.desc      AppStorage key cache_duration_0013 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0013';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0015
     * @tc.name      testExtCacheStorage0014
     * @tc.desc      AppStorage key cache_duration_0014 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0014';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0016
     * @tc.name      testExtCacheStorage0015
     * @tc.desc      AppStorage key cache_duration_0015 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0015';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0017
     * @tc.name      testExtCacheStorage0016
     * @tc.desc      AppStorage key cache_duration_0016 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0016';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0018
     * @tc.name      testExtCacheStorage0017
     * @tc.desc      AppStorage key cache_duration_0017 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0017';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0019
     * @tc.name      testExtCacheStorage0018
     * @tc.desc      AppStorage key cache_duration_0018 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0018';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0020
     * @tc.name      testExtCacheStorage0019
     * @tc.desc      AppStorage key cache_duration_0019 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0019';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0021
     * @tc.name      testExtCacheStorage0020
     * @tc.desc      AppStorage key cache_duration_0020 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0020';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0022
     * @tc.name      testExtCacheStorage0021
     * @tc.desc      AppStorage key cache_duration_0021 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0021';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0023
     * @tc.name      testExtCacheStorage0022
     * @tc.desc      AppStorage key cache_duration_0022 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0022';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0024
     * @tc.name      testExtCacheStorage0023
     * @tc.desc      AppStorage key cache_duration_0023 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0023';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0025
     * @tc.name      testExtCacheStorage0024
     * @tc.desc      AppStorage key cache_duration_0024 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0024';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0026
     * @tc.name      testExtCacheStorage0025
     * @tc.desc      AppStorage key cache_duration_0025 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0025';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0027
     * @tc.name      testExtCacheStorage0026
     * @tc.desc      AppStorage key cache_duration_0026 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0026';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0028
     * @tc.name      testExtCacheStorage0027
     * @tc.desc      AppStorage key cache_duration_0027 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0027';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0029
     * @tc.name      testExtCacheStorage0028
     * @tc.desc      AppStorage key cache_duration_0028 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0028';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0030
     * @tc.name      testExtCacheStorage0029
     * @tc.desc      AppStorage key cache_duration_0029 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0029';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0031
     * @tc.name      testExtCacheStorage0030
     * @tc.desc      AppStorage key cache_duration_0030 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0030';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0032
     * @tc.name      testExtCacheStorage0031
     * @tc.desc      AppStorage key cache_duration_0031 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0031';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0033
     * @tc.name      testExtCacheStorage0032
     * @tc.desc      AppStorage key cache_duration_0032 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0032';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0034
     * @tc.name      testExtCacheStorage0033
     * @tc.desc      AppStorage key cache_duration_0033 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0033';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0035
     * @tc.name      testExtCacheStorage0034
     * @tc.desc      AppStorage key cache_duration_0034 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0034';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0036
     * @tc.name      testExtCacheStorage0035
     * @tc.desc      AppStorage key cache_duration_0035 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0035';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0037
     * @tc.name      testExtCacheStorage0036
     * @tc.desc      AppStorage key cache_duration_0036 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0036';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0038
     * @tc.name      testExtCacheStorage0037
     * @tc.desc      AppStorage key cache_duration_0037 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0037';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0039
     * @tc.name      testExtCacheStorage0038
     * @tc.desc      AppStorage key cache_duration_0038 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0038';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0040
     * @tc.name      testExtCacheStorage0039
     * @tc.desc      AppStorage key cache_duration_0039 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0039';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0041
     * @tc.name      testExtCacheStorage0040
     * @tc.desc      AppStorage key cache_duration_0040 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0040';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0042
     * @tc.name      testExtCacheStorage0041
     * @tc.desc      AppStorage key cache_duration_0041 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0041';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0043
     * @tc.name      testExtCacheStorage0042
     * @tc.desc      AppStorage key cache_duration_0042 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0042';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0044
     * @tc.name      testExtCacheStorage0043
     * @tc.desc      AppStorage key cache_duration_0043 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0043';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0045
     * @tc.name      testExtCacheStorage0044
     * @tc.desc      AppStorage key cache_duration_0044 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0044';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0046
     * @tc.name      testExtCacheStorage0045
     * @tc.desc      AppStorage key cache_duration_0045 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0045';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0047
     * @tc.name      testExtCacheStorage0046
     * @tc.desc      AppStorage key cache_duration_0046 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0046';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0048
     * @tc.name      testExtCacheStorage0047
     * @tc.desc      AppStorage key cache_duration_0047 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0047';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0049
     * @tc.name      testExtCacheStorage0048
     * @tc.desc      AppStorage key cache_duration_0048 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0048';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0050
     * @tc.name      testExtCacheStorage0049
     * @tc.desc      AppStorage key cache_duration_0049 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0049';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0051
     * @tc.name      testExtCacheStorage0050
     * @tc.desc      AppStorage key cache_duration_0050 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0050';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0052
     * @tc.name      testExtCacheStorage0051
     * @tc.desc      AppStorage key cache_duration_0051 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0051';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0053
     * @tc.name      testExtCacheStorage0052
     * @tc.desc      AppStorage key cache_duration_0052 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0052';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0054
     * @tc.name      testExtCacheStorage0053
     * @tc.desc      AppStorage key cache_duration_0053 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0053';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0055
     * @tc.name      testExtCacheStorage0054
     * @tc.desc      AppStorage key cache_duration_0054 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0054';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0056
     * @tc.name      testExtCacheStorage0055
     * @tc.desc      AppStorage key cache_duration_0055 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0055';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0057
     * @tc.name      testExtCacheStorage0056
     * @tc.desc      AppStorage key cache_duration_0056 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0056';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0058
     * @tc.name      testExtCacheStorage0057
     * @tc.desc      AppStorage key cache_duration_0057 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0057';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0059
     * @tc.name      testExtCacheStorage0058
     * @tc.desc      AppStorage key cache_duration_0058 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0058';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0060
     * @tc.name      testExtCacheStorage0059
     * @tc.desc      AppStorage key cache_duration_0059 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0059';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0061
     * @tc.name      testExtCacheStorage0060
     * @tc.desc      AppStorage key cache_duration_0060 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0060';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0062
     * @tc.name      testExtCacheStorage0061
     * @tc.desc      AppStorage key cache_duration_0061 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0061';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0063
     * @tc.name      testExtCacheStorage0062
     * @tc.desc      AppStorage key cache_duration_0062 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0062';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0064
     * @tc.name      testExtCacheStorage0063
     * @tc.desc      AppStorage key cache_duration_0063 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0063';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0065
     * @tc.name      testExtCacheStorage0064
     * @tc.desc      AppStorage key cache_duration_0064 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0064';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0066
     * @tc.name      testExtCacheStorage0065
     * @tc.desc      AppStorage key cache_duration_0065 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0065';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0067
     * @tc.name      testExtCacheStorage0066
     * @tc.desc      AppStorage key cache_duration_0066 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0066';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0068
     * @tc.name      testExtCacheStorage0067
     * @tc.desc      AppStorage key cache_duration_0067 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0067';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0069
     * @tc.name      testExtCacheStorage0068
     * @tc.desc      AppStorage key cache_duration_0068 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0068';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0070
     * @tc.name      testExtCacheStorage0069
     * @tc.desc      AppStorage key cache_duration_0069 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0069';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0071
     * @tc.name      testExtCacheStorage0070
     * @tc.desc      AppStorage key cache_duration_0070 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0070';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0072
     * @tc.name      testExtCacheStorage0071
     * @tc.desc      AppStorage key cache_duration_0071 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0071';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0073
     * @tc.name      testExtCacheStorage0072
     * @tc.desc      AppStorage key cache_duration_0072 stores 0 then 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0072';
      AppStorage.setOrCreate<number>(key, 0);
      expect(AppStorage.get<number>(key)).assertEqual(0);
      AppStorage.setOrCreate<number>(key, 7);
      expect(AppStorage.get<number>(key)).assertEqual(7);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0074
     * @tc.name      testExtCacheStorage0073
     * @tc.desc      AppStorage key cache_duration_0073 stores 1 then 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0073';
      AppStorage.setOrCreate<number>(key, 1);
      expect(AppStorage.get<number>(key)).assertEqual(1);
      AppStorage.setOrCreate<number>(key, 8);
      expect(AppStorage.get<number>(key)).assertEqual(8);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0075
     * @tc.name      testExtCacheStorage0074
     * @tc.desc      AppStorage key cache_duration_0074 stores 1000 then 1007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0074';
      AppStorage.setOrCreate<number>(key, 1000);
      expect(AppStorage.get<number>(key)).assertEqual(1000);
      AppStorage.setOrCreate<number>(key, 1007);
      expect(AppStorage.get<number>(key)).assertEqual(1007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0076
     * @tc.name      testExtCacheStorage0075
     * @tc.desc      AppStorage key cache_duration_0075 stores 60000 then 60007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0075';
      AppStorage.setOrCreate<number>(key, 60000);
      expect(AppStorage.get<number>(key)).assertEqual(60000);
      AppStorage.setOrCreate<number>(key, 60007);
      expect(AppStorage.get<number>(key)).assertEqual(60007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0077
     * @tc.name      testExtCacheStorage0076
     * @tc.desc      AppStorage key cache_duration_0076 stores 3599000 then 3599007.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0076';
      AppStorage.setOrCreate<number>(key, 3599000);
      expect(AppStorage.get<number>(key)).assertEqual(3599000);
      AppStorage.setOrCreate<number>(key, 3599007);
      expect(AppStorage.get<number>(key)).assertEqual(3599007);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0078
     * @tc.name      testExtCacheStorage0077
     * @tc.desc      AppStorage key cache_duration_0077 stores -1 then 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0077';
      AppStorage.setOrCreate<number>(key, -1);
      expect(AppStorage.get<number>(key)).assertEqual(-1);
      AppStorage.setOrCreate<number>(key, 6);
      expect(AppStorage.get<number>(key)).assertEqual(6);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0079
     * @tc.name      testExtCacheStorage0078
     * @tc.desc      AppStorage key cache_duration_0078 stores 42 then 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0078';
      AppStorage.setOrCreate<number>(key, 42);
      expect(AppStorage.get<number>(key)).assertEqual(42);
      AppStorage.setOrCreate<number>(key, 49);
      expect(AppStorage.get<number>(key)).assertEqual(49);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STORAGE_0080
     * @tc.name      testExtCacheStorage0079
     * @tc.desc      AppStorage key cache_duration_0079 stores 999999 then 1000006.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStorage0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const key: string = 'cache_duration_0079';
      AppStorage.setOrCreate<number>(key, 999999);
      expect(AppStorage.get<number>(key)).assertEqual(999999);
      AppStorage.setOrCreate<number>(key, 1000006);
      expect(AppStorage.get<number>(key)).assertEqual(1000006);
      AppStorage.delete(key);
      expect(AppStorage.get<number>(key)).assertUndefined();
    })
  });
}
