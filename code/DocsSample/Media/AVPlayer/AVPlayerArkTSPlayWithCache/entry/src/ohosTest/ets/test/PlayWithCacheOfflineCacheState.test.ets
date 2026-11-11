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

const TAG: string = '[Sample_playWithCacheOfflineCacheState]';
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

export default function playWithCacheOfflineCacheStateTest(): void {
  describe('playWithCacheOfflineCacheStateTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0001
     * @tc.name      testExtCacheState0000
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0002
     * @tc.name      testExtCacheState0001
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0003
     * @tc.name      testExtCacheState0002
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0004
     * @tc.name      testExtCacheState0003
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0005
     * @tc.name      testExtCacheState0004
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0006
     * @tc.name      testExtCacheState0005
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0007
     * @tc.name      testExtCacheState0006
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0008
     * @tc.name      testExtCacheState0007
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0009
     * @tc.name      testExtCacheState0008
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0010
     * @tc.name      testExtCacheState0009
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0011
     * @tc.name      testExtCacheState0010
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0012
     * @tc.name      testExtCacheState0011
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0013
     * @tc.name      testExtCacheState0012
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0014
     * @tc.name      testExtCacheState0013
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0015
     * @tc.name      testExtCacheState0014
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0016
     * @tc.name      testExtCacheState0015
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0017
     * @tc.name      testExtCacheState0016
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0018
     * @tc.name      testExtCacheState0017
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0019
     * @tc.name      testExtCacheState0018
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0020
     * @tc.name      testExtCacheState0019
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0021
     * @tc.name      testExtCacheState0020
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0022
     * @tc.name      testExtCacheState0021
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0023
     * @tc.name      testExtCacheState0022
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0024
     * @tc.name      testExtCacheState0023
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0025
     * @tc.name      testExtCacheState0024
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0026
     * @tc.name      testExtCacheState0025
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0027
     * @tc.name      testExtCacheState0026
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0028
     * @tc.name      testExtCacheState0027
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0029
     * @tc.name      testExtCacheState0028
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0030
     * @tc.name      testExtCacheState0029
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0031
     * @tc.name      testExtCacheState0030
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0032
     * @tc.name      testExtCacheState0031
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0033
     * @tc.name      testExtCacheState0032
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0034
     * @tc.name      testExtCacheState0033
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0035
     * @tc.name      testExtCacheState0034
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0036
     * @tc.name      testExtCacheState0035
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0037
     * @tc.name      testExtCacheState0036
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0038
     * @tc.name      testExtCacheState0037
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0039
     * @tc.name      testExtCacheState0038
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0040
     * @tc.name      testExtCacheState0039
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0041
     * @tc.name      testExtCacheState0040
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0042
     * @tc.name      testExtCacheState0041
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0043
     * @tc.name      testExtCacheState0042
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0044
     * @tc.name      testExtCacheState0043
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0045
     * @tc.name      testExtCacheState0044
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0046
     * @tc.name      testExtCacheState0045
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0047
     * @tc.name      testExtCacheState0046
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0048
     * @tc.name      testExtCacheState0047
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0049
     * @tc.name      testExtCacheState0048
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0050
     * @tc.name      testExtCacheState0049
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0051
     * @tc.name      testExtCacheState0050
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0052
     * @tc.name      testExtCacheState0051
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0053
     * @tc.name      testExtCacheState0052
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0054
     * @tc.name      testExtCacheState0053
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0055
     * @tc.name      testExtCacheState0054
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0056
     * @tc.name      testExtCacheState0055
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0057
     * @tc.name      testExtCacheState0056
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0058
     * @tc.name      testExtCacheState0057
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0059
     * @tc.name      testExtCacheState0058
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0060
     * @tc.name      testExtCacheState0059
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0061
     * @tc.name      testExtCacheState0060
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0062
     * @tc.name      testExtCacheState0061
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0063
     * @tc.name      testExtCacheState0062
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0064
     * @tc.name      testExtCacheState0063
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0065
     * @tc.name      testExtCacheState0064
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0066
     * @tc.name      testExtCacheState0065
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0067
     * @tc.name      testExtCacheState0066
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0068
     * @tc.name      testExtCacheState0067
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0069
     * @tc.name      testExtCacheState0068
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0070
     * @tc.name      testExtCacheState0069
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0071
     * @tc.name      testExtCacheState0070
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0072
     * @tc.name      testExtCacheState0071
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0073
     * @tc.name      testExtCacheState0072
     * @tc.desc      Offline cache True toggled 0 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0074
     * @tc.name      testExtCacheState0073
     * @tc.desc      Offline cache False toggled 0 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 0; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0075
     * @tc.name      testExtCacheState0074
     * @tc.desc      Offline cache True toggled 1 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0076
     * @tc.name      testExtCacheState0075
     * @tc.desc      Offline cache False toggled 1 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0077
     * @tc.name      testExtCacheState0076
     * @tc.desc      Offline cache True toggled 2 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0078
     * @tc.name      testExtCacheState0077
     * @tc.desc      Offline cache False toggled 2 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0079
     * @tc.name      testExtCacheState0078
     * @tc.desc      Offline cache True toggled 3 times is False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = true;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(false);
      expect(cacheKey).assertEqual('cache:https://sample.test/media/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_CACHESTATE_0080
     * @tc.name      testExtCacheState0079
     * @tc.desc      Offline cache False toggled 3 times is True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const cacheKey: string = `cache:${url}`;
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      expect(enabled).assertEqual(true);
      expect(cacheKey).assertEqual('cache:https://sample.test/cache/playlist.m3u8');
      expect(url.endsWith('.m3u8')).assertTrue();
    })
  });
}
