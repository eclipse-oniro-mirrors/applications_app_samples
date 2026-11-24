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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import uri from '@ohos.uri';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Address parsing through the URI module.
 * A picked photo arrives as a file address while a shared caption may carry a
 * web link. The cases pin the part accessors, the absolute flag and the
 * normalisation that removes a parent segment before the address is stored.
 */
export default function uriContractTest() {
  describe('UriContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0100
     * @tc.name SchemeParsed001
     * @tc.desc Verify the scheme is exposed without its separator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SchemeParsed_001', 0, (): void => {
      Logger.info(TAG, 'SchemeParsed_001 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      expect(address.scheme).assertEqual('https');
      Logger.info(TAG, 'SchemeParsed_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0200
     * @tc.name AuthorityKeepsHost002
     * @tc.desc Verify the authority carries the host name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AuthorityKeepsHost_002', 0, (): void => {
      Logger.info(TAG, 'AuthorityKeepsHost_002 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      expect(address.authority.indexOf('example.com') !== -1).assertTrue();
      Logger.info(TAG, 'AuthorityKeepsHost_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0300
     * @tc.name AuthorityKeepsPort003
     * @tc.desc Verify an explicit port stays inside the authority
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AuthorityKeepsPort_003', 0, (): void => {
      Logger.info(TAG, 'AuthorityKeepsPort_003 begin');
      const address: uri.URI = new uri.URI('https://example.com:8080/album/item.jpg');
      const parts: Array<string> = address.authority.split(':');
      expect(parts[0]).assertEqual('example.com');
      expect(parts[1]).assertEqual('8080');
      Logger.info(TAG, 'AuthorityKeepsPort_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0400
     * @tc.name PathParsed004
     * @tc.desc Verify the path keeps its folder and file segments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'PathParsed_004', 0, (): void => {
      Logger.info(TAG, 'PathParsed_004 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      expect(address.path).assertEqual('/album/item.jpg');
      Logger.info(TAG, 'PathParsed_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0500
     * @tc.name QueryParsed005
     * @tc.desc Verify the query keeps its key value text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QueryParsed_005', 0, (): void => {
      Logger.info(TAG, 'QueryParsed_005 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg?size=large');
      expect(address.query).assertEqual('size=large');
      Logger.info(TAG, 'QueryParsed_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0600
     * @tc.name FragmentParsed006
     * @tc.desc Verify the fragment is exposed without its leading marker
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FragmentParsed_006', 0, (): void => {
      Logger.info(TAG, 'FragmentParsed_006 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg#preview');
      expect(address.fragment).assertEqual('preview');
      Logger.info(TAG, 'FragmentParsed_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0700
     * @tc.name AbsoluteAddressFlag007
     * @tc.desc Verify a scheme qualified address is reported as absolute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbsoluteAddressFlag_007', 0, (): void => {
      Logger.info(TAG, 'AbsoluteAddressFlag_007 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      expect(address.checkIsAbsolute()).assertTrue();
      Logger.info(TAG, 'AbsoluteAddressFlag_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0800
     * @tc.name RelativeAddressFlag008
     * @tc.desc Verify an address without a scheme is not reported as absolute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RelativeAddressFlag_008', 0, (): void => {
      Logger.info(TAG, 'RelativeAddressFlag_008 begin');
      const address: uri.URI = new uri.URI('album/item.jpg');
      expect(address.checkIsAbsolute()).assertFalse();
      Logger.info(TAG, 'RelativeAddressFlag_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_0900
     * @tc.name SameAddressEqualsTo009
     * @tc.desc Verify two parses of one address compare as equal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameAddressEqualsTo_009', 0, (): void => {
      Logger.info(TAG, 'SameAddressEqualsTo_009 begin');
      const first: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      const second: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      expect(first.equalsTo(second)).assertTrue();
      Logger.info(TAG, 'SameAddressEqualsTo_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_1000
     * @tc.name DifferentPathIsNotEqual010
     * @tc.desc Verify a different path makes two addresses unequal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DifferentPathIsNotEqual_010', 0, (): void => {
      Logger.info(TAG, 'DifferentPathIsNotEqual_010 begin');
      const first: uri.URI = new uri.URI('https://example.com/album/item.jpg');
      const second: uri.URI = new uri.URI('https://example.com/album/other.jpg');
      expect(first.equalsTo(second)).assertFalse();
      Logger.info(TAG, 'DifferentPathIsNotEqual_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_1100
     * @tc.name ToStringKeepsParts011
     * @tc.desc Verify the rendered address still contains scheme, path and fragment
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ToStringKeepsParts_011', 0, (): void => {
      Logger.info(TAG, 'ToStringKeepsParts_011 begin');
      const address: uri.URI = new uri.URI('https://example.com/album/item.jpg?size=large#preview');
      const rendered: string = address.toString();
      expect(rendered.indexOf('https://') !== -1).assertTrue();
      expect(rendered.indexOf('/album/item.jpg') !== -1).assertTrue();
      expect(rendered.indexOf('#preview') !== -1).assertTrue();
      Logger.info(TAG, 'ToStringKeepsParts_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_1200
     * @tc.name NormalizeRemovesParentSegment012
     * @tc.desc Verify normalisation collapses a parent segment in the path
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NormalizeRemovesParentSegment_012', 0, (): void => {
      Logger.info(TAG, 'NormalizeRemovesParentSegment_012 begin');
      const address: uri.URI = new uri.URI('https://example.com/a/../b');
      const cleaned: uri.URI = address.normalize();
      expect(cleaned.path).assertEqual('/b');
      Logger.info(TAG, 'NormalizeRemovesParentSegment_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_1300
     * @tc.name LocalFileScheme013
     * @tc.desc Verify a picked media address is parsed with the file scheme
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LocalFileScheme_013', 0, (): void => {
      Logger.info(TAG, 'LocalFileScheme_013 begin');
      const address: uri.URI = new uri.URI('file://media/Photo/1/IMG_001.jpg');
      expect(address.checkIsAbsolute()).assertTrue();
      expect(address.scheme).assertEqual('file');
      expect(address.path.endsWith('.jpg')).assertTrue();
      Logger.info(TAG, 'LocalFileScheme_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_URI_1400
     * @tc.name QueryKeepsBothPairs014
     * @tc.desc Verify a two pair query keeps both keys in order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'QueryKeepsBothPairs_014', 0, (): void => {
      Logger.info(TAG, 'QueryKeepsBothPairs_014 begin');
      const address: uri.URI = new uri.URI('https://example.com/item?a=1&b=2');
      const query: string = address.query;
      expect(query.indexOf('a=1') !== -1).assertTrue();
      expect(query.indexOf('b=2') !== -1).assertTrue();
      Logger.info(TAG, 'QueryKeepsBothPairs_014 end');
    });
  });
}
