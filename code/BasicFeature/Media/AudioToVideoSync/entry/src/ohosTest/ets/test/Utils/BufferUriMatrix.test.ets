/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { buffer, uri } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';
import { hilog } from '@kit.PerformanceAnalysisKit';

function makeBuffer(text: string): buffer.Buffer {
  return buffer.from(text);
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Utils_BufferUriMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function bufferUriMatrixTest() {
  describe('bufferUriMatrixTest', () => {
    beforeAll(() => {
      console.info('bufferUriMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('bufferUriMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0100
     * @tc.name      testBuffer0001
     * @tc.desc      Verify a buffer created from ASCII text keeps three bytes and the same text
     */
    it('testBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0001');
      const value: buffer.Buffer = makeBuffer('abc');
      expect(value.length).assertEqual(3);
      expect(value.toString()).assertEqual('abc');
    
      logEnd('testBuffer0001');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0200
     * @tc.name      testBuffer0002
     * @tc.desc      Verify byteLength matches UTF-8 widths for ASCII, CJK and emoji
     */
    it('testBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0002');
      expect(buffer.byteLength('abc')).assertEqual(3);
      expect(buffer.byteLength('中')).assertEqual(3);
      expect(buffer.byteLength('😀')).assertEqual(4);
    
      logEnd('testBuffer0002');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0300
     * @tc.name      testBuffer0003
     * @tc.desc      Verify alloc produces the requested length filled with the requested byte
     */
    it('testBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0003');
      const value: buffer.Buffer = buffer.alloc(4, 0);
      expect(value.length).assertEqual(4);
      for (let i = 0; i < value.length; i++) {
        expect(value[i]).assertEqual(0);
      }
    
      logEnd('testBuffer0003');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0400
     * @tc.name      testBuffer0004
     * @tc.desc      Verify concat joins two buffers in order with the summed length
     */
    it('testBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0004');
      const joined: buffer.Buffer = buffer.concat([makeBuffer('ab'), makeBuffer('cd')]);
      expect(joined.length).assertEqual(4);
      expect(joined.toString()).assertEqual('abcd');
    
      logEnd('testBuffer0004');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0500
     * @tc.name      testBuffer0005
     * @tc.desc      Verify subarray selects the requested half-open byte range
     */
    it('testBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0005');
      const value: buffer.Buffer = makeBuffer('abcdef');
      const slice: buffer.Buffer = value.subarray(1, 4);
      expect(slice.length).assertEqual(3);
      expect(slice.toString()).assertEqual('bcd');
      expect(value.toString()).assertEqual('abcdef');
    
      logEnd('testBuffer0005');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0600
     * @tc.name      testBuffer0006
     * @tc.desc      Verify hexadecimal rendering matches the known ASCII byte codes
     */
    it('testBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0006');
      expect(makeBuffer('abc').toString('hex')).assertEqual('616263');
      expect(makeBuffer('A').toString('hex')).assertEqual('41');
    
      logEnd('testBuffer0006');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0700
     * @tc.name      testBuffer0007
     * @tc.desc      Verify a buffer created from a byte array renders the same text
     */
    it('testBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0007');
      const value: buffer.Buffer = buffer.from([65, 66, 67]);
      expect(value.length).assertEqual(3);
      expect(value.toString()).assertEqual('ABC');
    
      logEnd('testBuffer0007');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_BUFFER_0800
     * @tc.name      testBuffer0008
     * @tc.desc      Verify a CJK buffer keeps the encoded byte length and text round trip
     */
    it('testBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testBuffer0008');
      const value: buffer.Buffer = makeBuffer('音画');
      expect(value.length).assertEqual(6);
      expect(value.toString()).assertEqual('音画');
      expect(value.length).assertEqual(buffer.byteLength('音画'));
    
      logEnd('testBuffer0008');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0100
     * @tc.name      testUri0001
     * @tc.desc      Verify a well-formed absolute URI round-trips through toString
     */
    it('testUri0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0001');
      const text: string = 'https://example.com/path/to?x=1&x=2';
      const parsed: uri.URI = new uri.URI(text);
      expect(parsed.toString()).assertEqual(text);
      expect(parsed.checkIsAbsolute()).assertTrue();
    
      logEnd('testUri0001');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0200
     * @tc.name      testUri0002
     * @tc.desc      Verify a relative path URI is not absolute
     */
    it('testUri0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0002');
      const parsed: uri.URI = new uri.URI('/relative/path');
      expect(parsed.checkIsAbsolute()).assertFalse();
      expect(parsed.toString()).assertEqual('/relative/path');
    
      logEnd('testUri0002');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0300
     * @tc.name      testUri0003
     * @tc.desc      Verify the first query value is returned for a repeated key
     */
    it('testUri0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0003');
      const parsed: uri.URI = new uri.URI('https://example.com/path?x=1&x=2');
      expect(parsed.getQueryValue('x')).assertEqual('1');
    
      logEnd('testUri0003');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0400
     * @tc.name      testUri0004
     * @tc.desc      Verify all values of a repeated query key are available
     */
    it('testUri0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0004');
      const parsed: uri.URI = new uri.URI('https://example.com/path?x=1&x=2');
      const values: string[] = parsed.getQueryValues('x');
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual('1');
      expect(values[1]).assertEqual('2');
    
      logEnd('testUri0004');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0500
     * @tc.name      testUri0005
     * @tc.desc      Verify the query key list contains the repeated parameter exactly once
     */
    it('testUri0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0005');
      const parsed: uri.URI = new uri.URI('https://example.com/path?x=1&x=2');
      const names: string[] = parsed.getQueryNames();
      expect(names.indexOf('x') >= 0).assertTrue();
      expect(names.lastIndexOf('x')).assertEqual(names.indexOf('x'));
    
      logEnd('testUri0005');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0600
     * @tc.name      testUri0006
     * @tc.desc      Verify adding a query value creates a new URI and leaves the original unchanged
     */
    it('testUri0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0006');
      const original: uri.URI = new uri.URI('https://example.com/path?x=1');
      const extended: uri.URI = original.addQueryValue('y', '3');
      expect(extended.toString().indexOf('y=3') >= 0).assertTrue();
      expect(original.toString().indexOf('y=3')).assertEqual(-1);
      expect(extended.getQueryValue('y')).assertEqual('3');
    
      logEnd('testUri0006');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_URI_0700
     * @tc.name      testUri0007
     * @tc.desc      Verify the last path segment is the final component before the query
     */
    it('testUri0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testUri0007');
      const parsed: uri.URI = new uri.URI('https://example.com/path/to?x=1');
      expect(parsed.getLastSegment()).assertEqual('to');
    
      logEnd('testUri0007');
    })
  });
}
