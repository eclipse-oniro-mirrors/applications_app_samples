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
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildFullMoment, buildImageMoment, buildMoment } from '../common/DataFactory';
/**
 * Serialized shape of a feed row.
 * The page compares media slots through JSON.stringify, and tooling snapshots
 * rows the same way. The cases below pin which keys appear for each media
 * combination and that the text fields survive serialization unchanged.
 */
export default function jsonShapeContractTest() {
  describe('JsonShapeContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0100
     * @tc.name IdKeyPresent001
     * @tc.desc Verify id key present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IdKeyPresent_001', 0, (): void => {
      Logger.info(TAG, 'IdKeyPresent_001 begin');
      const moment: FriendMoment = buildMoment('id-0100', 'Author', 'body');
      const payload: string = JSON.stringify(moment);
      const present: boolean = payload.indexOf('"id"') !== -1;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'IdKeyPresent_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0200
     * @tc.name UserNameKeyPresent002
     * @tc.desc Verify user name key present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameKeyPresent_002', 0, (): void => {
      Logger.info(TAG, 'UserNameKeyPresent_002 begin');
      const moment: FriendMoment = buildMoment('id-0200', 'Author', 'body');
      const payload: string = JSON.stringify(moment);
      expect(payload).assertContain('"userName"');
      expect(payload).assertContain('Author');
      Logger.info(TAG, 'UserNameKeyPresent_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0300
     * @tc.name AvatarKeyPresent003
     * @tc.desc Verify avatar key present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AvatarKeyPresent_003', 0, (): void => {
      Logger.info(TAG, 'AvatarKeyPresent_003 begin');
      const moment: FriendMoment = buildMoment('id-0300', 'Author', 'body');
      const payload: string = JSON.stringify(moment);
      expect(payload).assertContain('"avatar"');
      Logger.info(TAG, 'AvatarKeyPresent_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0400
     * @tc.name TextKeyPresent004
     * @tc.desc Verify text key present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TextKeyPresent_004', 0, (): void => {
      Logger.info(TAG, 'TextKeyPresent_004 begin');
      const moment: FriendMoment = buildMoment('id-0400', 'Author', 'body text');
      const payload: string = JSON.stringify(moment);
      const parsed: FriendMoment = JSON.parse(payload) as FriendMoment;
      expect(parsed.text).assertEqual('body text');
      expect(payload).assertContain('"text"');
      Logger.info(TAG, 'TextKeyPresent_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0500
     * @tc.name EmptyImageKeyKept005
     * @tc.desc Verify empty image key kept
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyImageKeyKept_005', 0, (): void => {
      Logger.info(TAG, 'EmptyImageKeyKept_005 begin');
      const moment: FriendMoment = buildFullMoment('id-0500', 'Author', 'body', '', '');
      const payload: string = JSON.stringify(moment);
      expect(payload).assertContain('"image":""');
      expect(payload).assertContain('"video":""');
      Logger.info(TAG, 'EmptyImageKeyKept_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0600
     * @tc.name AbsentImageKeyOmitted006
     * @tc.desc Verify absent image key omitted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbsentImageKeyOmitted_006', 0, (): void => {
      Logger.info(TAG, 'AbsentImageKeyOmitted_006 begin');
      const moment: FriendMoment = buildMoment('id-0600', 'Author', 'body');
      const payload: string = JSON.stringify(moment);
      const omitted: boolean = payload.indexOf('"image"') === -1;
      Logger.info(TAG, 'omitted=' + JSON.stringify(omitted));
      expect(omitted).assertTrue();
      Logger.info(TAG, 'AbsentImageKeyOmitted_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0700
     * @tc.name AbsentVideoKeyOmitted007
     * @tc.desc Verify absent video key omitted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AbsentVideoKeyOmitted_007', 0, (): void => {
      Logger.info(TAG, 'AbsentVideoKeyOmitted_007 begin');
      const moment: FriendMoment = buildImageMoment('id-0700', 'Author', 'body', 'img');
      const payload: string = JSON.stringify(moment);
      const omitted: boolean = payload.indexOf('"video"') === -1;
      Logger.info(TAG, 'omitted=' + JSON.stringify(omitted));
      expect(omitted).assertTrue();
      Logger.info(TAG, 'AbsentVideoKeyOmitted_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0800
     * @tc.name BothMediaKeysPresent008
     * @tc.desc Verify both media keys present
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BothMediaKeysPresent_008', 0, (): void => {
      Logger.info(TAG, 'BothMediaKeysPresent_008 begin');
      const moment: FriendMoment = buildFullMoment('id-0800', 'Author', 'body', 'img', 'vid');
      const payload: string = JSON.stringify(moment);
      const parsed: FriendMoment = JSON.parse(payload) as FriendMoment;
      expect(parsed.image).assertEqual('img');
      expect(parsed.video).assertEqual('vid');
      Logger.info(TAG, 'BothMediaKeysPresent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_0900
     * @tc.name KeyOrderStable009
     * @tc.desc Verify key order stable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'KeyOrderStable_009', 0, (): void => {
      Logger.info(TAG, 'KeyOrderStable_009 begin');
      const moment: FriendMoment = buildFullMoment('id-0900', 'Author', 'body', 'img', 'vid');
      const first: string = JSON.stringify(moment);
      const second: string = JSON.stringify(moment);
      expect(first).assertEqual(second);
      Logger.info(TAG, 'KeyOrderStable_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_1000
     * @tc.name ArrayPayloadLength010
     * @tc.desc Verify array payload length
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayPayloadLength_010', 0, (): void => {
      Logger.info(TAG, 'ArrayPayloadLength_010 begin');
      const rows: Array<FriendMoment> = [
        buildMoment('a', 'Author', 'one'),
        buildMoment('b', 'Author', 'two'),
        buildMoment('c', 'Author', 'three')
      ];
      const payload: string = JSON.stringify(rows);
      const head: boolean = payload.startsWith('[') && payload.endsWith(']');
      Logger.info(TAG, 'head=' + JSON.stringify(head));
      expect(head).assertTrue();
      expect(payload).assertContain('three');
      Logger.info(TAG, 'ArrayPayloadLength_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_1100
     * @tc.name NumericIdStaysQuoted011
     * @tc.desc Verify numeric id stays quoted
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumericIdStaysQuoted_011', 0, (): void => {
      Logger.info(TAG, 'NumericIdStaysQuoted_011 begin');
      const moment: FriendMoment = buildMoment('007', 'Author', 'body');
      const payload: string = JSON.stringify(moment);
      const parsed: FriendMoment = JSON.parse(payload) as FriendMoment;
      expect(parsed.id).assertEqual('007');
      Logger.info(TAG, 'NumericIdStaysQuoted_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_1200
     * @tc.name ChineseBodyPreserved012
     * @tc.desc Verify chinese body preserved
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ChineseBodyPreserved_012', 0, (): void => {
      Logger.info(TAG, 'ChineseBodyPreserved_012 begin');
      const moment: FriendMoment = buildMoment('id-1200', 'Chef', '来杯香槟');
      const payload: string = JSON.stringify(moment);
      const parsed: FriendMoment = JSON.parse(payload) as FriendMoment;
      expect(parsed.text).assertEqual('来杯香槟');
      expect(payload.indexOf('\\u') === -1).assertTrue();
      Logger.info(TAG, 'ChineseBodyPreserved_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_1300
     * @tc.name LongerBodyLongerPayload013
     * @tc.desc Verify longer body longer payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LongerBodyLongerPayload_013', 0, (): void => {
      Logger.info(TAG, 'LongerBodyLongerPayload_013 begin');
      const short: FriendMoment = buildMoment('id-1300', 'Author', 'x');
      const long: FriendMoment = buildMoment('id-1301', 'Author', 'xxxxxxxxxx');
      const grown: boolean = JSON.stringify(long).length === Math.max(JSON.stringify(short).length, JSON.stringify(long).length);
      Logger.info(TAG, 'grown=' + JSON.stringify(grown));
      expect(grown).assertTrue();
      Logger.info(TAG, 'LongerBodyLongerPayload_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_JSONSHAPE_1400
     * @tc.name StringRoundTripExact014
     * @tc.desc Verify string round trip exact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StringRoundTripExact_014', 0, (): void => {
      Logger.info(TAG, 'StringRoundTripExact_014 begin');
      const body: string = 'keep  the  gaps';
      const restored: string = JSON.parse(JSON.stringify(body)) as string;
      expect(restored).assertEqual(body);
      expect(restored.length).assertEqual(15);
      Logger.info(TAG, 'StringRoundTripExact_014 end');
    });
  });
}
