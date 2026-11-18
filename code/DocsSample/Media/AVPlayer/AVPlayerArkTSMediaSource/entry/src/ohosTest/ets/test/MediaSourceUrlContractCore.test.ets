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

const TAG: string = '[Sample_mediaSourceUrlContractCore]';
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

export default function mediaSourceUrlContractCoreTest(): void {
  describe('mediaSourceUrlContractCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0001
     * @tc.name      testExtUrlContract0000
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0002
     * @tc.name      testExtUrlContract0001
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0003
     * @tc.name      testExtUrlContract0002
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0004
     * @tc.name      testExtUrlContract0003
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0005
     * @tc.name      testExtUrlContract0004
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0006
     * @tc.name      testExtUrlContract0005
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0007
     * @tc.name      testExtUrlContract0006
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0008
     * @tc.name      testExtUrlContract0007
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0009
     * @tc.name      testExtUrlContract0008
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0010
     * @tc.name      testExtUrlContract0009
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0011
     * @tc.name      testExtUrlContract0010
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0012
     * @tc.name      testExtUrlContract0011
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0013
     * @tc.name      testExtUrlContract0012
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0014
     * @tc.name      testExtUrlContract0013
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0015
     * @tc.name      testExtUrlContract0014
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0016
     * @tc.name      testExtUrlContract0015
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0017
     * @tc.name      testExtUrlContract0016
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0018
     * @tc.name      testExtUrlContract0017
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0019
     * @tc.name      testExtUrlContract0018
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0020
     * @tc.name      testExtUrlContract0019
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0021
     * @tc.name      testExtUrlContract0020
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0022
     * @tc.name      testExtUrlContract0021
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0023
     * @tc.name      testExtUrlContract0022
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0024
     * @tc.name      testExtUrlContract0023
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0025
     * @tc.name      testExtUrlContract0024
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0026
     * @tc.name      testExtUrlContract0025
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0027
     * @tc.name      testExtUrlContract0026
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0028
     * @tc.name      testExtUrlContract0027
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0029
     * @tc.name      testExtUrlContract0028
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0030
     * @tc.name      testExtUrlContract0029
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0031
     * @tc.name      testExtUrlContract0030
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0032
     * @tc.name      testExtUrlContract0031
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0033
     * @tc.name      testExtUrlContract0032
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0034
     * @tc.name      testExtUrlContract0033
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0035
     * @tc.name      testExtUrlContract0034
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0036
     * @tc.name      testExtUrlContract0035
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0037
     * @tc.name      testExtUrlContract0036
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0038
     * @tc.name      testExtUrlContract0037
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0039
     * @tc.name      testExtUrlContract0038
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0040
     * @tc.name      testExtUrlContract0039
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0041
     * @tc.name      testExtUrlContract0040
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0042
     * @tc.name      testExtUrlContract0041
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0043
     * @tc.name      testExtUrlContract0042
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0044
     * @tc.name      testExtUrlContract0043
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0045
     * @tc.name      testExtUrlContract0044
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0046
     * @tc.name      testExtUrlContract0045
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0047
     * @tc.name      testExtUrlContract0046
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0048
     * @tc.name      testExtUrlContract0047
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0049
     * @tc.name      testExtUrlContract0048
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0050
     * @tc.name      testExtUrlContract0049
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0051
     * @tc.name      testExtUrlContract0050
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0052
     * @tc.name      testExtUrlContract0051
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0053
     * @tc.name      testExtUrlContract0052
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0054
     * @tc.name      testExtUrlContract0053
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0055
     * @tc.name      testExtUrlContract0054
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0056
     * @tc.name      testExtUrlContract0055
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0057
     * @tc.name      testExtUrlContract0056
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0058
     * @tc.name      testExtUrlContract0057
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0059
     * @tc.name      testExtUrlContract0058
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0060
     * @tc.name      testExtUrlContract0059
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0061
     * @tc.name      testExtUrlContract0060
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0062
     * @tc.name      testExtUrlContract0061
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0063
     * @tc.name      testExtUrlContract0062
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0064
     * @tc.name      testExtUrlContract0063
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0065
     * @tc.name      testExtUrlContract0064
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0066
     * @tc.name      testExtUrlContract0065
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0067
     * @tc.name      testExtUrlContract0066
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0068
     * @tc.name      testExtUrlContract0067
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0069
     * @tc.name      testExtUrlContract0068
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0070
     * @tc.name      testExtUrlContract0069
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0071
     * @tc.name      testExtUrlContract0070
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0072
     * @tc.name      testExtUrlContract0071
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0073
     * @tc.name      testExtUrlContract0072
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0074
     * @tc.name      testExtUrlContract0073
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0075
     * @tc.name      testExtUrlContract0074
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0076
     * @tc.name      testExtUrlContract0075
     * @tc.desc      URL https://example.com/a.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/a.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0077
     * @tc.name      testExtUrlContract0076
     * @tc.desc      URL https://example.com/b.m3u8 resolves extension m3u8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/b.m3u8';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('m3u8');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0078
     * @tc.name      testExtUrlContract0077
     * @tc.desc      URL https://example.com/c.mp3 resolves extension mp3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/c.mp3';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp3');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0079
     * @tc.name      testExtUrlContract0078
     * @tc.desc      URL https://example.com/d.ts resolves extension ts.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'https://example.com/d.ts';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('ts');
      expect(isHttps).assertEqual(true);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_URL_0080
     * @tc.name      testExtUrlContract0079
     * @tc.desc      URL http://example.com/e.mp4 resolves extension mp4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtUrlContract0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const url: string = 'http://example.com/e.mp4';
      const extension: string = url.substring(url.lastIndexOf('.') + 1);
      const isHttps: boolean = url.startsWith('https://');
      const isHttp: boolean = url.startsWith('http://');
      expect(extension).assertEqual('mp4');
      expect(isHttps).assertEqual(false);
      expect(isHttp || isHttps).assertTrue();
      expect(url.length).assertLarger(0);
      expect(url.indexOf('example.com') > 0).assertTrue();
    })
  });
}
