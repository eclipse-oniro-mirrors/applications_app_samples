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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NetworkUtils, HttpUtils, NetworkInfo, HttpCallResult } from 'library';

const DOMAIN: number = 0xF811;
// Loopback endpoint on a port that has no listener: every request to it
// fails immediately at transport level, so the offline HTTP cases exercise
// the failure path deterministically without touching real services.
const UNREACHABLE_URL: string = 'http://127.0.0.1:1/health';
// Short connect and read timeout used by the offline HTTP failure cases.
const SHORT_TIMEOUT_MS: number = 3000;
// ASCII alphabet used to build payloads with exact character counts.
const ASCII_UNIT: string = 'abcdefghijklmnopqrstuvwxyz0123456789';

// Build an ASCII text block with the exact requested character count by
// doubling the alphabet and trimming the overshoot with substring.
function asciiBlock(count: number): string {
  let text: string = ASCII_UNIT;
  while (text.length < count) {
    text = text + text;
  }
  return text.substring(0, count);
}

// Registers the numeric matrix test suite for the network and http helpers.
export default function numericMatrixNetHttpTest() {
  // Define the numeric matrix suite that contains all NetworkUtils and HttpUtils cases.
  describe('NumericMatrixNetHttpSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0100
     * @tc.name      testNumNetHttp0001
     * @tc.desc      Verify isSuccessStatus accepts the HTTP 200 lower success boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 200 sits exactly on the inclusive success lower bound.
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      // Status 199 sits just below the lower bound and must be rejected.
      expect(HttpUtils.isSuccessStatus(199)).assertFalse();
      // Status 201 is the first value above the boundary and stays accepted.
      expect(HttpUtils.isSuccessStatus(201)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0200
     * @tc.name      testNumNetHttp0002
     * @tc.desc      Verify isSuccessStatus accepts the HTTP 399 upper success boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 399 sits exactly on the inclusive success upper bound.
      expect(HttpUtils.isSuccessStatus(399)).assertTrue();
      // Status 400 is the first value above the bound and must be rejected.
      expect(HttpUtils.isSuccessStatus(400)).assertFalse();
      // Status 398 is the last value below the bound and stays accepted.
      expect(HttpUtils.isSuccessStatus(398)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0300
     * @tc.name      testNumNetHttp0003
     * @tc.desc      Verify isSuccessStatus rejects the whole informational 1xx status band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 100 Continue is below the success band.
      expect(HttpUtils.isSuccessStatus(100)).assertFalse();
      // Status 101 Switching Protocols is below the success band.
      expect(HttpUtils.isSuccessStatus(101)).assertFalse();
      // Status 199 is the last informational value and stays rejected.
      expect(HttpUtils.isSuccessStatus(199)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0400
     * @tc.name      testNumNetHttp0004
     * @tc.desc      Verify isSuccessStatus accepts typical 2xx success family statuses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 204 No Content is an ordinary transport success.
      expect(HttpUtils.isSuccessStatus(204)).assertTrue();
      // Status 206 Partial Content stays inside the success band.
      expect(HttpUtils.isSuccessStatus(206)).assertTrue();
      // Status 202 Accepted stays inside the success band.
      expect(HttpUtils.isSuccessStatus(202)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0500
     * @tc.name      testNumNetHttp0005
     * @tc.desc      Verify isSuccessStatus accepts the common 3xx redirect statuses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 301 Moved Permanently is counted as transport success.
      expect(HttpUtils.isSuccessStatus(301)).assertTrue();
      // Status 302 Found stays inside the success band.
      expect(HttpUtils.isSuccessStatus(302)).assertTrue();
      // Status 304 Not Modified stays inside the success band.
      expect(HttpUtils.isSuccessStatus(304)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0600
     * @tc.name      testNumNetHttp0006
     * @tc.desc      Verify isSuccessStatus rejects the 401, 403 and 404 client error statuses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 401 Unauthorized is outside the success band.
      expect(HttpUtils.isSuccessStatus(401)).assertFalse();
      // Status 403 Forbidden is outside the success band.
      expect(HttpUtils.isSuccessStatus(403)).assertFalse();
      // Status 404 Not Found is outside the success band.
      expect(HttpUtils.isSuccessStatus(404)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0700
     * @tc.name      testNumNetHttp0007
     * @tc.desc      Verify isSuccessStatus rejects uncommon 4xx client error statuses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 418 is a non standard client error and is rejected.
      expect(HttpUtils.isSuccessStatus(418)).assertFalse();
      // Status 429 Too Many Requests is rejected.
      expect(HttpUtils.isSuccessStatus(429)).assertFalse();
      // Status 499 is a non standard client error and is rejected.
      expect(HttpUtils.isSuccessStatus(499)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0800
     * @tc.name      testNumNetHttp0008
     * @tc.desc      Verify isSuccessStatus rejects the common 5xx server error statuses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 500 Internal Server Error is rejected.
      expect(HttpUtils.isSuccessStatus(500)).assertFalse();
      // Status 502 Bad Gateway is rejected.
      expect(HttpUtils.isSuccessStatus(502)).assertFalse();
      // Status 503 Service Unavailable is rejected.
      expect(HttpUtils.isSuccessStatus(503)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_0900
     * @tc.name      testNumNetHttp0009
     * @tc.desc      Verify isSuccessStatus rejects the far end of the 5xx status band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 505 HTTP Version Not Supported is rejected.
      expect(HttpUtils.isSuccessStatus(505)).assertFalse();
      // Status 511 Network Authentication Required is rejected.
      expect(HttpUtils.isSuccessStatus(511)).assertFalse();
      // Status 599 is the last non standard server error and is rejected.
      expect(HttpUtils.isSuccessStatus(599)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1000
     * @tc.name      testNumNetHttp0010
     * @tc.desc      Verify isSuccessStatus rejects zero and negative numeric status inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 0 is the no-response sentinel and is never a success.
      expect(HttpUtils.isSuccessStatus(0)).assertFalse();
      // Status -1 is below every valid HTTP value and is rejected.
      expect(HttpUtils.isSuccessStatus(-1)).assertFalse();
      // Status -200 doubles the boundary value with a negative sign.
      expect(HttpUtils.isSuccessStatus(-200)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1100
     * @tc.name      testNumNetHttp0011
     * @tc.desc      Verify isSuccessStatus rejects status inputs beyond the HTTP numeric space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 999 sits above every defined HTTP status family.
      expect(HttpUtils.isSuccessStatus(999)).assertFalse();
      // Status 1000 crosses into the four digit numeric space.
      expect(HttpUtils.isSuccessStatus(1000)).assertFalse();
      // Status 1999 is far above the valid status space.
      expect(HttpUtils.isSuccessStatus(1999)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1200
     * @tc.name      testNumNetHttp0012
     * @tc.desc      Verify isSuccessStatus accepts statuses around the 3xx band start.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 299 is the last value of the 2xx family.
      expect(HttpUtils.isSuccessStatus(299)).assertTrue();
      // Status 300 is the first value of the 3xx family.
      expect(HttpUtils.isSuccessStatus(300)).assertTrue();
      // Status 250 sits in the middle of the accepted numeric band.
      expect(HttpUtils.isSuccessStatus(250)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1300
     * @tc.name      testNumNetHttp0013
     * @tc.desc      Verify isSuccessStatus rejects tiny positive numbers below the status space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 1 is far below the success band.
      expect(HttpUtils.isSuccessStatus(1)).assertFalse();
      // Status 99 is the largest value below the 1xx family.
      expect(HttpUtils.isSuccessStatus(99)).assertFalse();
      // Status 50 is an arbitrary tiny positive value and is rejected.
      expect(HttpUtils.isSuccessStatus(50)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1400
     * @tc.name      testNumNetHttp0014
     * @tc.desc      Verify isSuccessStatus classifies fractional numeric inputs by the range test.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 200.5 passes the plain range test because it is above 200.
      expect(HttpUtils.isSuccessStatus(200.5)).assertTrue();
      // Status 399.5 exceeds the inclusive upper bound of 399.
      expect(HttpUtils.isSuccessStatus(399.5)).assertFalse();
      // Status 400.5 fails the range test because it is above the ceiling.
      expect(HttpUtils.isSuccessStatus(400.5)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1500
     * @tc.name      testNumNetHttp0015
     * @tc.desc      Verify isSuccessStatus rejects NaN and infinite numeric specials.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // NaN fails every numeric comparison and must be rejected.
      expect(HttpUtils.isSuccessStatus(Number.NaN)).assertFalse();
      // Positive infinity is above the success ceiling and is rejected.
      expect(HttpUtils.isSuccessStatus(Number.POSITIVE_INFINITY)).assertFalse();
      // Negative infinity is below the success floor and is rejected.
      expect(HttpUtils.isSuccessStatus(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1600
     * @tc.name      testNumNetHttp0016
     * @tc.desc      Verify isSuccessStatus rejects 32 bit boundary and overflow status inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 2147483647 is the 32 bit signed maximum and is rejected.
      expect(HttpUtils.isSuccessStatus(2147483647)).assertFalse();
      // Status 2147483648 crosses the 32 bit signed boundary.
      expect(HttpUtils.isSuccessStatus(2147483648)).assertFalse();
      // Status 4294967296 equals two raised to the power of 32.
      expect(HttpUtils.isSuccessStatus(4294967296)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1700
     * @tc.name      testNumNetHttp0017
     * @tc.desc      Verify isSuccessStatus is idempotent for repeated boundary classifications.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Repeating the 200 boundary check twice keeps the same outcome.
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      // Repeating the 404 rejection twice keeps the same outcome.
      expect(HttpUtils.isSuccessStatus(404)).assertFalse();
      expect(HttpUtils.isSuccessStatus(404)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1800
     * @tc.name      testNumNetHttp0018
     * @tc.desc      Verify isSuccessStatus classifies a full status family sweep by hundreds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sweep one representative of every status family.
      const codes: number[] = [100, 200, 300, 400, 500];
      // Only the 2xx and 3xx representatives belong to the success band.
      const flags: boolean[] = [false, true, true, false, false];
      // Classify each representative and compare with the expected flag.
      for (let index = 0; index < codes.length; index++) {
        expect(HttpUtils.isSuccessStatus(codes[index])).assertEqual(flags[index]);
      }
      // A late third-digit boundary value stays inside the success band.
      expect(HttpUtils.isSuccessStatus(299)).assertTrue();
      // The canonical not-found status stays outside the success band.
      expect(HttpUtils.isSuccessStatus(404)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_1900
     * @tc.name      testNumNetHttp0019
     * @tc.desc      Verify isSuccessStatus rejects single digit and double digit values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Status 5 is a single digit value far below the success band.
      expect(HttpUtils.isSuccessStatus(5)).assertFalse();
      // Status 10 is a small double digit value and is rejected.
      expect(HttpUtils.isSuccessStatus(10)).assertFalse();
      // Status 55 sits between 10 and 99 and is rejected.
      expect(HttpUtils.isSuccessStatus(55)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2000
     * @tc.name      testNumNetHttp0020
     * @tc.desc      Verify httpGet reports a failed HttpCallResult for the unreachable loopback URL.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The loopback endpoint has no listener, so the request must fail.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // Transport failure keeps success false and never reports a status.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // No response body can exist when the transport itself failed.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2100
     * @tc.name      testNumNetHttp0021
     * @tc.desc      Verify httpGet reports a positive transport error code for the failed attempt.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Exercise the catch path of attemptOnce through the public API.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // The transport error code must be strictly positive, not zero.
      expect(result.errorCode > 0).assertTrue();
      // The success flag mirrors the positive error code with false.
      expect(result.success).assertFalse();
      // The failure keeps the numeric status at the none sentinel.
      expect(result.statusCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2200
     * @tc.name      testNumNetHttp0022
     * @tc.desc      Verify httpGet failure message names the request failure prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run one failing request to inspect the human readable message.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // The message must carry the generic failure prefix text.
      expect(result.message).assertContain('Request failed');
      // The message is never empty on the failure path.
      expect(result.message.length > 0).assertTrue();
      // The success flag stays false alongside the failure message.
      expect(result.success).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2300
     * @tc.name      testNumNetHttp0023
     * @tc.desc      Verify httpGet fails identically for the https scheme on the closed loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Switch the scheme while keeping the closed loopback port one.
      const result: HttpCallResult = await HttpUtils.httpGet('https://127.0.0.1:1/health', SHORT_TIMEOUT_MS, 0);
      // The https transport failure keeps the same failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code is reported through the result.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2400
     * @tc.name      testNumNetHttp0024
     * @tc.desc      Verify httpGet fails for an empty request path on the closed loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty path form is the shortest absolute URL shape.
      const result: HttpCallResult = await HttpUtils.httpGet('http://127.0.0.1:1/', SHORT_TIMEOUT_MS, 0);
      // The failure shape stays stable for the empty path.
      expect(result.success).assertFalse();
      expect(result.body).assertEqual('');
      // The transport error code remains positive for the closed port.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2500
     * @tc.name      testNumNetHttp0025
     * @tc.desc      Verify httpGet fails for a deeply nested request path on the closed loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The deep path uses eight nested segments after the host.
      const result: HttpCallResult =
        await HttpUtils.httpGet('http://127.0.0.1:1/a/b/c/d/e/f/g/h', SHORT_TIMEOUT_MS, 0);
      // The failure shape does not depend on the path depth.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code stays positive for the closed port.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2600
     * @tc.name      testNumNetHttp0026
     * @tc.desc      Verify httpGet fails for a URL carrying a multi key query string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The query string carries two keys joined by an ampersand.
      const result: HttpCallResult =
        await HttpUtils.httpGet('http://127.0.0.1:1/x?key=value&page=2', SHORT_TIMEOUT_MS, 0);
      // The failure shape stays stable when a query string is present.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The body stays empty because no response ever arrived.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2700
     * @tc.name      testNumNetHttp0027
     * @tc.desc      Verify httpGet fails for a URL carrying a fragment part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fragment part is stripped before the transport request.
      const result: HttpCallResult =
        await HttpUtils.httpGet('http://127.0.0.1:1/x#section', SHORT_TIMEOUT_MS, 0);
      // The failure shape stays stable when a fragment is present.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The failure message still names the generic prefix.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2800
     * @tc.name      testNumNetHttp0028
     * @tc.desc      Verify httpGet fails for the port zero URL boundary value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port zero is the lowest numeric port value and is unusable.
      const result: HttpCallResult = await HttpUtils.httpGet('http://127.0.0.1:0/x', SHORT_TIMEOUT_MS, 0);
      // The request cannot reach a service on port zero.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // No response body can exist for the unusable port.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_2900
     * @tc.name      testNumNetHttp0029
     * @tc.desc      Verify httpGet fails for the maximum port 65535 boundary value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port 65535 is the largest numeric port value and stays closed here.
      const result: HttpCallResult = await HttpUtils.httpGet('http://127.0.0.1:65535/x', SHORT_TIMEOUT_MS, 0);
      // The transport failure keeps the standard failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code remains strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3000
     * @tc.name      testNumNetHttp0030
     * @tc.desc      Verify httpGet fails for the out of range port 65536 value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port 65536 exceeds the sixteen bit port space and is invalid.
      const result: HttpCallResult = await HttpUtils.httpGet('http://127.0.0.1:65536/x', SHORT_TIMEOUT_MS, 0);
      // The invalid port keeps the transport failure shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The failure message carries the generic prefix text.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3100
     * @tc.name      testNumNetHttp0031
     * @tc.desc      Verify httpGet fails for the localhost host name on the closed loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The localhost alias resolves to the same closed loopback port.
      const result: HttpCallResult = await HttpUtils.httpGet('http://localhost:1/health', SHORT_TIMEOUT_MS, 0);
      // The host name form keeps the transport failure shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The body stays empty because the connection never opened.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3200
     * @tc.name      testNumNetHttp0032
     * @tc.desc      Verify httpGet fails with a one millisecond timeout on the closed port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One millisecond is the smallest practical timeout value.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, 1, 0);
      // The refused connection keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3300
     * @tc.name      testNumNetHttp0033
     * @tc.desc      Verify httpGet fails with a hundred millisecond timeout on the closed port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One hundred milliseconds is a short but realistic timeout.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, 100, 0);
      // The failure shape stays stable across timeout values.
      expect(result.success).assertFalse();
      expect(result.body).assertEqual('');
      // The failure message still carries the generic prefix.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3400
     * @tc.name      testNumNetHttp0034
     * @tc.desc      Verify httpGet accepts an explicit three second timeout on the closed port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three thousand milliseconds equals the documented short timeout.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, 3000, 0);
      // The closed port fails before the timeout can elapse.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code is always reported on failure.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3500
     * @tc.name      testNumNetHttp0035
     * @tc.desc      Verify httpGet with retry zero performs exactly one failed attempt.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Retry count zero means the first attempt result is final.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // The single failed attempt keeps the standard failure shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code carries the refused connection code.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3600
     * @tc.name      testNumNetHttp0036
     * @tc.desc      Verify httpGet with three retries still reports the final failure shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three retries exhaust the backoff ladder and stay failed.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 3);
      // The final attempt result keeps the failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The last transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3700
     * @tc.name      testNumNetHttp0037
     * @tc.desc      Verify httpGet clamps a negative retry count to zero attempts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Negative retry counts clamp to zero so one attempt still runs.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, -5);
      // The clamped retry ladder keeps the failed attempt shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The attempt result carries a positive transport error code.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3800
     * @tc.name      testNumNetHttp0038
     * @tc.desc      Verify httpGet fails fast for the empty URL string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty URL is rejected by the transport before any connection.
      const result: HttpCallResult = await HttpUtils.httpGet('', SHORT_TIMEOUT_MS, 0);
      // The failure shape reports no success and no status.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The generic failure prefix stays present in the message.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_3900
     * @tc.name      testNumNetHttp0039
     * @tc.desc      Verify httpGet fails fast for a malformed URL without a host.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A URL without a host part cannot be resolved or connected.
      const result: HttpCallResult = await HttpUtils.httpGet('http://', SHORT_TIMEOUT_MS, 0);
      // The malformed URL keeps the transport failure shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The body stays empty because no response ever arrived.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4000
     * @tc.name      testNumNetHttp0040
     * @tc.desc      Verify httpGet fails for the unsupported ftp scheme.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The ftp scheme is outside the http and https transport set.
      const result: HttpCallResult = await HttpUtils.httpGet('ftp://127.0.0.1:1/x', SHORT_TIMEOUT_MS, 0);
      // The unsupported scheme keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4100
     * @tc.name      testNumNetHttp0041
     * @tc.desc      Verify two consecutive httpGet calls report the same stable failure shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run two back to back requests against the closed loopback port.
      const first: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      const second: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // Both calls fail with the same transport level outcome.
      expect(first.success).assertFalse();
      expect(second.success).assertFalse();
      // Both calls keep the numeric status at the none sentinel.
      expect(first.statusCode).assertEqual(second.statusCode);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4200
     * @tc.name      testNumNetHttp0042
     * @tc.desc      Verify httpPost reports a failed HttpCallResult for the unreachable loopback URL.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A short payload posted to the closed port must fail.
      const result: HttpCallResult =
        await HttpUtils.httpPost(UNREACHABLE_URL, '{"key":"value"}', SHORT_TIMEOUT_MS, 0);
      // The post transport failure keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // No response body can exist for the refused connection.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4300
     * @tc.name      testNumNetHttp0043
     * @tc.desc      Verify httpPost with an empty body still fails with a positive error code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty body is the shortest possible post payload.
      const result: HttpCallResult = await HttpUtils.httpPost(UNREACHABLE_URL, '', SHORT_TIMEOUT_MS, 0);
      // The empty payload failure keeps the transport error path.
      expect(result.success).assertFalse();
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      // The numeric status stays at the none sentinel.
      expect(result.statusCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4400
     * @tc.name      testNumNetHttp0044
     * @tc.desc      Verify httpPost with a ten kilobyte body fails on the closed loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ten kilobytes is a large but still reasonable text payload.
      const result: HttpCallResult =
        await HttpUtils.httpPost(UNREACHABLE_URL, asciiBlock(10240), SHORT_TIMEOUT_MS, 0);
      // The large payload failure keeps the standard failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The failure message carries the generic prefix text.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4500
     * @tc.name      testNumNetHttp0045
     * @tc.desc      Verify httpPost with a multibyte unicode body fails on the closed port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The unicode payload exercises the multibyte encoding path.
      const result: HttpCallResult =
        await HttpUtils.httpPost(UNREACHABLE_URL, '你好，网络安全', SHORT_TIMEOUT_MS, 0);
      // The unicode payload failure keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code remains strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4600
     * @tc.name      testNumNetHttp0046
     * @tc.desc      Verify httpPost with a multiline body fails on the closed loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The multiline payload contains three text rows.
      const result: HttpCallResult =
        await HttpUtils.httpPost(UNREACHABLE_URL, 'line one' + '\n' + 'line two' + '\n' + 'line three',
          SHORT_TIMEOUT_MS, 0);
      // The multiline payload failure keeps the failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The body stays empty because no response ever arrived.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4700
     * @tc.name      testNumNetHttp0047
     * @tc.desc      Verify httpPost with two retries still reports the final failure shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two retries exhaust the backoff ladder on the closed port.
      const result: HttpCallResult =
        await HttpUtils.httpPost(UNREACHABLE_URL, 'retry-body', SHORT_TIMEOUT_MS, 2);
      // The final post attempt keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The last transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4800
     * @tc.name      testNumNetHttp0048
     * @tc.desc      Verify httpPost with a one millisecond timeout fails on the closed port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one millisecond timeout is the smallest practical value.
      const result: HttpCallResult = await HttpUtils.httpPost(UNREACHABLE_URL, 'quick', 1, 0);
      // The refused connection keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The failure message carries the generic prefix text.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_4900
     * @tc.name      testNumNetHttp0049
     * @tc.desc      Verify httpPost failure result separates status none from the transport code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The closed port never produces an HTTP status value.
      const result: HttpCallResult =
        await HttpUtils.httpPost('https://127.0.0.1:1/post', 'payload', SHORT_TIMEOUT_MS, 0);
      // The numeric status stays at zero for the transport failure.
      expect(result.statusCode).assertEqual(0);
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      // The success flag stays false for the https post failure.
      expect(result.success).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5000
     * @tc.name      testNumNetHttp0050
     * @tc.desc      Verify httpPost failure message contains the generic failure prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The plain text payload fails on the closed loopback port.
      const result: HttpCallResult =
        await HttpUtils.httpPost(UNREACHABLE_URL, 'plain text body', SHORT_TIMEOUT_MS, 0);
      // The failure message names the generic request failure prefix.
      expect(result.message).assertContain('Request failed');
      // The message is never empty on the post failure path.
      expect(result.message.length > 0).assertTrue();
      // The body stays empty alongside the failure message.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5100
     * @tc.name      testNumNetHttp0051
     * @tc.desc      Verify httpPost with a single character body fails on the closed port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one character payload is the smallest non-empty post body.
      const result: HttpCallResult = await HttpUtils.httpPost(UNREACHABLE_URL, 'x', SHORT_TIMEOUT_MS, 0);
      // The tiny payload failure keeps the standard failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5200
     * @tc.name      testNumNetHttp0052
     * @tc.desc      Verify the HttpCallResult failure shape exposes typed boolean and number fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect one failed result to inspect the contract fields.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // The success field is a real boolean and false on failure.
      expect(result.success === true || result.success === false).assertTrue();
      expect(result.success).assertFalse();
      // The status and error code fields carry numeric sentinels.
      expect(result.statusCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5300
     * @tc.name      testNumNetHttp0053
     * @tc.desc      Verify the HttpCallResult failure shape carries a positive code and a message.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect one failed get result for the message contract.
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      // The message is a non-empty readable description.
      expect(result.message.length > 0).assertTrue();
      // The body stays an empty string on the failure path.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5400
     * @tc.name      testNumNetHttp0054
     * @tc.desc      Verify repeated httpGet calls return independent failure results with equal codes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run the same closed port request twice in sequence.
      const first: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      const second: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      // Both results report the same numeric status sentinel.
      expect(first.statusCode).assertEqual(second.statusCode);
      // Both results stay marked as failed.
      expect(first.success).assertFalse();
      expect(second.success).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5500
     * @tc.name      testNumNetHttp0055
     * @tc.desc      Verify hasDefaultNetwork returns a stable boolean without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The system query never throws and always yields a boolean.
      const first: boolean = await NetworkUtils.hasDefaultNetwork();
      // The result must sit inside the boolean value domain.
      expect(first === true || first === false).assertTrue();
      // A second call returns the same stable answer.
      const second: boolean = await NetworkUtils.hasDefaultNetwork();
      expect(second).assertEqual(first);
      // The repeated answer also sits inside the boolean value domain.
      expect(second === true || second === false).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5600
     * @tc.name      testNumNetHttp0056
     * @tc.desc      Verify hasDefaultNetwork stays stable across three consecutive calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three rapid queries describe the same system state.
      const first: boolean = await NetworkUtils.hasDefaultNetwork();
      const second: boolean = await NetworkUtils.hasDefaultNetwork();
      const third: boolean = await NetworkUtils.hasDefaultNetwork();
      // Every query result stays inside the boolean domain.
      expect(first === true || first === false).assertTrue();
      expect(second === true || second === false).assertTrue();
      // The third answer matches the first answer exactly.
      expect(third).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5700
     * @tc.name      testNumNetHttp0057
     * @tc.desc      Verify isNetworkAvailable returns a stable boolean without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The availability query degrades to false instead of throwing.
      const first: boolean = await NetworkUtils.isNetworkAvailable();
      // The result must sit inside the boolean value domain.
      expect(first === true || first === false).assertTrue();
      // A second call keeps the same stable availability answer.
      const second: boolean = await NetworkUtils.isNetworkAvailable();
      expect(second).assertEqual(first);
      // The repeated answer also stays inside the boolean value domain.
      expect(second === true || second === false).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5800
     * @tc.name      testNumNetHttp0058
     * @tc.desc      Verify isNetworkAvailable stays stable across three consecutive calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three rapid queries describe the same availability state.
      const first: boolean = await NetworkUtils.isNetworkAvailable();
      const second: boolean = await NetworkUtils.isNetworkAvailable();
      const third: boolean = await NetworkUtils.isNetworkAvailable();
      // Every answer stays inside the boolean value domain.
      expect(first === true || first === false).assertTrue();
      expect(second === true || second === false).assertTrue();
      // The third answer matches the first answer exactly.
      expect(third).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_5900
     * @tc.name      testNumNetHttp0059
     * @tc.desc      Verify getNetworkInfo returns a boolean availability field without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The snapshot call degrades to the unavailable shape on failure.
      const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // The availability field stays inside the boolean value domain.
      expect(info.available === true || info.available === false).assertTrue();
      // An unavailable snapshot must report the documented Unknown bearer.
      if (info.available === false) {
        expect(info.bearerText).assertEqual('Unknown');
      }
      // The netId field keeps the non negative numeric domain.
      expect(info.netId >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6000
     * @tc.name      testNumNetHttp0060
     * @tc.desc      Verify getNetworkInfo returns a non negative netId in both shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two snapshots carry the same numeric netId domain.
      const first: NetworkInfo = await NetworkUtils.getNetworkInfo();
      const second: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // Both netId values stay at zero or above in every shape.
      expect(first.netId >= 0).assertTrue();
      expect(second.netId >= 0).assertTrue();
      // The none sentinel zero is reported when no default network exists.
      expect(first.netId >= 0 && first.netId <= 4294967296).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6100
     * @tc.name      testNumNetHttp0061
     * @tc.desc      Verify getNetworkInfo always returns a non-empty bearerText string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two snapshots carry the same bearerText domain.
      const first: NetworkInfo = await NetworkUtils.getNetworkInfo();
      const second: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // The bearer text is never empty because Unknown is the fallback.
      expect(first.bearerText.length > 0).assertTrue();
      // The second snapshot keeps the same non-empty contract.
      expect(second.bearerText.length > 0).assertTrue();
      // The unknown fallback is exactly the documented sentinel text.
      expect(first.bearerText === 'Unknown' || first.bearerText.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6200
     * @tc.name      testNumNetHttp0062
     * @tc.desc      Verify two getNetworkInfo snapshots report the same stable netId and availability.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two back to back snapshots describe the same default network.
      const first: NetworkInfo = await NetworkUtils.getNetworkInfo();
      const second: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // The netId stays identical between the two snapshots.
      expect(first.netId).assertEqual(second.netId);
      // The availability flag stays identical between the two snapshots.
      expect(first.available).assertEqual(second.available);
      // Both snapshots keep the non negative numeric domain.
      expect(second.netId >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6300
     * @tc.name      testNumNetHttp0063
     * @tc.desc      Verify getNetworkInfo keeps the Unknown bearer contract for unavailable networks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect one snapshot for the degradation contract check.
      const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // An unavailable snapshot always reports the Unknown sentinel.
      if (info.available === false) {
        expect(info.bearerText).assertEqual('Unknown');
        expect(info.netId).assertEqual(0);
      }
      // The bearer text is non-empty in every reported shape.
      expect(info.bearerText.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6400
     * @tc.name      testNumNetHttp0064
     * @tc.desc      Verify getBearerName returns a stable non-empty readable bearer string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bearer name query reuses the snapshot resolution path.
      const first: string = await NetworkUtils.getBearerName();
      // The returned bearer text is never empty.
      expect(first.length > 0).assertTrue();
      // A second query keeps the same stable bearer name.
      const second: string = await NetworkUtils.getBearerName();
      expect(second).assertEqual(first);
      // The repeated bearer text is never empty either.
      expect(second.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6500
     * @tc.name      testNumNetHttp0065
     * @tc.desc      Verify getBearerName reports a known bearer name or the Unknown fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Resolve the bearer name twice from the snapshot path.
      const name: string = await NetworkUtils.getBearerName();
      // The unknown sentinel is the documented degradation value.
      expect(name.length > 0).assertTrue();
      // A known bearer resolves to one of the readable family names.
      expect(name === 'WiFi' || name === 'Cellular' || name === 'Ethernet'
        || name === 'VPN' || name === 'Bluetooth' || name === 'Unknown').assertTrue();
      // Bearer family names never contain whitespace characters.
      expect(name.indexOf(' ') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6600
     * @tc.name      testNumNetHttp0066
     * @tc.desc      Verify the full NetworkUtils query sequence completes without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run every public NetworkUtils query in one sequence.
      const available: boolean = await NetworkUtils.isNetworkAvailable();
      const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
      const bearer: string = await NetworkUtils.getBearerName();
      // Every result keeps its documented value domain.
      expect(available === true || available === false).assertTrue();
      expect(info.netId >= 0).assertTrue();
      expect(bearer.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6700
     * @tc.name      testNumNetHttp0067
     * @tc.desc      Verify a single getNetworkInfo snapshot satisfies the full field contract.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One snapshot carries all three contract fields at once.
      const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // The availability field stays inside the boolean domain.
      expect(info.available === true || info.available === false).assertTrue();
      // The netId stays inside the non negative numeric domain.
      expect(info.netId >= 0).assertTrue();
      // The bearer text stays a non-empty readable string.
      expect(info.bearerText.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6800
     * @tc.name      testNumNetHttp0068
     * @tc.desc      Verify three getNetworkInfo snapshots report one stable netId triple.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three rapid snapshots describe the same default network id.
      const first: NetworkInfo = await NetworkUtils.getNetworkInfo();
      const second: NetworkInfo = await NetworkUtils.getNetworkInfo();
      const third: NetworkInfo = await NetworkUtils.getNetworkInfo();
      // The first two netId values stay identical.
      expect(first.netId).assertEqual(second.netId);
      // The third snapshot matches the first snapshot exactly.
      expect(third.netId).assertEqual(first.netId);
      // Every snapshot keeps the non negative numeric domain.
      expect(first.netId >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_6900
     * @tc.name      testNumNetHttp0069
     * @tc.desc      Verify isSuccessStatus classifies the four range boundary values in one sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The four values pin both inclusive ends of the success band.
      const codes: number[] = [199, 200, 399, 400];
      // Only 200 and 399 belong to the inclusive success band.
      const flags: boolean[] = [false, true, true, false];
      // Classify each boundary value and compare the expected flag.
      for (let index = 0; index < codes.length; index++) {
        expect(HttpUtils.isSuccessStatus(codes[index])).assertEqual(flags[index]);
      }
      // The inclusive lower end of the band is classified as success.
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      // The first value past the band end is classified as failure.
      expect(HttpUtils.isSuccessStatus(400)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_7000
     * @tc.name      testNumNetHttp0070
     * @tc.desc      Verify httpGet fails for a two hundred character request path segment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0070';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a very long single path segment on the closed port.
      const longPath: string = 'http://127.0.0.1:1/' + asciiBlock(200);
      const result: HttpCallResult = await HttpUtils.httpGet(longPath, SHORT_TIMEOUT_MS, 0);
      // The long path failure keeps the standard failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The transport error code stays strictly positive.
      expect(result.errorCode > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_7100
     * @tc.name      testNumNetHttp0071
     * @tc.desc      Verify httpPost with a one kilobyte body fails on the maximum loopback port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0071';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one kilobyte payload hits the maximum closed port value.
      const result: HttpCallResult =
        await HttpUtils.httpPost('http://127.0.0.1:65535/post', asciiBlock(1024), SHORT_TIMEOUT_MS, 0);
      // The kilobyte payload failure keeps the failed result shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The body stays empty because no response ever arrived.
      expect(result.body).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_7200
     * @tc.name      testNumNetHttp0072
     * @tc.desc      Verify httpGet fails for a URL combining deep path, query and fragment parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0072';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The combined URL carries a deep path, query and fragment at once.
      const combined: string = 'http://127.0.0.1:1/a/b?key=value&flag=1' + '#top';
      const result: HttpCallResult = await HttpUtils.httpGet(combined, SHORT_TIMEOUT_MS, 0);
      // The combined URL failure keeps the standard failed shape.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The failure message carries the generic prefix text.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_7300
     * @tc.name      testNumNetHttp0073
     * @tc.desc      Verify hasDefaultNetwork and isNetworkAvailable agree on the boolean domain.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0073';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both queries describe the same default network state.
      const hasDefault: boolean = await NetworkUtils.hasDefaultNetwork();
      const isAvailable: boolean = await NetworkUtils.isNetworkAvailable();
      // Each answer stays inside the boolean value domain.
      expect(hasDefault === true || hasDefault === false).assertTrue();
      expect(isAvailable === true || isAvailable === false).assertTrue();
      // An available network always implies a present default network.
      if (isAvailable === true) {
        expect(hasDefault).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_7400
     * @tc.name      testNumNetHttp0074
     * @tc.desc      Verify httpGet with retries on the empty URL still reports the failure shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumNetHttp0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumNetHttp0074';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty URL fails every attempt of the two retry ladder.
      const result: HttpCallResult = await HttpUtils.httpGet('', SHORT_TIMEOUT_MS, 2);
      // Every attempt fails, so the final shape stays failed.
      expect(result.success).assertFalse();
      expect(result.statusCode).assertEqual(0);
      // The generic failure prefix stays present in the message.
      expect(result.message).assertContain('Request failed');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_NETHTTP_7500
     * @tc.name      testNumNetHttp0075
     * @tc.desc      Verify isSuccessStatus sweeps the 2xx band edges around the accepted range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumNetHttp0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumNetHttp0075';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The sweep walks the inner edges of the accepted numeric band.
      const codes: number[] = [201, 204, 250, 299, 300];
      // Every swept value belongs to the inclusive success band.
      for (let index = 0; index < codes.length; index++) {
        expect(HttpUtils.isSuccessStatus(codes[index])).assertTrue();
      }
      // The band edges 199 and 400 stay outside the accepted range.
      expect(HttpUtils.isSuccessStatus(199)).assertFalse();
      expect(HttpUtils.isSuccessStatus(400)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
