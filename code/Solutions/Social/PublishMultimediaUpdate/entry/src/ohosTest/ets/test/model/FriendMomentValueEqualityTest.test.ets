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
import Logger from '../Logger';
import { FriendMoment } from 'publishmultimediaupdate/src/main/ets/model/BasicDataSource';
import { BUNDLE, TAG } from '../common/TestConstant';
import { buildFullMoment, buildMoment } from '../common/DataFactory';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Value equality of two rows.
 * The model has no equals method; the page and the snapshot code compare rows
 * through their serialized form. These cases pin when two rows count as the
 * same value and when they must differ, separating that from reference
 * identity, which the data source keeps.
 */
function sameValue(left: FriendMoment, right: FriendMoment): boolean {
  return JSON.stringify(left) === JSON.stringify(right);
}
export default function friendMomentValueEqualityTest() {
  describe('FriendMomentValueEqualityTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      Logger.info(TAG, 'FriendMomentValueEqualityTest ready');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0100
     * @tc.name SameFieldsSameValue001
     * @tc.desc Verify same fields same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameFieldsSameValue_001', 0, (): void => {
      Logger.info(TAG, 'SameFieldsSameValue_001 begin');
      const left: FriendMoment = buildMoment('same-id', 'Author', 'same body');
      const right: FriendMoment = buildMoment('same-id', 'Author', 'same body');
      const equal: boolean = sameValue(left, right);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertTrue();
      const sameRef: boolean = left === right;
      expect(sameRef).assertFalse();
      Logger.info(TAG, 'SameFieldsSameValue_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0200
     * @tc.name DifferentTextDiffers002
     * @tc.desc Verify different text differs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DifferentTextDiffers_002', 0, (): void => {
      Logger.info(TAG, 'DifferentTextDiffers_002 begin');
      const left: FriendMoment = buildMoment('id', 'Author', 'left body');
      const right: FriendMoment = buildMoment('id', 'Author', 'right body');
      const equal: boolean = sameValue(left, right);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertFalse();
      Logger.info(TAG, 'DifferentTextDiffers_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0300
     * @tc.name SpaceChangeDiffers003
     * @tc.desc Verify space change differs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SpaceChangeDiffers_003', 0, (): void => {
      Logger.info(TAG, 'SpaceChangeDiffers_003 begin');
      const left: FriendMoment = buildMoment('id', 'Author', 'body');
      const right: FriendMoment = buildMoment('id', 'Author', 'body ');
      const forward: boolean = sameValue(left, right);
      const backward: boolean = sameValue(right, left);
      expect(forward === backward).assertTrue();
      expect(forward).assertFalse();
      Logger.info(TAG, 'SpaceChangeDiffers_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0400
     * @tc.name AssignedImageDiffers004
     * @tc.desc Verify assigned image differs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AssignedImageDiffers_004', 0, (): void => {
      Logger.info(TAG, 'AssignedImageDiffers_004 begin');
      const text: FriendMoment = buildMoment('id', 'Author', 'body');
      const photo: FriendMoment = buildFullMoment('id', 'Author', 'body', 'img', '');
      const equal: boolean = sameValue(text, photo);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertFalse();
      Logger.info(TAG, 'AssignedImageDiffers_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0500
     * @tc.name EmptyImageDiffersFromAbsent005
     * @tc.desc Verify empty image differs from absent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EmptyImageDiffersFromAbsent_005', 0, (): void => {
      Logger.info(TAG, 'EmptyImageDiffersFromAbsent_005 begin');
      const absent: FriendMoment = buildMoment('id', 'Author', 'body');
      const empty: FriendMoment = buildFullMoment('id', 'Author', 'body', '', '');
      const equal: boolean = sameValue(absent, empty);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertFalse();
      Logger.info(TAG, 'EmptyImageDiffersFromAbsent_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0600
     * @tc.name SwappedMediaDiffers006
     * @tc.desc Verify swapped media differs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SwappedMediaDiffers_006', 0, (): void => {
      Logger.info(TAG, 'SwappedMediaDiffers_006 begin');
      const left: FriendMoment = buildFullMoment('id', 'Author', 'body', 'a', 'b');
      const right: FriendMoment = buildFullMoment('id', 'Author', 'body', 'b', 'a');
      const equal: boolean = sameValue(left, right);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertFalse();
      Logger.info(TAG, 'SwappedMediaDiffers_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0700
     * @tc.name SameMediaSameValue007
     * @tc.desc Verify same media same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameMediaSameValue_007', 0, (): void => {
      Logger.info(TAG, 'SameMediaSameValue_007 begin');
      const left: FriendMoment = buildFullMoment('id', 'Author', 'body', 'img', 'vid');
      const right: FriendMoment = buildFullMoment('id', 'Author', 'body', 'img', 'vid');
      const equal: boolean = sameValue(left, right);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertTrue();
      Logger.info(TAG, 'SameMediaSameValue_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0800
     * @tc.name NumericIdIsText008
     * @tc.desc Verify numeric id is text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NumericIdIsText_008', 0, (): void => {
      Logger.info(TAG, 'NumericIdIsText_008 begin');
      const padded: FriendMoment = buildMoment('007', 'Author', 'body');
      const plain: FriendMoment = buildMoment('7', 'Author', 'body');
      const equal: boolean = sameValue(padded, plain);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertFalse();
      Logger.info(TAG, 'NumericIdIsText_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_0900
     * @tc.name UserNameChangeDiffers009
     * @tc.desc Verify user name change differs
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UserNameChangeDiffers_009', 0, (): void => {
      Logger.info(TAG, 'UserNameChangeDiffers_009 begin');
      const left: FriendMoment = buildMoment('id', 'Author', 'body');
      const right: FriendMoment = buildMoment('id', 'Reader', 'body');
      expect(left.userName !== right.userName).assertTrue();
      expect(left.text).assertEqual(right.text);
      expect(sameValue(left, right)).assertFalse();
      Logger.info(TAG, 'UserNameChangeDiffers_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_MODEL_VALUEEQ_1000
     * @tc.name EqualityStableAcrossReads010
     * @tc.desc Verify equality stable across reads
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EqualityStableAcrossReads_010', 0, (): void => {
      Logger.info(TAG, 'EqualityStableAcrossReads_010 begin');
      const left: FriendMoment = buildMoment('id', 'Author', 'body');
      const right: FriendMoment = buildMoment('id', 'Author', 'body');
      const first: boolean = sameValue(left, right);
      const second: boolean = sameValue(right, left);
      const stable: boolean = first === second;
      Logger.info(TAG, 'stable=' + JSON.stringify(stable));
      expect(stable).assertTrue();
      Logger.info(TAG, 'EqualityStableAcrossReads_010 end');
    });
  });
}
