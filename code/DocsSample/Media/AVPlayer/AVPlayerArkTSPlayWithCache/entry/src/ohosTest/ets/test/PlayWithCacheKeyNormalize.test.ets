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

const TAG: string = '[Sample_playWithCacheKeyNormalize]';
const DOMAIN: number = 0xF811;

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

export default function playWithCacheKeyNormalizeTest(): void {
  describe('playWithCacheKeyNormalizeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0001
     * @tc.name      testExtCacheKey0000
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0002
     * @tc.name      testExtCacheKey0001
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0003
     * @tc.name      testExtCacheKey0002
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0004
     * @tc.name      testExtCacheKey0003
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0005
     * @tc.name      testExtCacheKey0004
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0006
     * @tc.name      testExtCacheKey0005
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0007
     * @tc.name      testExtCacheKey0006
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0008
     * @tc.name      testExtCacheKey0007
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0009
     * @tc.name      testExtCacheKey0008
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0010
     * @tc.name      testExtCacheKey0009
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0011
     * @tc.name      testExtCacheKey0010
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0012
     * @tc.name      testExtCacheKey0011
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0013
     * @tc.name      testExtCacheKey0012
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0014
     * @tc.name      testExtCacheKey0013
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0015
     * @tc.name      testExtCacheKey0014
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0016
     * @tc.name      testExtCacheKey0015
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0017
     * @tc.name      testExtCacheKey0016
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0018
     * @tc.name      testExtCacheKey0017
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0019
     * @tc.name      testExtCacheKey0018
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0020
     * @tc.name      testExtCacheKey0019
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0021
     * @tc.name      testExtCacheKey0020
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0022
     * @tc.name      testExtCacheKey0021
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0023
     * @tc.name      testExtCacheKey0022
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0024
     * @tc.name      testExtCacheKey0023
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0025
     * @tc.name      testExtCacheKey0024
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0026
     * @tc.name      testExtCacheKey0025
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0027
     * @tc.name      testExtCacheKey0026
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0028
     * @tc.name      testExtCacheKey0027
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0029
     * @tc.name      testExtCacheKey0028
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0030
     * @tc.name      testExtCacheKey0029
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0031
     * @tc.name      testExtCacheKey0030
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0032
     * @tc.name      testExtCacheKey0031
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0033
     * @tc.name      testExtCacheKey0032
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0034
     * @tc.name      testExtCacheKey0033
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0035
     * @tc.name      testExtCacheKey0034
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0036
     * @tc.name      testExtCacheKey0035
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0037
     * @tc.name      testExtCacheKey0036
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0038
     * @tc.name      testExtCacheKey0037
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0039
     * @tc.name      testExtCacheKey0038
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0040
     * @tc.name      testExtCacheKey0039
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0041
     * @tc.name      testExtCacheKey0040
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0042
     * @tc.name      testExtCacheKey0041
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0043
     * @tc.name      testExtCacheKey0042
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0044
     * @tc.name      testExtCacheKey0043
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0045
     * @tc.name      testExtCacheKey0044
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0046
     * @tc.name      testExtCacheKey0045
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0047
     * @tc.name      testExtCacheKey0046
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0048
     * @tc.name      testExtCacheKey0047
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0049
     * @tc.name      testExtCacheKey0048
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0050
     * @tc.name      testExtCacheKey0049
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0051
     * @tc.name      testExtCacheKey0050
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0052
     * @tc.name      testExtCacheKey0051
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0053
     * @tc.name      testExtCacheKey0052
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0054
     * @tc.name      testExtCacheKey0053
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0055
     * @tc.name      testExtCacheKey0054
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0056
     * @tc.name      testExtCacheKey0055
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0057
     * @tc.name      testExtCacheKey0056
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0058
     * @tc.name      testExtCacheKey0057
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0059
     * @tc.name      testExtCacheKey0058
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0060
     * @tc.name      testExtCacheKey0059
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0061
     * @tc.name      testExtCacheKey0060
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0062
     * @tc.name      testExtCacheKey0061
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0063
     * @tc.name      testExtCacheKey0062
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0064
     * @tc.name      testExtCacheKey0063
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0065
     * @tc.name      testExtCacheKey0064
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0066
     * @tc.name      testExtCacheKey0065
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0067
     * @tc.name      testExtCacheKey0066
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0068
     * @tc.name      testExtCacheKey0067
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0069
     * @tc.name      testExtCacheKey0068
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0070
     * @tc.name      testExtCacheKey0069
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0071
     * @tc.name      testExtCacheKey0070
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0072
     * @tc.name      testExtCacheKey0071
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0073
     * @tc.name      testExtCacheKey0072
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0074
     * @tc.name      testExtCacheKey0073
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0075
     * @tc.name      testExtCacheKey0074
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0076
     * @tc.name      testExtCacheKey0075
     * @tc.desc      Normalize https://sample.test/a.m3u8?x=1#frag -> https://sample.test/a.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/a.m3u8?x=1#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/a.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0077
     * @tc.name      testExtCacheKey0076
     * @tc.desc      Normalize https://sample.test/B.m3u8#frag -> https://sample.test/B.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/B.m3u8#frag';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/B.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0078
     * @tc.name      testExtCacheKey0077
     * @tc.desc      Normalize https://sample.test/c.m3u8?token=1 -> https://sample.test/c.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/c.m3u8?token=1';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/c.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0079
     * @tc.name      testExtCacheKey0078
     * @tc.desc      Normalize http://sample.test/d.m3u8 -> http://sample.test/d.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'http://sample.test/d.m3u8';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('http://sample.test/d.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_KEY_0080
     * @tc.name      testExtCacheKey0079
     * @tc.desc      Normalize https://sample.test/e.m3u8#f -> https://sample.test/e.m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheKey0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rawUrl: string = 'https://sample.test/e.m3u8#f';
      const normalized: string = rawUrl.split('#')[0].split('?')[0].replace('HTTPS://', 'https://').replace('HTTP://', 'http://');
      expect(normalized).assertEqual('https://sample.test/e.m3u8');
      expect(normalized.indexOf('#')).assertEqual(-1);
      expect(normalized.indexOf('?')).assertEqual(-1);
      expect(normalized.endsWith('.m3u8')).assertTrue();
    })
  });
}
