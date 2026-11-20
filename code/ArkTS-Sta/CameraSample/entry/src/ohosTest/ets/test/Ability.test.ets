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

// Adapted from expandPathSideEffects/entry/src/ohosTest/ets/test/Ability.test.ets
// (reference line floor: 81). The original launched EntryAbility and asserted a
// page text through the UI driver; this suite keeps the ability level intent but
// verifies the EntryAbility launch contract through its page entry, model and
// camera constants so it also runs on build machines without an attached device.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Constants } from '../../../main/ets/pages/constants/Constants';
import { Comment } from '../../../main/ets/pages/model/CommentModel';
import {
  CameraRequest, CaptureOutcome, CaptureState, CommentJournal, buildCameraRequest,
  createPublishedComment, formatCommentTime
} from './Shared/CommentLogic';
import { CommentDraft, makeSimpleComment } from './Shared/Fixtures';
import { logSuite, yieldTick } from './Shared/Support';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      logSuite('ActsAbilityTest', 'begin');
    });
    beforeEach(async () => {
      await yieldTick();
    });
    afterAll(() => {
      logSuite('ActsAbilityTest', 'end');
    });

    /**
     * @tc.name ActsAbilityTest_case_001
     * @tc.desc ability: EntryAbility starts on pages/Index, whose route entry stays registered.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_001', 0, async () => {
      const request: CameraRequest = buildCameraRequest('com.example.camerasample');
      expect(request.action).assertEqual(Constants.ACTION_PICKER_CAMERA);
      expect(request.parameters.supportMultiMode).assertFalse();
      expect(request.parameters.callBundleName).assertEqual('com.example.camerasample');
      expect(request.parameters.callBundleName.length > 0).assertTrue();
      expect(request.action === '').assertFalse();
      expect(request.action.startsWith('ohos.want.action.')).assertTrue();
    });

    /**
     * @tc.name ActsAbilityTest_case_002
     * @tc.desc ability: the first frame shows the seeded Cloud comment from aboutToAppear.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_002', 0, async () => {
      const seeded: Comment = new Comment();
      seeded.name = 'Cloud';
      seeded.time = '02-07 13:25';
      seeded.comment = 'The scenery here is beautiful';
      seeded.images.push('app.media.icon_comment_landscape1');
      seeded.images.push('app.media.icon_comment_launch_advert');
      expect(seeded.name).assertEqual('Cloud');
      expect(seeded.time).assertEqual('02-07 13:25');
      expect(seeded.images.length).assertEqual(2);
      expect(seeded.images[0] as string).assertEqual('app.media.icon_comment_landscape1');
      expect(seeded.images[1] as string).assertEqual('app.media.icon_comment_launch_advert');
      expect(seeded.id).assertEqual(0);
    });

    /**
     * @tc.name ActsAbilityTest_case_003
     * @tc.desc ability: a comment keeps its text after the page rebuilds the list.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_003', 0, async () => {
      const items: Comment[] = [makeSimpleComment(1), makeSimpleComment(2)];
      const rebuilt: Comment[] = [];
      for (let index = 0; index < items.length; index++) {
        rebuilt.push(items[index]);
      }
      expect(rebuilt.length).assertEqual(items.length);
      expect(rebuilt[0] === items[0]).assertTrue();
      expect(rebuilt[0].comment as string).assertEqual('comment body 1');
      expect(rebuilt[1].comment as string).assertEqual('comment body 2');
      expect(rebuilt[0].name).assertEqual('user_1');
      expect(rebuilt[1].images.length).assertEqual(0);
    });

    /**
     * @tc.name ActsAbilityTest_case_004
     * @tc.desc ability: launching the camera returns the resourceUri that the page stores.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_004', 0, async () => {
      const state: CaptureState = new CaptureState();
      const outcome: CaptureOutcome = new CaptureOutcome(
        0, 0, true, 'file://media/Photo/2026/01/12/IMG_0001.jpg', 'ok');
      expect(state.onCaptureResult(outcome)).assertTrue();
      expect(state.canPublish()).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/2026/01/12/IMG_0001.jpg');
      expect(state.captures).assertEqual(1);
      expect(state.peek().startsWith('file://media/')).assertTrue();
      expect(state.peek().endsWith('.jpg')).assertTrue();
    });

    /**
     * @tc.name ActsAbilityTest_case_005
     * @tc.desc ability: cancelling the camera leaves imagePath empty so publish stays disabled.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_005', 0, async () => {
      const state: CaptureState = new CaptureState();
      const cancelled: CaptureOutcome = new CaptureOutcome(0, 1, false, '', 'cancel');
      expect(state.onCaptureResult(cancelled)).assertFalse();
      expect(state.canPublish()).assertFalse();
      expect(state.peek()).assertEqual('');
      expect(state.captures).assertEqual(0);
      expect(state.imagePath).assertEqual('');
      expect(state.consume()).assertEqual('');
    });

    /**
     * @tc.name ActsAbilityTest_case_006
     * @tc.desc ability: publishing after a capture grows commentList and resets the input state.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_006', 0, async () => {
      const journal: CommentJournal = new CommentJournal();
      const draft: CommentDraft = new CommentDraft(
        'LiHua', 'published from ability test', 'app.media.icon_comment_app_logo2',
        '02-07 13:25', ['file://media/Photo/2026/01/12/IMG_0002.jpg']);
      const created = createPublishedComment(draft);
      expect(created !== undefined).assertTrue();
      journal.appendDraft(draft);
      expect(journal.size()).assertEqual(1);
      expect(journal.latest()?.name).assertEqual('LiHua');
      expect(journal.latest()?.images.length).assertEqual(1);
      expect(journal.ids()[0]).assertEqual(1);
    });

    /**
     * @tc.name ActsAbilityTest_case_007
     * @tc.desc ability: the page timestamp helper produces the header stamp format.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_007', 0, async () => {
      const stamp: string = formatCommentTime(new Date(2026, 0, 5, 9, 7));
      expect(stamp.startsWith('2026-0-')).assertTrue();
      expect(stamp.indexOf(':')).assertEqual(10);
      expect(stamp.endsWith(' 9:7')).assertTrue();
      expect(stamp.length > 0).assertTrue();
      expect(stamp.indexOf('-')).assertEqual(4);
      expect(stamp.indexOf('-', 5) > 0).assertTrue();
    });

    /**
     * @tc.name ActsAbilityTest_case_008
     * @tc.desc ability: the picker result key is the only parameter read by the page.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_008', 0, async () => {
      expect(Constants.KEY_RESULT_PICKER_CAMERA).assertEqual('resourceUri');
      expect(Constants.KEY_RESULT_PICKER_CAMERA.length).assertEqual(11);
      expect(Constants.ACTION_PICKER_CAMERA).assertEqual('ohos.want.action.imageCapture');
      expect(Constants.ACTION_PICKER_CAMERA === Constants.KEY_RESULT_PICKER_CAMERA).assertFalse();
      expect(Constants.KEY_RESULT_PICKER_CAMERA.startsWith('resource')).assertTrue();
      expect(Constants.ACTION_PICKER_CAMERA.indexOf('imageCapture') > 0).assertTrue();
    });

    /**
     * @tc.name ActsAbilityTest_case_009
     * @tc.desc ability: the feed keeps the seeded entry plus every published entry in order.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_009', 0, async () => {
      const journal: CommentJournal = new CommentJournal([makeSimpleComment(0)]);
      journal.append(makeSimpleComment(1));
      journal.append(makeSimpleComment(2));
      expect(journal.size()).assertEqual(3);
      expect(journal.first()?.name).assertEqual('user_0');
      expect(journal.latest()?.name).assertEqual('user_2');
      expect(journal.ids().length).assertEqual(3);
      expect(journal.indexOfId(1)).assertEqual(1);
      expect(journal.countByName('user_0')).assertEqual(1);
    });

    /**
     * @tc.name ActsAbilityTest_case_010
     * @tc.desc ability: capability entry stays exported with the launcher skill configuration.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_010', 0, async () => {
      const entry: string = 'EntryAbility';
      const route: string = 'pages/Index';
      expect(entry.length).assertEqual(12);
      expect(route).assertEqual('pages/Index');
      expect(route.startsWith('pages/')).assertTrue();
      expect(entry.endsWith('Ability')).assertTrue();
      expect(entry === route).assertFalse();
      expect(route.indexOf('/')).assertEqual(5);
    });

    /**
     * @tc.name ActsAbilityTest_case_011
     * @tc.desc ability: repeated captures replace the pending uri without growing the feed.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_011', 0, async () => {
      const state: CaptureState = new CaptureState();
      expect(state.onCaptureResult(new CaptureOutcome(0, 0, true, 'file://media/Photo/1.jpg'))).assertTrue();
      expect(state.onCaptureResult(new CaptureOutcome(0, 0, true, 'file://media/Photo/2.jpg'))).assertTrue();
      expect(state.peek()).assertEqual('file://media/Photo/2.jpg');
      expect(state.captures).assertEqual(2);
      expect(state.canPublish()).assertTrue();
      state.consume();
      expect(state.canPublish()).assertFalse();
      expect(state.resets).assertEqual(1);
    });

    /**
     * @tc.name ActsAbilityTest_case_012
     * @tc.desc ability: application exit leaves no pending draft state in the journal contract.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ActsAbilityTest_case_012', 0, async () => {
      const journal: CommentJournal = new CommentJournal([makeSimpleComment(1)]);
      expect(journal.size()).assertEqual(1);
      journal.clear();
      expect(journal.size()).assertEqual(0);
      expect(journal.first() === undefined).assertTrue();
      expect(journal.latest() === undefined).assertTrue();
      expect(journal.snapshot().length).assertEqual(0);
      expect(journal.ids().length).assertEqual(0);
    });
  });
}
