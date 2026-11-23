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
import resourceManager from '@ohos.resourceManager';
import util from '@ohos.util';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Raw file directory access and alternate text encodings.
 * The router map under rawfile is resolved through the directory listing and
 * the descriptor form, not only through a full content read. Text that a user
 * pastes may also arrive in a legacy encoding, so the decoder's non UTF-8 modes
 * are pinned as well. None of these paths was exercised by the earlier suites.
 */
const manager: resourceManager.ResourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
const ROUTE_DIR: string = 'routerMap';
const ROUTE_FILE: string = 'publishmultimediaupdates.json';
const ROUTE_PATH: string = 'routerMap/publishmultimediaupdates.json';
export default function encodingAndRawApiTest() {
  describe('EncodingAndRawApiTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0100
     * @tc.name RouteDirectoryListed001
     * @tc.desc Verify the rawfile directory listing exposes the route map file
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RouteDirectoryListed_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RouteDirectoryListed_001 begin');
      const entries: Array<string> = await manager.getRawFileList(ROUTE_DIR);
      expect(entries.indexOf(ROUTE_FILE) !== -1).assertTrue();
      Logger.info(TAG, 'RouteDirectoryListed_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0200
     * @tc.name RouteListingNonEmpty002
     * @tc.desc Verify the rawfile directory listing is not empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RouteListingNonEmpty_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RouteListingNonEmpty_002 begin');
      const entries: Array<string> = await manager.getRawFileList(ROUTE_DIR);
      expect(entries.length !== 0).assertTrue();
      Logger.info(TAG, 'RouteListingNonEmpty_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0300
     * @tc.name ListingStable003
     * @tc.desc Verify two directory listings report the same entry count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ListingStable_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'ListingStable_003 begin');
      const first: Array<string> = await manager.getRawFileList(ROUTE_DIR);
      const second: Array<string> = await manager.getRawFileList(ROUTE_DIR);
      expect(first.length).assertEqual(second.length);
      Logger.info(TAG, 'ListingStable_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0400
     * @tc.name DescriptorOpensFile004
     * @tc.desc Verify the descriptor form opens the route map with a valid handle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DescriptorOpensFile_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DescriptorOpensFile_004 begin');
      const descriptor: resourceManager.RawFileDescriptor = await manager.getRawFd(ROUTE_PATH);
      expect(descriptor.fd !== -1).assertTrue();
      expect(descriptor.length !== 0).assertTrue();
      Logger.info(TAG, 'DescriptorOpensFile_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0500
     * @tc.name DescriptorLengthMatchesBytes005
     * @tc.desc Verify the descriptor length equals the content byte count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DescriptorLengthMatchesBytes_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DescriptorLengthMatchesBytes_005 begin');
      const descriptor: resourceManager.RawFileDescriptor = await manager.getRawFd(ROUTE_PATH);
      const bytes: Uint8Array = await manager.getRawFileContent(ROUTE_PATH);
      expect(descriptor.length).assertEqual(bytes.length);
      Logger.info(TAG, 'DescriptorLengthMatchesBytes_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0600
     * @tc.name ExtraFormatArgsIgnored006
     * @tc.desc Verify a plain string resource ignores surplus format arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ExtraFormatArgsIgnored_006', 0, (): void => {
      Logger.info(TAG, 'ExtraFormatArgsIgnored_006 begin');
      const plain: string = manager.getStringSync($r('app.string.publish_multimedia_updates_share'));
      const withArgs: string = manager.getStringSync($r('app.string.publish_multimedia_updates_share'), 'x', 1);
      expect(withArgs).assertEqual(plain);
      Logger.info(TAG, 'ExtraFormatArgsIgnored_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0700
     * @tc.name Utf16LengthDoubles007
     * @tc.desc Verify UTF-16 encoding uses two bytes per ascii character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Utf16LengthDoubles_007', 0, (): void => {
      Logger.info(TAG, 'Utf16LengthDoubles_007 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-16le');
      expect(encoder.encodeInto('abc').length).assertEqual(6);
      Logger.info(TAG, 'Utf16LengthDoubles_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0800
     * @tc.name Utf16RoundTrip008
     * @tc.desc Verify ascii text survives a UTF-16 encode and decode cycle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Utf16RoundTrip_008', 0, (): void => {
      Logger.info(TAG, 'Utf16RoundTrip_008 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-16le');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-16le');
      const text: string = 'publish update';
      expect(decoder.decodeToString(encoder.encodeInto(text))).assertEqual(text);
      Logger.info(TAG, 'Utf16RoundTrip_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_0900
     * @tc.name Utf16Chinese009
     * @tc.desc Verify CJK text survives a UTF-16 round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Utf16Chinese_009', 0, (): void => {
      Logger.info(TAG, 'Utf16Chinese_009 begin');
      const encoder: util.TextEncoder = new util.TextEncoder('utf-16le');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-16le');
      const text: string = '来杯香槟';
      const bytes: Uint8Array = encoder.encodeInto(text);
      expect(bytes.length).assertEqual(8);
      expect(decoder.decodeToString(bytes)).assertEqual(text);
      Logger.info(TAG, 'Utf16Chinese_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_ENCRAW_1000
     * @tc.name GbkDecodesKnownBytes010
     * @tc.desc Verify the GBK decoder maps the known bytes of a CJK character
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'GbkDecodesKnownBytes_010', 0, (): void => {
      Logger.info(TAG, 'GbkDecodesKnownBytes_010 begin');
      const decoder: util.TextDecoder = util.TextDecoder.create('gbk');
      const bytes: Uint8Array = new Uint8Array(2);
      bytes[0] = 0xD6;
      bytes[1] = 0xD0;
      expect(decoder.decodeToString(bytes)).assertEqual('中');
      Logger.info(TAG, 'GbkDecodesKnownBytes_010 end');
    });
  });
}
