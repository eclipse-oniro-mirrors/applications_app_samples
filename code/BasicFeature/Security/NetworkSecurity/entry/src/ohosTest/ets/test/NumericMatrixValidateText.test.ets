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
import { ValidateUtils } from 'library';

const DOMAIN: number = 0xF811;

// Registers the numeric matrix test suite for the url and text validation helpers.
export default function numericMatrixValidateTextTest() {
  describe('NumericMatrixValidateTextSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0100
     * @tc.name      testNumValText0001
     * @tc.desc      Verify isValidUrl accepts plain http and https hosts without path.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bare http host is the minimal accepted absolute URL.
      expect(ValidateUtils.isValidUrl('http://example.com')).assertTrue();
      // The bare https host uses the secure scheme with the same host.
      expect(ValidateUtils.isValidUrl('https://example.com')).assertTrue();
      // Another single label host under http stays valid.
      expect(ValidateUtils.isValidUrl('http://example.org')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0200
     * @tc.name      testNumValText0002
     * @tc.desc      Verify isValidUrl accepts root slash and double slash paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single root slash counts as an empty path.
      expect(ValidateUtils.isValidUrl('http://example.com/')).assertTrue();
      // The secure scheme with a root slash stays valid.
      expect(ValidateUtils.isValidUrl('https://example.com/')).assertTrue();
      // Two slashes form an empty first path segment and stay valid.
      expect(ValidateUtils.isValidUrl('http://example.com//')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0300
     * @tc.name      testNumValText0003
     * @tc.desc      Verify isValidUrl accepts single and deep document paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one segment path naming an html document is accepted.
      expect(ValidateUtils.isValidUrl('https://example.com/index.html')).assertTrue();
      // A single letter path is the shortest non empty path.
      expect(ValidateUtils.isValidUrl('http://example.com/a')).assertTrue();
      // A four segment path exercises repeated slash separators.
      expect(ValidateUtils.isValidUrl('https://example.com/deep/path/page.php')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0400
     * @tc.name      testNumValText0004
     * @tc.desc      Verify isValidUrl accepts numeric ports after the host.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The two digit default web port follows the host.
      expect(ValidateUtils.isValidUrl('http://example.com:80')).assertTrue();
      // The four digit development port follows the host.
      expect(ValidateUtils.isValidUrl('http://example.com:8080')).assertTrue();
      // The three digit secure default port follows the secure host.
      expect(ValidateUtils.isValidUrl('https://example.com:443')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0500
     * @tc.name      testNumValText0005
     * @tc.desc      Verify isValidUrl accepts ports combined with document paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The secure default port pairs with a two segment path.
      expect(ValidateUtils.isValidUrl('https://example.com:443/api/v1')).assertTrue();
      // The smallest one digit port pairs with a root slash.
      expect(ValidateUtils.isValidUrl('http://example.com:1/')).assertTrue();
      // The five digit maximum port pairs with a short path.
      expect(ValidateUtils.isValidUrl('https://example.com:65535/x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0600
     * @tc.name      testNumValText0006
     * @tc.desc      Verify isValidUrl accepts dotted quad hosts without port.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A private dotted quad host is accepted as a host label.
      expect(ValidateUtils.isValidUrl('http://192.168.1.1')).assertTrue();
      // A private quad with zeros only stays a valid host.
      expect(ValidateUtils.isValidUrl('https://10.0.0.1')).assertTrue();
      // A quad host pairs with a one segment path.
      expect(ValidateUtils.isValidUrl('http://172.16.0.1/admin')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0700
     * @tc.name      testNumValText0007
     * @tc.desc      Verify isValidUrl accepts quad hosts with ports and paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A quad host carries a four digit port and an admin path.
      expect(ValidateUtils.isValidUrl('https://192.168.1.1:8443/admin')).assertTrue();
      // The loopback host carries the classic development port.
      expect(ValidateUtils.isValidUrl('http://127.0.0.1:8080/health')).assertTrue();
      // The unspecified quad host carries the smallest port digit.
      expect(ValidateUtils.isValidUrl('http://0.0.0.0:1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0800
     * @tc.name      testNumValText0008
     * @tc.desc      Verify isValidUrl accepts deep paths with query strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A three segment path carries two query parameters.
      expect(ValidateUtils.isValidUrl('https://sub.domain.example.org/a/b/c?x=1&y=2')).assertTrue();
      // A four label host carries a single letter path.
      expect(ValidateUtils.isValidUrl('http://a.b.c.d/x')).assertTrue();
      // A www host carries a path with one query parameter.
      expect(ValidateUtils.isValidUrl('https://www.example.com/path?q=1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_0900
     * @tc.name      testNumValText0009
     * @tc.desc      Verify isValidUrl accepts upper and mixed case hosts and paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An upper case host label is accepted by the host alphabet.
      expect(ValidateUtils.isValidUrl('http://EXAMPLE.COM')).assertTrue();
      // Mixed case host and path letters are both accepted.
      expect(ValidateUtils.isValidUrl('http://Example.Com/Path')).assertTrue();
      // Upper case host, port and path keep the URL valid.
      expect(ValidateUtils.isValidUrl('https://EXAMPLE.com:8080/PAGE')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1000
     * @tc.name      testNumValText0010
     * @tc.desc      Verify isValidUrl accepts localhost hosts with and without ports.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The dot free localhost host is accepted by the host alphabet.
      expect(ValidateUtils.isValidUrl('http://localhost')).assertTrue();
      // localhost pairs with the common development port and path.
      expect(ValidateUtils.isValidUrl('http://localhost:3000/dev')).assertTrue();
      // The secure scheme on localhost carries a short path.
      expect(ValidateUtils.isValidUrl('https://localhost/x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1100
     * @tc.name      testNumValText0011
     * @tc.desc      Verify isValidUrl accepts percent encoded and plus signed paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Percent escapes encode a space inside the path.
      expect(ValidateUtils.isValidUrl('https://example.com/path%20with%20space')).assertTrue();
      // An encoded slash escape stays inside the path alphabet.
      expect(ValidateUtils.isValidUrl('http://example.com/%2F')).assertTrue();
      // A plus sign in the path is an ordinary path character here.
      expect(ValidateUtils.isValidUrl('http://example.com/plus+sign')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1200
     * @tc.name      testNumValText0012
     * @tc.desc      Verify isValidUrl accepts queries and fragments after the root slash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A query after the root slash is part of the path tail.
      expect(ValidateUtils.isValidUrl('http://example.com/?q=1')).assertTrue();
      // A query and a fragment after the root slash both fit the tail.
      expect(ValidateUtils.isValidUrl('https://example.com/?a=1&b=2#frag')).assertTrue();
      // A bare query marker and fragment after the slash stay valid.
      expect(ValidateUtils.isValidUrl('http://example.com/?q#f')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1300
     * @tc.name      testNumValText0013
     * @tc.desc      Verify isValidUrl accepts dot segments and doubled slashes in paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A doubled slash inside the path is an ordinary character run.
      expect(ValidateUtils.isValidUrl('https://example.com/a//double/slash')).assertTrue();
      // A dot segment stays a literal path token here.
      expect(ValidateUtils.isValidUrl('http://example.com/x/./y')).assertTrue();
      // A parent dot segment is accepted as raw path text.
      expect(ValidateUtils.isValidUrl('http://example.com/../up')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1400
     * @tc.name      testNumValText0014
     * @tc.desc      Verify isValidUrl accepts shortest two label hosts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // a.b is the shortest dot separated host accepted.
      expect(ValidateUtils.isValidUrl('http://a.b')).assertTrue();
      // x.io pairs single letter host with a two letter label.
      expect(ValidateUtils.isValidUrl('http://x.io')).assertTrue();
      // n.dev uses the modern short top level label.
      expect(ValidateUtils.isValidUrl('https://n.dev')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1500
     * @tc.name      testNumValText0015
     * @tc.desc      Verify isValidUrl accepts port digits without range checking.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Port zero is syntactically one digit and passes this check.
      expect(ValidateUtils.isValidUrl('http://example.com:0/path')).assertTrue();
      // Port 99999 is five digits and passes the digit shape rule.
      expect(ValidateUtils.isValidUrl('http://example.com:99999/path')).assertTrue();
      // Port 65536 is five digits above the real port ceiling yet passes.
      expect(ValidateUtils.isValidUrl('http://example.com:65536/path')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1600
     * @tc.name      testNumValText0016
     * @tc.desc      Verify isValidUrl accepts hosts with edge dot and hyphen characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A host starting with a dot is allowed by the host alphabet.
      expect(ValidateUtils.isValidUrl('https://.com')).assertTrue();
      // A host starting with a hyphen is allowed by the host alphabet.
      expect(ValidateUtils.isValidUrl('http://-example.com')).assertTrue();
      // A host ending with a dot keeps the host alphabet match alive.
      expect(ValidateUtils.isValidUrl('http://example.com./path')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1700
     * @tc.name      testNumValText0017
     * @tc.desc      Verify isValidUrl rejects non http and https schemes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // ftp is a different scheme and fails the two scheme rule.
      expect(ValidateUtils.isValidUrl('ftp://example.com')).assertFalse();
      // ws is a websocket scheme outside the accepted pair.
      expect(ValidateUtils.isValidUrl('ws://example.com')).assertFalse();
      // file has an empty authority and a foreign scheme.
      expect(ValidateUtils.isValidUrl('file:///tmp/x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1800
     * @tc.name      testNumValText0018
     * @tc.desc      Verify isValidUrl rejects upper case scheme spellings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The scheme letters are matched case sensitively.
      expect(ValidateUtils.isValidUrl('HTTP://example.com')).assertFalse();
      // Mixed case scheme spelling is rejected the same way.
      expect(ValidateUtils.isValidUrl('Https://example.com')).assertFalse();
      // Fully upper case secure scheme is rejected too.
      expect(ValidateUtils.isValidUrl('HTTPS://example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_1900
     * @tc.name      testNumValText0019
     * @tc.desc      Verify isValidUrl rejects scheme less host only texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A protocol relative host misses the required scheme.
      expect(ValidateUtils.isValidUrl('//example.com')).assertFalse();
      // A bare host has neither scheme nor slashes.
      expect(ValidateUtils.isValidUrl('example.com')).assertFalse();
      // A www host without scheme is still not an absolute URL here.
      expect(ValidateUtils.isValidUrl('www.example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2000
     * @tc.name      testNumValText0020
     * @tc.desc      Verify isValidUrl rejects empty host forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // http with nothing after the separator has no host.
      expect(ValidateUtils.isValidUrl('http://')).assertFalse();
      // https with nothing after the separator has no host either.
      expect(ValidateUtils.isValidUrl('https://')).assertFalse();
      // Three slashes leave the host empty before the path.
      expect(ValidateUtils.isValidUrl('http:///')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2100
     * @tc.name      testNumValText0021
     * @tc.desc      Verify isValidUrl rejects user information before the host.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A user at sign is not part of the host alphabet.
      expect(ValidateUtils.isValidUrl('http://user@example.com')).assertFalse();
      // A user and password component break the host match.
      expect(ValidateUtils.isValidUrl('https://user:pass@example.com')).assertFalse();
      // A lone at sign before the host breaks the host match.
      expect(ValidateUtils.isValidUrl('http://@example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2200
     * @tc.name      testNumValText0022
     * @tc.desc      Verify isValidUrl rejects queries or fragments without a path slash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A query directly after the host misses the required slash.
      expect(ValidateUtils.isValidUrl('http://example.com?query=1')).assertFalse();
      // A fragment directly after the host misses the required slash.
      expect(ValidateUtils.isValidUrl('http://example.com#frag')).assertFalse();
      // A query and fragment pair still misses the path slash.
      expect(ValidateUtils.isValidUrl('http://example.com?q=1#f')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2300
     * @tc.name      testNumValText0023
     * @tc.desc      Verify isValidUrl rejects non numeric port words and signs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The word port is not a digit run after the colon.
      expect(ValidateUtils.isValidUrl('http://example.com:port')).assertFalse();
      // Letters after the colon fail the port digit rule.
      expect(ValidateUtils.isValidUrl('http://example.com:abc/')).assertFalse();
      // A minus sign is not part of the port digit alphabet.
      expect(ValidateUtils.isValidUrl('http://example.com:-1/')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2400
     * @tc.name      testNumValText0024
     * @tc.desc      Verify isValidUrl rejects port numbers longer than five digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Six port digits exceed the five digit port budget.
      expect(ValidateUtils.isValidUrl('http://example.com:123456/x')).assertFalse();
      // Seven port digits exceed the budget even further.
      expect(ValidateUtils.isValidUrl('http://example.com:1234567/')).assertFalse();
      // Six zero digits overshoot the five digit port width.
      expect(ValidateUtils.isValidUrl('https://example.com:000000')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2500
     * @tc.name      testNumValText0025
     * @tc.desc      Verify isValidUrl rejects spaces inside host and path text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A raw space in the path is not allowed by the tail alphabet.
      expect(ValidateUtils.isValidUrl('https://example.com/path with space')).assertFalse();
      // A raw space inside a short path fails the same rule.
      expect(ValidateUtils.isValidUrl('http://example.com/a b')).assertFalse();
      // A raw space inside the host breaks the host alphabet.
      expect(ValidateUtils.isValidUrl('http://exa mple.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2600
     * @tc.name      testNumValText0026
     * @tc.desc      Verify isValidUrl rejects underscore and symbol hosts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An underscore is outside the host alphabet.
      expect(ValidateUtils.isValidUrl('https://exa_mple.com')).assertFalse();
      // An exclamation mark is outside the host alphabet.
      expect(ValidateUtils.isValidUrl('http://ex!ample.com')).assertFalse();
      // Parentheses are outside the host alphabet.
      expect(ValidateUtils.isValidUrl('http://exa(mple).com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2700
     * @tc.name      testNumValText0027
     * @tc.desc      Verify isValidUrl rejects empty and truncated scheme texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string has no scheme at all.
      expect(ValidateUtils.isValidUrl('')).assertFalse();
      // A bare scheme word lacks the colon slash separator.
      expect(ValidateUtils.isValidUrl('http')).assertFalse();
      // A scheme without the slash pair is not absolute.
      expect(ValidateUtils.isValidUrl('http:example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2800
     * @tc.name      testNumValText0028
     * @tc.desc      Verify isValidUrl rejects doubled colons and empty hosts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A colon after the port leaves a dangling separator.
      expect(ValidateUtils.isValidUrl('http://example.com:80:')).assertFalse();
      // Two colons between host and port break the port digit run.
      expect(ValidateUtils.isValidUrl('http://example.com::80')).assertFalse();
      // An empty host before the port fails the host requirement.
      expect(ValidateUtils.isValidUrl('http://:8080/path')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_2900
     * @tc.name      testNumValText0029
     * @tc.desc      Verify isValidUrl rejects six digit and mixed letter decimal ports.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Six digits exceed the five digit port width.
      expect(ValidateUtils.isValidUrl('https://example.com:655360')).assertFalse();
      // A letter glued to the port digits breaks the digit run.
      expect(ValidateUtils.isValidUrl('http://example.com:1a/x')).assertFalse();
      // A decimal point inside the port breaks the digit run.
      expect(ValidateUtils.isValidUrl('http://example.com:80.5/x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3000
     * @tc.name      testNumValText0030
     * @tc.desc      Verify isValidUrl rejects URLs padded or broken by spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading space breaks the anchored scheme start.
      expect(ValidateUtils.isValidUrl(' ' + 'http://example.com')).assertFalse();
      // A trailing space breaks the anchored URL end.
      expect(ValidateUtils.isValidUrl('http://example.com' + ' ')).assertFalse();
      // A space inside the scheme host gap breaks the host alphabet.
      expect(ValidateUtils.isValidUrl('http:// example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3100
     * @tc.name      testNumValText0031
     * @tc.desc      Verify isValidUrl rejects semicolon comma and brace decorations.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A semicolon parameter block is not accepted after the host.
      expect(ValidateUtils.isValidUrl('http://example.com;param')).assertFalse();
      // A comma after the host is outside every accepted part.
      expect(ValidateUtils.isValidUrl('http://example.com,x')).assertFalse();
      // Braces after the host are outside every accepted part.
      expect(ValidateUtils.isValidUrl('http://example.com{x}')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3200
     * @tc.name      testNumValText0032
     * @tc.desc      Verify isValidUrl rejects mutated scheme names.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Mixed case scheme letters fail the literal scheme match.
      expect(ValidateUtils.isValidUrl('HtTp://example.com')).assertFalse();
      // A digit glued to http breaks the scheme literal.
      expect(ValidateUtils.isValidUrl('http1://example.com')).assertFalse();
      // A plus glued to http breaks the scheme literal.
      expect(ValidateUtils.isValidUrl('http+x://example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3300
     * @tc.name      testNumValText0033
     * @tc.desc      Verify isValidDomain accepts common two label domains.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // example.com is the canonical two label domain.
      expect(ValidateUtils.isValidDomain('example.com')).assertTrue();
      // example.org swaps the top level label.
      expect(ValidateUtils.isValidDomain('example.org')).assertTrue();
      // example.io uses a short two letter top level label.
      expect(ValidateUtils.isValidDomain('example.io')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3400
     * @tc.name      testNumValText0034
     * @tc.desc      Verify isValidDomain accepts minimal label and TLD lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // a.io pairs the shortest label with a two letter TLD.
      expect(ValidateUtils.isValidDomain('a.io')).assertTrue();
      // a.bc keeps both parts at their minimum lengths.
      expect(ValidateUtils.isValidDomain('a.bc')).assertTrue();
      // ab.cd uses two letter labels on both sides.
      expect(ValidateUtils.isValidDomain('ab.cd')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3500
     * @tc.name      testNumValText0035
     * @tc.desc      Verify isValidDomain accepts multi label domains.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The classic www prefix adds one label in front.
      expect(ValidateUtils.isValidDomain('www.example.com')).assertTrue();
      // Three labels in front of the TLD all pass the label rule.
      expect(ValidateUtils.isValidDomain('sub.domain.example.org')).assertTrue();
      // Six single letter labels end in a two letter TLD.
      expect(ValidateUtils.isValidDomain('a.b.c.d.e.f.gh')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3600
     * @tc.name      testNumValText0036
     * @tc.desc      Verify isValidDomain accepts labels with interior hyphens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A hyphen inside the label keeps both ends alphanumeric.
      expect(ValidateUtils.isValidDomain('example-hyphen.com')).assertTrue();
      // A short hyphenated label works the same way.
      expect(ValidateUtils.isValidDomain('my-site.org')).assertTrue();
      // A two letter label with an interior hyphen passes.
      expect(ValidateUtils.isValidDomain('a-b.io')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3700
     * @tc.name      testNumValText0037
     * @tc.desc      Verify isValidDomain accepts upper and mixed case spellings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fully upper case labels are accepted.
      expect(ValidateUtils.isValidDomain('EXAMPLE.COM')).assertTrue();
      // Mixed case labels on both sides are accepted.
      expect(ValidateUtils.isValidDomain('Example.Com')).assertTrue();
      // Upper case labels with a short TLD are accepted.
      expect(ValidateUtils.isValidDomain('EXAMPLE.IO')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3800
     * @tc.name      testNumValText0038
     * @tc.desc      Verify isValidDomain accepts numeric labels before the TLD.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A purely numeric label is allowed before the TLD.
      expect(ValidateUtils.isValidDomain('123.com')).assertTrue();
      // Another numeric label with a different TLD passes too.
      expect(ValidateUtils.isValidDomain('456.net')).assertTrue();
      // Ten single digit labels end in a letter TLD.
      expect(ValidateUtils.isValidDomain('0.1.2.3.4.5.6.7.8.9.io')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_3900
     * @tc.name      testNumValText0039
     * @tc.desc      Verify isValidDomain accepts two letter and long TLDs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The two letter country TLD co meets the minimum width.
      expect(ValidateUtils.isValidDomain('example.co')).assertTrue();
      // The six letter TLD museum is well above the minimum.
      expect(ValidateUtils.isValidDomain('example.museum')).assertTrue();
      // The six letter TLD travel passes the same rule.
      expect(ValidateUtils.isValidDomain('example.travel')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4000
     * @tc.name      testNumValText0040
     * @tc.desc      Verify isValidDomain accepts punycode labels with digits and hyphens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The xn-- punycode label keeps alphanumeric ends with interior hyphens.
      expect(ValidateUtils.isValidDomain('xn--fsq.com')).assertTrue();
      // A longer punycode label with digits still fits the alphabet.
      expect(ValidateUtils.isValidDomain('xn--fiqs8s.cn')).assertTrue();
      // The russian punycode TLD label fits the label alphabet.
      expect(ValidateUtils.isValidDomain('xn--p1ai.org')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4100
     * @tc.name      testNumValText0041
     * @tc.desc      Verify isValidDomain accepts labels of exactly sixty three characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixty three letters fill the maximum label width exactly.
      expect(ValidateUtils.isValidDomain('a'.repeat(63) + '.com')).assertTrue();
      // Sixty three characters with interior hyphens keep the ends numeric letters.
      expect(ValidateUtils.isValidDomain('a' + '-'.repeat(61) + 'z' + '.com')).assertTrue();
      // Sixty three letters with a two letter TLD pass as well.
      expect(ValidateUtils.isValidDomain('a'.repeat(63) + '.io')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4200
     * @tc.name      testNumValText0042
     * @tc.desc      Verify isValidDomain accepts long hyphenated service labels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A forty five character hyphenated label stays inside the width cap.
      expect(ValidateUtils.isValidDomain('very-long-label-name-with-many-hyphens-inside.example.com')).assertTrue();
      // A label mixing letters a digit and hyphens passes.
      expect(ValidateUtils.isValidDomain('mail-server-1.example.com')).assertTrue();
      // A service label starting with a letter and digit tail passes.
      expect(ValidateUtils.isValidDomain('s3-bucket.example.org')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4300
     * @tc.name      testNumValText0043
     * @tc.desc      Verify isValidDomain accepts bare word TLDs of two letters or more.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one letter label with the word TLD example passes.
      expect(ValidateUtils.isValidDomain('x.example')).assertTrue();
      // Two single letter labels before the word TLD pass.
      expect(ValidateUtils.isValidDomain('y.z.example')).assertTrue();
      // Three single letter labels before the word TLD pass.
      expect(ValidateUtils.isValidDomain('a.b.c.example')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4400
     * @tc.name      testNumValText0044
     * @tc.desc      Verify isValidDomain accepts labels starting with digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single digit label is a valid first label.
      expect(ValidateUtils.isValidDomain('9.example.com')).assertTrue();
      // A digit hyphen digit label keeps alphanumeric ends.
      expect(ValidateUtils.isValidDomain('9-9.com')).assertTrue();
      // A label alternating digits and letters passes.
      expect(ValidateUtils.isValidDomain('1a2b3c.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4500
     * @tc.name      testNumValText0045
     * @tc.desc      Verify isValidDomain accepts repeated and chained hyphens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four chained hyphens stay inside the label alphabet.
      expect(ValidateUtils.isValidDomain('a-b-c-d-e.com')).assertTrue();
      // A doubled hyphen inside the label is still alphabet legal.
      expect(ValidateUtils.isValidDomain('hyphen--double.com')).assertTrue();
      // Digit hyphen letter labels across three labels pass.
      expect(ValidateUtils.isValidDomain('x-1.y-2.z-3.org')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4600
     * @tc.name      testNumValText0046
     * @tc.desc      Verify isValidDomain accepts two label names without TLD keywords.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // localdomain is a ten letter word TLD and passes.
      expect(ValidateUtils.isValidDomain('localhost.localdomain')).assertTrue();
      // local as a four letter word TLD passes the width rule.
      expect(ValidateUtils.isValidDomain('test.local')).assertTrue();
      // Three single word labels with a four letter tail pass.
      expect(ValidateUtils.isValidDomain('my.host.name')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4700
     * @tc.name      testNumValText0047
     * @tc.desc      Verify isValidDomain accepts labels mixing digits letters and hyphens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A label alternating letters and digits stays in the alphabet.
      expect(ValidateUtils.isValidDomain('a1b2c3.example.com')).assertTrue();
      // A label chaining letters digits and hyphens passes.
      expect(ValidateUtils.isValidDomain('abc-123-xyz.net')).assertTrue();
      // Three short mixed labels keep every end alphanumeric.
      expect(ValidateUtils.isValidDomain('s1.t2.u3.example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4800
     * @tc.name      testNumValText0048
     * @tc.desc      Verify isValidDomain accepts long alphabetic and upper case label sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The full alphabet is a valid twenty six letter label.
      expect(ValidateUtils.isValidDomain('abcdefghijklmnopqrstuvwxyz.com')).assertTrue();
      // Eight upper case two letter labels end in a two letter TLD.
      expect(ValidateUtils.isValidDomain('AA.BB.CC.DD.EE.FF.GG.HH')).assertTrue();
      // Mixed case labels carrying digits pass the alphabet rule.
      expect(ValidateUtils.isValidDomain('MIXEDcase123.Domain4.Example5.ORG')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_4900
     * @tc.name      testNumValText0049
     * @tc.desc      Verify isValidDomain rejects dot free single words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single word has no label dot separator at all.
      expect(ValidateUtils.isValidDomain('example')).assertFalse();
      // The word localhost without a dot is not a domain here.
      expect(ValidateUtils.isValidDomain('localhost')).assertFalse();
      // A single letter has no separator and no TLD.
      expect(ValidateUtils.isValidDomain('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5000
     * @tc.name      testNumValText0050
     * @tc.desc      Verify isValidDomain rejects trailing dot forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing dot after the label leaves the TLD empty.
      expect(ValidateUtils.isValidDomain('example.')).assertFalse();
      // A trailing dot after the full domain leaves nothing as TLD.
      expect(ValidateUtils.isValidDomain('example.com.')).assertFalse();
      // A trailing dot after two labels breaks the TLD too.
      expect(ValidateUtils.isValidDomain('sub.example.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5100
     * @tc.name      testNumValText0051
     * @tc.desc      Verify isValidDomain rejects leading dot forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading dot leaves the first label empty.
      expect(ValidateUtils.isValidDomain('.example.com')).assertFalse();
      // A leading dot before a short TLD fails the same way.
      expect(ValidateUtils.isValidDomain('.com')).assertFalse();
      // Two leading dots leave the first two labels empty.
      expect(ValidateUtils.isValidDomain('..com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5200
     * @tc.name      testNumValText0052
     * @tc.desc      Verify isValidDomain rejects one letter top level labels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one letter TLD is below the two letter minimum.
      expect(ValidateUtils.isValidDomain('example.c')).assertFalse();
      // A one letter TLD after a one letter label fails too.
      expect(ValidateUtils.isValidDomain('a.b')).assertFalse();
      // A one letter TLD after two labels still fails the width rule.
      expect(ValidateUtils.isValidDomain('x.y.z')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5300
     * @tc.name      testNumValText0053
     * @tc.desc      Verify isValidDomain rejects TLDs carrying digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A digit inside the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidDomain('example.c0m')).assertFalse();
      // A trailing digit after the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidDomain('example.com2')).assertFalse();
      // A purely numeric TLD breaks the letters only rule.
      expect(ValidateUtils.isValidDomain('example.123')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5400
     * @tc.name      testNumValText0054
     * @tc.desc      Verify isValidDomain rejects labels with edge hyphens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading hyphen breaks the alphanumeric label start.
      expect(ValidateUtils.isValidDomain('-example.com')).assertFalse();
      // A trailing hyphen breaks the alphanumeric label end.
      expect(ValidateUtils.isValidDomain('example-.com')).assertFalse();
      // A bare hyphen label fails both ends at once.
      expect(ValidateUtils.isValidDomain('-.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5500
     * @tc.name      testNumValText0055
     * @tc.desc      Verify isValidDomain rejects spaces inside the domain.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A space inside the label breaks the label alphabet.
      expect(ValidateUtils.isValidDomain('ex ample.com')).assertFalse();
      // A space before the dot breaks the label alphabet too.
      expect(ValidateUtils.isValidDomain('example .com')).assertFalse();
      // A space inside the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidDomain('example.c om')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5600
     * @tc.name      testNumValText0056
     * @tc.desc      Verify isValidDomain rejects empty blank and lone dot texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string has no labels or TLD.
      expect(ValidateUtils.isValidDomain('')).assertFalse();
      // A blank space is not a label.
      expect(ValidateUtils.isValidDomain(' ')).assertFalse();
      // A lone dot separates two empty labels.
      expect(ValidateUtils.isValidDomain('.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5700
     * @tc.name      testNumValText0057
     * @tc.desc      Verify isValidDomain rejects doubled dots between labels.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A doubled dot leaves the middle label empty.
      expect(ValidateUtils.isValidDomain('example..com')).assertFalse();
      // Two doubled dots leave two labels empty.
      expect(ValidateUtils.isValidDomain('a..b..com')).assertFalse();
      // A doubled dot before the last label breaks that label.
      expect(ValidateUtils.isValidDomain('a.b..c.de')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5800
     * @tc.name      testNumValText0058
     * @tc.desc      Verify isValidDomain rejects labels longer than sixty three characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixty four letters exceed the label width cap by one.
      expect(ValidateUtils.isValidDomain('a'.repeat(64) + '.com')).assertFalse();
      // Sixty four characters with hyphens exceed the cap as well.
      expect(ValidateUtils.isValidDomain('a' + '-'.repeat(62) + 'z' + '.com')).assertFalse();
      // Sixty four letters with a short TLD still exceed the cap.
      expect(ValidateUtils.isValidDomain('a'.repeat(64) + '.io')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_5900
     * @tc.name      testNumValText0059
     * @tc.desc      Verify isValidDomain rejects underscores inside labels and TLDs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An underscore inside the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidDomain('example.c_m')).assertFalse();
      // An underscore after two TLD letters breaks the rule too.
      expect(ValidateUtils.isValidDomain('example.co_m')).assertFalse();
      // An underscore inside the label breaks the label alphabet.
      expect(ValidateUtils.isValidDomain('exam_ple.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6000
     * @tc.name      testNumValText0060
     * @tc.desc      Verify isValidDomain rejects IP shaped and scheme shaped texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A dotted quad ends in a numeric TLD of one digit.
      expect(ValidateUtils.isValidDomain('192.168.1.1')).assertFalse();
      // Five numeric labels end in a one digit label as TLD.
      expect(ValidateUtils.isValidDomain('1.2.3.4.5')).assertFalse();
      // A URL with scheme characters is not a bare domain.
      expect(ValidateUtils.isValidDomain('http://example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6100
     * @tc.name      testNumValText0061
     * @tc.desc      Verify isValidEmail accepts minimal letter addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The canonical user at example dot com passes.
      expect(ValidateUtils.isValidEmail('user@example.com')).assertTrue();
      // Single letter local and domain parts pass the shape.
      expect(ValidateUtils.isValidEmail('a@b.co')).assertTrue();
      // Another single letter pair with a three letter TLD passes.
      expect(ValidateUtils.isValidEmail('x@y.org')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6200
     * @tc.name      testNumValText0062
     * @tc.desc      Verify isValidEmail accepts dotted local parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One dot inside the local part is an allowed character.
      expect(ValidateUtils.isValidEmail('first.last@example.com')).assertTrue();
      // Two dots inside the local part stay inside the charset.
      expect(ValidateUtils.isValidEmail('first.middle.last@example.com')).assertTrue();
      // Four dotted segments in the local part all fit the charset.
      expect(ValidateUtils.isValidEmail('a.b.c.d@example.io')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6300
     * @tc.name      testNumValText0063
     * @tc.desc      Verify isValidEmail accepts plus tagged local parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plus tag after the user name is an allowed local character.
      expect(ValidateUtils.isValidEmail('user+tag@example.com')).assertTrue();
      // Repeated plus tags stay inside the local charset.
      expect(ValidateUtils.isValidEmail('user+tag+more@example.com')).assertTrue();
      // A leading plus keeps the local part non empty and valid.
      expect(ValidateUtils.isValidEmail('+leading@example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6400
     * @tc.name      testNumValText0064
     * @tc.desc      Verify isValidEmail accepts underscore local parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An interior underscore is an allowed local character.
      expect(ValidateUtils.isValidEmail('user_name@example.com')).assertTrue();
      // A leading underscore keeps the local part valid.
      expect(ValidateUtils.isValidEmail('_underscore@example.com')).assertTrue();
      // Trailing underscores stay inside the local charset.
      expect(ValidateUtils.isValidEmail('under_score_@example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6500
     * @tc.name      testNumValText0065
     * @tc.desc      Verify isValidEmail accepts percent local parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A percent sign is an allowed local part character.
      expect(ValidateUtils.isValidEmail('user%test@example.com')).assertTrue();
      // A percent with digits keeps the local charset match.
      expect(ValidateUtils.isValidEmail('percent%25@example.com')).assertTrue();
      // A lone percent is a non empty local part here.
      expect(ValidateUtils.isValidEmail('%@example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6600
     * @tc.name      testNumValText0066
     * @tc.desc      Verify isValidEmail accepts sub domain addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One sub domain label before the domain passes.
      expect(ValidateUtils.isValidEmail('u1@sub.example.org')).assertTrue();
      // Three sub domain labels before the TLD all fit the charset.
      expect(ValidateUtils.isValidEmail('deep.a@x.y.z.example.com')).assertTrue();
      // Numeric local and sub domain labels pass the shape.
      expect(ValidateUtils.isValidEmail('1@2.example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6700
     * @tc.name      testNumValText0067
     * @tc.desc      Verify isValidEmail accepts upper and mixed case addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fully upper case local and domain parts pass.
      expect(ValidateUtils.isValidEmail('USER@EXAMPLE.COM')).assertTrue();
      // Mixed case with a dotted local part passes.
      expect(ValidateUtils.isValidEmail('User.Name@Example.Com')).assertTrue();
      // Mixed case with underscore and multi label domain passes.
      expect(ValidateUtils.isValidEmail('UPPER_lower@Domain.Example.IO')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6800
     * @tc.name      testNumValText0068
     * @tc.desc      Verify isValidEmail accepts numeric local parts and domains.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A numeric local part and numeric domain label pass.
      expect(ValidateUtils.isValidEmail('123@456.com')).assertTrue();
      // A long numeric local part stays inside the charset.
      expect(ValidateUtils.isValidEmail('1234567890@numbers.example.com')).assertTrue();
      // A zero padded local part with a co uk domain passes.
      expect(ValidateUtils.isValidEmail('007@bond.example.co.uk')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_6900
     * @tc.name      testNumValText0069
     * @tc.desc      Verify isValidEmail accepts hyphen local parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing hyphen in the local part is an allowed character.
      expect(ValidateUtils.isValidEmail('user-@example.com')).assertTrue();
      // A leading hyphen keeps the local part non empty and valid.
      expect(ValidateUtils.isValidEmail('-user@example.com')).assertTrue();
      // Chained hyphens in the local part stay inside the charset.
      expect(ValidateUtils.isValidEmail('a-b-c@example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7000
     * @tc.name      testNumValText0070
     * @tc.desc      Verify isValidEmail rejects local characters outside its simplified charset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0070';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A star is outside the simplified local part charset.
      expect(ValidateUtils.isValidEmail('a*b@example.com')).assertFalse();
      // An apostrophe is outside the simplified local part charset.
      expect(ValidateUtils.isValidEmail("o'brien@example.com")).assertFalse();
      // A dollar sign is outside the simplified local part charset.
      expect(ValidateUtils.isValidEmail('a$b@example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7100
     * @tc.name      testNumValText0071
     * @tc.desc      Verify isValidEmail accepts long dotted and multi label addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0071';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five dotted segments in the local part all fit the charset.
      expect(ValidateUtils.isValidEmail('long.email.address.with.many.dots@example.com')).assertTrue();
      // A two letter TLD after a single letter domain passes.
      expect(ValidateUtils.isValidEmail('a@b.cd')).assertTrue();
      // Three sub domain labels with a long TLD pass the shape.
      expect(ValidateUtils.isValidEmail('user@sub.domain.example.museum')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7200
     * @tc.name      testNumValText0072
     * @tc.desc      Verify isValidEmail accepts charset quirks for dots and hyphens.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0072';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading dot is inside the local part charset.
      expect(ValidateUtils.isValidEmail('.leading-dot@example.com')).assertTrue();
      // A doubled dot inside the domain survives the loose charset.
      expect(ValidateUtils.isValidEmail('user@example..com')).assertTrue();
      // A domain starting with a hyphen survives the loose charset.
      expect(ValidateUtils.isValidEmail('user@-example.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7300
     * @tc.name      testNumValText0073
     * @tc.desc      Verify isValidEmail rejects empty and at sign only texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0073';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string has no local or domain part.
      expect(ValidateUtils.isValidEmail('')).assertFalse();
      // A lone at sign has empty parts on both sides.
      expect(ValidateUtils.isValidEmail('@')).assertFalse();
      // A bare word has no at sign at all.
      expect(ValidateUtils.isValidEmail('user')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7400
     * @tc.name      testNumValText0074
     * @tc.desc      Verify isValidEmail rejects empty local or domain sides.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0074';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty local part before the at sign is rejected.
      expect(ValidateUtils.isValidEmail('@example.com')).assertFalse();
      // An empty domain after the at sign is rejected.
      expect(ValidateUtils.isValidEmail('user@')).assertFalse();
      // A lone dot after the at sign cannot form a TLD.
      expect(ValidateUtils.isValidEmail('user@.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7500
     * @tc.name      testNumValText0075
     * @tc.desc      Verify isValidEmail rejects domains without a dotted TLD.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0075';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A domain without a dot and TLD is rejected.
      expect(ValidateUtils.isValidEmail('user@example')).assertFalse();
      // A domain ending in a dot leaves the TLD empty.
      expect(ValidateUtils.isValidEmail('user@example.')).assertFalse();
      // A one letter TLD is below the two letter minimum.
      expect(ValidateUtils.isValidEmail('user@example.c')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7600
     * @tc.name      testNumValText0076
     * @tc.desc      Verify isValidEmail rejects doubled at signs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0076';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A doubled at sign before the domain breaks the shape.
      expect(ValidateUtils.isValidEmail('user@@example.com')).assertFalse();
      // A doubled at sign inside the local part breaks it too.
      expect(ValidateUtils.isValidEmail('us@@er@example.com')).assertFalse();
      // A doubled at sign with short parts fails the same rule.
      expect(ValidateUtils.isValidEmail('a@@b.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7700
     * @tc.name      testNumValText0077
     * @tc.desc      Verify isValidEmail rejects spaces in local and domain parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0077';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A space inside the local part breaks the local charset.
      expect(ValidateUtils.isValidEmail('user @example.com')).assertFalse();
      // A space inside the domain breaks the domain charset.
      expect(ValidateUtils.isValidEmail('user@exa mple.com')).assertFalse();
      // A space inside the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidEmail('user@example. com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7800
     * @tc.name      testNumValText0078
     * @tc.desc      Verify isValidEmail rejects underscore and symbol domain characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0078';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An underscore is outside the domain charset.
      expect(ValidateUtils.isValidEmail('user@exam_ple.com')).assertFalse();
      // An exclamation mark is outside the domain charset.
      expect(ValidateUtils.isValidEmail('user@exam!ple.com')).assertFalse();
      // A space inside the domain label fails the charset again.
      expect(ValidateUtils.isValidEmail('user@ex ample.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_7900
     * @tc.name      testNumValText0079
     * @tc.desc      Verify isValidEmail rejects trailing dot dot and hyphen TLD endings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0079';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing dot after the TLD breaks the anchored ending.
      expect(ValidateUtils.isValidEmail('user@example.com.')).assertFalse();
      // Two trailing dots after the TLD break the anchored ending.
      expect(ValidateUtils.isValidEmail('user@example.com..')).assertFalse();
      // A trailing hyphen after the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidEmail('user@example.com-')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8000
     * @tc.name      testNumValText0080
     * @tc.desc      Verify isValidEmail rejects TLDs carrying digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0080';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing digit after the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidEmail('user@example.com2')).assertFalse();
      // A digit inside the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidEmail('user@example.c9m')).assertFalse();
      // A leading digit in the TLD breaks the letters only rule.
      expect(ValidateUtils.isValidEmail('user@example.9com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8100
     * @tc.name      testNumValText0081
     * @tc.desc      Verify isValidEmail rejects non ascii local and domain characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0081';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters are outside the local part charset.
      expect(ValidateUtils.isValidEmail('邮件@example.com')).assertFalse();
      // Chinese characters are outside the domain charset.
      expect(ValidateUtils.isValidEmail('user@邮件.com')).assertFalse();
      // A fully Chinese address fails both charset rules.
      expect(ValidateUtils.isValidEmail('用户@例子.公司')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8200
     * @tc.name      testNumValText0082
     * @tc.desc      Verify isValidEmail rejects empty domain and doubled at ends.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0082';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A dotted local part with an empty domain is rejected.
      expect(ValidateUtils.isValidEmail('user.name@')).assertFalse();
      // A local part ending at an empty double at domain fails.
      expect(ValidateUtils.isValidEmail('user@@')).assertFalse();
      // Two leading at signs leave the local part empty.
      expect(ValidateUtils.isValidEmail('@@example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8300
     * @tc.name      testNumValText0083
     * @tc.desc      Verify isValidEmail rejects hash bang and space local characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0083';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A hash sign is outside the local part charset.
      expect(ValidateUtils.isValidEmail('user#$%@example.com')).assertFalse();
      // A bang is outside the local part charset.
      expect(ValidateUtils.isValidEmail('user!@example.com')).assertFalse();
      // A space inside the local word breaks the charset match.
      expect(ValidateUtils.isValidEmail('us er@example.com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8400
     * @tc.name      testNumValText0084
     * @tc.desc      Verify isValidEmail rejects missing dot and one letter TLD forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0084';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single label domain has no dotted TLD.
      expect(ValidateUtils.isValidEmail('User@Example')).assertFalse();
      // A trailing dot leaves the TLD empty.
      expect(ValidateUtils.isValidEmail('User@Example.')).assertFalse();
      // A one letter TLD is below the two letter minimum.
      expect(ValidateUtils.isValidEmail('a@b.c')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8500
     * @tc.name      testNumValText0085
     * @tc.desc      Verify encodeUriComponent keeps unreserved words unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0085';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Plain lower case letters need no escaping at all.
      expect(ValidateUtils.encodeUriComponent('abc')).assertEqual('abc');
      // Upper case letters and digits are all unreserved.
      expect(ValidateUtils.encodeUriComponent('ABC123')).assertEqual('ABC123');
      // Hyphen underscore and dot stay unescaped in the word.
      expect(ValidateUtils.encodeUriComponent('a1-B2_Z3')).assertEqual('a1-B2_Z3');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8600
     * @tc.name      testNumValText0086
     * @tc.desc      Verify encodeUriComponent escapes one and multiple spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0086';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single space becomes the percent twenty escape.
      expect(ValidateUtils.encodeUriComponent(' ')).assertEqual('%20');
      // A space between letters becomes one escape between them.
      expect(ValidateUtils.encodeUriComponent('a b')).assertEqual('a%20b');
      // Two adjacent spaces become two escapes in a row.
      expect(ValidateUtils.encodeUriComponent('a  b')).assertEqual('a%20%20b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8700
     * @tc.name      testNumValText0087
     * @tc.desc      Verify encodeUriComponent escapes query structural characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0087';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The plus sign escapes to percent two B.
      expect(ValidateUtils.encodeUriComponent('a+b')).assertEqual('a%2Bb');
      // The ampersand escapes to percent two six.
      expect(ValidateUtils.encodeUriComponent('a&b')).assertEqual('a%26b');
      // The equals sign escapes to percent three D.
      expect(ValidateUtils.encodeUriComponent('a=b')).assertEqual('a%3Db');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8800
     * @tc.name      testNumValText0088
     * @tc.desc      Verify encodeUriComponent escapes path and fragment delimiters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0088';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The slash escapes to percent two F.
      expect(ValidateUtils.encodeUriComponent('a/b')).assertEqual('a%2Fb');
      // The question mark escapes to percent three F.
      expect(ValidateUtils.encodeUriComponent('a?b')).assertEqual('a%3Fb');
      // The hash escapes to percent two three.
      expect(ValidateUtils.encodeUriComponent('a#b')).assertEqual('a%23b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_8900
     * @tc.name      testNumValText0089
     * @tc.desc      Verify encodeUriComponent escapes percent signs repeatedly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0089';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A percent after digits escapes to percent two five.
      expect(ValidateUtils.encodeUriComponent('100%')).assertEqual('100%25');
      // A lone percent escapes to percent two five.
      expect(ValidateUtils.encodeUriComponent('%')).assertEqual('%25');
      // An existing escape sequence escapes its percent again.
      expect(ValidateUtils.encodeUriComponent('%25')).assertEqual('%2525');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_9000
     * @tc.name      testNumValText0090
     * @tc.desc      Verify encodeUriComponent keeps the unreserved symbol set unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0090';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The tilde is unreserved and stays as is.
      expect(ValidateUtils.encodeUriComponent('~')).assertEqual('~');
      // The whole unreserved symbol set survives unchanged.
      expect(ValidateUtils.encodeUriComponent("-_.!~*'()")).assertEqual("-_.!~*'()");
      // Parentheses are unreserved and stay as is.
      expect(ValidateUtils.encodeUriComponent('()')).assertEqual('()');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_9100
     * @tc.name      testNumValText0091
     * @tc.desc      Verify encodeUriComponent escapes Chinese text as utf8 triples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0091';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The character 中 encodes as its three byte utf8 triple.
      expect(ValidateUtils.encodeUriComponent('中')).assertEqual('%E4%B8%AD');
      // The word 网络 encodes as two consecutive utf8 triples.
      expect(ValidateUtils.encodeUriComponent('网络')).assertEqual('%E7%BD%91%E7%BB%9C');
      // The word 安全 encodes as two more utf8 triples.
      expect(ValidateUtils.encodeUriComponent('安全')).assertEqual('%E5%AE%89%E5%85%A8');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_9200
     * @tc.name      testNumValText0092
     * @tc.desc      Verify encodeUriComponent escapes quote angle and backslash symbols.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0092';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The double quote escapes to percent two two.
      expect(ValidateUtils.encodeUriComponent('"')).assertEqual('%22');
      // The angle brackets escape to their percent triples.
      expect(ValidateUtils.encodeUriComponent('<>')).assertEqual('%3C%3E');
      // The backslash escapes to percent five C.
      expect(ValidateUtils.encodeUriComponent('\\')).assertEqual('%5C');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_9300
     * @tc.name      testNumValText0093
     * @tc.desc      Verify encodeUriComponent escapes at colon and dollar symbols.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumValText0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0093';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The at sign escapes to percent four zero.
      expect(ValidateUtils.encodeUriComponent('@')).assertEqual('%40');
      // The colon escapes to percent three A.
      expect(ValidateUtils.encodeUriComponent(':')).assertEqual('%3A');
      // The dollar sign escapes to percent two four.
      expect(ValidateUtils.encodeUriComponent('$')).assertEqual('%24');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_VALTEXT_9400
     * @tc.name      testNumValText0094
     * @tc.desc      Verify encodeUriComponent handles empty text and list separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumValText0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumValText0094';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Encoding the empty string yields the empty string.
      expect(ValidateUtils.encodeUriComponent('')).assertEqual('');
      // The comma escapes to percent two C.
      expect(ValidateUtils.encodeUriComponent(',')).assertEqual('%2C');
      // The semicolon escapes to percent three B.
