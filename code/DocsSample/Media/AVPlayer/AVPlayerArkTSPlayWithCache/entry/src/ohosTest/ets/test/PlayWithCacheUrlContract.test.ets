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

const TAG: string = '[Sample_playWithCacheUrlContract]';
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

export default function playWithCacheUrlContractTest(): void {
  describe('playWithCacheUrlContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0001
     * @tc.name      testExtCacheUrl0000
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0002
     * @tc.name      testExtCacheUrl0001
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0003
     * @tc.name      testExtCacheUrl0002
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0004
     * @tc.name      testExtCacheUrl0003
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0005
     * @tc.name      testExtCacheUrl0004
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0006
     * @tc.name      testExtCacheUrl0005
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0007
     * @tc.name      testExtCacheUrl0006
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0008
     * @tc.name      testExtCacheUrl0007
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0009
     * @tc.name      testExtCacheUrl0008
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0010
     * @tc.name      testExtCacheUrl0009
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0011
     * @tc.name      testExtCacheUrl0010
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0012
     * @tc.name      testExtCacheUrl0011
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0013
     * @tc.name      testExtCacheUrl0012
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0014
     * @tc.name      testExtCacheUrl0013
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0015
     * @tc.name      testExtCacheUrl0014
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0016
     * @tc.name      testExtCacheUrl0015
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0017
     * @tc.name      testExtCacheUrl0016
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0018
     * @tc.name      testExtCacheUrl0017
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0019
     * @tc.name      testExtCacheUrl0018
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0020
     * @tc.name      testExtCacheUrl0019
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0021
     * @tc.name      testExtCacheUrl0020
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0022
     * @tc.name      testExtCacheUrl0021
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0023
     * @tc.name      testExtCacheUrl0022
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0024
     * @tc.name      testExtCacheUrl0023
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0025
     * @tc.name      testExtCacheUrl0024
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0026
     * @tc.name      testExtCacheUrl0025
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0027
     * @tc.name      testExtCacheUrl0026
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0028
     * @tc.name      testExtCacheUrl0027
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0029
     * @tc.name      testExtCacheUrl0028
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0030
     * @tc.name      testExtCacheUrl0029
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0031
     * @tc.name      testExtCacheUrl0030
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0032
     * @tc.name      testExtCacheUrl0031
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0033
     * @tc.name      testExtCacheUrl0032
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0034
     * @tc.name      testExtCacheUrl0033
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0035
     * @tc.name      testExtCacheUrl0034
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0036
     * @tc.name      testExtCacheUrl0035
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0037
     * @tc.name      testExtCacheUrl0036
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0038
     * @tc.name      testExtCacheUrl0037
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0039
     * @tc.name      testExtCacheUrl0038
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0040
     * @tc.name      testExtCacheUrl0039
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0041
     * @tc.name      testExtCacheUrl0040
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0042
     * @tc.name      testExtCacheUrl0041
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0043
     * @tc.name      testExtCacheUrl0042
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0044
     * @tc.name      testExtCacheUrl0043
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0045
     * @tc.name      testExtCacheUrl0044
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0046
     * @tc.name      testExtCacheUrl0045
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0047
     * @tc.name      testExtCacheUrl0046
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0048
     * @tc.name      testExtCacheUrl0047
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0049
     * @tc.name      testExtCacheUrl0048
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0050
     * @tc.name      testExtCacheUrl0049
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0051
     * @tc.name      testExtCacheUrl0050
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0052
     * @tc.name      testExtCacheUrl0051
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0053
     * @tc.name      testExtCacheUrl0052
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0054
     * @tc.name      testExtCacheUrl0053
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0055
     * @tc.name      testExtCacheUrl0054
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0056
     * @tc.name      testExtCacheUrl0055
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0057
     * @tc.name      testExtCacheUrl0056
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0058
     * @tc.name      testExtCacheUrl0057
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0059
     * @tc.name      testExtCacheUrl0058
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0060
     * @tc.name      testExtCacheUrl0059
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0061
     * @tc.name      testExtCacheUrl0060
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0062
     * @tc.name      testExtCacheUrl0061
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0063
     * @tc.name      testExtCacheUrl0062
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0064
     * @tc.name      testExtCacheUrl0063
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0065
     * @tc.name      testExtCacheUrl0064
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0066
     * @tc.name      testExtCacheUrl0065
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0067
     * @tc.name      testExtCacheUrl0066
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0068
     * @tc.name      testExtCacheUrl0067
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0069
     * @tc.name      testExtCacheUrl0068
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0070
     * @tc.name      testExtCacheUrl0069
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0071
     * @tc.name      testExtCacheUrl0070
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0072
     * @tc.name      testExtCacheUrl0071
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0073
     * @tc.name      testExtCacheUrl0072
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0074
     * @tc.name      testExtCacheUrl0073
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0075
     * @tc.name      testExtCacheUrl0074
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0076
     * @tc.name      testExtCacheUrl0075
     * @tc.desc      URL https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0077
     * @tc.name      testExtCacheUrl0076
     * @tc.desc      URL https://example.com/a.mp4 extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp4');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0078
     * @tc.name      testExtCacheUrl0077
     * @tc.desc      URL https://example.com/b.ts extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('ts');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0079
     * @tc.name      testExtCacheUrl0078
     * @tc.desc      URL https://example.com/c.mp3 extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('mp3');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(true);
      expect(url.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_URL_0080
     * @tc.name      testExtCacheUrl0079
     * @tc.desc      URL http://example.com/d.m3u8 extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheUrl0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/d.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      expect(extension).assertEqual('m3u8');
      expect(url.startsWith('http')).assertTrue();
      expect(url.startsWith('https://')).assertEqual(false);
      expect(url.length).assertLarger(0);
    })
  });
}
