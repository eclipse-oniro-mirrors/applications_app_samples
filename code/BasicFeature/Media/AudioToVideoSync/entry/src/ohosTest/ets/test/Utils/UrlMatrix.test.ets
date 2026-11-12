/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { url } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';
import { hilog } from '@kit.PerformanceAnalysisKit';

const SAMPLE: string = 'https://example.com:8443/path/to?x=1&x=2#frag';

function sampleUrl(): url.URL {
  return new url.URL(SAMPLE);
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Utils_UrlMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function urlMatrixTest() {
  describe('urlMatrixTest', () => {
    beforeAll(() => {
      console.info('urlMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('urlMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0100
     * @tc.name      testUrl0001
     * @tc.desc      Verify protocol, hostname, port and host are split from the absolute URL
     */
    it('testUrl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0001');
      const parsed: url.URL = sampleUrl();
      expect(parsed.protocol).assertEqual('https:');
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.port).assertEqual('8443');
      expect(parsed.host).assertEqual('example.com:8443');
    
      logEnd('testUrl0001');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0200
     * @tc.name      testUrl0002
     * @tc.desc      Verify pathname, search and hash are split from the absolute URL
     */
    it('testUrl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0002');
      const parsed: url.URL = sampleUrl();
      expect(parsed.pathname).assertEqual('/path/to');
      expect(parsed.search).assertEqual('?x=1&x=2');
      expect(parsed.hash).assertEqual('#frag');
    
      logEnd('testUrl0002');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0300
     * @tc.name      testUrl0003
     * @tc.desc      Verify href and toString reproduce the original absolute URL
     */
    it('testUrl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0003');
      const parsed: url.URL = sampleUrl();
      expect(parsed.href).assertEqual(SAMPLE);
      expect(parsed.toString()).assertEqual(SAMPLE);
    
      logEnd('testUrl0003');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0400
     * @tc.name      testUrl0004
     * @tc.desc      Verify the first and all values of a repeated query parameter are available
     */
    it('testUrl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0004');
      const parsed: url.URL = sampleUrl();
      expect(parsed.searchParams.get('x')).assertEqual('1');
      const all: string[] = parsed.searchParams.getAll('x');
      expect(all.length).assertEqual(2);
      expect(all[0]).assertEqual('1');
      expect(all[1]).assertEqual('2');
    
      logEnd('testUrl0004');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0500
     * @tc.name      testUrl0005
     * @tc.desc      Verify query membership distinguishes present and absent keys
     */
    it('testUrl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0005');
      const parsed: url.URL = sampleUrl();
      expect(parsed.searchParams.has('x')).assertTrue();
      expect(parsed.searchParams.has('missing')).assertFalse();
    
      logEnd('testUrl0005');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0600
     * @tc.name      testUrl0006
     * @tc.desc      Verify a relative path resolves against the supplied base URL
     */
    it('testUrl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0006');
      const resolved: url.URL = new url.URL('/a/b', 'https://example.com');
      expect(resolved.href).assertEqual('https://example.com/a/b');
      expect(resolved.pathname).assertEqual('/a/b');
      expect(resolved.hostname).assertEqual('example.com');
      expect(resolved.protocol).assertEqual('https:');
    
      logEnd('testUrl0006');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URL_0700
     * @tc.name      testUrl0007
     * @tc.desc      Verify a URL without an explicit port reports an empty port and a bare host
     */
    it('testUrl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUrl0007');
      const parsed: url.URL = new url.URL('https://example.com/path');
      expect(parsed.port).assertEqual('');
      expect(parsed.host).assertEqual('example.com');
      expect(parsed.hostname).assertEqual('example.com');
      expect(parsed.pathname).assertEqual('/path');
    
      logEnd('testUrl0007');
    })
  });
}
