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
import { ValidateUtils, NetworkUtils, NetworkInfo, HttpUtils, HttpCallResult } from 'library';

// Observation log prefix so device dependent cases stay traceable in the hilog stream.
const OBSERVE_TAG: string = '[ValidateNetworkLogic]';
// Unreachable loopback endpoint: no service listens on port 1, so the request
// exercises the transport failure path without touching real network services.
const UNREACHABLE_URL: string = 'http://127.0.0.1:1/health';
// Short connect and read timeout for the observational HTTP cases.
const SHORT_TIMEOUT_MS: number = 3000;

// Registers the pure logic test suite for the validation, network and http helpers.
export default function validateNetworkLogicTest() {
  // Define the logic test suite that contains all ValidateUtils, NetworkUtils and HttpUtils cases.
  describe('ValidateNetworkLogicSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0100
     * @tc.name      testValNet0001
     * @tc.desc      Verify isValidIPv4 accepts dotted quad addresses including both octet boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The unspecified address is a valid dotted quad.
      expect(ValidateUtils.isValidIPv4('0.0.0.0')).assertTrue();
      // The all-ones address sits exactly on the octet ceiling.
      expect(ValidateUtils.isValidIPv4('255.255.255.255')).assertTrue();
      // A typical private LAN address passes.
      expect(ValidateUtils.isValidIPv4('192.168.1.100')).assertTrue();
      // A public resolver address passes.
      expect(ValidateUtils.isValidIPv4('8.8.8.8')).assertTrue();
      // The smallest non-zero octets still form a valid address.
      expect(ValidateUtils.isValidIPv4('1.2.3.4')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0200
     * @tc.name      testValNet0002
     * @tc.desc      Verify isValidIPv4 rejects out of range octets, wrong octet counts and malformed text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // An octet above 255 is rejected.
      expect(ValidateUtils.isValidIPv4('256.1.1.1')).assertFalse();
      // Three octets are not enough.
      expect(ValidateUtils.isValidIPv4('1.2.3')).assertFalse();
      // Five octets are too many.
      expect(ValidateUtils.isValidIPv4('1.2.3.4.5')).assertFalse();
      // Letters are not octets.
      expect(ValidateUtils.isValidIPv4('a.b.c.d')).assertFalse();
      // A negative octet fails the leading digit check.
      expect(ValidateUtils.isValidIPv4('-1.2.3.4')).assertFalse();
      // Empty octets between dots are rejected.
      expect(ValidateUtils.isValidIPv4('1..2.3')).assertFalse();
      // Empty text is not an address.
      expect(ValidateUtils.isValidIPv4('')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0300
     * @tc.name      testValNet0003
     * @tc.desc      Verify isValidIPv6 accepts full eight group forms, compression shorthands and mixed case hex.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The full eight group form passes.
      expect(ValidateUtils.isValidIPv6('2001:0db8:0000:0000:0000:0000:0000:0001')).assertTrue();
      // The loopback shorthand passes.
      expect(ValidateUtils.isValidIPv6('::1')).assertTrue();
      // The unspecified address shorthand passes.
      expect(ValidateUtils.isValidIPv6('::')).assertTrue();
      // A link-local compressed form passes.
      expect(ValidateUtils.isValidIPv6('fe80::1')).assertTrue();
      // Compression in the middle of the address passes.
      expect(ValidateUtils.isValidIPv6('2001:db8::8a2e:370:7334')).assertTrue();
      // Uppercase hex letters pass as well.
      expect(ValidateUtils.isValidIPv6('ABCD::EF01')).assertTrue();
      // Seven zero groups with a final one pass in the expanded form.
      expect(ValidateUtils.isValidIPv6('0:0:0:0:0:0:0:1')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0400
     * @tc.name      testValNet0004
     * @tc.desc      Verify isValidIPv6 rejects oversized groups, double compression, bad hex and wrong group counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A five digit group is too long.
      expect(ValidateUtils.isValidIPv6('12345::')).assertFalse();
      // Two compressions in one address are ambiguous.
      expect(ValidateUtils.isValidIPv6('1::2::3')).assertFalse();
      // Non hex letters are rejected.
      expect(ValidateUtils.isValidIPv6('GGGG::1')).assertFalse();
      // A leading single colon is malformed.
      expect(ValidateUtils.isValidIPv6(':ab::cd')).assertFalse();
      // Seven groups without compression are incomplete.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7')).assertFalse();
      // Nine groups are too many.
      expect(ValidateUtils.isValidIPv6('1:2:3:4:5:6:7:8:9')).assertFalse();
      // Empty text is not an address.
      expect(ValidateUtils.isValidIPv6('')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0500
     * @tc.name      testValNet0005
     * @tc.desc      Verify isValidDomain accepts multi label names with hyphens, uppercase labels and long TLDs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A plain two label domain passes.
      expect(ValidateUtils.isValidDomain('example.com')).assertTrue();
      // Nested subdomains pass.
      expect(ValidateUtils.isValidDomain('sub.example.org')).assertTrue();
      // Hyphens inside labels pass.
      expect(ValidateUtils.isValidDomain('a-b.example.io')).assertTrue();
      // Uppercase labels pass.
      expect(ValidateUtils.isValidDomain('EXAMPLE.COM')).assertTrue();
      // Long letter TLDs pass.
      expect(ValidateUtils.isValidDomain('example.museum')).assertTrue();
      // Single character labels pass.
      expect(ValidateUtils.isValidDomain('x.io')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0600
     * @tc.name      testValNet0006
     * @tc.desc      Verify isValidDomain rejects missing, empty or malformed labels and non letter TLDs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A TLD suffix is mandatory.
      expect(ValidateUtils.isValidDomain('example')).assertFalse();
      // Labels cannot start with a dot.
      expect(ValidateUtils.isValidDomain('.example.com')).assertFalse();
      // Empty middle labels are rejected.
      expect(ValidateUtils.isValidDomain('example..com')).assertFalse();
      // Labels cannot start with a hyphen.
      expect(ValidateUtils.isValidDomain('-example.com')).assertFalse();
      // Labels cannot end with a hyphen.
      expect(ValidateUtils.isValidDomain('example-.com')).assertFalse();
      // The TLD needs at least two letters.
      expect(ValidateUtils.isValidDomain('example.c')).assertFalse();
      // The TLD cannot be numeric.
      expect(ValidateUtils.isValidDomain('example.123')).assertFalse();
      // A trailing dot leaves the TLD empty.
      expect(ValidateUtils.isValidDomain('example.com.')).assertFalse();
      // A dotted IPv4 literal is not a domain name.
      expect(ValidateUtils.isValidDomain('127.0.0.1')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0700
     * @tc.name      testValNet0007
     * @tc.desc      Verify isValidUrl accepts http and https absolute URLs with host, port, path and query.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Plain http host passes.
      expect(ValidateUtils.isValidUrl('http://example.com')).assertTrue();
      // Plain https host passes.
      expect(ValidateUtils.isValidUrl('https://example.com')).assertTrue();
      // Paths pass.
      expect(ValidateUtils.isValidUrl('http://example.com/path/to/resource')).assertTrue();
      // Ports pass.
      expect(ValidateUtils.isValidUrl('https://example.com:8080')).assertTrue();
      // Query strings ride on the path segment.
      expect(ValidateUtils.isValidUrl('https://sub.example.com:443/api?query=1')).assertTrue();
      // Dotted IPv4 hosts pass.
      expect(ValidateUtils.isValidUrl('http://192.168.1.10:8080/api')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0800
     * @tc.name      testValNet0008
     * @tc.desc      Verify isValidUrl rejects wrong schemes, missing hosts and malformed ports while keeping the port range out of its scope.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Other schemes are rejected.
      expect(ValidateUtils.isValidUrl('ftp://example.com')).assertFalse();
      // The scheme is case sensitive and uppercase is rejected.
      expect(ValidateUtils.isValidUrl('HTTPS://EXAMPLE.COM')).assertFalse();
      // A missing host is rejected.
      expect(ValidateUtils.isValidUrl('http://')).assertFalse();
      // A scheme-less host is rejected.
      expect(ValidateUtils.isValidUrl('example.com')).assertFalse();
      // Spaces inside the host are rejected.
      expect(ValidateUtils.isValidUrl('http://exa mple.com')).assertFalse();
      // Non numeric ports are rejected.
      expect(ValidateUtils.isValidUrl('http://example.com:abc')).assertFalse();
      // The URL pattern accepts any one to five digit port even out of range;
      // the port range check is a separate concern covered by isValidPort.
      expect(ValidateUtils.isValidUrl('http://example.com:99999')).assertTrue();
      expect(ValidateUtils.isValidPort(99999)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_0900
     * @tc.name      testValNet0009
     * @tc.desc      Verify isValidPort accepts integers across the full one to 65535 range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The lowest valid port passes.
      expect(ValidateUtils.isValidPort(1)).assertTrue();
      // Common service ports pass.
      expect(ValidateUtils.isValidPort(80)).assertTrue();
      expect(ValidateUtils.isValidPort(443)).assertTrue();
      expect(ValidateUtils.isValidPort(8080)).assertTrue();
      // The highest valid port sits exactly on the ceiling.
      expect(ValidateUtils.isValidPort(65535)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1000
     * @tc.name      testValNet0010
     * @tc.desc      Verify isValidPort rejects boundary violations and non integer values including NaN and Infinity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Zero is reserved and invalid.
      expect(ValidateUtils.isValidPort(0)).assertFalse();
      // One above the ceiling is invalid.
      expect(ValidateUtils.isValidPort(65536)).assertFalse();
      // Negative numbers are invalid.
      expect(ValidateUtils.isValidPort(-1)).assertFalse();
      // Fractional numbers are not integers.
      expect(ValidateUtils.isValidPort(80.5)).assertFalse();
      // NaN is not an integer.
      expect(ValidateUtils.isValidPort(Number.NaN)).assertFalse();
      // Infinity is not an integer.
      expect(ValidateUtils.isValidPort(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1100
     * @tc.name      testValNet0011
     * @tc.desc      Verify isValidEmail accepts local parts with dots, plus tags, underscores and percent signs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The plain shape passes.
      expect(ValidateUtils.isValidEmail('user@example.com')).assertTrue();
      // Dots in the local part and subdomains pass.
      expect(ValidateUtils.isValidEmail('first.last@sub.example.org')).assertTrue();
      // Plus addressing passes.
      expect(ValidateUtils.isValidEmail('user+tag@example.io')).assertTrue();
      // Underscores and hyphens pass.
      expect(ValidateUtils.isValidEmail('user_99@example-dev.co')).assertTrue();
      // Percent signs and uppercase pass.
      expect(ValidateUtils.isValidEmail('USER%NAME@EXAMPLE.COM')).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1200
     * @tc.name      testValNet0012
     * @tc.desc      Verify isValidEmail rejects missing local parts, missing domains, bad at signs and spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // A missing domain is rejected.
      expect(ValidateUtils.isValidEmail('user@')).assertFalse();
      // A missing local part is rejected.
      expect(ValidateUtils.isValidEmail('@example.com')).assertFalse();
      // A missing at sign is rejected.
      expect(ValidateUtils.isValidEmail('userexample.com')).assertFalse();
      // A one letter TLD is rejected.
      expect(ValidateUtils.isValidEmail('user@example.c')).assertFalse();
      // Spaces inside the domain are rejected.
      expect(ValidateUtils.isValidEmail('user@exam ple.com')).assertFalse();
      // Spaces inside the local part are rejected.
      expect(ValidateUtils.isValidEmail('user name@example.com')).assertFalse();
      // A double at sign is rejected.
      expect(ValidateUtils.isValidEmail('user@@example.com')).assertFalse();
      // Empty text is rejected.
      expect(ValidateUtils.isValidEmail('')).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1300
     * @tc.name      testValNet0013
     * @tc.desc      Verify encodeUriComponent escapes reserved and non ASCII characters while keeping unreserved text intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Unreserved text passes through unchanged.
      expect(ValidateUtils.encodeUriComponent('plain')).assertEqual('plain');
      expect(ValidateUtils.encodeUriComponent('abcXYZ012-_.~')).assertEqual('abcXYZ012-_.~');
      // Spaces become percent escapes.
      expect(ValidateUtils.encodeUriComponent('a b')).assertEqual('a%20b');
      // Reserved characters are escaped one by one.
      expect(ValidateUtils.encodeUriComponent('a&b=c')).assertEqual('a%26b%3Dc');
      // Slashes are escaped too.
      expect(ValidateUtils.encodeUriComponent('path/one')).assertEqual('path%2Fone');
      // Plus signs are escaped, they are not treated as spaces.
      expect(ValidateUtils.encodeUriComponent('a+b')).assertEqual('a%2Bb');
      // Non ASCII text is escaped as UTF-8 byte sequences.
      expect(ValidateUtils.encodeUriComponent('网络')).assertEqual('%E7%BD%91%E7%BB%9C');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1400
     * @tc.name      testValNet0014
     * @tc.desc      Verify decodeUri resolves valid escapes, keeps plus signs literal and falls back on malformed escapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Percent escapes decode back to spaces.
      expect(ValidateUtils.decodeUri('a%20b')).assertEqual('a b');
      // UTF-8 byte sequences decode back to text.
      expect(ValidateUtils.decodeUri('%E7%BD%91%E7%BB%9C')).assertEqual('网络');
      // Text without escapes passes through unchanged.
      expect(ValidateUtils.decodeUri('plain')).assertEqual('plain');
      // Plus signs stay literal, they are not converted to spaces.
      expect(ValidateUtils.decodeUri('a+b')).assertEqual('a+b');
      // A dangling percent sign is malformed and falls back to the input.
      expect(ValidateUtils.decodeUri('100%')).assertEqual('100%');
      // Invalid hex digits after the percent sign fall back to the input.
      expect(ValidateUtils.decodeUri('%zz')).assertEqual('%zz');
      // A truncated UTF-8 sequence falls back to the input.
      expect(ValidateUtils.decodeUri('%E7%BD')).assertEqual('%E7%BD');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1500
     * @tc.name      testValNet0015
     * @tc.desc      Verify encode and decode form a lossless roundtrip for text, reserved, non ASCII and pre-encoded values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // One matrix of values that must survive an encode then decode roundtrip.
      const values: string[] = ['plain text', 'q=1&x=2', 'path/one', 'a+b', 'user@example.com', '网络安全'];
      for (let index = 0; index < values.length; index++) {
        const encoded: string = ValidateUtils.encodeUriComponent(values[index]);
        const decoded: string = ValidateUtils.decodeUri(encoded);
        expect(decoded).assertEqual(values[index]);
      }
      // Reserved separators are rewritten, proving the encoder is not the identity.
      expect(ValidateUtils.encodeUriComponent(values[1])).not().assertEqual(values[1]);
      // Non ASCII text is rewritten into percent escape sequences as well.
      expect(ValidateUtils.encodeUriComponent(values[5])).not().assertEqual(values[5]);
      // Unreserved ASCII characters pass through the encoder unchanged.
      expect(ValidateUtils.encodeUriComponent('abcXYZ019')).assertEqual('abcXYZ019');
      // An already percent encoded value survives one extra encode and decode pair.
      const preEncoded: string = '%20';
      expect(ValidateUtils.decodeUri(ValidateUtils.encodeUriComponent(preEncoded))).assertEqual('%20');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1600
     * @tc.name      testValNet0016
     * @tc.desc      Verify isPositiveNumber accepts finite positives and rejects zero, negatives, NaN and Infinity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Whole and fractional positives pass.
      expect(ValidateUtils.isPositiveNumber(1)).assertTrue();
      expect(ValidateUtils.isPositiveNumber(0.001)).assertTrue();
      expect(ValidateUtils.isPositiveNumber(1000000)).assertTrue();
      // Zero is not positive.
      expect(ValidateUtils.isPositiveNumber(0)).assertFalse();
      // Negatives fail.
      expect(ValidateUtils.isPositiveNumber(-1)).assertFalse();
      expect(ValidateUtils.isPositiveNumber(-0.5)).assertFalse();
      // Non finite numbers fail.
      expect(ValidateUtils.isPositiveNumber(Number.NaN)).assertFalse();
      expect(ValidateUtils.isPositiveNumber(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1700
     * @tc.name      testValNet0017
     * @tc.desc      Verify the validators cooperate when assembling, checking and decoding a complete endpoint URL.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // Build an endpoint whose query value needs percent encoding.
      const rawQuery: string = 'token=secret value';
      const encodedQuery: string = ValidateUtils.encodeUriComponent(rawQuery);
      const endpoint: string = 'https://192.168.1.10:8080/api?' + encodedQuery;
      // The assembled endpoint passes the URL shape check.
      expect(ValidateUtils.isValidUrl(endpoint)).assertTrue();
      // Split the authority from the path and query.
      const afterScheme: string = endpoint.substring('https://'.length);
      const slashIndex: number = afterScheme.indexOf('/');
      const authority: string = slashIndex > 0 ? afterScheme.substring(0, slashIndex) : afterScheme;
      // The host part is a valid IPv4 literal and not a domain name.
      const colonIndex: number = authority.lastIndexOf(':');
      const host: string = authority.substring(0, colonIndex);
      expect(ValidateUtils.isValidIPv4(host)).assertTrue();
      expect(ValidateUtils.isValidDomain(host)).assertFalse();
      // The port part is a valid port number.
      const port: number = Number.parseInt(authority.substring(colonIndex + 1), 10);
      expect(ValidateUtils.isValidPort(port)).assertTrue();
      expect(port).assertEqual(8080);
      // The query decodes back to the raw value.
      expect(ValidateUtils.decodeUri(encodedQuery)).assertEqual(rawQuery);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1800
     * @tc.name      testValNet0018
     * @tc.desc      Verify hasDefaultNetwork resolves to a boolean without throwing on the live system state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device dependent call: the outcome follows the live system network state,
      // so only the result shape is asserted and the value is logged for the report.
      const resolved: boolean = await NetworkUtils.hasDefaultNetwork();
      expect(typeof resolved).assertEqual('boolean');
      // The promise contract resolves a strict boolean, never an undefined leak.
      expect(resolved === true || resolved === false).assertTrue();
      // A second call keeps the same result shape without coupling the two values.
      const resolvedAgain: boolean = await NetworkUtils.hasDefaultNetwork();
      expect(typeof resolvedAgain).assertEqual('boolean');
      console.info(OBSERVE_TAG + ' hasDefaultNetwork observed: ' + resolved.toString()
        + ', second call: ' + resolvedAgain.toString());
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_1900
     * @tc.name      testValNet0019
     * @tc.desc      Verify isNetworkAvailable resolves to a boolean without throwing on the live system state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device dependent call: only the result shape is asserted and the value is logged.
      const available: boolean = await NetworkUtils.isNetworkAvailable();
      expect(typeof available).assertEqual('boolean');
      // The promise contract resolves a strict boolean, never an undefined leak.
      expect(available === true || available === false).assertTrue();
      // A second call keeps the same result shape without coupling the two values.
      const availableAgain: boolean = await NetworkUtils.isNetworkAvailable();
      expect(typeof availableAgain).assertEqual('boolean');
      console.info(OBSERVE_TAG + ' isNetworkAvailable observed: ' + available.toString()
        + ', second call: ' + availableAgain.toString());
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2000
     * @tc.name      testValNet0020
     * @tc.desc      Verify getBearerName resolves to a non empty readable bearer label on any network state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device dependent call: the exact label depends on the active bearer, so the
      // non empty string contract is asserted and the observed label is logged.
      const bearer: string = await NetworkUtils.getBearerName();
      expect(typeof bearer).assertEqual('string');
      expect(bearer.length).assertLarger(0);
      // The readable label never carries surrounding whitespace.
      expect(bearer === bearer.trim()).assertTrue();
      // A second call keeps the same non empty label contract.
      const bearerAgain: string = await NetworkUtils.getBearerName();
      expect(bearerAgain.length).assertLarger(0);
      console.info(OBSERVE_TAG + ' getBearerName observed: ' + bearer
        + ', second call: ' + bearerAgain);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2100
     * @tc.name      testValNet0021
     * @tc.desc      Verify getNetworkInfo resolves a complete snapshot with boolean availability, a netId and a bearer label.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device dependent call: the snapshot fields follow the live network, so the
      // field shape and fallback guarantees are asserted and the values are logged.
      const info: NetworkInfo = await NetworkUtils.getNetworkInfo();
      expect(typeof info.available).assertEqual('boolean');
      expect(typeof info.netId).assertEqual('number');
      expect(typeof info.bearerText).assertEqual('string');
      // The failure fallback keeps the netId at zero and the label non empty.
      expect(info.netId).assertLargerOrEqual(0);
      expect(info.bearerText.length).assertLarger(0);
      console.info(OBSERVE_TAG + ' getNetworkInfo observed: available=' + info.available.toString()
        + ', netId=' + info.netId.toString() + ', bearer=' + info.bearerText);
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2200
     * @tc.name      testValNet0022
     * @tc.desc      Verify isSuccessStatus classifies 2xx and 3xx status codes as transport success.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // 2xx statuses are transport successes.
      expect(HttpUtils.isSuccessStatus(200)).assertTrue();
      expect(HttpUtils.isSuccessStatus(201)).assertTrue();
      expect(HttpUtils.isSuccessStatus(204)).assertTrue();
      // The whole 3xx range still counts as transport success.
      expect(HttpUtils.isSuccessStatus(301)).assertTrue();
      expect(HttpUtils.isSuccessStatus(399)).assertTrue();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2300
     * @tc.name      testValNet0023
     * @tc.desc      Verify isSuccessStatus rejects codes below 200 and at or above 400 including non HTTP numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValNet0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Just below the floor fails.
      expect(HttpUtils.isSuccessStatus(199)).assertFalse();
      // Client and server errors fail.
      expect(HttpUtils.isSuccessStatus(400)).assertFalse();
      expect(HttpUtils.isSuccessStatus(404)).assertFalse();
      expect(HttpUtils.isSuccessStatus(500)).assertFalse();
      // Non HTTP numbers fail too.
      expect(HttpUtils.isSuccessStatus(0)).assertFalse();
      expect(HttpUtils.isSuccessStatus(-1)).assertFalse();
      expect(HttpUtils.isSuccessStatus(999)).assertFalse();
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2400
     * @tc.name      testValNet0024
     * @tc.desc      Verify httpGet against an unreachable endpoint resolves a shape complete failure outcome without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device and network dependent call: the request targets a loopback port with
      // no listener, so only the result shape and the internal consistency of the
      // outcome fields are asserted; the observed values go to the log.
      const startedAt: number = Date.now();
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, SHORT_TIMEOUT_MS, 0);
      const elapsed: number = Date.now() - startedAt;
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.statusCode).assertEqual('number');
      expect(typeof result.body).assertEqual('string');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.message).assertEqual('string');
      expect(result.message.length).assertLarger(0);
      // Contract invariant: success is true exactly when no transport error was
      // recorded and the status code lands in the success range.
      const consistent: boolean = result.success ===
        (result.errorCode === 0 && HttpUtils.isSuccessStatus(result.statusCode));
      expect(consistent).assertTrue();
      console.info(OBSERVE_TAG + ' httpGet observed: success=' + result.success.toString()
        + ', status=' + result.statusCode.toString() + ', code=' + result.errorCode.toString()
        + ', elapsed=' + elapsed.toString() + 'ms');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2500
     * @tc.name      testValNet0025
     * @tc.desc      Verify httpPost against an unreachable endpoint resolves a shape complete failure outcome without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device and network dependent call: only the result shape and the contract
      // invariant are asserted, the observed values go to the log.
      const result: HttpCallResult = await HttpUtils.httpPost(UNREACHABLE_URL, 'ping-payload', SHORT_TIMEOUT_MS, 0);
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.statusCode).assertEqual('number');
      expect(typeof result.body).assertEqual('string');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.message).assertEqual('string');
      expect(result.message.length).assertLarger(0);
      const consistent: boolean = result.success ===
        (result.errorCode === 0 && HttpUtils.isSuccessStatus(result.statusCode));
      expect(consistent).assertTrue();
      console.info(OBSERVE_TAG + ' httpPost observed: success=' + result.success.toString()
        + ', status=' + result.statusCode.toString() + ', code=' + result.errorCode.toString());
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_LOGIC_VALNET_2600
     * @tc.name      testValNet0026
     * @tc.desc      Verify httpGet with one retry still resolves without throwing and stays inside a sane time window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValNet0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Device and network dependent call: one retry against the unreachable endpoint
      // must still resolve without throwing; only the shape and a generous time
      // window are asserted because the exact elapsed time depends on the stack.
      const startedAt: number = Date.now();
      const result: HttpCallResult = await HttpUtils.httpGet(UNREACHABLE_URL, 2000, 1);
      const elapsed: number = Date.now() - startedAt;
      expect(typeof result.success).assertEqual('boolean');
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(60000);
      console.info(OBSERVE_TAG + ' httpGet retry observed: success=' + result.success.toString()
        + ', code=' + result.errorCode.toString() + ', elapsed=' + elapsed.toString() + 'ms');
    });
  });
}
