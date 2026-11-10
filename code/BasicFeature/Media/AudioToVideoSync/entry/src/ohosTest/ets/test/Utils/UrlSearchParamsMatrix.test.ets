/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { url } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';

function params(): url.URLSearchParams {
  return new url.URLSearchParams('a=1&a=2&b=3');
}

export default function urlSearchParamsMatrixTest() {
  describe('urlSearchParamsMatrixTest', () => {
    beforeAll(() => {
      console.info('urlSearchParamsMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('urlSearchParamsMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0100
     * @tc.name      testUrlParams0001
     * @tc.desc      Verify the first value of a repeated parameter is returned by get
     */
    it('testUrlParams0001', 0, () => {
      expect(params().get('a')).assertEqual('1');
      expect(params().get('b')).assertEqual('3');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0200
     * @tc.name      testUrlParams0002
     * @tc.desc      Verify getAll returns every value of a repeated parameter in order
     */
    it('testUrlParams0002', 0, () => {
      const all: string[] = params().getAll('a');
      expect(all.length).assertEqual(2);
      expect(all[0]).assertEqual('1');
      expect(all[1]).assertEqual('2');
      expect(params().getAll('b').length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0300
     * @tc.name      testUrlParams0003
     * @tc.desc      Verify has distinguishes present and absent keys
     */
    it('testUrlParams0003', 0, () => {
      const query: url.URLSearchParams = params();
      expect(query.has('a')).assertTrue();
      expect(query.has('b')).assertTrue();
      expect(query.has('missing')).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0400
     * @tc.name      testUrlParams0004
     * @tc.desc      Verify append adds a new key without disturbing existing values
     */
    it('testUrlParams0004', 0, () => {
      const query: url.URLSearchParams = params();
      query.append('c', '4');
      expect(query.has('c')).assertTrue();
      expect(query.get('c')).assertEqual('4');
      expect(query.getAll('a').length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0500
     * @tc.name      testUrlParams0005
     * @tc.desc      Verify set replaces every value of a repeated key with one value
     */
    it('testUrlParams0005', 0, () => {
      const query: url.URLSearchParams = params();
      query.set('a', '9');
      expect(query.get('a')).assertEqual('9');
      expect(query.getAll('a').length).assertEqual(1);
      expect(query.has('b')).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0600
     * @tc.name      testUrlParams0006
     * @tc.desc      Verify delete removes the key and all of its values
     */
    it('testUrlParams0006', 0, () => {
      const query: url.URLSearchParams = params();
      query.delete('a');
      expect(query.has('a')).assertFalse();
      expect(query.getAll('a').length).assertEqual(0);
      expect(query.has('b')).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_UTIL_PARAMS_0700
     * @tc.name      testUrlParams0007
     * @tc.desc      Verify string serialization reflects appended and removed entries
     */
    it('testUrlParams0007', 0, () => {
      const query: url.URLSearchParams = params();
      query.delete('b');
      query.append('c', '4');
      const text: string = query.toString();
      expect(text.indexOf('a=1') >= 0).assertTrue();
      expect(text.indexOf('c=4') >= 0).assertTrue();
      expect(text.indexOf('b=3')).assertEqual(-1);
    })
  });
}
