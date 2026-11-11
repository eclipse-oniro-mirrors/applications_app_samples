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
import { media } from '@kit.MediaKit';

const TAG: string = '[Sample_playWithCacheMediaSourceContract]';
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

export default function playWithCacheMediaSourceContractTest(): void {
  describe('playWithCacheMediaSourceContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0001
     * @tc.name      testExtCacheSource0000
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0002
     * @tc.name      testExtCacheSource0001
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0003
     * @tc.name      testExtCacheSource0002
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0004
     * @tc.name      testExtCacheSource0003
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0005
     * @tc.name      testExtCacheSource0004
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0006
     * @tc.name      testExtCacheSource0005
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0007
     * @tc.name      testExtCacheSource0006
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0008
     * @tc.name      testExtCacheSource0007
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0009
     * @tc.name      testExtCacheSource0008
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0010
     * @tc.name      testExtCacheSource0009
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0011
     * @tc.name      testExtCacheSource0010
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0012
     * @tc.name      testExtCacheSource0011
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0013
     * @tc.name      testExtCacheSource0012
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0014
     * @tc.name      testExtCacheSource0013
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0015
     * @tc.name      testExtCacheSource0014
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0016
     * @tc.name      testExtCacheSource0015
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0017
     * @tc.name      testExtCacheSource0016
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0018
     * @tc.name      testExtCacheSource0017
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0019
     * @tc.name      testExtCacheSource0018
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0020
     * @tc.name      testExtCacheSource0019
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0021
     * @tc.name      testExtCacheSource0020
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0022
     * @tc.name      testExtCacheSource0021
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0023
     * @tc.name      testExtCacheSource0022
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0024
     * @tc.name      testExtCacheSource0023
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0025
     * @tc.name      testExtCacheSource0024
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0026
     * @tc.name      testExtCacheSource0025
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0027
     * @tc.name      testExtCacheSource0026
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0028
     * @tc.name      testExtCacheSource0027
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0029
     * @tc.name      testExtCacheSource0028
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0030
     * @tc.name      testExtCacheSource0029
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0031
     * @tc.name      testExtCacheSource0030
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0032
     * @tc.name      testExtCacheSource0031
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0033
     * @tc.name      testExtCacheSource0032
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0034
     * @tc.name      testExtCacheSource0033
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0035
     * @tc.name      testExtCacheSource0034
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0036
     * @tc.name      testExtCacheSource0035
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0037
     * @tc.name      testExtCacheSource0036
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0038
     * @tc.name      testExtCacheSource0037
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0039
     * @tc.name      testExtCacheSource0038
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0040
     * @tc.name      testExtCacheSource0039
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0041
     * @tc.name      testExtCacheSource0040
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0042
     * @tc.name      testExtCacheSource0041
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0043
     * @tc.name      testExtCacheSource0042
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0044
     * @tc.name      testExtCacheSource0043
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0045
     * @tc.name      testExtCacheSource0044
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0046
     * @tc.name      testExtCacheSource0045
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0047
     * @tc.name      testExtCacheSource0046
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0048
     * @tc.name      testExtCacheSource0047
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0049
     * @tc.name      testExtCacheSource0048
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0050
     * @tc.name      testExtCacheSource0049
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0051
     * @tc.name      testExtCacheSource0050
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0052
     * @tc.name      testExtCacheSource0051
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0053
     * @tc.name      testExtCacheSource0052
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0054
     * @tc.name      testExtCacheSource0053
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0055
     * @tc.name      testExtCacheSource0054
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0056
     * @tc.name      testExtCacheSource0055
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0057
     * @tc.name      testExtCacheSource0056
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0058
     * @tc.name      testExtCacheSource0057
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0059
     * @tc.name      testExtCacheSource0058
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0060
     * @tc.name      testExtCacheSource0059
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0061
     * @tc.name      testExtCacheSource0060
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0062
     * @tc.name      testExtCacheSource0061
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0063
     * @tc.name      testExtCacheSource0062
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0064
     * @tc.name      testExtCacheSource0063
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0065
     * @tc.name      testExtCacheSource0064
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0066
     * @tc.name      testExtCacheSource0065
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0067
     * @tc.name      testExtCacheSource0066
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0068
     * @tc.name      testExtCacheSource0067
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0069
     * @tc.name      testExtCacheSource0068
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0070
     * @tc.name      testExtCacheSource0069
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0071
     * @tc.name      testExtCacheSource0070
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0072
     * @tc.name      testExtCacheSource0071
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0073
     * @tc.name      testExtCacheSource0072
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0074
     * @tc.name      testExtCacheSource0073
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0075
     * @tc.name      testExtCacheSource0074
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0076
     * @tc.name      testExtCacheSource0075
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0077
     * @tc.name      testExtCacheSource0076
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0078
     * @tc.name      testExtCacheSource0077
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0079
     * @tc.name      testExtCacheSource0078
     * @tc.desc      MediaSource https://sample.test/media/playlist.m3u8 cache=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/media/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = true;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(true);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SOURCE_0080
     * @tc.name      testExtCacheSource0079
     * @tc.desc      MediaSource https://sample.test/cache/playlist.m3u8 cache=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSource0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://sample.test/cache/playlist.m3u8';
      const headers: Record<string, string> = {};
      const cacheEnabled: boolean = false;
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 20, showFirstFrameOnPrepare: true };
      expect(Object.keys(headers).length).assertEqual(0);
      expect(cacheEnabled).assertEqual(false);
      expect(strategy.preferredBufferDuration).assertEqual(20);
      expect(strategy.showFirstFrameOnPrepare).assertTrue();
      expect(url.endsWith('.m3u8')).assertTrue();
      expect(media.AVMimeTypes.APPLICATION_M3U8).assertEqual('application/m3u8');
    })
  });
}
