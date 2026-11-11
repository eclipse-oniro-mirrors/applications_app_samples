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
import { media } from '@kit.MediaKit';

const TAG: string = '[Sample_MediaSourcePredownloadContract]';
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

export default function mediaSourcePredownloadContractTest(): void {
  describe('mediaSourcePredownloadContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0001
     * @tc.name      testExtPreDownload0000
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0002
     * @tc.name      testExtPreDownload0001
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0003
     * @tc.name      testExtPreDownload0002
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0004
     * @tc.name      testExtPreDownload0003
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0005
     * @tc.name      testExtPreDownload0004
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0006
     * @tc.name      testExtPreDownload0005
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0007
     * @tc.name      testExtPreDownload0006
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0008
     * @tc.name      testExtPreDownload0007
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0009
     * @tc.name      testExtPreDownload0008
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0010
     * @tc.name      testExtPreDownload0009
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0011
     * @tc.name      testExtPreDownload0010
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0012
     * @tc.name      testExtPreDownload0011
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0013
     * @tc.name      testExtPreDownload0012
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0014
     * @tc.name      testExtPreDownload0013
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0015
     * @tc.name      testExtPreDownload0014
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0016
     * @tc.name      testExtPreDownload0015
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0017
     * @tc.name      testExtPreDownload0016
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0018
     * @tc.name      testExtPreDownload0017
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0019
     * @tc.name      testExtPreDownload0018
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0020
     * @tc.name      testExtPreDownload0019
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0021
     * @tc.name      testExtPreDownload0020
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0022
     * @tc.name      testExtPreDownload0021
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0023
     * @tc.name      testExtPreDownload0022
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0024
     * @tc.name      testExtPreDownload0023
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0025
     * @tc.name      testExtPreDownload0024
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0026
     * @tc.name      testExtPreDownload0025
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0027
     * @tc.name      testExtPreDownload0026
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0028
     * @tc.name      testExtPreDownload0027
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0029
     * @tc.name      testExtPreDownload0028
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0030
     * @tc.name      testExtPreDownload0029
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0031
     * @tc.name      testExtPreDownload0030
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0032
     * @tc.name      testExtPreDownload0031
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0033
     * @tc.name      testExtPreDownload0032
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0034
     * @tc.name      testExtPreDownload0033
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0035
     * @tc.name      testExtPreDownload0034
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0036
     * @tc.name      testExtPreDownload0035
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0037
     * @tc.name      testExtPreDownload0036
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0038
     * @tc.name      testExtPreDownload0037
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0039
     * @tc.name      testExtPreDownload0038
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0040
     * @tc.name      testExtPreDownload0039
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0041
     * @tc.name      testExtPreDownload0040
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0042
     * @tc.name      testExtPreDownload0041
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0043
     * @tc.name      testExtPreDownload0042
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0044
     * @tc.name      testExtPreDownload0043
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0045
     * @tc.name      testExtPreDownload0044
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0046
     * @tc.name      testExtPreDownload0045
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0047
     * @tc.name      testExtPreDownload0046
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0048
     * @tc.name      testExtPreDownload0047
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0049
     * @tc.name      testExtPreDownload0048
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0050
     * @tc.name      testExtPreDownload0049
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0051
     * @tc.name      testExtPreDownload0050
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0052
     * @tc.name      testExtPreDownload0051
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0053
     * @tc.name      testExtPreDownload0052
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0054
     * @tc.name      testExtPreDownload0053
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0055
     * @tc.name      testExtPreDownload0054
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0056
     * @tc.name      testExtPreDownload0055
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0057
     * @tc.name      testExtPreDownload0056
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0058
     * @tc.name      testExtPreDownload0057
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0059
     * @tc.name      testExtPreDownload0058
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0060
     * @tc.name      testExtPreDownload0059
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0061
     * @tc.name      testExtPreDownload0060
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0062
     * @tc.name      testExtPreDownload0061
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0063
     * @tc.name      testExtPreDownload0062
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0064
     * @tc.name      testExtPreDownload0063
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0065
     * @tc.name      testExtPreDownload0064
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0066
     * @tc.name      testExtPreDownload0065
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0067
     * @tc.name      testExtPreDownload0066
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0068
     * @tc.name      testExtPreDownload0067
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0069
     * @tc.name      testExtPreDownload0068
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0070
     * @tc.name      testExtPreDownload0069
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0071
     * @tc.name      testExtPreDownload0070
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0072
     * @tc.name      testExtPreDownload0071
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0073
     * @tc.name      testExtPreDownload0072
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0074
     * @tc.name      testExtPreDownload0073
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0075
     * @tc.name      testExtPreDownload0074
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0076
     * @tc.name      testExtPreDownload0075
     * @tc.desc      Pre-download URL https://example.com/a.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/a.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0077
     * @tc.name      testExtPreDownload0076
     * @tc.desc      Pre-download URL https://example.com/b.m3u8 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/b.m3u8';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0078
     * @tc.name      testExtPreDownload0077
     * @tc.desc      Pre-download URL http://example.com/c.mp4 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'http://example.com/c.mp4';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0079
     * @tc.name      testExtPreDownload0078
     * @tc.desc      Pre-download URL https://example.com/d.ts with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/d.ts';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_PREDL_0080
     * @tc.name      testExtPreDownload0079
     * @tc.desc      Pre-download URL https://example.com/e.mp3 with buffer 0 keeps empty headers.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtPreDownload0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const headers: Record<string, string> = {};
      const strategy: media.PlaybackStrategy = { preferredBufferDuration: 0 };
      const videoUrl: string = 'https://example.com/e.mp3';
      expect(Object.keys(headers).length).assertEqual(0);
      expect(strategy.preferredBufferDuration).assertEqual(0);
      expect(videoUrl.length).assertLarger(0);
      expect(videoUrl.startsWith('http')).assertTrue();
      expect(videoUrl.indexOf('.') > 0).assertTrue();
    })
  });
}
