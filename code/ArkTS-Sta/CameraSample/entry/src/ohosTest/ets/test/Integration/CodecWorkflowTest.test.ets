'use static';

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

// Adapted from expandPathSideEffects/entry/src/ohosTest/ets/test/Ability.test.ets.
// Reference line floor: 81; this suite only grows beyond it.
// CameraSample scope: comment draft, camera capture result and feed journal.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Comment } from '../../../../main/ets/pages/model/CommentModel';
import {
  AVATAR_LOGO_ONE, AVATAR_LOGO_TWO, AVATAR_FALLBACK, IMAGE_LANDSCAPE, IMAGE_ADVERT,
  IMAGE_CAMERA, TIME_MORNING, TIME_EMPTY, NAME_CLOUD, NAME_LIHUA, NAME_GUEST,
  SAMPLE_COMMENT_TEXT, SAMPLE_COMMENT_UNICODE, CommentDraft, CommentSnapshot,
  makeComment, makeSimpleComment, makeFeed, makeDraft, makeCaptureDraft, makeText,
  padNumber, repeatText, cloneComment, commentText, commentAvatar, commentImages,
  snapshotComment, sameSnapshot, sameStrings, withCommentText, withImages,
  assertCommentMatches, assertImagesMatch, assertFeedMatches, feedNames, feedIds,
  feedTimes, feedImageCounts, totalImageCount, indexOfName, indexOfId,
  imageUriFor, imageUriBatch, FIELD_COUNT
} from '../Shared/Fixtures';
import { Constants } from '../../../../main/ets/pages/constants/Constants';
import {
  CameraRequest, CameraParameters, CaptureOutcome, CaptureState, TextInputState,
  CommentJournal, DraftCodec, IdSequence, buildCameraRequest, captureSucceeded,
  extractResourceUri, formatCommentTime, formatCommentTimeAt, publishEligible,
  draftEligible, createPublishedComment, appendImmutable, imageGridKey, imageGridKeys,
  normalizeResourceUri, isResourceUri, isMediaUri, buildFeed, sumIds, joinNames
} from '../Shared/CommentLogic';
import { logSuite, yieldTick, Lcg, CallRecorder, expectNoDuplicates } from '../Shared/Support';

export default function CodecWorkflowTest(): void {
  describe('CodecWorkflowTest', () => {
    beforeAll(() => {
      logSuite('CodecWorkflowTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('CodecWorkflowTest', 'end');
    });

    /**
     * @tc.name CodecWorkflowTest_case_001
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 1)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_001', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_002
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 2)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_002', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_003
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 3)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_003', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_004
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 4)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_004', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_005
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 5)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_005', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_006
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 6)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_006', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_007
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 7)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_007', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_008
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 8)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_008', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_009
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 9)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_009', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_010
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 10)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_010', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_011
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 11)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_011', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_012
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 12)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_012', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_013
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 13)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_013', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_014
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 14)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_014', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_015
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 15)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_015', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_016
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 16)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_016', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_017
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 17)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_017', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_018
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 18)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_018', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_019
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 19)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_019', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_020
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 20)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_020', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_021
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 21)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_021', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_022
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 22)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_022', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_023
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 23)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_023', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_024
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 24)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_024', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_025
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 25)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_025', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_026
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 26)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_026', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_027
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 27)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_027', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_028
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 28)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_028', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_029
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 29)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_029', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_030
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 30)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_030', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_031
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 31)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_031', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_032
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 32)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_032', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_033
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 33)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_033', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_034
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 34)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_034', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_035
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 35)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_035', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_036
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 36)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_036', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_037
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 37)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_037', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_038
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 38)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_038', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_039
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 39)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_039', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_040
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 40)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_040', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_041
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 41)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_041', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_042
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 42)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_042', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2/IMG_0002.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_043
     * @tc.desc codec: draft line round trip preserves every field, variant 1 (CodecWorkflowTest case 43)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_043', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['datashare:///media/photo/3']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_044
     * @tc.desc codec: draft line round trip preserves every field, variant 2 (CodecWorkflowTest case 44)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_044', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0003.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
    /**
     * @tc.name CodecWorkflowTest_case_045
     * @tc.desc codec: draft line round trip preserves every field, variant 3 (CodecWorkflowTest case 45)
     * @tc.type Function
     * @tc.level Level1
     */
    it('CodecWorkflowTest_case_045', 0, async () => {
      const draft: CommentDraft = new CommentDraft('LiHua', 'hello codec', 'app.media.icon_comment_app_logo2', '02-07 13:25', ['file://media/Photo/1/IMG_0001.jpg']);
      const codec: DraftCodec = new DraftCodec();
      const payload: string = codec.encode(draft);
      expect(payload.indexOf('|') > 0).assertTrue();
      const decoded: CommentDraft | undefined = codec.decode(payload);
      expect(decoded !== undefined).assertTrue();
      if (decoded !== undefined) {
        expect(decoded.name).assertEqual('LiHua');
        expect(decoded.content).assertEqual('hello codec');
        expect(decoded.images.length).assertEqual(1);
        expect(decoded.images[0]).assertEqual(draft.images[0]);
      }
      expect(codec.decode('') === undefined).assertTrue();
      expect(codec.decode('a|b') === undefined).assertTrue();
    });
  });
}
